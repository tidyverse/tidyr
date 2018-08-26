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
#' gather_if(stocks, is.numeric, stock, price)
#' stocks %>% gather_if(is.numeric, stock, price)
#' # same result by gather
#' gather(stocks, stock, price, -time)
#'
#' # get first observation for each Species in iris data -- base R
#' mini_iris <- iris[c(1:3, 51:53, 101:103), ]
#' # gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
#' gather_if(mini_iris, is.numeric, key = flower_att, value = measurement)
#' # same result by gather
#' gather(mini_iris, key = flower_att, value = measurement, -Species)
#' # in case Sepal.Length should be kept as a column,
#' gather_if(mini_iris, is.numeric, key = flower_att, value = measurement, -Sepal.Length)
#' # this is helpful especially when comparing a certain variable with others.
#' library(ggplot2)
#' iris %>%
#'   gather_if(is.numeric, key = flower_ott, value = measurement, -Sepal.Length) %>%
#'   ggplot(aes(x = Sepal.Length, y = measurement, colour = Species)) +
#'   geom_point() +
#'   facet_grid(flower_ott ~ ., switch = 'y') +
#'   ylab(NULL) +
#'   theme(
#'     strip.background = element_blank(),
#'     strip.placement = 'outside'
#'   )
#'
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
