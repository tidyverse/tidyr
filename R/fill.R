#' @useDynLib tidyr
#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values.
#'
#' Fills missing values in using the previous entry. This is useful in the
#' common output format where values are not repeated, they're recorded
#' each time they change.
#'
#' @param col Bare column name.
#' @export
#' @inheritParams extract_
#' @export
#' @examples
#' df <- data.frame(Month = 1:12, Year = c(2000, rep(NA, 11)))
#' df %>% fill(Year)
fill <- function(data, col) {
  col <- col_name(substitute(col))
  fill_(data, col)
}

#' Standard-evaluation version of \code{fill}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param col Name of column to split, as string.
#' @keywords internal
#' @export
fill_ <- function(data, col) {
  UseMethod("fill_")
}

fill_.data.frame <- function(data, col) {
  old_attr <- attributes(data[[col]])
  data[[col]] <- fillVector(data[[col]])
  attributes(data[[col]]) <- old_attr

  data
}
