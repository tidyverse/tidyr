#' Pack and unpack
#'
#' @description
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("maturing")}
#'
#' Packing and unpacking preserve the length of a data frame, changing its
#' width. `pack()` makes `df` narrow by collapsing a set of columns into a
#' single df-column. `unpack()` makes `data` wider by expanding df-columns
#' back out into individual columns.
#'
#' @details
#' Generally, unpacking is more useful than packing because it simplifies
#' a complex data structure. Currently, few functions work with df-cols,
#' and they are mostly a curiosity, but seem worth exploring further because
#' they mimic the nested column headers that are so popular in Excel.
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
pack <- function(data, ...) {
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    abort("All elements of `...` must be named")
  }

  cols <- map(cols, ~ tidyselect::vars_select(tbl_vars(data), !!.x))
  packed <- map(cols, ~ data[.x])

  # TODO: find a different approach that preserves order
  asis <- setdiff(names(data), unlist(cols))
  out <- vec_cbind(data[asis], new_data_frame(packed, n = nrow(data)))

  reconstruct_tibble(data, out)
}

#' @export
#' @rdname pack
#' @param names_sep If `NULL`, the default, the names of new columns will
#'   come directly from the inner data frame.
#'
#'   If a string, the names of the new columns will be formed by pasting
#'   together the outer column name with the inner names, separated by
#'   `names_sep`.
#' @param names_repair Used to check that output data frame has valid
#'   names. Must be one of the following options:
#'
#'   * "minimal": no name repair or checks, beyond basic existence,
#'   * "unique": make sure names are unique and not empty,
#'   * "check_unique": (the default), no name repair, but check they are unique,
#'   * "universal": make the names unique and syntactic
#'   * a function: apply custom name repair.
#'   * [tidyr_legacy]: use the name repair from tidyr 0.8.
#'   * a formula: a purrr-style anonymous function (see [rlang::as_function()])
#'
#'   See [vctrs::vec_as_names()] for more details on these terms and the
#'   strategies used to enforce them.
unpack <- function(data, cols, names_sep = NULL, names_repair = "check_unique") {
  cols <- tidyselect::vars_select(tbl_vars(data), !!enquo(cols))

  new_cols <- map2(data[cols], cols, check_unpack, names_sep = names_sep)
  data <- update_cols(data, new_cols)
  out <- flatten_at(data, names(data) %in% cols)

  out <- as_tibble(out, .name_repair = names_repair)
  reconstruct_tibble(data, out)
}

check_unpack <- function(x, col, names_sep = NULL) {
  if (!is.data.frame(x) && !is_empty(x)) {
    abort(glue("`{col}` must be a data frame column"))
  }

  if (!is.null(names_sep)) {
    names(x) <- paste0(col, names_sep, names(x))
  }
  x
}
