#' Nest repeated values in a list-variable.
#'
#' There are many possible ways one could choose to nest columns inside a
#' data frame. `nest()` creates a list of data frames containing all
#' the nested variables: this seems to be the most useful form in practice.
#'
#' @inheritSection gather Rules for selection
#' @inheritParams gather
#' @param data A data frame.
#' @param .key The name of the new column, as a string or symbol.
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings
#'   and symbols). The name is captured from the expression with
#'   [rlang::quo_name()] (note that this kind of interface where
#'   symbols do not represent actual objects is now discouraged in the
#'   tidyverse; we support it here for backward compatibility).
#' @seealso [unnest()] for the inverse operation.
#' @export
#' @examples
#' library(dplyr)
#' as_tibble(iris) %>% nest(-Species)
#' as_tibble(chickwts) %>% nest(weight)
#'
#' if (require("gapminder")) {
#'   gapminder %>%
#'     group_by(country, continent) %>%
#'     nest()
#'
#'   gapminder %>%
#'     nest(-country, -continent)
#' }
nest <- function(data, ..., .key = "data") {
  UseMethod("nest")
}
#' @export
nest.data.frame <- function(data, ..., .key = "data") {
  key_var <- quo_name(enexpr(.key))

  nest_vars <- unname(tidyselect::vars_select(names(data), ...))
  if (is_empty(nest_vars)) {
    nest_vars <- names(data)
  }

  if (dplyr::is_grouped_df(data)) {
    group_vars <- dplyr::group_vars(data)
  } else {
    group_vars <- setdiff(names(data), nest_vars)
  }
  nest_vars <- setdiff(nest_vars, group_vars)

  data <- dplyr::ungroup(data)
  if (is_empty(group_vars)) {
    return(tibble(!! key_var := list(data)))
  }

  out <- dplyr::select(data, !!! syms(group_vars))

  idx <- dplyr::group_indices(data, !!! syms(group_vars))
  representatives <- which(!duplicated(idx))

  out <- dplyr::slice(out, representatives)

  out[[key_var]] <- unname(split(data[nest_vars], idx))[unique(idx)]

  out
}


