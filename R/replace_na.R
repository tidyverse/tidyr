#' Replace missing values
#'
#' Replace missing values in columns, either with a specific replacement
#' value or with a value (or expression) based on other columns in the
#' data.
#'
#' @param data A data frame.
#' @param replace A named list given the value to replace \code{NA} with
#'   for each column.
#' @param ... Named arguments providing values to replace \code{NA} with
#' for each column, or an expression based on other columns
#'
#' Note that if you are replacing a column named \code{replace}
#' you need to use replace = list(replace = 0) argument rather than a named
#' argument. This is to keep \code{replace_na} backwards-compatible.
#'
#' @examples
#' library(dplyr)
#' df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
#'
#' # can be given as arguments or a list
#' df %>% replace_na(x = 0, y = "unknown")
#' df %>% replace_na(list(x = 0, y = "unknown"))
#'
#' # can replace columns with other columns
#' df <- data_frame(x = c(1, 2, NA), y = c(3, NA, 4))
#' df %>% replace_na(x = y)
#' df %>% replace_na(y = x)
#'
#' df %>% replace_na(x = y * 10)
#'
#' @export
replace_na <- function(data, replace = list(), ...) {
  UseMethod("replace_na")
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is.list(replace))

  dots <- lazyeval::lazy_dots(...)
  replace <- c(replace, lazyeval::lazy_eval(dots, data = data))

  for (var in names(replace)) {
    repl <- replace[[var]]
    nas <- is.na(data[[var]])

    if (length(repl) == nrow(data)) {
      # replacing with another column
      repl <- repl[nas]
    }

    data[[var]][nas] <- repl
  }

  data
}

#' @export
replace_na.tbl_df <- function(data, replace = list(), ...) {
  dplyr::tbl_df(NextMethod())
}
