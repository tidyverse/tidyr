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
#' @param data,.data A data frame.
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Column to unpack.
#' @param names_sep,.names_sep If `NULL`, the default, the names will be left
#'   as is. In `pack()`, inner names will come from the former outer names;
#'   in `unpack()`, the new outer names will come from the inner names.
#'
#'   If a string, the inner and outer names will be used together. In `pack()`,
#'   the names of the new outer columns will be formed by pasting together the
#'   outer and the inner column names, separated by `names_sep`. In `unpack()`,
#'   the new inner names will have the outer names (+ `names_sep`) automatically
#'   stripped. This makes `names_sep` roughly symmetric between packing
#'   and unpacking.
#' @param ... <[`tidy-select`][tidyr_tidy_select]> Columns to pack, specified
#'   using name-variable pairs of the form `new_col = c(col1, col2, col3)`.
#'   The right hand side can be any valid tidy select expression.
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
#' # .names_sep allows you to strip off common prefixes; this
#' # acts as a natural inverse to name_sep in unpack()
#' iris %>%
#'   as_tibble() %>%
#'   pack(
#'     Sepal = starts_with("Sepal"),
#'     Petal = starts_with("Petal"),
#'     .names_sep = "."
#'   )
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
pack <- function(.data, ..., .names_sep = NULL) {
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    abort("All elements of `...` must be named")
  }

  cols <- map(cols, ~ tidyselect::eval_select(.x, .data))
  packed <- map(cols, ~ .data[.x])

  if (!is.null(.names_sep)) {
    packed <- imap(packed, strip_names, .names_sep)
  }

  # TODO: find a different approach that preserves order
  asis <- setdiff(names(.data), unlist(map(cols, names)))
  out <- vec_cbind(.data[asis], new_data_frame(packed, n = nrow(.data)))

  reconstruct_tibble(.data, out)
}

#' @export
#' @rdname pack
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
  check_present(cols)
  cols <- tidyselect::eval_select(enquo(cols), data)

  new_cols <- map2(data[cols], names(cols), check_unpack, names_sep = names_sep)

  data <- update_cols(data, new_cols)
  out <- flatten_at(data, names(data) %in% names(cols))

  if (has_name(formals(vec_as_names), "repair_arg")) {
    names(out) <- vec_as_names(names(out), repair = names_repair, repair_arg = "names_repair")
  } else {
    names(out) <- vec_as_names(names(out), repair = names_repair)
  }

  out <- as_tibble(out, .name_repair = "minimal")
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

strip_names <- function(df, base, names_sep) {
  base <- paste0(base, names_sep)
  names <- names(df)

  has_prefix <- regexpr(base, names, fixed = TRUE) == 1L
  names[has_prefix] <- substr(names[has_prefix], nchar(base) + 1, nchar(names[has_prefix]))

  set_names(df, names)
}
