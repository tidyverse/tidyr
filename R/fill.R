#' @useDynLib tidyr
#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values.
#'
#' Fills missing values in using the previous entry. This is useful in the
#' common output format where values are not repeated, they're recorded
#' each time they change.
#'
#' Missing values are replaced in atomic vectors; \code{NULL}s are replaced
#' in list.
#'
#' @param ... Specification of columns to fill. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @export
#' @inheritParams extract_
#' @inheritParams fill_
#' @seealso \code{\link{fill_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' df <- data.frame(Month = 1:12, Year = c(2000, rep(NA, 11)))
#' df %>% fill(Year)
fill <- function(data, ..., .direction = c("down", "up")) {
  fill_cols <- unname(dplyr::select_vars(colnames(data), ...))
  fill_(data, fill_cols, .direction = .direction)
}

#' Standard-evaluation version of \code{fill}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param fill_cols Character vector of column names.
#' @param .direction Direction in which to fill missing values. Currently
#'   either "down" (the default) or "up".
#' @keywords internal
#' @export
fill_ <- function(data, fill_cols, .direction = c("down", "up")) {
  UseMethod("fill_")
}

#' @export
fill_.data.frame <- function(data, fill_cols, .direction = c("down", "up")) {
  .direction <- match.arg(.direction)
  fillVector <- switch(.direction, down = fillDown, up = fillUp)

  for (col in fill_cols) {
    data[[col]] <- fillVector(data[[col]])
  }

  data
}

#' @export
fill_.grouped_df <- function(data, fill_cols, .direction = c("down", "up")) {
  dplyr::do(data, fill_(., fill_cols = fill_cols, .direction = .direction))
}
