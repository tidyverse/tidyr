#' Complete a data frame with missing combinations of data.
#'
#' Turns implicit missing values into explicit missing values.
#' This is a wrapper around [expand()],
#' [dplyr::left_join()] and [replace_na()] that's
#' useful for completing missing combinations of data.
#'
#' If you supply `fill`, these values will also replace existing
#' explicit missing values in the data set.
#'
#' @inheritParams expand
#' @param fill A named list that for each variable supplies a single value to
#'   use instead of `NA` for missing combinations.
#' @export
#' @examples
#' library(dplyr, warn.conflicts = FALSE)
#' df <- tibble(
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
  if (is_empty(exprs(...))) {
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

#' @rdname deprecated-se
#' @inheritParams complete
#' @export
complete_ <- function(data, cols, fill = list(), ...) {
  UseMethod("complete_")
}
#' @export
complete_.data.frame <- function(data, cols, fill = list(), ...) {
  cols <- compat_lazy_dots(cols, caller_env())
  complete(data, !!! cols, fill = fill)
}
