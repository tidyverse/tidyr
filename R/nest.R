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
#' @section New syntax:
#' tidyr 1.0.0 introduced a new syntax for `nest()` and `unnest()` that's
#' designed to be more similar to other functions. Converting to the new syntax
#' should be straightforward (guided by the message you'll recieve) but if
#' you just need to run an old analysis, you can easily revert to the previous
#' behaviour using [nest_legacy()] and [unnest_legacy()] as follows:
#'
#' ```
#' library(tidyr)
#' nest <- nest_legacy
#' unnest <- unnest_legacy
#' ```
#'
#' @section Grouped data frames:
#' `df %>% nest(data = c(x, y))` specifies the columns to be nested; i.e. the
#' columns that will appear in the inner data frame. Alternatively, you can
#' `nest()` a grouped data frame created by [dplyr::group_by()]. The grouping
#' variables remain in the outer data frame and the others are nested. The
#' result preserves the grouping of the input.
#'
#' Variables supplied to `nest()` will override grouping variables so that
#' `df %>% group_by(x, y) %>% nest(data = !z)` will be equivalent to
#' `df %>% nest(data = !z)`.
#'
#' @param .data A data frame.
#' @param ... <[`tidy-select`][tidyr_tidy_select]> Columns to nest, specified
#'   using name-variable pairs of the form `new_col = c(col1, col2, col3)`.
#'   The right hand side can be any valid tidy select expression.
#'
#'   `r lifecycle::badge("deprecated")`:
#'   previously you could write `df %>% nest(x, y, z)` and `df %>%
#'   unnest(x, y, z)`. Convert to `df %>% nest(data = c(x, y, z))`.
#'   and `df %>% unnest(c(x, y, z))`.
#'
#'   If you previously created new variable in `unnest()` you'll now need to
#'   do it explicitly with `mutate()`. Convert `df %>% unnest(y = fun(x, y, z))`
#'   to `df %>% mutate(y = fun(x, y, z)) %>% unnest(y)`.
#' @param names_sep,.names_sep If `NULL`, the default, the names will be left
#'   as is. In `nest()`, inner names will come from the former outer names;
#'   in `unnest()`, the new outer names will come from the inner names.
#'
#'   If a string, the inner and outer names will be used together. In
#'   `unnest()`, the names of the new outer columns will be formed by pasting
#'   together the outer and the inner column names, separated by `names_sep`. In
#'   `nest()`, the new inner names will have the outer names + `names_sep`
#'   automatically stripped. This makes `names_sep` roughly symmetric between
#'   nesting and unnesting.
#' @param .key
#'   `r lifecycle::badge("deprecated")`:
#'   No longer needed because of the new `new_col = c(col1, col2,
#'   col3)` syntax.
#' @export
#' @examples
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-nested variables
#' df %>% nest(data = c(y, z))
#' # chop does something similar, but retains individual columns
#' df %>% chop(c(y, z))
#'
#' # use tidyselect syntax and helpers, just like in dplyr::select()
#' df %>% nest(data = any_of(c("y", "z")))
#'
#' iris %>% nest(data = !Species)
#' nest_vars <- names(iris)[1:4]
#' iris %>% nest(data = any_of(nest_vars))
#' iris %>%
#'   nest(petal = starts_with("Petal"), sepal = starts_with("Sepal"))
#' iris %>%
#'   nest(width = contains("Width"), length = contains("Length"))
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
nest <- function(.data, ..., .names_sep = NULL, .key = deprecated()) {
  cols <- enquos(...)

  empty <- names2(cols) == ""
  if (any(empty)) {
    cols_good <- cols[!empty]
    cols_bad <- cols[empty]

    .key <- if (missing(.key)) "data" else as.character(ensym(.key))

    if (length(cols_bad) == 1L) {
      cols_bad <- cols_bad[[1]]
      cols_fixed_expr <- expr(!!cols_bad)
    } else {
      cols_fixed_expr <- expr(c(!!!cols_bad))
    }

    cols_fixed_label <- as_label(cols_fixed_expr)
    cols_fixed <- quos(!!.key := !!cols_fixed_expr)

    cols <- c(cols_good, cols_fixed)

    warn(paste0(
      "All elements of `...` must be named.\n",
      "Did you want `", .key, " = ", cols_fixed_label, "`?"
    ))

    return(nest(.data, !!!cols))
  }

  UseMethod("nest")
}

#' @export
nest.data.frame <- function(.data, ..., .names_sep = NULL, .key = deprecated()) {
  # The data frame print handles nested data frames poorly, so we want to
  # convert data frames (but not subclasses) to tibbles
  if (identical(class(.data), "data.frame")) {
    .data <- as_tibble(.data)
  }

  nest.tbl_df(.data, ..., .names_sep = .names_sep, .key = .key)
}

