#' @examples
#' df <- tibble(x = 1:4, y = list(integer(), 1L, 1:2, 1:3))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = FALSE)
#'
#' df <- tibble(x = 1:3, y = list(A = c(a = 1L), B = c(b1 = 1, b2 = 2), C = c(c = 3)))
#' df %>% unchop(y)
#' df %>% unchop(y, id = "name")
#'
#' df <- tibble(x = 1:2, y = list("1", 1:3))
#' df %>% unchop(y)
#' df %>% unchop(y, ptype = integer())
#' df %>% unchop(y, ptype = character())
#' df %>% unchop(y, ptype = list())
#'
#' df <- tibble(x = 1:3, y = list(NULL, tibble(x = 1), tibble(y = 1:2)))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = FALSE)
#'
unchop <- function(df, col, id = NULL, keep_empty = FALSE, ptype = NULL) {
  col <- tidyselect::vars_pull(names(df), !!enquo(col))
  x <- df[[col]]
  stopifnot(is.list(x))

  n <- map_int(x, vec_size)
  ptype <- vec_type_common(!!!x, .ptype = ptype)

  # Fill empty elements to ensure original rows are preserved
  empty <- n == 0
  if (keep_empty && any(empty)) {
    vec_slice(x, empty) <- list(vec_na(ptype))
    n[empty] <- 1L
  }

  # Somewhat inefficient to duplicate out[[col]] when we're just about
  # to remove it, but otherwise need to put back in the correct place
  out <- vec_slice(df, rep(vec_seq_along(df), n))
  # https://github.com/r-lib/vctrs/issues/232
  out[[col]] <- vec_c(!!!x, .ptype = ptype)

  if (!is.null(id)) {
    # What happens if it's a mix of named and unnamed?
    idx <- map(x, index)
    idx[empty] <- NA
    out <- append_col(out, vec_c(!!!idx), id, after = col)
  }

  out
}

index <- function(x) {
  names(x) %||% seq_along(x)
}
