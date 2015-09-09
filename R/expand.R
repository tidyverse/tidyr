#' Expand data frame to include all combinations of values
#'
#' \code{expand()} is often useful in conjunction with \code{left_join} if
#' you want to convert implicit missing values to explicit missing values.
#' Or you can use it in conjunction with \code{anti_join()} to figure
#' out which combinations are missing.
#'
#' @inheritParams expand_
#' @param ... Specification of columns to expand.
#'
#'   To find all unique combinations of x, y and z, including those not
#'   found in the data, supply each variable as a separate argument.
#'   To find only the combinations that occur in the data, supply them
#'   as a single argument with \code{c()}: \code{expand(df, c(x, y, z))}.
#'
#'   You can combine the two forms. For example,
#'   \code{expand(df, c(school_id, student_id), date)} would produce
#'   a row for every student for each date.
#' @seealso \code{\link{complete}} for a common application of \code{expand}:
#'   completing a data frame with missing combinations.
#' @seealso \code{\link{expand_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' # All possible combinations of vs & cyl, even those that aren't
#' # present in the data
#' expand(mtcars, vs, cyl)
#'
#' # Only combinations of vs and cyl that appear in the data
#' expand(mtcars, c(vs, cyl))
#'
#' library(dplyr)
#' # Each person was given one of two treatments, repeated three times
#' # But some of the replications haven't happened yet, so we have
#' # incomplete data:
#' experiment <- data_frame(
#'   name = rep(c("Alex", "Robert", "Sam"), c(3, 2, 1)),
#'   trt  = rep(c("a", "b", "a"), c(3, 2, 1)),
#'   rep = c(1, 2, 3, 1, 2, 1),
#'   measurment_1 = runif(6),
#'   measurment_2 = runif(6)
#' )
#'
#' # We can figure out the complete set of data with expand()
#' # Each person only gets one treatment, so we nest name and trt together:
#' complete <- expand(experiment, c(name, trt), rep)
#' complete
#'
#' # We can use anti_join to figure out which observations are missing
#' complete %>% anti_join(experiment)
#'
#' # And use right_join to add in the appropriate missing values to the
#' # original data
#' experiment %>% right_join(complete)
#' # Or use complete() which wraps up this common pattern
#' complete(experiment, c(name, trt), rep)
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
  dots <- lazyeval::as.lazy_dots(dots)
  if (length(dots) == 0)
    return(data.frame())

  pieces <- lapply(dots, unique_vals, data = data)
  Reduce(cross_df, pieces)
}

unique_vals <- function(data, dots) {
  df <- dplyr::distinct(dplyr::select_(data, .dots = dots))
  dplyr::arrange_(df, .dots = lapply(names(df), as.name))
}

cross_df <- function(x, y) {
  x_idx <- rep(seq_len(nrow(x)), each = nrow(y))
  y_idx <- rep(seq_len(nrow(y)), nrow(x))
  dplyr::bind_cols(x[x_idx, , drop = FALSE], y[y_idx, , drop = FALSE])
}

#' @export
expand_.tbl_df <- function(data, dots, ...) {
  dplyr::tbl_df(NextMethod())
}

#' Create an evenly spaced sequence of values from lowest to highest.
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
