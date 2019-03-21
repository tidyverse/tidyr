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
#' @param names_prefix A regular expressiong used to remove matching text
#'   from the start of each variable name.
#' @param names_sep If `names_to` contains multiple values, this argument
#'   controls how the column name is split up into multiple variables. It
#'   takes the same specification as [separate()], and can either be a
#'   numeric vector (specifying positions to break on), or a single string
#'   (specifying a regular expression to split on). If this does not give you
#'   enough control, use `pivot_longer_spec()` to create a spec object and
#'   process as needed.
#' @param spec Alternatively, instead of providing `cols` (and `names_to` and
#'   `values_to`) you can parse a specification data frame. This is useful
#'   for more complex pivots because it gives you greater control on how
#'   metadata stored in the column names turns into columns in the result.
#'
#'   Must be a data frame containing character `.name` and `.value` columns.
#' @param na.rm If `TRUE`, will drop rows that contain only `NA`s in the
#'   `value_to` column. This effectively converts explicit missing values to
#'   implicit missing values, and should generally be used only when missing
#'   values in `df` were created by its structure.
#' @param values_type If not specified, the type of the `value_to` column will
#'   be automatically guessed from the data. Supply this argument when you want
#'   to override that default. Should be a named list, where the names are
#'   given by the value columns.
#' @export
pivot_longer <- function(df,
                       cols,
                       names_to = "name",
                       values_to = "value",
                       names_prefix = NULL,
                       names_sep = NULL,
                       na.rm = FALSE,
                       values_type = list(),
                       spec = NULL
                       ) {

  if (is.null(spec)) {
    cols <- enquo(cols)
    spec <- pivot_longer_spec(df, !!cols,
      names_to = names_to,
      values_to = values_to,
      names_prefix = names_prefix,
      names_sep = names_sep
    )
  } else {
    spec <- check_spec(spec)
  }
  spec <- deduplicate_names(spec, df)

  values <- split(spec$.name, spec$.value)
  value_keys <- split(spec[-(1:2)], spec$.value)
  keys <- vec_unique(spec[-(1:2)])

  vals <- set_names(vec_na(list(), length(values)), names(values))
  for (value in names(values)) {
    cols <- values[[value]]
    col_id <- vec_match(value_keys[[value]], keys)

    val_cols <- vec_na(list(), length(cols))
    val_cols[col_id] <- unname(as.list(df[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(df)))

    val_type <- vec_type_common(!!!val_cols, .ptype = values_type[[value]])
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

  if (na.rm) {
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
                              names_sep = NULL) {
  cols <- tidyselect::vars_select(unique(names(df)), !!enquo(cols))

  if (is.null(names_prefix)) {
    names <- cols
  } else {
    names <- stringi::stri_replace_all_regex(cols, paste0("^", names_prefix), "")
  }

  if (length(names_to) > 1) {
    if (is.null(names_sep)) {
      abort("If you supply multiple names in `names_to` you must also supply `names_sep`")
    }

    names <- str_separate(names, names_to, sep = names_sep)

    if (".value" %in% names_to) {
      values_to <- NULL
    }
  } else {
    names <- tibble(!!names_to := names)
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
