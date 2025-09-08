#' Drop rows containing missing values
#'
#' `drop_na()` drops rows where any column specified by `...` contains a
#' missing value.
#'
#' @details
#' Another way to interpret `drop_na()` is that it only keeps the "complete"
#' rows (where no rows contain missing values). Internally, this completeness is
#' computed through [vctrs::vec_detect_complete()].
#'
#' @param data A data frame.
#' @param ... <[`tidy-select`][tidyr_tidy_select]> Columns to inspect for
#'   missing values. If empty, all columns are used.
#' @examples
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df |> drop_na()
#' df |> drop_na(x)
#'
#' vars <- "y"
#' df |> drop_na(x, any_of(vars))
#' @export
drop_na <- function(data, ...) {
  check_dots_unnamed()
  UseMethod("drop_na")
}

#' @export
drop_na.data.frame <- function(data, ...) {
  dots <- enquos(...)

  if (is_empty(dots)) {
    # Use all columns if no `...` are supplied
    cols <- data
  } else {
    vars <- tidyselect::eval_select(
      expr(c(!!!dots)),
      data,
      allow_rename = FALSE
    )
    cols <- data[vars]
  }

  loc <- vec_detect_complete(cols)
  out <- vec_slice(data, loc)

  reconstruct_tibble(data, out)
}
