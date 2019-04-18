#' Pivot data from wide to long.
#'
#' `pivot_longer()` "lengthens" data, increasing the number of rows and
#' decreasing the number of columns. See more details in `vignette("pivot")`,
#' and see [pivot_wider()] for the inverse transformation.
#'
#' @param df A data frame to pivot.
#' @param cols Columns to pivot into longer format. This takes a tidyselect
#'   specification.
#' @param names_to,values_to This pair of arguments determine which columns
#'   the data stored in the column names (`names_to`) and the data stored in
#'   the cell values (`values_to`) turn into in the result.
#'
#'   Note that these variables do not exist, so must be specified as strings.
#' @param names_prefix A regular expression used to remove matching text
#'   from the start of each variable name.
#' @param names_sep,names_pattern If `names_to` contains multiple values,
#'   these arguments control how the column name is broken up.
#'
#'   `names_sep` takes the same specification as [separate()], and can either
#'   be a numeric vector (specifying positions to break on), or a single string
#'   (specifying a regular expression to split on).
#'
#'   `names_pattern` takes the same specification as [extract()], a regular
#'   expression containing matching groups (`()`).
#'
#'   If these arguments does not give you enough control, use
#'   `pivot_longer_spec()` to create a spec object and process manually as
#'   needed.
#' @param spec Alternatively, instead of providing `cols` (and `names_to` and
#'   `values_to`) you can parse a specification data frame. This is useful
#'   for more complex pivots because it gives you greater control on how
#'   metadata stored in the column names turns into columns in the result.
#'
#'   Must be a data frame containing character `.name` and `.value` columns.
#' @param values_drop_na If `TRUE`, will drop rows that contain only `NA`s
#'   in the `value_to` column. This effectively converts explicit missing values
#'   to implicit missing values, and should generally be used only when missing
#'   values in `df` were created by its structure.
#' @param col_ptypes A list of of column name-prototype pairs.
#'
#'   If not specified, the type of the generated from `names_to` will be
#'   character, and the type of the variables generated from `values_to`
#'   will be the common type of the input columns used to generate them.
#' @export
pivot_longer <- function(df,
                         cols,
                         names_to = "name",
                         names_prefix = NULL,
                         names_sep = NULL,
                         names_pattern = NULL,
                         values_to = "value",
                         values_drop_na = FALSE,
                         col_ptypes = list(),
                         spec = NULL
                         ) {

  if (is.null(spec)) {
    cols <- enquo(cols)
    spec <- pivot_longer_spec(df, !!cols,
      names_to = names_to,
      values_to = values_to,
      names_prefix = names_prefix,
      names_sep = names_sep,
      names_pattern = names_pattern,
      col_ptypes = col_ptypes
    )
    spec <- check_spec(spec)
  } else {
    spec <- check_spec(spec)
  }
  spec <- deduplicate_names(spec, df)

  # Quick hack to ensure that split() preserves order
  v_fct <- factor(spec$.value, levels = unique(spec$.value))
  values <- split(spec$.name, v_fct)
  value_keys <- split(spec[setdiff(names(spec), c(".name", ".value"))], v_fct)
  keys <- vec_unique(spec[setdiff(names(spec), c(".name", ".value"))])

  vals <- set_names(vec_na(list(), length(values)), names(values))
  for (value in names(values)) {
    cols <- values[[value]]
    col_id <- vec_match(value_keys[[value]], keys)

    val_cols <- vec_na(list(), length(cols))
    val_cols[col_id] <- unname(as.list(df[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(df)))

    val_type <- vec_type_common(!!!val_cols, .ptype = col_ptypes[[value]])
    out <- vec_c(!!!val_cols, .ptype = val_type)
    # Interleave into correct order
    idx <- (matrix(seq_len(nrow(df) * length(val_cols)), ncol = nrow(df), byrow = TRUE))
    vals[[value]] <- vec_slice(out, as.integer(idx))
  }
  vals <- as_tibble(vals)

  # Line up output rows by combining spec and existing data frame
  rows <- expand_grid(
    df_id = vec_seq_along(df),
    key_id = vec_seq_along(keys),
  )
  rows$val_id <- vec_seq_along(rows)

  if (values_drop_na) {
    rows <- vec_slice(rows, !vec_equal_na(vals))
  }

  # Join together df, spec, and val to produce final tibble
  df_out <- drop_cols(df, spec$.name)
  vec_cbind(
    vec_slice(df_out, rows$df_id),
    vec_slice(keys, rows$key_id),
    vec_slice(vals, rows$val_id),
  )
}

#' @rdname pivot_longer
#' @export
pivot_longer_spec <- function(df, cols,
                              names_to = "name",
                              values_to = "value",
                              names_prefix = NULL,
                              names_sep = NULL,
                              names_pattern = NULL,
                              col_ptypes = NULL) {
  cols <- tidyselect::vars_select(unique(names(df)), !!enquo(cols))

  if (is.null(names_prefix)) {
    names <- cols
  } else {
    names <- stringi::stri_replace_all_regex(cols, paste0("^", names_prefix), "")
  }

  if (length(names_to) > 1) {
    if (!xor(is.null(names_sep), is.null(names_pattern))) {
      abort(glue::glue(
        "If you supply multiple names in `names_to` you must also supply one",
        " of `names_sep` or `names_pattern`."
      ))
    }

    if (!is.null(names_sep)) {
      names <- str_separate(names, names_to, sep = names_sep)
    } else {
      names <- str_extract(names, names_to, regex = names_pattern)
    }

    if (".value" %in% names_to) {
      values_to <- NULL
    }
  } else {
    names <- tibble(!!names_to := names)
  }

  # optionally, cast variables generated from columns
  cast_cols <- intersect(names(names), names(col_ptypes))
  for (col in cast_cols) {
    names[[col]] <- vec_cast(names[[col]], col_ptypes[[col]])
  }

  out <- tibble(.name = cols)
  out[[".value"]] <- values_to
  out <- vec_cbind(out, names)
  out

}

drop_cols <- function(df, cols) {
  if (is.character(cols)) {
    df[setdiff(names(df), cols)]
  } else if (is.integer(cols)) {
    df[-cols]
  } else {
    abort("Invalid input")
  }
}

# Match spec to data, handling duplicated column names
deduplicate_names <- function(spec, df) {
  col_id <- vec_match(names(df), spec$.name)
  has_match <- !is.na(col_id)

  if (!vec_duplicate_any(col_id[has_match])) {
    return(spec)
  }

  warn("Duplicate column names detected, adding .copy variable")

  spec <- vec_slice(spec, col_id[has_match])
  # Need to use numeric indices because names only match first
  spec$.name <- seq_along(df)[has_match]

  pieces <- vec_split(seq_len(nrow(spec)), col_id[has_match])
  copy <- integer(nrow(spec))
  for (i in seq_along(pieces$val)) {
    idx <- pieces$val[[i]]
    copy[idx] <- seq_along(idx)
  }

  spec$.copy <- copy
  spec
}
