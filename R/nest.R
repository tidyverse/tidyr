#' Nest repeated values in a list-varible.
#'
#' There are many possible ways one could choose to nest columns inside a
#' data frame. \code{nest()} creates a list of data frames containing all
#' the nested variables: this seems to be the most useful for in practice.
#'
#' @seealso \code{\link{unnest}} for the inverse operation.
#' @seealso \code{\link{nest_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @inheritParams nest_
#' @param ... Specification of columns to nest. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @export
#' @examples
#' library(dplyr)
#' iris %>% nest(-Species)
#' chickwts %>% nest(weight)
#'
#' if (require("gapminder")) {
#'   gapminder %>%
#'     group_by(country, continent) %>%
#'     nest()
#'
#'   gapminder %>%
#'     nest(-country, -continent)
#' }
nest <- function(data, ...) {
  nest_cols <- unname(dplyr::select_vars(colnames(data), ...))
  nest_(data, nest_cols)
}

#' Standard-evaluation version of \code{nest}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param nest_cols Character vector of columns to nest.
#' @keywords internal
#' @export
nest_ <- function(data, nest_cols) {
  UseMethod("nest_")
}

#' @export
nest_.data.frame <- function(data, nest_cols) {
  group_cols <- setdiff(names(data), nest_cols)

  data %>%
    dplyr::group_by_(.dots = group_cols) %>%
    dplyr::do(data = dplyr::as_data_frame(.[nest_cols])) %>%
    dplyr::ungroup()
}

#' @export
nest_.tbl_df <- function(data, nest_cols) {
  dplyr::tbl_df(NextMethod())
}

#' @export
nest_.grouped_df <- function(data, nest_cols) {
  if (length(nest_cols) > 0) {
    warning("`nest_cols` ignored when nesting grouped data", call. = FALSE)
  }

  groups <- dplyr::groups(data)
  group_vars <- vapply(groups, as.character, character(1))
  nest_vars <- setdiff(names(data), group_vars)

  data %>%
    dplyr::do(data = dplyr::as_data_frame(.[nest_vars])) %>%
    dplyr::ungroup()
}

globalVariables(".")
