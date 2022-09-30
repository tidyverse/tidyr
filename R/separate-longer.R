#' Split a string into rows
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string and splits it into multiple rows:
#'
#' * `separate_by_longer()` splits by a delimiter.
#' * `separate_at_longer()` splits by a fixed width.
#'
#' @export
#' @inheritParams separate_by_wider
#' @examples
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_by_longer(x, delim = " ")
#'
#' # You can separate multiple columns at a time
#' df <- tibble(id = 1:3, x = c("x", "x y", "x y z"), y = c("a", "a b", "a b c"))
#' df %>% separate_by_longer(c(x, y), delim = " ")
#'
#' # Or instead split by a fixed length
#' df <- tibble(id = 1:3, x = c("ab", "def", ""))
#' df %>% separate_at_longer(x, 1)
#' df %>% separate_at_longer(x, 2)
#' df %>% separate_at_longer(x, 2, keep_empty = TRUE)
separate_by_longer <- function(data, cols, delim, ...) {
  check_installed("stringr")
  check_required(cols)
  if (!is_string(delim)) {
    abort("`delim` must be a string")
  }
  check_dots_empty()

  map_unchop(data, {{ cols }}, stringr::str_split, pattern = stringr::fixed(delim))
}

#' @param width Number of characters to split by.
#' @param keep_empty By default, you'll get `nchar(x) / width` rows for
#'   each observation. If `nchar(x)` is zero, this means the entire input
#'   row will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a missing value.
#' @rdname separate_by_longer
#' @export
separate_at_longer <- function(data, cols, width, ..., keep_empty = FALSE) {
  check_installed("stringr")
  check_required(cols)
  if (!is_integerish(width) || length(width) != 1 || is.na(width)) {
    abort("`width` must be an integer")
  }
  check_dots_empty()

  map_unchop(
    data, {{ cols }},
    str_split_length,
    width = width,
    .keep_empty = keep_empty
  )
}

str_split_length <- function(x, width = 1) {
  max_length <- max(stringr::str_length(x))
  idx <- seq(1, max_length, by = width)

  pieces <- stringr::str_sub_all(x, cbind(idx, length = width))
  pieces <- lapply(pieces, function(x) x[x != ""])
  pieces
}

# helpers -----------------------------------------------------------------

map_unchop <- function(data, cols, fun, ..., .keep_empty = FALSE) {
  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- fun(data[[col]], ...)
  }
  unchop(data, all_of(col_names), keep_empty = .keep_empty)
}
