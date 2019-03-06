#' Pivot data from wide to long.
#'
#' `pivot_long()` "lengthens" data, increasing the number of rows and
#' decreasing the number of columns. See more details in `vignette("pivot")`,
#' and see [pivot_wide()] for the inverse transformation.
#'
#' @param df A data frame to pivot.
#' @param cols Columns to pivot into longer format. This takes a tidyselect
#'   specification.
#' @param names_to,values_to This pair of arguments determine which columns
#'   the data stored in the column names (`names_to`) and the data stored in
#'   the cell values (`values_to`) turn into in the result.
#'
#'   Note that these variables do not exist, so must be specified as strings.
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
#' @param ptype If not specified, the type of the `value_to` column will be
#'   automatically guess from the data. Supply this argument when you want to
#'   override that default. Should be a named list, where the names are
#'   given by the value columns.
#' @export
pivot_long <- function(df,
                       cols,
                       names_to = "name",
                       values_to = "value",
                       spec = NULL,
                       na.rm = FALSE,
                       ptype = list()
                       ) {

  if (is.null(spec)) {
    cols <- enquo(cols)
    spec <- pivot_long_spec(df, !!cols, names_to = names_to, values_to = values_to)
  } else {
    spec <- check_spec(spec)
  }

  measures <- split(spec$.name, spec$.value)
  measure_keys <- split(spec[-(1:2)], spec$.value)
  keys <- vec_unique(spec[-(1:2)])

  vals <- set_names(vec_na(list(), length(measures)), names(measures))
  for (measure in names(measures)) {
    cols <- measures[[measure]]
    col_id <- vec_match(measure_keys[[measure]], keys)

    val_cols <- vec_na(list(), nrow(keys))
    val_cols[col_id] <- unname(as.list(df[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(df)))

    val_type <- vec_type_common(!!!val_cols, .ptype = ptype[[measure]])
    out <- vec_c(!!!val_cols, .ptype = val_type)
    # Interleave into correct order
    idx <- (matrix(seq_len(nrow(df) * length(val_cols)), ncol = nrow(df), byrow = TRUE))
    vals[[measure]] <- vec_slice(out, as.integer(idx))
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
  df_out <- df[setdiff(names(df), spec$.name)]
  vec_cbind(
    vec_slice(df_out, rows$df_id),
    vec_slice(keys, rows$key_id),
    vec_slice(vals, rows$val_id),
  )
}

#' @rdname pivot_long
#' @export
pivot_long_spec <- function(df, cols, names_to = "name", values_to = "value") {
  cols <- tidyselect::vars_select(unique(names(df)), !!enquo(cols))

  tibble(
    .name = cols,
    .value = values_to,
    !!names_to := cols
  )
}
