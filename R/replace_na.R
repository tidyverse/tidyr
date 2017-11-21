#' Replace missing values
#'
#' @param data A data frame or vector.
#' @param replace If `data` is a data frame, a named list giving the value to
#'   replace `NA` with for each column. If `data` is a vector, a single value
#'   used for replacement.
#' @param ... Additional arguments for methods. Currently unused.
#' @export
#' @examples
#' library(dplyr)
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% replace_na(list(x = 0, y = "unknown"))
#'
#' df$x %>% replace_na(0)
#' df$y %>% replace_na("unknown")
replace_na <- function(data, replace, ...) {
  UseMethod("replace_na")
}

#' @export
replace_na.default <- function(data, replace = NA, ...) {
  stopifnot(length(replace) == 1)
  data[are_na(data)] <- replace
  data
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is_list(replace))

  replace_vars <- intersect(names(replace), names(data))

  for (var in replace_vars) {
    data[[var]][are_na(data[[var]])] <- replace[[var]]
  }

  data
}
