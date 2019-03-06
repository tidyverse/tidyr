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

      pieces <- vec_split(val, val_id)
      val <- pieces$val
      val_id <- pieces$key
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

#' @export
#' @rdname pivot_wide
pivot_wide_spec <- function(df,
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
