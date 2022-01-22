
#' Split a string into rows
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string and splits it into multiple rows:
#'
#' * `separate_longer_delim()` splits by a delimiter.
#' * `separate_longer_fixed()` splits by a fixed width.
#'
#' @export
#' @inheritParams separate_wider_delim
#' @examples
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_longer_delim(x, delim = " ")
#'
#' # You can separate multiple columns at a time
#' df <- tibble(id = 1:3, x = c("x", "x y", "x y z"), y = c("a", "a b", "a b c"))
#' df %>% separate_longer_delim(c(x, y), delim = " ")
#'
#' # Or instead split by a fixed length
#' df <- tibble(id = 1:3, x = c("ab", "def", ""))
#' df %>% separate_longer_fixed(x, 1)
#' df %>% separate_longer_fixed(x, 2)
#' df %>% separate_longer_fixed(x, 2, keep_empty = TRUE)
separate_longer_delim <- function(
    data,
    cols,
    delim
) {
  check_installed("stringr")
  check_present(cols)

  if (!is_string(delim)) {
    abort("`delim` must be a string")
  }

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- stringr::str_split(data[[col]], delim)
  }
  unchop(data, all_of(col_names))
}

#' @param width Number of characters to split by.
#' @param keep_empty By default, you'll get `nchar(x) / width` rows for
#'   each observation. If `nchar(x)` is zero, this means the entire input
#'   row will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a missing value.
#' @rdname separate_longer_delim
#' @export
separate_longer_fixed <- function(
    data,
    cols,
    width,
    keep_empty = FALSE
) {
  check_installed("stringr")
  check_present(cols)
  if (!is_integerish(width) || length(width) != 1 || is.na(width)) {
    abort("`width` must be an integer")
  }

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_split_length(data[[col]], width)
  }
  unchop(data, all_of(col_names), keep_empty = keep_empty)
}
