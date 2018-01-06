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
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"), z = list(1:5, NULL, 10:20))
#' df %>% replace_na(list(x = 0, y = "unknown"))
#'
#' # NULL are the list-col equivalent of NAs
#' df %>% replace_na(list(z = list(5)))
#'
#' df$x %>% replace_na(0)
#' df$y %>% replace_na("unknown")
replace_na <- function(data, replace, ...) {
  UseMethod("replace_na")
}

#' @export
replace_na.default <- function(data, replace = NA, ...) {
  check_replacement(replace, "data")
  data[!is_complete(data)] <- replace
  data
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is_list(replace))

  replace_vars <- intersect(names(replace), names(data))

  for (var in replace_vars) {
    check_replacement(replace[[var]], var)
    data[[var]][!is_complete(data[[var]])] <- replace[[var]]
  }

  data
}

check_replacement <- function(x, var) {
  n <- length(x)
  if (n == 1) {
    return()
  }

  abort(glue("Replacement for `{var}` is length {n}, not length 1"))
}