#' @export
nest.tbl_df <- function(.data, ..., .names_sep = NULL, .key = deprecated()) {
  .key <- check_key(.key)
  if (missing(...)) {
    warn(paste0(
      "`...` must not be empty for ungrouped data frames.\n",
      "Did you want `", .key, " = everything()`?"
    ))
    cols <- quos(!!.key := everything())
  } else {
    cols <- enquos(...)
  }

  out <- pack(.data, !!!cols, .names_sep = .names_sep)
  out <- chop(out, cols = all_of(names(cols)))

  # `nest()` currently doesn't return list-of columns
  for (name in names(cols)) {
    out[[name]] <- tidyr_new_list(out[[name]])
  }

  out
}

#' @export
nest.grouped_df <- function(.data, ..., .names_sep = NULL, .key = deprecated()) {
  if (missing(...)) {
    .key <- check_key(.key)
    cols <- setdiff(names(.data), dplyr::group_vars(.data))
    nest.tbl_df(.data, !!.key := all_of(cols), .names_sep = .names_sep)
  } else {
    NextMethod()
  }
}

check_key <- function(.key) {
  if (!is_missing(.key)) {
    warn("`.key` is deprecated")
    .key
  } else {
    "data"
  }
}

# unnest ------------------------------------------------------------------

#' @inheritParams unchop
#' @inheritParams unpack
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to unnest.
#'
#'   If you `unnest()` multiple columns, parallel entries must be of
#'   compatible sizes, i.e. they're either equal or length 1 (following the
#'   standard tidyverse recycling rules).
#' @param .drop,.preserve
#'   `r lifecycle::badge("deprecated")`:
#'   all list-columns are now preserved; If there are any that you
#'   don't want in the output use `select()` to remove them prior to
#'   unnesting.
#' @param .id
#'   `r lifecycle::badge("deprecated")`:
#'   convert `df %>% unnest(x, .id = "id")` to `df %>% mutate(id =
#'   names(x)) %>% unnest(x))`.
#' @param .sep
#'   `r lifecycle::badge("deprecated")`:
#'   use `names_sep` instead.
#' @export
#' @rdname nest
unnest <- function(data,
                   cols,
                   ...,
                   keep_empty = FALSE,
                   ptype = NULL,
                   names_sep = NULL,
                   names_repair = "check_unique",
                   .drop = deprecated(),
                   .id = deprecated(),
                   .sep = deprecated(),
                   .preserve = deprecated()) {

  deprecated <- FALSE
  if (!missing(.preserve)) {
    lifecycle::deprecate_warn("1.0.0", "unnest(.preserve = )",
      details = "All list-columns are now preserved"
    )
    deprecated <- TRUE
    .preserve <- tidyselect::vars_select(tbl_vars(data), !!enquo(.preserve))
  } else {
    .preserve <- NULL
  }

  if (missing(cols) && missing(...)) {
    list_cols <- names(data)[map_lgl(data, is_list)]
    cols <- expr(c(!!!syms(setdiff(list_cols, .preserve))))
    warn(paste0(
      "`cols` is now required when using unnest().\n",
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
    unnest_call <- expr(unnest(!!cols))
    warn(paste0(
      "unnest() has a new interface. See ?unnest for details.\n",
      "Try `df %>% ", expr_text(unnest_call), "`, with `mutate()` if needed"
    ))
    deprecated <- TRUE
  }

  if (!is_missing(.drop)) {
    lifecycle::deprecate_warn("1.0.0", "unnest(.drop = )",
      details = "All list-columns are now preserved."
    )
    deprecated <- TRUE
  }

  if (!is_missing(.id)) {
    lifecycle::deprecate_warn("1.0.0", "unnest(.id = )",
      details = "Manually create column of names instead."
    )
    deprecated <- TRUE
    first_col <- tidyselect::vars_select(tbl_vars(data), !!cols)[[1]]
    data[[.id]] <- names(data[[first_col]])
  }

  if (!is_missing(.sep)) {
    lifecycle::deprecate_warn("1.0.0", "unnest(.sep = )",
      details = glue("Use `names_sep = '{.sep}'` instead.")
    )
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
  cols <- tidyselect::eval_select(enquo(cols), data)
  data <- unchop(data, any_of(cols), keep_empty = keep_empty, ptype = ptype)
  unpack(data, any_of(cols), names_sep = names_sep, names_repair = names_repair)
}


#' @export
unnest.rowwise_df <- function(
                              data,
                              cols,
                              ...,
                              keep_empty = FALSE,
                              ptype = NULL,
                              names_sep = NULL,
                              names_repair = "check_unique"
                              ) {

  out <- unnest.data.frame(as_tibble(data), {{ cols }},
    keep_empty = keep_empty,
    ptype = ptype,
    names_sep = names_sep,
    names_repair = names_repair
  )
  if (packageVersion("dplyr") > "0.8.99") {
    out <- dplyr::grouped_df(out, dplyr::group_vars(data))
  }

  out
}
