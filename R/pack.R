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
#' @param cols Name of column that you wish to unpack.
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
#' df %>% unpack(c(y, z), names_sep = "_")
#'
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
#' @param names_sep If `NULL`, the default, the names of new columns will
#'   come directly from the inner data frame.
#'
#'   If a string, the names of the new columns will be formed by pasting
#'   together the outer column name with the inner names, separated by
#'   `names_sep`.
#' @param name_repair Used to check that output data frame has valid
#'   names. Must be one of the following options:
#'
#'   * "minimal": No name repair or checks, beyond basic existence,
#'   * "unique": Make sure names are unique and not empty,
#'   * "check_unique": (the default), no name repair, but check they are unique,
#'   * "universal": Make the names unique and syntactic
#'   * a function: apply custom name repair.
#'   * a formula: a purrr-style anonymous function (see [rlang::as_function()])
#'
#'   See [tibble::name-repair] for more details on these terms and the
#'   strategies used to enforce them.
unpack <- function(df, cols, names_sep = NULL, name_repair = "check_unique") {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  df[cols] <- map2(df[cols], cols, check_unpack, names_sep = names_sep)
  out <- flatten_at(df, names(df) %in% cols)

  as_tibble(out, .name_repair = name_repair)
}

check_unpack <- function(x, col, names_sep = NULL) {
  if (!is.data.frame(x)) {
    abort(glue("`{col}` must be a data frame column"))
  }

  if (!is.null(names_sep)) {
    names(x) <- paste0(col, names_sep, names(x))
  }

  x
}
