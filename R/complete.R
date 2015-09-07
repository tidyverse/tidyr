#' @importFrom stats setNames
#' @importFrom utils type.convert
NULL

#' Complete a data frame with missing combinations of data.
#'
#' This is a wrapper around \code{\link{expand}()},
#' \code{\link[dplyr]{left_join}()} and \code{\link{replace_na}} that's
#' useful for completing missing combinations of data. It turns implicitly
#' missing values into explicitly missing values.
#'
#' @inheritParams complete_
#' @inheritParams expand
#' @export
#' @examples
#' library(dplyr)
#' df <- data_frame(
#'   group = c(1:2, 1),
#'   item_id = c(1:2, 2),
#'   item_name = c("a", "b", "b"),
#'   value1 = 1:3,
#'   value2 = 4:6
#' )
#' df %>% complete(group, c(item_id, item_name))
#'
#' # You can also choose to fill in missing values
#' df %>% complete(group, c(item_id, item_name), fill = list(value1 = 0))
complete <- function(data, ..., fill = list()) {
  dots <- lazyeval::lazy_dots(...)
  complete_(data, dots, fill = fill)
}

#' Standard-evaluation version of \code{complete}.
#'
#' This is a S3 generic.
#' @param data A data frame
#' @param cols Columns to expand
#' @param fill A named list that for each variable supplies a single value to
#'   use instead of \code{NA} for missing combinations.
#' @export
#' @keywords internal
complete_ <- function(data, cols, fill, ...) {
  UseMethod("complete_")
}

#' @export
complete_.data.frame <- function(data, cols, fill, ...) {
  full <- expand_(data, cols)
  full <- dplyr::left_join(full, data, by = names(full))
  full <- replace_na(full, replace = fill)

  full
}
