#' Replace missing values
#'
#' @param data A data frame.
#' @param replace A named list given the value to replace \code{NA} with
#'   for each column.
#' @param ... Additional arguments for methods. Currently unused.
#' @examples
#' library(dplyr)
#' df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% replace_na(list(x = 0, y = "unknown"))
#' @export
replace_na <- function(data, replace = list(), ...) {
  UseMethod("replace_na")
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is.list(replace))

  for (var in names(replace)) {
    data[[var]][is.na(data[[var]])] <- replace[[var]]
  }

  data
}

#' @export
replace_na.tbl_df <- function(data, replace = list(), ...) {
  dplyr::tbl_df(NextMethod())
}
