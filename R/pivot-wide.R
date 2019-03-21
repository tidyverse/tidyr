#' Pivot data from long to wide
#'
#' `pivot_wider()` "widens" data, increasing the number of columns and
#' decreasing the number of rows. See more details in `vignette("pivot")`,
#' and see [pivot_longer()] for the inverse transformation.
#'
#' @inheritParams pivot_longer
#' @param keys Keys, a set of columns that uniquely identifies each
#'   observation. Defaults to all columns in `df` except for the columns
#'   specified in `names_from` and `values_from`.
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
#' @param values_collapse Optionally, a named list describing how to collapse
#'   each `value` if the keys are not unique.
#' @export
#' @examples
#' # Use values_fill to fill in missing values when you know what they
#' # represent
#' fish_encounters %>%
#'   pivot_wider(
#'     names_from = station,
#'     values_from = seen,
#'     values_fill = list(seen = 0)
#'   )
pivot_wider <- function(df,
                       keys = NULL,
                       names_from = name,
                       values_from = value,
                       names_prefix = "",
                       names_sep = "_",
                       values_fill = NULL,
                       values_collapse = NULL,
                       spec = NULL) {

  if (is.null(spec)) {
    names_from <- enquo(names_from)
    values_from <- enquo(values_from)

    spec <- pivot_wider_spec(df,
      names_from = !!names_from,
      values_from = !!values_from,
      names_prefix = names_prefix,
      names_sep = names_sep
    )
  } else {
    spec <- check_spec(spec)
  }

  values <- vec_unique(spec$.value)
  spec_cols <- c(names(spec)[-(1:2)], values)

  keys <- enquo(keys)
  if (!quo_is_null(keys)) {
    key_vars <- tidyselect::vars_select(names(df), !!keys)
  } else {
    key_vars <- names(df)
  }
  key_vars <- setdiff(key_vars, spec_cols)

  # Figure out rows in output
  df_rows <- df[key_vars]
  if (ncol(df_rows) == 0) {
    rows <- tibble(.rows = 1)
    row_id <- rep(1L, nrow(spec))
  } else {
    rows <- vec_unique(df_rows)
    row_id <- vec_match(df_rows, rows)
  }

  value_specs <- unname(split(spec, spec$.value))
  value_out <- vec_na(list(), length(value_specs))

  for (i in seq_along(value_out)) {
    spec_i <- value_specs[[i]]
    value <- spec_i$.value[[1]]
    val <- df[[value]]

    cols <- df[names(spec_i)[-(1:2)]]
    col_id <- vec_match(cols, spec_i[-(1:2)])
    val_id <- data.frame(row = row_id, col = col_id)

    dedup <- vals_dedup(val_id, val, values_collapse[[value]])
    val_id <- dedup$key
    val <- dedup$val

    nrow <- nrow(rows)
    ncol <- nrow(spec_i)

    fill <- values_fill[[value]]
    if (is.null(fill)) {
      out <- vec_na(val, nrow * ncol)
    } else {
      stopifnot(vec_size(fill) == 1)
      fill <- vec_cast(fill, val)
      out <- vec_repeat(fill, nrow * ncol)
    }
    vec_slice(out, val_id$row + nrow * (val_id$col - 1L)) <- val

    value_out[[i]] <- wrap_vec(out, spec_i$.name)
  }

  out <- vec_cbind(rows, !!!value_out)

  # recreate desired column order
  # https://github.com/r-lib/vctrs/issues/227
  if (all(spec$.name %in% names(out))) {
    out <- out[c(names(rows), spec$.name)]
  }
  out
}

#' @export
#' @rdname pivot_wider
pivot_wider_spec <- function(df,
                            names_from = name,
                            values_from = value,
                            names_prefix = "",
                            names_sep = "_") {
  names_from <- tidyselect::vars_select(names(df), !!enquo(names_from))
  values_from <- tidyselect::vars_pull(names(df), !!enquo(values_from))

  row_ids <- vec_unique(df[names_from])
  out <- tibble(
    .name = paste0(names_prefix, exec(paste, !!!row_ids, sep = names_sep)),
    .value = values_from
  )
  vec_cbind(out, row_ids)
}

# quiet R CMD check
name <- value <- NULL

# Helpers -----------------------------------------------------------------

vals_dedup <- function(key, val, collapse = NULL) {
  if (!vec_duplicate_any(key)) {
    return(list(key = key, val = val))
  }

  if (is.null(collapse)) {
    warn("Values are not uniquely identified; output will contain list-columns")
  }

  out <- vec_split(val, key)
  if (!is.null(collapse)) {
    collapse <- as_function(collapse)
    # This is only correct if `values_collapse` always returns a single value
    # Needs https://github.com/r-lib/vctrs/issues/183
    out$val <- vec_c(!!!map(out$val, collapse))
  }

  out
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
