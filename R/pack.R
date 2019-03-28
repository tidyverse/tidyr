#' Pack and unpack
#'
#' Packing and unpacking preserve the length of a data frame, changing its
#' width. `pack()` makes `df` narrow by collapsing a set of columns into a
#' single df-column. `unpack()` makes `df` wider by expanding list-columns and
#' df-columns into individual columns.
#'
#' Generally, unpacking is more useful than packing because it simplifies
#' a complex data structure. Currently, few functions work with df-cols,
#' and they are mostly a curiosity, but seem worth exploring further because
#' they mimic the nested column headers that are so popular in Excel.
#'
#' Learn more in `vignette("chop-pack-nest")`.
#'
#' @inheritParams unchop
#' @param ... Name-variable pairs of the form `new_col = c(col1, col2, col3)`,
#'   that describe how you wish to pack existing columns into new columns.
#'   The right hand side can be any expression supported by tidyselect.
#' @export
#' @examples
#' # Packing =============================================================
#' # It's not currently clear why you would ever want to pack columns
#' # since few functions work with this sort of data.
#' df <- tibble(x1 = 1:3, x2 = 4:6, x3 = 7:9, y = 1:3)
#' df %>% pack(x = c(x1, x2, x3))
#' df %>% pack(x = c(x1, x2, x3))
#'
#' # Unpacking ===========================================================
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
pack <- function(df, ...) {
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    abort("All elements of `...` must be named")
  }

  cols <- map(cols, ~ tidyselect::vars_select(names(df), !!.x))
  packed <- map(cols, ~ df[.x])

  # TODO: find a different approach that preserves order
  asis <- setdiff(names(df), unlist(cols))
  vec_cbind(df[asis], new_data_frame(packed, n = nrow(df)))
}

#' @export
#' @rdname pack
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

# Helpers -----------------------------------------------------------------

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
