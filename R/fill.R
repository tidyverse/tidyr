#' @useDynLib tidyr
#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values.
#'
#' Fills missing values in using the previous entry. This is useful in the
#' common output format where values are not repeated, they're recorded
#' each time they change.
#'
#' @param ... Specification of columns to fill. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @export
#' @inheritParams extract_
#' @export
#' @examples
#' df <- data.frame(Month = 1:12, Year = c(2000, rep(NA, 11)))
#' df %>% fill(Year)
fill <- function(data, ...) {
  fill_cols <- unname(dplyr::select_vars(names(data), ...))
  fill_(data, fill_cols)
}

#' Standard-evaluation version of \code{fill}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param fill_cols Character vector of column names.
#' @keywords internal
#' @export
fill_ <- function(data, fill_cols) {
  UseMethod("fill_")
}

#' @export
fill_.data.frame <- function(data, fill_cols) {
  for (col in fill_cols) {
    old_attr <- attributes(data[[col]])
    data[[col]] <- fillVector(data[[col]])
    attributes(data[[col]]) <- old_attr
  }

  data
}
