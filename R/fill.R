#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values.
#'
#' Fills missing values in selected columns using the previous entry. This is useful in the
#' common output format where values are not repeated, they're recorded
#' each time they change.
#'
#' Missing values are replaced in atomic vectors; `NULL`s are replaced
#' in list.
#'
#' @inheritParams gather
#' @param ... A selection of columns. If empty, nothing happens. You can
#'   supply bare variable names, select all variables between `x` and `z`
#'   with `x:z`, exclude `y` with `-y`. For more selection options, see the
#'   [dplyr::select()] documentation.
#' @param .direction Direction in which to fill missing values. Currently
#'   either "down" (the default) or "up".
#' @export
#' @examples
#' df <- data.frame(Month = 1:12, Year = c(2000, rep(NA, 11)))
#' df %>% fill(Year)
fill <- function(data, ..., .direction = c("down", "up")) {
  UseMethod("fill")
}
#' @export
fill.data.frame <- function(data, ..., .direction = c("down", "up")) {
  fill_cols <- unname(tidyselect::vars_select(names(data), ...))

  .direction <- match.arg(.direction)
  fillVector <- switch(.direction, down = fillDown, up = fillUp)

  for (col in fill_cols) {
    data[[col]] <- fillVector(data[[col]])
  }

  data
}
#' @export
fill.grouped_df <- function(data, ..., .direction = c("down", "up")) {
  dplyr::do(data, fill(., ..., .direction = .direction))
}
