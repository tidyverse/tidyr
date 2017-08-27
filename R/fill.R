#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values.
#'
#' Fills missing values in using the previous entry. This is useful in the
#' common output format where values are not repeated, they're recorded
#' each time they change.
#'
#' Missing values are replaced in atomic vectors; `NULL`s are replaced
#' in list.
#'
#' @inheritParams expand
#' @inheritParams gather
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
fill.default <- function(data, ..., .direction = c("down", "up")) {
  fill_(data, fill_cols = compat_as_lazy_dots(...), .direction = .direction)
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


#' @rdname deprecated-se
#' @inheritParams fill
#' @param fill_cols Character vector of column names.
#' @export
fill_ <- function(data, fill_cols, .direction = c("down", "up")) {
  UseMethod("fill_")
}
#' @export
fill_.data.frame <- function(data, fill_cols, .direction = c("down", "up")) {
  vars <- syms(fill_cols)
  fill(data, !!! vars, .direction = .direction)
}
