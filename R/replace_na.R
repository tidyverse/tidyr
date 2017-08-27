#' Replace missing values
#'
#' @param data A data frame.
#' @param replace A named list given the value to replace `NA` with
#'   for each column.
#' @param ... Additional arguments for methods. Currently unused.
#' @examples
#' library(dplyr)
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% replace_na(list(x = 0, y = "unknown"))
#' @export
replace_na <- function(data, replace = list(), ...) {
  UseMethod("replace_na")
}
#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is_list(replace))

  for (var in names(replace)) {
    data[[var]][are_na(data[[var]])] <- replace[[var]]
  }

  data
}
