#' Nest repeated values from selected variables in a list-variable.
#'
#' A scoped variant of `nest()`` operate on a selection of variables.
#' Unlike `nest()`, `nest_if` coerce input data to be ungrouped data frame.
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
nest_if <- function(data, .predicate, ..., .key = "data") {
  UseMethod("nest_if")
}
#' @export
nest_if.data.frame <- function(data, .predicate, ..., .key = "data") {
  key_var <- quo_name(enexpr(.key))
  predicate_vars <- dplyr:::tbl_if_vars(
    dplyr::ungroup(data), .predicate, rlang:::caller_env(), .include_group_vars = TRUE
  )
  nest_vars <- unname(tidyselect::vars_select(names(data), !!predicate_vars, ...))
  if(length(nest_vars) == 0) return(data)
  nest(dplyr::ungroup(data), !!nest_vars, .key = !!key_var)
}
