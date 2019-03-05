# where metadata becomes data

#' Generate pivoting specifications
#'
#' @param df A data frame
#' @param cols Columns to pivot into longer format. This takes a tidyselect
#'   specification.
#' @param names_to A string giving the name of the column to contain the data
#'   previously stored in the column names.
#' @param values_to A string giving the name of the column to contain the data
#'   previously stored in the cell values.
#' @export
pivot_long_spec <- function(df, cols, names_to = "name", values_to = "value") {
  cols <- tidyselect::vars_select(unique(names(df)), !!enquo(cols))

  tibble(
    .name = cols,
    .value = values_to,
    !!names_to := cols
  )
}

#' @export
#' @rdname pivot_long_spec
#' @param names_from Name of the variable (or variables) that will be used to
#'   generate column names.
#' @param values_from Name of the variable that will be used to generate
#'   cell values.
#' @param sep If `names_from` contains multiple variables, this will be
#'   used to join their values together into a single string to use as
#'   a column name.
pivot_wide_spec <- function(df, names_from = name, values_from = value, sep = "_") {
  names_from <- tidyselect::vars_select(names(df), !!enquo(names_from))
  values_from <- tidyselect::vars_pull(names(df), !!enquo(values_from))

  row_ids <- vec_unique(df[names_from])
  out <- tibble(
    .name = exec(paste, !!!row_ids, sep = sep),
    .value = values_from
  )
  vec_cbind(out, row_ids)
}

# quiet R CMD check
name <- NULL
value <- NULL
