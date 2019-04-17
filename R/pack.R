#' Pack and unpack
#'
#' Packing and unpacking preserve the length of a data frame, changing its
#' width. `pack()` makes `df` narrow by collapsing a set of columns into a
#' single df-column. `unpack()` makes `df` wider by expanding df-columns
#' back out into individual columns.
#'
#' Generally, unpacking is more useful than packing because it simplifies
#' a complex data structure. Currently, few functions work with df-cols,
#' and they are mostly a curiosity, but seem worth exploring further because
#' they mimic the nested column headers that are so popular in Excel.
#'
#' Learn more in `vignette("chop-pack-nest")`.
#'
#' @inheritParams unchop
#' @param col Name of column that you wish to unpack.
#' @param ... Name-variable pairs of the form `new_col = c(col1, col2, col3)`,
#'   that describe how you wish to pack existing columns into new columns.
#'   The right hand side can be any expression supported by tidyselect.
#' @export
#' @examples
#' # Packing =============================================================
#' # It's not currently clear why you would ever want to pack columns
#' # since few functions work with this sort of data.
#' df <- tibble(x1 = 1:3, x2 = 4:6, x3 = 7:9, y = 1:3)
#' df
#' df %>% pack(x = starts_with("x"))
#' df %>% pack(x = c(x1, x2, x3), y = y)
#'
#' # Unpacking ===========================================================
#' df <- tibble(
#'   x = 1:3,
#'   y = tibble(a = 1:3, b = 3:1),
#'   z = tibble(X = c("a", "b", "c"), Y = runif(3), Z = c(TRUE, FALSE, NA))
#' )
#' df
#' df %>% unpack(y)
#' df %>% unpack(c(y, z))
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
unpack <- function(df, col) {
  cols <- tidyselect::vars_select(names(df), !!enquo(col))

  for (col in cols) {
    x <- df[[col]]
    if (!is.data.frame(x)) {
      abort(glue("`{col}` must be a data frame column"))
    }
    df <- append_df(df, x, col, remove = TRUE)
  }

  df
}

