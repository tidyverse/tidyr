#' Expand data frame to include all combinations of levels.
#'
#' @inheritParams expand_
#' @param ... Specification of columns to expand. These can either
#'   be bare column names, or transformations of a column.
#' @seealso \code{\link{expand_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' expand(mtcars, vs, cyl)
#' expand(mtcars, cyl, mpg = seq_range(mpg, 2))
#' expand(mtcars, cyl, mpg = seq_range(mpg, 5))
#'
#' df <- data.frame(a = c(1, 2, 5), b = c(3, 5, 3), c = c(1, 2, 3))
#' expand(df)
#' expand(df, a, b)
#' expand(df, a, c)
#' expand(df, b, c)
expand <- function(data, ...) {
  dots <- lazyeval::lazy_dots(...)
  expand_(data, dots)
}

#' Expand (standard evaluation).
#'
#' This is a S3 generic.
#'
#' @param data A data frame
#' @param expand_cols Character vector of column names to be expanded.
#' @keywords internal
#' @export
expand_ <- function(data, dots, ...) {
  UseMethod("expand_")
}

#' @export
expand_.data.frame <- function(data, dots, ...) {
  dots <- lazyeval::auto_name(dots)
  if (length(dots) > 0) {
    data <- lazyeval::lazy_eval(dots, data)
  }

  grid <- lapply(data, ulevels)
  rev(expand.grid(rev(grid), stringsAsFactors = FALSE))
}

#' @export
expand_.tbl_df <- function(data, dots, ...) {
  dplyr::tbl_df(NextMethod())
}

#' Create an evenly spaced sequence of values from highest to lowest.
#'
#' @param x A numeric vector
#' @param n Number of values
#' @export
#' @examples
#' seq_range(1:100, 5)
seq_range <- function(x, n) {
  rng <- range(x, na.rm = TRUE)
  seq(rng[1], rng[2], length = n)
}
