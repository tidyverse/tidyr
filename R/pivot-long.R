#' Pivot data from wide to long
#'
#' @description
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("maturing")}
#'
#' `pivot_longer()` "lengthens" data, increasing the number of rows and
#' decreasing the number of columns. The inverse transformation is
#' [pivot_wider()]
#'
#' Learn more in `vignette("pivot")`.
#'
#' @details
#' `pivot_longer()` is an updated approach to [gather()], designed to be both
#' simpler to use and to handle more use cases. We recommend you use
#' `pivot_longer()` for new code; `gather()` isn't going away but is no longer
#' under active development.
#'
#' @param data A data frame to pivot.
#' @param cols Columns to pivot into longer format.
#'
#'   This takes a tidyselect specification, e.g. use `a:c` to select all
#'   columns from `a` to `c`, `starts_with("prefix")` to select all columns
#'   starting with "prefix", or `everything()` to select all columns.
#' @param names_to A string specifying the name of the column to create
#'   from the data stored in the column names of `data`.
#'
#'   Can be a character vector, creating multiple columns, if `names_sep`
#'   or `names_pattern` is provided. In this case, there are two special
#'   values you can take advantage of:
#'
#'   * `NA` will discard that component of the name.
#'   * `.value` indicates that component of the name defines the name of the
#'     column containing the cell values, overriding `values_to`.
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
#'   If these arguments do not give you enough control, use
#'   `pivot_longer_spec()` to create a spec object and process manually as
#'   needed.
#' @param names_repair What happens if the output has invalid column names?
#'   The default, `"check_unique"` is to error if the columns are duplicated.
#'   Use `"minimal"` to allow duplicates in the output, or `"unique"` to
#'   de-duplicated by adding numeric suffixes. See [vctrs::vec_as_names()]
#'   for more options.
#' @param values_to A string specifying the name of the column to create
#'   from the data stored in cell values. If `names_to` is a character
#'   containing the special `.value` sentinel, this value will be ignored,
#'   and the name of the value column will be derived from part of the
#'   existing column names.
#' @param values_drop_na If `TRUE`, will drop rows that contain only `NA`s
#'   in the `value_to` column. This effectively converts explicit missing values
#'   to implicit missing values, and should generally be used only when missing
#'   values in `data` were created by its structure.
#' @param names_ptypes,values_ptypes A list of column name-prototype pairs.
#'   A prototype (or ptype for short) is a zero-length vector (like `integer()`
#'   or `numeric()`) that defines the type, class, and attributes of a vector.
#'
#'   If not specified, the type of the columns generated from `names_to` will
#'   be character, and the type of the variables generated from `values_to`
#'   will be the common type of the input columns used to generate them.
#' @export
#' @examples
#' # See vignette("pivot") for examples and explanation
#'
#' # Simplest case where column names are character data
#' relig_income
#' relig_income %>%
#'  pivot_longer(-religion, names_to = "income", values_to = "count")
#'
#' # Slightly more complex case where columns have common prefix,
#' # and missing missings are structural so should be dropped.
#' billboard
#' billboard %>%
#'  pivot_longer(
#'    cols = starts_with("wk"),
#'    names_to = "week",
#'    names_prefix = "wk",
#'    values_to = "rank",
#'    values_drop_na = TRUE
#'  )
#'
#' # Multiple variables stored in column names
#' who %>% pivot_longer(
#'   cols = new_sp_m014:newrel_f65,
#'   names_to = c("diagnosis", "gender", "age"),
#'   names_pattern = "new_?(.*)_(.)(.*)",
#'   values_to = "count"
#' )
#'
#' # Multiple observations per row
#' anscombe
#' anscombe %>%
#'  pivot_longer(everything(),
#'    names_to = c(".value", "set"),
#'    names_pattern = "(.)(.)"
#'  )
pivot_longer <- function(data,
                         cols,
                         names_to = "name",
                         names_prefix = NULL,
                         names_sep = NULL,
                         names_pattern = NULL,
                         names_ptypes = list(),
                         names_repair = "check_unique",
                         values_to = "value",
                         values_drop_na = FALSE,
                         values_ptypes = list()
                         ) {

  cols <- enquo(cols)
  spec <- build_longer_spec(data, !!cols,
    names_to = names_to,
    values_to = values_to,
    names_prefix = names_prefix,
    names_sep = names_sep,
    names_pattern = names_pattern,
    names_ptypes = names_ptypes
  )

  pivot_longer_spec(data, spec,
    names_repair = names_repair,
    values_drop_na = values_drop_na,
    values_ptypes = values_ptypes
  )
}


