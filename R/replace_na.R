#' Replace missing values
#'
#' @param data A data frame or a vector.
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
#' @rdname replace_na
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is.list(replace))

  for (var in names(replace)) {
    data[[var]][is.na(data[[var]])] <- replace[[var]]
  }

  data
}

#' @export
#' @rdname replace_na
replace_na.tbl_df <- function(data, replace = list(), ...) {
  as_data_frame(NextMethod())
}

#' @export
#' @rdname replace_na
replace_na.default <- function(data, replace = list(), ...) {
  data[which(is.na(data))] <- replace[[1]]
  data
}
