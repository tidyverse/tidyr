#' Nest rows into a list-column of data frames
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
#'   The right hand side can be any valid tidyselect expression.
#'
#'   `r lifecycle::badge("deprecated")`:
#'   previously you could write `df %>% nest(x, y, z)`.
#'   Convert to `df %>% nest(data = c(x, y, z))`.
#' @param .names_sep If `NULL`, the default, the inner names will come from
#'   the former outer names. If a string, the  new inner names will use the
#'   outer names with `names_sep` automatically stripped. This makes
#'   `names_sep` roughly symmetric between nesting and unnesting.
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
#' fish_encounters %>%
#'   dplyr::group_by(fish) %>%
#'   nest()
#'
#' # Nesting is often useful for creating per group models
#' mtcars %>%
#'   dplyr::group_by(cyl) %>%
#'   nest() %>%
#'   dplyr::mutate(models = lapply(data, function(df) lm(mpg ~ wt, data = df)))
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
  check_string(.names_sep, allow_null = TRUE)
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
