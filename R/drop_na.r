#' Drop rows containing missing values
#'
#' @param data A data frame.
#' @param ... Specification of variables to consider while dropping rows.
#'   If empty, consider all variables. Use bare variable names. Select all
#'    variables between x and z with \code{x:z}, exclude y with \code{-y}.
#'    For more options, see the \link[dplyr]{select} documentation.
#' @seealso \code{\link{drop_na_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @examples
#' library(dplyr)
#' df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% drop_na()
#' df %>% drop_na(x)
#' @export
drop_na <- function(data, ...) {
  relevant_cols <- unname(dplyr::select_vars(colnames(data), ...))
  drop_na_(data, relevant_cols)
}

#' Standard-evaluation version of \code{drop_na}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param vars Character vector of variable names. If empty, all
#'    variables are considered while dropping rows.
#' @keywords internal
#' @export
drop_na_ <- function(data, vars) {
  UseMethod("drop_na_")
}

#' @export
drop_na_.data.frame <- function(data, vars) {
  if (!is.character(vars)) stop("`vars` is not a character vector.", call. = FALSE)
  if (length(vars) == 0) {
    f = stats::complete.cases(data)
  } else {
    f <- stats::complete.cases(data[vars])
  }
  data[f, ]
}

#' @export
drop_na_.tbl_df <- function(data, vars) {
  as_data_frame(NextMethod())
}

#' @export
drop_na_.grouped_df <- function(data, vars) {
  regroup(NextMethod(), data)
}
