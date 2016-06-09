#' Nest repeated values in a list-variable.
#'
#' There are many possible ways one could choose to nest columns inside a
#' data frame. \code{nest()} creates a list of data frames containing all
#' the nested variables: this seems to be the most useful form in practice.
#'
#' @seealso \code{\link{unnest}} for the inverse operation.
#' @seealso \code{\link{nest_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @param .key The name of the new column.
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
nest <- function(data, ..., .key = data) {
  key_col <- col_name(substitute(.key))
  nest_cols <- unname(dplyr::select_vars(colnames(data), ...))
  nest_(data, key_col, nest_cols)
}

#' Standard-evaluation version of \code{nest}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param key_col Name of the column that will contain the nested data frames.
#' @param nest_cols Character vector of columns to nest.
#' @keywords internal
#' @export
nest_ <- function(data, key_col, nest_cols = character()) {
  UseMethod("nest_")
}

#' @export
nest_.data.frame <- function(data, key_col, nest_cols = character()) {
  group_cols <- setdiff(names(data), nest_cols)
  nest_impl(as_data_frame(data), key_col, group_cols, nest_cols)
}

#' @export
nest_.tbl_df <- function(data, key_col, nest_cols = character()) {
  as_data_frame(NextMethod())
}

#' @export
nest_.grouped_df <- function(data, key_col, nest_cols = character()) {
  if (length(nest_cols) == 0) {
    nest_cols <- names(data)
  }
  group_cols <- vapply(dplyr::groups(data), as.character, character(1))
  nest_impl(data, key_col, group_cols, nest_cols)
}

#' @importFrom tibble data_frame
nest_impl <- function(data, key_col, group_cols, nest_cols) {
  data <- dplyr::ungroup(data)

  if (length(group_cols) == 0) {
    df <- data_frame(list(data))
    names(df) <- enc2utf8(key_col)

    return(df)
  }

  nest_cols <- setdiff(nest_cols, group_cols)

  out <- dplyr::distinct_(dplyr::select_(data, .dots = group_cols))

  idx <- dplyr::group_indices_(data, .dots = group_cols)
  out[[key_col]] <- unname(split(data[nest_cols], idx))[unique(idx)]

  out
}

globalVariables(".")
