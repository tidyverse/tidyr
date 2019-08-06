#' Nest and unnest
#'
#' @description
#' Nesting creates a list-column of data frames; unnesting flattens it back out
#' into regular columns. Nesting is implicitly a summarising operation: you
#' get one row for each group defined by the non-nested columns. This is useful
#' in conjunction with other summaries that work with whole datasets, most
#' notably models.
#'
#' Learn more in `vignette("nest")`.
#'
#' @section Grouped data frames:
#' `df %>% nest(x, y)` specify the columns to be nested; i.e. the columns
#' that will appear in the inner data frame. Alternatively, you `nest()` a
#' grouped data frame created by [dplyr::group_by()]. Here the grouping
#' variables will remain in the outer data frame, and nesting all other
#' data frames. The result will preserve the grouping of the input.
#'
#' Variables supplied to `nest()` will override grouping variables so that
#' `df %>% group_by(x, y) %>% nest(z)` will be equivalent to `df %>% nest(z)`.
#'
#' @param .data A data frame.
#' @param ... Name-variable pairs of the form `new_col = c(col1, col2, col3)`,
#'   that describe how you wish to nest existing columns into new columns.
#'   The right hand side can be any expression supported by tidyselect.
#'
#'   **Deprecated**: previously you could write `df %>% nest(x, y, z)`
#'   and `df %>% unnest(x, y, z)`. Convert to `df %>% nest(data = c(x, y, z))`.
#'   and `df %>% unnest(c(x, y, z))`.
#'
#'   If you previously created new variable in `unnest()` you'll now need to
#'   do it explicitly with `mutate()`. Convert `df %>% unnest(y = fun(x, y, z))`
#'   to `df %>% mutate(y = fun(x, y, z)) %>% unnest(y)`.
#' @param .key **Deprecated**: No longer needed because of the updated `...`
#'   syntax.
#' @export
#' @examples
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% nest(data = c(y, z))
#' # cf nest
#' df %>% chop(c(y, z))
#'
#' iris %>% nest(data = -Species)
#' chickwts %>% nest(data = weight)
#'
#' # Nesting a grouped data frame nests all variables apart from the group vars
#' library(dplyr)
#' fish_encounters %>%
#'   group_by(fish) %>%
#'   nest()
#'
#' # Nesting is often useful for creating per group models
#' mtcars %>%
#'   group_by(cyl) %>%
#'   nest() %>%
#'   mutate(models = lapply(data, function(df) lm(mpg ~ wt, data = df)))
#'
#' # unnest() is primarily designed to work with lists of data frames
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
#' # If you have lists of lists, or lists of atomic vectors, instead
#' # see hoist(), unnest_wider(), and unnest_longer()
#'
#' #' # You can unnest multiple columns simultaneously
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
nest <- function(.data, ..., .key = "DEPRECATED") {
  cols <- enquos(...)

  if (any(names2(cols) == "")) {
    col_names <- unname(tidyselect::vars_select(names(.data), !!!cols))
    cols_expr <- expr(c(!!!syms(col_names)))
    .key <- if (missing(.key)) "data" else as.character(ensym(.key))
    cols <- quos(!!.key := !!cols_expr)

    warn(paste0(
      "All elements of `...` must be named.\n",
      "Did you want `", .key, " = ", expr_text(cols_expr), "`?"
    ))

    return(nest(.data, !!!cols))
  }

  UseMethod("nest")
}

#' @export
nest.data.frame <- function(.data, ..., .key = "DEPRECATED") {
  # The data frame print handles nested data frames poorly, so we want to
  # convert data frames (but not subclasses) to tibbles
  if (identical(class(.data), "data.frame")) {
    .data <- as_tibble(.data)
  }

  nest.tbl_df(.data, ..., .key = .key)
}

#' @export
nest.tbl_df <- function(.data, ..., .key = "DEPRECATED") {
  .key <- check_key(.key)

  if (missing(...)) {
    cols <- list2(!!.key := names(.data))
  } else {
    cols <- enquos(...)
    cols <- map(cols, ~ tidyselect::vars_select(names(.data), !!.x))
  }

  asis <- setdiff(names(.data), unlist(cols))

  keys <- .data[asis]
  u_keys <- vec_unique(keys)
  out <- map(cols, ~ vec_split(.data[.x], keys)$val)

  vec_cbind(u_keys, new_data_frame(out, n = nrow(u_keys)))
}

#' @export
nest.grouped_df <- function(.data, ..., .key = "DEPRECATED") {
  .key <- check_key(.key)

  if (missing(...)) {
    nest_vars <- setdiff(names(.data), dplyr::group_vars(.data))
    out <- nest.tbl_df(.data, !!.key := !!nest_vars)
  } else {
    out <- NextMethod()
  }
  group_vars <- intersect(names(out), dplyr::group_vars(.data))

  dplyr::grouped_df(out, group_vars)
}

check_key <- function(.key) {
  if (!identical(.key, "DEPRECATED")) {
    warn("`.key` is deprecated")
    .key
  } else {
    "data"
  }
}

# unnest ------------------------------------------------------------------

#' @inheritParams unchop
#' @inheritParams unpack
#' @param cols Names of columns to unnest.
#'
#'   If you `unnest()` multiple columns, parallel entries must compatible
#'   sizes, i.e. they're either equal or length 1 (following the standard
#'   tidyverse recycling rules).
#' @param .drop,.preserve **Deprecated**: all list-columns are now preserved;
#'   If there are any that you don't want in the output use `select()` to
#'   remove them prior to unnesting.
#' @param .id **Deprecated**: convert `df %>% unnest(x, .id = "id")` to
#'   `df %>% mutate(id = names(x)) %>% unnest(x))`.
#' @param .sep **Deprecated**: use `names_sep` instead.
#' @export
#' @rdname nest
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
    warn(glue("`.sep` is deprecated. Use `names_sep = '{.sep}'` instead."))
    deprecated <- TRUE
    names_sep <- .sep
  }

  if (deprecated) {
    return(unnest(
      data,
      cols = !!cols,
      names_sep = names_sep,
      keep_empty = keep_empty,
      ptype = ptype,
      names_repair = tidyr_legacy
    ))
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

  if (nrow(data) == 0) {
    for (col in cols) {
      data[[col]] <- as_empty_df(data[[col]], col = col)
    }
  } else {
    for (col in cols) {
      data[[col]] <- map(data[[col]], as_df, col = col)
    }
  }

  data <- unchop(data, !!cols, keep_empty = keep_empty, ptype = ptype)
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
    new_data_frame(set_names(list(x), col))
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

as_empty_df <- function(x, col) {
  if (is_list_of(x)) {
    x
  } else if (is.list(x)) {
    list_of(.ptype = tibble(!!col := unspecified()))
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}
