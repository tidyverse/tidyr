#' Complete a data frame with missing combinations of data.
#'
#' Turns implicit missing values into explicit missing values.
#' This is a wrapper around \code{\link{expand}()},
#' \code{\link[dplyr]{left_join}()} and \code{\link{replace_na}} that's
#' useful for completing missing combinations of data.
#'
#' If you supply \code{fill}, these values will also replace existing
#' explicit missing values in the data set.
#'
#' @inheritParams complete_
#' @inheritParams expand
#' @seealso \code{\link{complete_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' library(dplyr, warn.conflicts = FALSE)
#' df <- data_frame(
#'   group = c(1:2, 1),
#'   item_id = c(1:2, 2),
#'   item_name = c("a", "b", "b"),
#'   value1 = 1:3,
#'   value2 = 4:6
#' )
#' df %>% complete(group, nesting(item_id, item_name))
#'
#' # You can also choose to fill in missing values
#' df %>% complete(group, nesting(item_id, item_name), fill = list(value1 = 0))
complete <- function(data, ..., fill = list()) {
  if (dots_n(...) == 0) {
    abort("Please supply variables to complete")
  }

  UseMethod("complete")
}
complete.default <- function(data, ..., fill = list()) {
  complete_(data, .dots = compat_as_lazy_dots(...), fill = fill)
}
#' @export
complete.data.frame <- function(data, ..., fill = list()) {
  full <- expand(data, ...)
  full <- dplyr::left_join(full, data, by = names(full))
  full <- replace_na(full, replace = fill)

  reconstruct_tibble(data, full)
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
complete_ <- function(data, cols, fill = list(), ...) {
  UseMethod("complete_")
}
#' @export
complete_.data.frame <- function(data, cols, fill = list(), ...) {
  cols <- compat_lazy_dots(cols, caller_env())
  complete(data, !!! cols, fill = fill)
}
