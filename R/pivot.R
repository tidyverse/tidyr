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
    # https://github.com/r-lib/vctrs/issues/201
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

#' Pivot data from long to wide
#'
#' `pivot_wide()` "widens" data, increasing the number of columns and
#' decreasing the number of rows. See more details in `vignette("pivot")`,
#' and see [pivot_long()] for the inverse transformation.
#'
#' @inheritParams pivot_long
#' @param names_from,values_from A pair of arguments describing which column
#'   (or columns) to get the name of the output column (`name_from`), and
#'   which column to get the cell values from (`values_from`).
#' @param names_sep If `names_from` contains multiple variables, this will be
#'   used to join their values together into a single string to use as
#'   a column name.
#' @param names_prefix String added to the start of every variable name. This is
#'   particularly useful if `names_from` is a numeric vector and you want to
#'   create syntactic variable names.
#' @param values_fill Optionally, a named list specifying what each `value`
#'   should be filled in with when missing.
#' @export
#' @examples
#' # Use values_fill to fill in missing values when you know what they
#' # represent
#' fish_encounters %>%
#'   pivot_wide(
#'     names_from = station,
#'     values_from = seen,
#'     values_fill = list(seen = 0)
#'   )
pivot_wide <- function(df,
                       names_from = name,
                       values_from = value,
                       names_prefix = "",
                       names_sep = "_",
                       values_fill = NULL,
                       spec = NULL) {

  if (is.null(spec)) {
    names_from <- enquo(names_from)
    values_from <- enquo(values_from)

    spec <- pivot_wide_spec(df,
      names_from = !!names_from,
      values_from = !!values_from,
      names_prefix = names_prefix,
      names_sep = names_sep
    )
  } else {
    spec <- check_spec(spec)
  }

  measures <- vec_unique(spec$.value)
  spec_cols <- c(names(spec)[-(1:2)], measures)

  # Figure out rows in output
  df_rows <- df[setdiff(names(df), spec_cols)]
  if (ncol(df_rows) == 0) {
    rows <- tibble(.rows = 1)
    row_id <- rep(1L, nrow(spec))
  } else {
    rows <- vec_unique(df_rows)
    row_id <- vec_match(df_rows, rows)
  }

  measure_specs <- unname(split(spec, spec$.value))
  measure_out <- vec_na(list(), length(measure_specs))

  for (i in seq_along(measure_out)) {
    spec <- measure_specs[[i]]
    measure <- spec$.value[[1]]
    val <- df[[measure]]

    cols <- df[names(spec)[-(1:2)]]
    col_id <- vec_match(cols, spec[-(1:2)])
    val_id <- data.frame(row = row_id, col = col_id)
    if (vec_duplicate_any(val_id)) {
      warn("Values are not uniquely identified; output will contain list-columns")

      # https://github.com/r-lib/vctrs/issues/196
      val <- unname(split(val, vec_duplicate_id(val_id)))
      val_id <- vec_unique(val_id)
    }

    nrow <- nrow(rows)
    ncol <- nrow(spec)

    fill <- values_fill[[measure]]
    if (is.null(fill)) {
      out <- vec_na(val, nrow * ncol)
    } else {
      stopifnot(vec_size(fill) == 1)
      fill <- vec_cast(fill, val)
      out <- vec_repeat(fill, nrow * ncol)
    }
    vec_slice(out, val_id$row + nrow * (val_id$col - 1L)) <- val

    measure_out[[i]] <- wrap_vec(out, spec$.name)
  }
  vec_cbind(rows, !!!measure_out)
}

# Wrap a "rectangular" vector into a data frame
wrap_vec <- function(vec, names) {
  ncol <- length(names)
  nrow <- length(vec) / ncol
  out <- set_names(vec_na(list(), ncol), names)
  for (i in 1:ncol) {
    out[[i]] <- vec_slice(vec, ((i - 1) * nrow + 1):(i * nrow))
  }

  as_tibble(out)
}

# Helpers -----------------------------------------------------------------

check_spec <- function(spec) {
  # Eventually should just be vec_assert() on partial_frame()
  # Waiting for https://github.com/r-lib/vctrs/issues/198

  if (!is.data.frame(spec)) {
    stop("`spec` must be a data frame", call. = FALSE)
  }

  if (!has_name(spec, ".name") || !has_name(spec, ".value")) {
    stop("`spec` must have `.name` and `.value` columns", call. = FALSE)
  }

  # Ensure .name and .value come first
  vars <- union(c(".name", ".value"), names(spec))
  spec[vars]
}
