#' Pack and packing
#'
#' Packing and unpacking preserve the length of a data frame, changing its
#' width. `chop()` makes `df` shorter by converting rows within each group
#' into list-columns. `unchop()` makes `df` longer by expanding list-columns
#' so that each element of the list-column gets its own row in the output.
#' Learn more in `vignette("chop-pack-nest")`.
#'
#' @inheritParams unchop
#' @export
#' @examples
#' df <- tibble(x = 1:3, y = list(c(a = 1L), c(a = 1, b = 2), c(b = 3)))
#' df %>% unpack(y)
#'
#' df <- tibble(x = 1:4, y = list(integer(), 1, 2:3, 4:6))
#' df %>% unpack(y)
#'
#' # Lists of data frames ------------------------------------------------
#' # A list of data frames becomes multiple list-cols because unpack()
#' # preserves the length of the input
#' df <- tibble(x = 1:3, y = list(NULL, tibble(a = 1, b = 2), tibble(b = 1:3)))
#' df %>% unpack(y)
#'
#' # Data frame column ---------------------------------------------------
#' df <- tibble(x = 1:3, y = tibble(a = 1:3, b = 3:1))
#' df %>% unpack(y)
unpack <- function(df, col, ptype = NULL) {
  col <- tidyselect::vars_pull(names(df), !!enquo(col))
  x <- df[[col]]

  if (is_bare_list(vec_proxy(x))) {
    x_df <- map(x, df_row, outer = col)
    out <- vec_rbind(!!!x_df, .ptype = ptype)
  } else if (is.data.frame(x)) {
    out <- x
  } else {
    abort("`col` must be a list or data frame")
  }

  append_df(df, out, col, remove = TRUE)
}

# Always returns a single row
df_row <- function(x, outer) {
  if (is.null(x)) {
    tibble::new_tibble(list(), nrow = 1)
  } else if (is.data.frame(x)) {
    tibble::new_tibble(map(x, list), nrow = 1L)
  } else {
    if (is.null(names(x)) && length(x) > 0L) {
      names(x) <- paste0(outer, seq_along(x))
    }
    tibble::new_tibble(as.list(x), nrow = 1L)
  }
}
