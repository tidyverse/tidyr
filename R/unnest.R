#' Unnest a list-column of data frames
#'
#' @description
#' `unnest()`, `unnest_longer()`, and `unnest_wider()` flatten list-columns
#' into regular columns. `unnest()` is designed primarily for lists of data
#' frames, where `unnest_wider()` and `unnest_longer()` are designed
#' specifically for lists of vectors.
#'
#' Learn more in `vignette("rectangling")`.
#'
#' @section Unnest variants:
#'
#' The three `unnest()` functions differ in how they change the shape of the
#' output data frame:
#'
#' * `unnest_wider()` preserves the rows, but changes the columns.
#' * `unnest_longer()` preserves the columns, but changes the rows
#' * `unnest()` can change both rows and columns.
#'
#' These principles guide their behaviour when they are called with a
#' non-primary data type. For example, if you `unnest_wider()` a list of data
#' frames, the number of rows must be preserved, so each column is turned into
#' a list column of length one. Or if you `unnest_longer()` a list of data
#' frame, the number of columns must be preserved so it creates a packed
#' column. I'm not sure how if these behaviours are useful in practice, but
#' they are theoretically pleasing.
#'
#' @param data A data frame.
#' @param cols Names of columns to unnest.
#'
#'   If you `unnest()` multiple columns, parallel entries must compatible
#'   sizes, i.e. they're either equal or length 1 (following the standard
#'   tidyverse recycling rules).
#' @inheritParams unchop
#' @inheritParams unpack
#' @param ... **Deprecated**:
#'   Convert `df %>% unnest(x, y)` to `df %>% unnest(c(x, y))` and
#'   `df %>% unnest(y = fun(x, y, z))` to
#'   `df %>% mutate(y = fun(x, y, z)) %>% unnest(y)`.
#' @param .drop,.preserve **Deprecated**: all list-columns are now preserved;
#'   If there are any that you don't want in the output use `select()` to
#'   remove them prior to unnesting.
#' @param .id **Deprecated**: convert `df %>% unnest(x, .id = "id")` to
#'   `df %>% mutate(id = names(x)) %>% unnest(x))`.
#' @param .sep **Deprecated**: use `names_sep` instead.
#' @seealso [nest()] for the inverse operation.
#' @export
#' @examples
#' # unnest() is primarily design to work with nested columns, i.e. lists
#' # of tibbles or data frames
#' df <- tibble(
#'   x = 1:3,
#'   y = list(
#'     NULL,
#'     tibble(a = 1, b = 2),
#'     tibble(a = 1:3, b = 3:1)
#'   )
#' )
#' df %>% unnest(y)
#' df %>% unnest(y, keep_empty = TRUE)
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
#'
#' # You can unnest multiple columns simultaneously
#' df <- tibble(
#'  a = list(c("a", "b"), "c"),
#'  b = list(1:2, 3),
#'  c = c(11, 22)
#' )
#' df %>% unnest(c(a, b))
#'
#' # Compare with unnesting one column at a time, which generates
#' # the Cartesian product
#' df %>% unnest(a) %>% unnest(b)
unnest <- function(data,
                   cols,
                   ...,
                   keep_empty = FALSE,
                   ptype = NULL,
                   names_sep = NULL,
                   names_repair = "check_unique",
                   .drop = "DEPRECATED",
                   .id = "DEPRECATED",
                   .sep = "DEPRECATED",
                   .preserve = "DEPRECATED") {

  deprecated <- FALSE
  if (!missing(.preserve)) {
    warn("`.preserve` is deprecated. All list-columns are now preserved")
    deprecated <- TRUE
    .preserve <- tidyselect::vars_select(names(data), !!enquo(.preserve))
  } else {
    .preserve <- NULL
  }

  if (missing(cols) && missing(...)) {
    list_cols <- names(data)[map_lgl(data, is_list)]
    cols <- expr(c(!!!syms(setdiff(list_cols, .preserve))))
    warn(paste0(
      "`cols` is now required.\n",
      "Please use `cols = ", expr_text(cols), "`"
    ))
    deprecated <- TRUE
  }

  if (missing(...)) {
    cols <- enquo(cols)
  } else {
    dots <- enquos(cols, ..., .named = TRUE, .ignore_empty = "all")
    data <- dplyr::mutate(data, !!!dots)
    cols <- expr(c(!!!syms(names(dots))))
    warn(paste0(
      "unnest() has a new interface. See ?unnest for details.\n",
      "Try `cols = ", expr_text(cols), "`, with `mutate()` needed"
    ))
    deprecated <- TRUE
  }

  if (!missing(.drop)) {
    warn("`.drop` is deprecated. All list-columns are now preserved.")
    deprecated <- TRUE
  }

  if (!missing(.id)) {
    warn("`.id` is deprecated. Manually create column of names instead.")
    deprecated <- TRUE
    first_col <- tidyselect::vars_select(names(data), !!cols)[[1]]
    data[[.id]] <- names(data[[first_col]])
  }

  if (!missing(.sep)) {
    warn(glue("`.sep` is deprecated. Use `name_sep = {.sep}` instead."))
    deprecated <- TRUE
    names_sep <- .sep
  }

  if (deprecated) {
    return(unnest(
      data,
      cols = !!cols,
      names_sep = names_sep,
      keep_empty = keep_empty,
      ptype = ptype)
    )
  }

  UseMethod("unnest")
}

