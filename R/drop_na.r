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
#'
#' @param data A data frame.
#' @param relevant_cols Character vector of column names. If empty or \code{NULL}, all
#'    variables are considered while dropping rows
#' @keywords internal
#' @export
drop_na_ <- function(data, relevant_cols){
  if (is.null(relevant_cols) || length(relevant_cols) == 0) {
    f = stats::complete.cases(data)
  } else {
    f <- stats::complete.cases(data[relevant_cols])
  }
  dplyr::filter(data, f)
}
