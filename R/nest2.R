#' Nesting and unnesting
#'
#' Nesting and unnesting change both the length and width of a data frame.
#' `nest()` and `unnest()` are designed to create with nested-dfs, list-cols of
#' data frames.
#'
#' `unnest_wider()` and `unnest_longer()` are special cases of `unnest()`
#' that unnest for lists of vectors; the suffixes are needed because depending
#' on the context a vector might represent a row or a column. They also
#' provide greater control
#'
#' Learn more in `vignette("chop-pack-nest")`.
#'
#' @param cols Names of columns to unnest.
#' @param ... Name-variable pairs of the form `new_col = c(col1, col2, col3)`,
#'   that describe how you wish to nest existing columns into new columns.
#'   The right hand side can be any expression supported by tidyselect.
#' @inheritParams unchop
#' @export
#' @examples
#' # nest =============================================================
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% nest(c(y, z))
#' # cf nest
#' df %>% chop(c(y, z))
#'
#' # unnest ===========================================================
#' df <- tibble(
#'   x = 1:3,
#'   y = list(
#'     NULL,
#'     tibble(a = 1, b = 2),
#'     tibble(a = 1:3, b = 3:1)
#'   )
#' )
#' df %>% unnest2(y)
#' df %>% unnest2(y, keep_empty = TRUE)
#'
#' # You can use unnest_longer() and unnest_wider() with nested dfs,
#' # although it's not clear how useful the results are. unnest_longer()
#' # maintains the same number of columns, creating a packed data frame,
#' # while unnest_wider() maintains the same number of rows, creating
#' # list-cols of vectors
#' df %>% unnest_wider(y)
#' df %>% unnest_longer(y)
#'
#' # Typically, however, you'll use unnest_longer() and _wider() with
#' # list-cols containing vectors
#' df <- tibble(
#'   x = 1:3,
#'   y = list(NULL, 1:3, 4:5)
#' )
#' df %>% unnest_longer(y)
#' df %>% unnest_longer(y, keep_empty = TRUE)
#' # Automatically creates names if widening
#' df %>% unnest_wider(y)
#'
#' # And similarly if the vectors are named
#' df <- tibble(
#'   x = 1:2,
#'   y = list(c(a = 1, b = 2), c(a = 10, b = 11, c = 12))
#' )
#' df %>% unnest_wider(y)
#' df %>% unnest_longer(y)
nest2 <- function(df, ...) {
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    abort("All elements of `...` must be named")
  }

  # replace with pack() + chop() ?

  cols <- map(cols, ~ tidyselect::vars_select(names(df), !!.x))
  asis <- setdiff(names(df), unlist(cols))

  keys <- df[asis]
  u_keys <- vec_unique(keys)
  out <- map(cols, ~ vec_split(df[.x], keys)$val)

  vec_cbind(u_keys, new_data_frame(out, n = nrow(u_keys)))
}

#' @export
#' @rdname nest2
unnest2 <- function(df, cols, keep_empty = FALSE, ptype = NULL) {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  for (col in cols) {
    df[[col]] <- map(df[[col]], as_df, col = col)
  }

  df <- unchop(df, !!cols, keep_empty = keep_empty, ptype = ptype)
  unpack(df, !!cols)
}

#' @export
#' @rdname nest2
#' @param value_to Name of column to store vector values.
#' @param index_to A string giving the name of a new column which will
#'   contain the inner names of the values. If unnamed, `col` will instead
#'   contain numeric indices.
unnest_longer <- function(df, cols,
                          value_to = "values",
                          index_to = "index",
                          keep_empty = FALSE) {

  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  for (col in cols) {
    df[[col]] <- map(
      df[[col]], vec_to_long,
      col = col,
      value_to = value_to,
      index_to = index_to
    )
  }

  df <- unchop(df, !!cols, keep_empty = keep_empty)
  unpack(df, !!cols)
}

#' @export
#' @rdname nest2
unnest_wider <- function(df, cols) {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  for (col in cols) {
    df[[col]] <- map(df[[col]], vec_to_wide, col = col)
  }

  df <- unchop(df, !!cols, keep_empty = TRUE)
  unpack(df, !!cols)
}

# helpers -----------------------------------------------------------------

# n cols, n rows
as_df <- function(x, col) {
  if (is.null(x)) {
    x
  } else if (is.data.frame(x)) {
    x
  } else if (vec_is(x)) {
    # Preserves vec_size() invariant
    tibble(!!col := x)
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

# 1 row; n cols
vec_to_wide <- function(x, col) {
  if (is.null(x)) {
    NULL
  } else if (is.data.frame(x)) {
    as_tibble(map(x, list))
  } else if (vec_is(x)) {
    tibble::as_tibble(as.list(x), .name_repair = "unique", .rows = 1L)
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

# 1 col; n rows
vec_to_long <- function(x, col, value_to = "values", index_to = "index") {
  if (is.null(x)) {
    NULL
  } else if (is.data.frame(x)) {
    tibble(!!col := x)
  } else if (vec_is(x)) {
    tibble::tibble(
      !!value_to := x,
      !!index_to := index(x)
    )
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

index <- function(x) {
  names(x) %||% seq_along(x)
}
