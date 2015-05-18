#' Nest repeated values in a list-varible.
#'
#' @seealso \code{\link{unnest}} for the inverse operation.
#' @inheritParams nest_
#' @param ... Specification of columns to nest. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @export
#' @examples
#' library(dplyr)
#' iris %>% nest(-Species)
#' chickwts %>% nest(weight)
nest <- function(data, ...) {
  nest_cols <- unname(dplyr::select_vars(names(data), ...))
  nest_(data, nest_cols)
}

#' Standard-evaluation version of \code{nest}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param nest_cols Character vector of columns to nest.
#' @export
nest_ <- function(data, nest_cols) {
  UseMethod("nest_")
}

#' @export
nest_.data.frame <- function(data, nest_cols) {
  group_cols <- setdiff(names(data), nest_cols)

  nested_cols <- lapply(nest_cols, function(var) {
    lazyeval::interp(quote(list(x)), x = as.name(var))
  })
  names(nested_cols) <- nest_cols

  data %>%
    dplyr::group_by_(.dots = group_cols) %>%
    dplyr::summarise_(.dots = nested_cols) %>%
    dplyr::rowwise()
}

#' @export
nest_.tbl_df <- function(data, nest_cols) {
  dplyr::tbl_df(NextMethod())
}