#' @export
unnest.data.frame <- function(
                              data,
                              cols,
                              ...,
                              keep_empty = FALSE,
                              ptype = NULL,
                              names_sep = NULL,
                              names_repair = "check_unique",
                              .drop = "DEPRECATED",
                              .id = "DEPRECATED",
                              .sep = "DEPRECATED",
                              .preserve = "DEPRECATED") {

  cols <- tidyselect::vars_select(names(data), !!enquo(cols))
  for (col in cols) {
    data[[col]][] <- map(data[[col]], as_df, col = col)
  }

  data <- unchop(data, !!cols, keep_empty = keep_empty, ptype = ptype)
  unpack(data, !!cols, names_sep = names_sep, names_repair = names_repair)
}

#' @export
#' @rdname unnest
#' @param values_to Name of column to store vector values.
#' @param indices_to A string giving the name of a new column which will
#'   contain the inner names of the values. If unnamed, `col` will instead
#'   contain numeric indices.
unnest_longer <- function(data, cols,
                          values_to = "values",
                          indices_to = "index",
                          keep_empty = FALSE,
                          names_sep = NULL,
                          names_repair = "check_unique"
                          ) {

  cols <- tidyselect::vars_select(names(data), !!enquo(cols))

  for (col in cols) {
    data[[col]][] <- map(
      data[[col]], vec_to_long,
      col = col,
      values_to = values_to,
      indices_to = indices_to
    )
  }

  data <- unchop(data, !!cols, keep_empty = keep_empty)
  unpack(data, !!cols, names_sep = names_sep, names_repair = names_repair)
}

#' @export
#' @rdname unnest
unnest_wider <- function(data, cols,
                         names_sep = NULL,
                         names_repair = "check_unique") {
  cols <- tidyselect::vars_select(names(data), !!enquo(cols))

  for (col in cols) {
    data[[col]][] <- map(data[[col]], vec_to_wide, col = col)
  }

  data <- unchop(data, !!cols, keep_empty = TRUE)
  unpack(data, !!cols, names_sep = names_sep, names_repair = names_repair)
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
    if (is.list(x)) {
      x <- purrr::compact(x)
      # Hack: probably should always apply and then vec_simplify()
      # in unnest_wider()
      x <- map_if(x, ~ vec_size(.x) != 1, list)
    } else {
      x <- as.list(x)
    }
    as_tibble(x, .name_repair = "unique", .rows = 1L)
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

# 1 col; n rows
vec_to_long <- function(x, col, values_to = "values", indices_to = "index") {
  if (is.null(x)) {
    NULL
  } else if (is.data.frame(x)) {
    tibble(!!col := x)
  } else if (vec_is(x)) {
    tibble(
      !!values_to := x,
      !!indices_to := index(x)
    )
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

index <- function(x) {
  names(x) %||% seq_along(x)
}
