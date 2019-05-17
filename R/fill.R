#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values with previous or next value
#'
#' Fills missing values in selected columns using the next or previous entry.
#' This is useful in the common output format where values are not repeated,
#' and are only recorded when they change.
#'
#' Missing values are replaced in atomic vectors; `NULL`s are replaced in lists.
#'
#' @inheritParams gather
#' @param ... A selection of columns. If empty, nothing happens. You can
#'   supply bare variable names, select all variables between `x` and `z`
#'   with `x:z`, exclude `y` with `-y`. For more selection options, see the
#'   [dplyr::select()] documentation.
#' @param .direction Direction in which to fill missing values. Currently
#'   either "down" (the default), "up", "downup" (i.e. first down and then up)
#'   or "updown" (first up and then down).
#' @export
#' @examples
#' df <- data.frame(Month = 1:12, Year = c(2000, rep(NA, 11)))
#' df %>% fill(Year)
fill <- function(data, ..., .direction = c("down", "up", "downup", "updown")) {
  ellipsis::check_dots_unnamed()
  UseMethod("fill")
}
#' @export
fill.data.frame <- function(data, ..., .direction = c("down", "up", "downup", "updown")) {
  vec_fill <- vec_fill_fun(.direction)
  dplyr::mutate_at(data, dplyr::vars(...), vec_fill)
}

vec_fill_fun <- function(.direction = c("down", "up", "downup", "updown")) {
  .direction <- match.arg(.direction)
  switch(
    .direction,
    down = fillDown,
    up = fillUp,
    downup = function(x) fillUp(fillDown(x)),
    updown = function(x) fillDown(fillUp(x))
  )
}
