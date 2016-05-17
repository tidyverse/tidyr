#' Expand data frame to include all combinations of values
#'
#' \code{expand()} is often useful in conjunction with \code{left_join} if
#' you want to convert implicit missing values to explicit missing values.
#' Or you can use it in conjunction with \code{anti_join()} to figure
#' out which combinations are missing.
#'
#' \code{crossing()} is similar to \code{\link{expand.grid}()}, this never
#' converts strings to factors, returns a \code{tbl_df} without additional
#' attributes, and first factors vary slowest. \code{nesting()} is the
#' complement to \code{crossing()}: it only keeps combinations of all variables
#' that appear in the data.
#'
#' @inheritParams expand_
#' @param ... Specification of columns to expand.
#'
#'   To find all unique combinations of x, y and z, including those not
#'   found in the data, supply each variable as a separate argument.
#'   To find only the combinations that occur in the data, use nest:
#'   \code{expand(df, nesting(x, y, z))}.
#'
#'   You can combine the two forms. For example,
#'   \code{expand(df, nesting(school_id, student_id), date)} would produce
#'   a row for every student for each date.
#'
#'   To fill in values that are missing altogether, use expressions like
#'   \code{year = 2010:2020} or \code{year = \link{full_seq}(year)}.
#' @seealso \code{\link{complete}} for a common application of \code{expand}:
#'   completing a data frame with missing combinations.
#' @seealso \code{\link{expand_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' library(dplyr)
#' # All possible combinations of vs & cyl, even those that aren't
#' # present in the data
#' expand(mtcars, vs, cyl)
#'
#' # Only combinations of vs and cyl that appear in the data
#' expand(mtcars, nesting(vs, cyl))
#'
#' # Implicit missings ---------------------------------------------------------
#' df <- data_frame(
#'   year   = c(2010, 2010, 2010, 2010, 2012, 2012, 2012),
#'   qtr    = c(   1,    2,    3,    4,    1,    2,    3),
#'   return = rnorm(7)
#' )
#' df %>% expand(year, qtr)
#' df %>% expand(year = 2010:2012, qtr)
#' df %>% expand(year = full_seq(year, 1), qtr)
#' df %>% complete(year = full_seq(year, 1), qtr)
#'
#' # Nesting -------------------------------------------------------------------
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
#' all <- experiment %>% expand(nesting(name, trt), rep)
#' all
#'
#' # We can use anti_join to figure out which observations are missing
#' all %>% anti_join(experiment)
#'
#' # And use right_join to add in the appropriate missing values to the
#' # original data
#' all %>% right_join(experiment)
#' # Or use the complete() short-hand
#' experiment %>% complete(nesting(name, trt), rep)
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

  dots <- lazyeval::auto_name(dots)
  pieces <- lazyeval::lazy_eval(dots, data)

  crossing_(pieces)
}

#' @export
expand_.tbl_df <- function(data, dots, ...) {
  as_data_frame(NextMethod())
}

#' @export
expand_.grouped_df <- function(data, dots, ...) {
  dplyr::do(data, expand_(., dots, ...))
}


# Nesting & crossing ------------------------------------------------------

#' @export
#' @rdname expand
crossing <- function(...) {
  crossing_(list(...))
}

#' @export
#' @rdname expand
#' @importFrom tibble data_frame
nesting <- function(...) {
  df <- data_frame(...)
  df <- dplyr::distinct(df)
  df[do.call(order, df), , drop = FALSE]
}

crossing_ <- function(x) {
  stopifnot(is.list(x))

  is_atomic <- vapply(x, is.atomic, logical(1))
  is_df <- vapply(x, is.data.frame, logical(1))
  if (any(!is_df & !is_atomic)) {
    bad <- names(x)[!is_df & !is_atomic]
    stop(
      "Each element must be either an atomic vector or a data frame\n.",
      "Problems: ", paste(bad, collapse = ", "), ".\n",
      call. = FALSE
    )
  }

  # turn each data frame into single column data frame
  col_df <- lapply(x[is_atomic], function(x) data_frame(x = ulevels(x)))
  col_df <- Map(setNames, col_df, names(x)[is_atomic])
  x[is_atomic] <- col_df

  Reduce(cross_df, x)
}

cross_df <- function(x, y) {
  x_idx <- rep(seq_len(nrow(x)), each = nrow(y))
  y_idx <- rep(seq_len(nrow(y)), nrow(x))
  dplyr::bind_cols(x[x_idx, , drop = FALSE], y[y_idx, , drop = FALSE])
}

