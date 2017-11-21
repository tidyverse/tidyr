#' Replace missing values
#'
#' @param data A data frame or vector.
#' @param replace The value(s) to replace `NA` with. If `data` is
#'   a vector, a vector or list with a single replacement value.
#'   If `data` is a data.frame, a named list providing such
#'   replacement vectors for each of the named columns.
#' @param ... Additional arguments for methods. Currently unused.
#' @examples
#' library(dplyr)
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% replace_na(list(x = 0, y = "unknown"))
#' df$x %>% replace_na(3)
#' @export
replace_na <- function(data, replace = NULL, ...) {
  UseMethod("replace_na")
}
#' @export
replace_na.default <- function(data, replace = NULL, ...) {
  if (length(replace) != 1L)
    stop("If 'data' is a vector, 'replace' has to be of length 1, not ", length(replace))
  if (is_list(replace)) replace <- replace[[1L]]

  data[are_na(data)] <- replace
  data
}
#' @export
replace_na.data.frame <- function(data, replace = NULL, ...) {
  if (is_null(replace)) return(data)
  stopifnot(is_list(replace))

  replace_vars <- intersect(names(replace), names(data))

  for (var in replace_vars) {
    data[[var]][are_na(data[[var]])] <- replace[[var]]
  }

  data
}
