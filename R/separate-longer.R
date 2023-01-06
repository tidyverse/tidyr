#' Split a string into rows
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string and splits it into multiple rows:
#'
#' * `separate_longer_delim()` splits by a delimiter.
#' * `separate_longer_position()` splits by a fixed width.
#'
#' @export
#' @param delim For `separate_longer_delim()`, a string giving the delimiter
#'   between values. By default, it is interpreted as a fixed string; use
#'   [stringr::regex()] and friends to split in other ways.
#' @inheritParams separate_wider_delim
#' @return A data frame based on `data`. It has the same columns, but different
#'   rows.
#' @examples
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_longer_delim(x, delim = " ")
#'
#' # You can separate multiple columns at once if they have the same structure
#' df <- tibble(id = 1:3, x = c("x", "x y", "x y z"), y = c("a", "a b", "a b c"))
#' df %>% separate_longer_delim(c(x, y), delim = " ")
#'
#' # Or instead split by a fixed length
#' df <- tibble(id = 1:3, x = c("ab", "def", ""))
#' df %>% separate_longer_position(x, 1)
#' df %>% separate_longer_position(x, 2)
#' df %>% separate_longer_position(x, 2, keep_empty = TRUE)
separate_longer_delim <- function(data, cols, delim, ...) {
  check_installed("stringr")
  check_data_frame(data)
  check_required(cols)
  check_string(delim)
  check_dots_empty()

  if (is_bare_string(delim)) {
    delim <- stringr::fixed(delim)
  }

  map_unchop(data, {{ cols }}, stringr::str_split, pattern = delim)
}

#' @param width For `separate_longer_position()`, an integer giving the
#'   number of characters to split by.
#' @param keep_empty By default, you'll get `ceiling(nchar(x) / width)` rows for
#'   each observation. If `nchar(x)` is zero, this means the entire input
#'   row will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a missing value.
#' @rdname separate_longer_delim
#' @export
separate_longer_position <- function(data, cols, width, ..., keep_empty = FALSE) {
  check_installed("stringr")
  check_data_frame(data)
  check_required(cols)
  check_number_whole(width, min = 1L)
  check_dots_empty()

  map_unchop(
    data,
    {{ cols }},
    str_split_length,
    width = width,
    .keep_empty = keep_empty
  )
}

str_split_length <- function(x, width = 1) {
  if (length(x) == 0L) {
    return(list())
  }

  max_length <- max(stringr::str_length(x))
  idx <- seq(1, max_length, by = width)

  pieces <- stringr::str_sub_all(x, cbind(idx, length = width))
  pieces <- lapply(pieces, function(x) x[x != ""])
  pieces
}

# helpers -----------------------------------------------------------------

map_unchop <- function(data, cols, fun, ..., .keep_empty = FALSE, .error_call = caller_env()) {
  cols <- tidyselect::eval_select(
    enquo(cols),
    data = data,
    allow_rename = FALSE,
    allow_empty = FALSE,
    error_call = .error_call
  )
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- fun(data[[col]], ...)
  }

  unchop(
    data = data,
    cols = all_of(col_names),
    keep_empty = .keep_empty,
    ptype = character(),
    error_call = .error_call
  )
}