#' Pivot data from wide to long using a spec
#'
#' This is a low level interface to pivotting, inspired by the cdata package,
#' that allows you to describe pivotting with a data frame.
#'
#' @keywords internal
#' @export
#' @inheritParams pivot_longer
#' @param spec A specification data frame. This is useful for more complex
#'  pivots because it gives you greater control on how metadata stored in the
#'  column names turns into columns in the result.
#'
#'   Must be a data frame containing character `.name` and `.value` columns.
#'   Additional columns in `spec` should be named to match columns in the
#'   long format of the dataset and contain values corresponding to columns
#'   pivoted from the wide format.
#'   The special `.seq` variable is used to disambiguate rows internally;
#'   it is automatically removed after pivotting.
#'
#' @examples
#' # See vignette("pivot") for examples and explanation
#'
#' # Use `build_longer_spec()` to build `spec` using similar syntax to `pivot_longer()`
#' # and run `pivot_longer_spec()` based on `spec`.
#' spec <- relig_income %>% build_longer_spec(
#'   cols = -religion,
#'   names_to = "income",
#'   values_to = "count"
#' )
#'
#' spec
#'
#' pivot_longer_spec(relig_income, spec)
#'
#' # Is equivalent to:
#' relig_income %>% pivot_longer(
#'   cols = -religion,
#'   names_to = "income",
#'   values_to = "count")
#'
pivot_longer_spec <- function(data,
                              spec,
                              names_repair = "check_unique",
                              values_drop_na = FALSE,
                              values_ptypes = list()
                              ) {
  spec <- check_spec(spec)
  spec <- deduplicate_spec(spec, data)

  # Quick hack to ensure that split() preserves order
  v_fct <- factor(spec$.value, levels = unique(spec$.value))
  values <- split(spec$.name, v_fct)
  value_keys <- split(spec[-(1:2)], v_fct)
  keys <- vec_unique(spec[-(1:2)])

  vals <- set_names(vec_init(list(), length(values)), names(values))
  for (value in names(values)) {
    cols <- values[[value]]
    col_id <- vec_match(value_keys[[value]], keys)

    val_cols <- vec_init(list(), nrow(keys))
    val_cols[col_id] <- unname(as.list(data[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(data)))

    val_type <- vec_ptype_common(!!!set_names(val_cols[col_id], cols), .ptype = values_ptypes[[value]])
    out <- vec_c(!!!val_cols, .ptype = val_type)
    # Interleave into correct order
    idx <- (matrix(seq_len(nrow(data) * length(val_cols)), ncol = nrow(data), byrow = TRUE))
    vals[[value]] <- vec_slice(out, as.integer(idx))
  }
  vals <- as_tibble(vals)

  # Line up output rows by combining spec and existing data frame
  rows <- expand_grid(
    df_id = vec_seq_along(data),
    key_id = vec_seq_along(keys),
  )
  rows$val_id <- vec_seq_along(rows)

  if (values_drop_na) {
    rows <- vec_slice(rows, !vec_equal_na(vals))
  }

  # Join together df, spec, and val to produce final tibble
  df_out <- drop_cols(data, spec$.name)
  out <- wrap_error_names(vec_cbind(
    as_tibble(vec_slice(df_out, rows$df_id)),
    vec_slice(keys, rows$key_id),
    vec_slice(vals, rows$val_id),
    .name_repair = names_repair
  ))
  out$.seq <- NULL

  reconstruct_tibble(data, out)
}

#' @rdname pivot_longer_spec
#' @export
build_longer_spec <- function(data, cols,
                              names_to = "name",
                              values_to = "value",
                              names_prefix = NULL,
                              names_sep = NULL,
                              names_pattern = NULL,
                              names_ptypes = NULL) {
  cols <- unname(tidyselect::vars_select(unique(names(data)), !!enquo(cols)))
  if (length(cols) == 0) {
    abort(glue::glue("`cols` must select at least one column."))
  }

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
  } else {
    if (!is.null(names_sep)) {
      abort("`names_sep` can not be used with length-1 `names_to`")
    }
    if (!is.null(names_pattern)) {
      names <- str_extract(names, names_to, regex = names_pattern)[[1]]
    }

    names <- tibble(!!names_to := names)
  }

  if (".value" %in% names_to) {
    values_to <- NULL
  }

  # optionally, cast variables generated from columns
  cast_cols <- intersect(names(names), names(names_ptypes))
  for (col in cast_cols) {
    names[[col]] <- vec_cast(names[[col]], names_ptypes[[col]])
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

# Ensure that there's a one-to-one match from spec to data by adding
# a special .seq variable which is automatically removed after pivotting.
deduplicate_spec <- function(spec, df) {

  # Ensure each .name has a unique output identifier
  key <- spec[setdiff(names(spec), ".name")]
  if (vec_duplicate_any(key)) {
    pos <- vec_group_loc(key)$loc
    seq <- vector("integer", length = nrow(spec))
    for (i in seq_along(pos)) {
      seq[pos[[i]]] <- seq_along(pos[[i]])
    }
    spec$.seq <- seq
  }

  # Match spec to data, handling duplicated column names
  col_id <- vec_match(names(df), spec$.name)
  has_match <- !is.na(col_id)

  if (!vec_duplicate_any(col_id[has_match])) {
    return(spec)
  }

  spec <- vec_slice(spec, col_id[has_match])
  # Need to use numeric indices because names only match first
  spec$.name <- seq_along(df)[has_match]

  pieces <- vec_split(seq_len(nrow(spec)), col_id[has_match])
  copy <- integer(nrow(spec))
  for (i in seq_along(pieces$val)) {
    idx <- pieces$val[[i]]
    copy[idx] <- seq_along(idx)
  }

  spec$.seq <- copy
  spec
}
