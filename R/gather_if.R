#' Gather selected variables into key-value pairs.
#'
#' A scoped variant of `gather()` operate on a selection of variables.
#'
#' @inheritParams expand
#' @param .predicate A predicate function to be applied to the columns
#'   or a logical vector. The variables for which `.predicate` is or
#'   returns TRUE are gathered. This argument is passed to
#'   `rlang::as_function()``and thus supports quosure-style lambda
#'   functions and strings representing function names.
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings
#'   and symbols). The name is captured from the expression with
#'   [rlang::quo_name()] (note that this kind of interface where
#'   symbols do not represent actual objects is now discouraged in the
#'   tidyverse; we support it here for backward compatibility).
#' @param ... An additional selection of columns after `.predicate`.
#'   If empty, all variables selected by `.predicate` are selected.
#'   You can supply bare variable names, select all variables between
#'   x and z with `x:z`, exclude y with `-y`. For more options, see
#'   the [dplyr::select()] documentation. See also the section on
#'   selection rules in `gather`.
#' @inheritParams gather
#' @inheritParams gather_
#' @export
#' @examples
#' library(dplyr)
#' # From http://stackoverflow.com/questions/1181060
#' stocks <- tibble(
#'   time = as.Date('2009-01-01') + 0:9,
#'   X = rnorm(10, 0, 1),
#'   Y = rnorm(10, 0, 2),
#'   Z = rnorm(10, 0, 4)
#' )
#'
#' gather(stocks, stock, price, -time)
#' stocks %>% gather(stock, price, -time)
#'
#' # get first observation for each Species in iris data -- base R
#' mini_iris <- iris[c(1, 51, 101), ]
#' # gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
#' gather(mini_iris, key = flower_att, value = measurement,
#'        Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
#' # same result but less verbose
#' gather(mini_iris, key = flower_att, value = measurement, -Species)
#'
#' # repeat iris example using dplyr and the pipe operator
#' library(dplyr)
#' mini_iris <-
#'   iris %>%
#'   group_by(Species) %>%
#'   slice(1)
#' mini_iris %>% gather(key = flower_att, value = measurement, -Species)
gather_if <- function(
  data, .predicate, key = "key", value = "value", ...,
  na.rm = FALSE, convert = FALSE, factor_key = FALSE
) {
  vars <- dplyr:::tbl_if_vars(
    data, .predicate, rlang:::caller_env(), .include_group_vars = TRUE
  )

  gather(
    data = data, key = key, value = value,
    one_of(vars), # !!vars also works. Which is better?
    ..., na.rm = na.rm, convert = convert, factor_key = factor_key
  )
}
