#' Drop rows containing missing values
#'
#' @param data A data frame.
#' @inheritSection gather Rules for selection
#' @inheritParams gather
#' @examples
#' library(dplyr)
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% drop_na()
#' df %>% drop_na(x)
#' @export
drop_na <- function(data, ...) {
  UseMethod("drop_na")
}
#' @export
drop_na.default <- function(data, ...) {
  drop_na_(data, vars = compat_as_lazy_dots(...))
}
#' @export
drop_na.data.frame <- function(data, ...) {
  vars <- unname(tidyselect::vars_select(colnames(data), ...))
  if (!is_character(vars)) {
    abort("`vars` is not a character vector.")
  }

  if (is_empty(vars)) {
    f <- stats::complete.cases(data)
  } else {
    f <- stats::complete.cases(data[vars])
  }
  out <- data[f, ]

  reconstruct_tibble(data, out)
}


#' @rdname deprecated-se
#' @export
drop_na_ <- function(data, vars) {
  UseMethod("drop_na_")
}
#' @export
drop_na_.data.frame <- function(data, vars) {
  drop_na(data, !!! vars)
}
