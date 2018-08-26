#' Nest repeated values from selected variables in a list-variable.
#'
#' A scoped variant of `nest()`` operate on a selection of variables.
#'
#' @inheritParams gather_if
#' @inheritParams nest
#' @param .predicate A predicate function to be applied to the columns or a
#'   logical vector. The variables for which .predicate is or returns TRUE
#'   are nested. This argument is passed to `rlang::as_function()` and thus
#'   supports quosure-style lambda functions and strings representing
#'   function names.
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
#' as_tibble(iris) %>% nest_if(is.numeric)
#' # same result by nest
#' as_tibble(iris) %>% nest(-Species)
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


