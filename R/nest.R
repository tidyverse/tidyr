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
#' @details
#' If neither `...` nor `.by` are supplied, `nest()` will nest all variables,
#' and will use the column name supplied through `.key`.
#'
#' @section New syntax:
#' tidyr 1.0.0 introduced a new syntax for `nest()` and `unnest()` that's
#' designed to be more similar to other functions. Converting to the new syntax
#' should be straightforward (guided by the message you'll receive) but if
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
#' columns that will appear in the inner data frame. `df %>% nest(.by = c(x,
#' y))` specifies the columns to nest _by_; i.e. the columns that will remain in
#' the outer data frame. An alternative way to achieve the latter is to `nest()`
#' a grouped data frame created by [dplyr::group_by()]. The grouping variables
#' remain in the outer data frame and the others are nested. The result
#' preserves the grouping of the input.
#'
#' Variables supplied to `nest()` will override grouping variables so that
#' `df %>% group_by(x, y) %>% nest(data = !z)` will be equivalent to
#' `df %>% nest(data = !z)`.
#'
#' You can't supply `.by` with a grouped data frame, as the groups already
#' represent what you are nesting by.
#'
#' @param .data A data frame.
#' @param ... <[`tidy-select`][tidyr_tidy_select]> Columns to nest; these will
#'   appear in the inner data frames.
#'
#'   Specified using name-variable pairs of the form
#'   `new_col = c(col1, col2, col3)`. The right hand side can be any valid
#'   tidyselect expression.
#'
#'   If not supplied, then `...` is derived as all columns _not_ selected by
#'   `.by`, and will use the column name from `.key`.
#'
#'   `r lifecycle::badge("deprecated")`:
#'   previously you could write `df %>% nest(x, y, z)`.
#'   Convert to `df %>% nest(data = c(x, y, z))`.
#' @param .by <[`tidy-select`][tidyr_tidy_select]> Columns to nest _by_; these
#'   will remain in the outer data frame.
#'
#'   `.by` can be used in place of or in conjunction with columns supplied
#'   through `...`.
#'
#'   If not supplied, then `.by` is derived as all columns _not_ selected by
#'   `...`.
#' @param .key The name of the resulting nested column. Only applicable when
#'   `...` isn't specified, i.e. in the case of `df %>% nest(.by = x)`.
#'
#'   If `NULL`, then `"data"` will be used by default.
#' @param .names_sep If `NULL`, the default, the inner names will come from
#'   the former outer names. If a string, the  new inner names will use the
#'   outer names with `names_sep` automatically stripped. This makes
#'   `names_sep` roughly symmetric between nesting and unnesting.
#' @export
#' @examples
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#'
#' # Specify variables to nest using name-variable pairs.
#' # Note that we get one row of output for each unique combination of
#' # non-nested variables.
#' df %>% nest(data = c(y, z))
#'
#' # Specify variables to nest by (rather than variables to nest) using `.by`
#' df %>% nest(.by = x)
#'
#' # In this case, since `...` isn't used you can specify the resulting column
#' # name with `.key`
#' df %>% nest(.by = x, .key = "cols")
#'
#' # Use tidyselect syntax and helpers, just like in `dplyr::select()`
#' df %>% nest(data = any_of(c("y", "z")))
#'
#' # `...` and `.by` can be used together to drop columns you no longer need,
#' # or to include the columns you are nesting by in the inner data frame too.
#' # This drops `z`:
#' df %>% nest(data = y, .by = x)
#' # This includes `x` in the inner data frame:
#' df %>% nest(data = everything(), .by = x)
#'
#' # Multiple nesting structures can be specified at once
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
#' # That is similar to `nest(.by = )`, except here the result isn't grouped
#' fish_encounters %>%
#'   nest(.by = fish)
#'
#' # Nesting is often useful for creating per group models
#' mtcars %>%
#'   nest(.by = cyl) %>%
#'   dplyr::mutate(models = lapply(data, function(df) lm(mpg ~ wt, data = df)))
nest <- function(.data,
                 ...,
                 .by = NULL,
                 .key = NULL,
                 .names_sep = NULL) {
  cols <- enquos(...)
  empty <- names2(cols) == ""

  if (any(empty)) {
    cols_good <- cols[!empty]
    cols_bad <- cols[empty]

    .key <- check_key(.key)

    if (length(cols_bad) == 1L) {
      cols_bad <- cols_bad[[1]]
      cols_fixed_expr <- expr(!!cols_bad)
    } else {
      cols_fixed_expr <- expr(c(!!!cols_bad))
    }

    cols_fixed_label <- as_label(cols_fixed_expr)
    cols_fixed <- quos(!!.key := !!cols_fixed_expr)

    cols <- c(cols_good, cols_fixed)

    lifecycle::deprecate_warn(
      when = "1.0.0",
      what = I("Supplying `...` without names"),
      details = c(
        i = "Please specify a name for each selection.",
        i = cli::format_inline("Did you want `{(.key)} = {cols_fixed_label}`?")
      ),
      always = TRUE
    )

    return(nest(.data, !!!cols, .by = {{ .by }}))
  }

  UseMethod("nest")
}

#' @export
nest.data.frame <- function(.data,
                            ...,
                            .by = NULL,
                            .key = NULL,
                            .names_sep = NULL) {
  # The data frame print handles nested data frames poorly, so we want to
  # convert data frames (but not subclasses) to tibbles
  if (identical(class(.data), "data.frame")) {
    .data <- as_tibble(.data)
  }

  nest.tbl_df(
    .data,
    ...,
    .by = {{ .by }},
    .key = .key,
    .names_sep = .names_sep
  )
}

#' @export
nest.tbl_df <- function(.data,
                        ...,
                        .by = NULL,
                        .key = NULL,
                        .names_sep = NULL) {
  error_call <- current_env()

  info <- nest_info(.data, ..., .by = {{ .by }}, .key = .key)
  cols <- info$cols
  inner <- info$inner
  outer <- info$outer

  inner <- .data[inner]
  inner <- pack(inner, !!!cols, .names_sep = .names_sep, .error_call = error_call)

  out <- .data[outer]
  out <- vec_cbind(out, inner, .name_repair = "check_unique", .error_call = error_call)
  out <- reconstruct_tibble(.data, out)
  out <- chop(out, cols = all_of(names(cols)), error_call = error_call)

  # `nest()` currently doesn't return list-of columns
  for (name in names(cols)) {
    out[[name]] <- tidyr_new_list(out[[name]])
  }

  out
}

#' @export
nest.grouped_df <- function(.data,
                            ...,
                            .by = NULL,
                            .key = NULL,
                            .names_sep = NULL) {
  by <- enquo(.by)
  if (!quo_is_null(by)) {
    cli::cli_abort("Can't supply {.arg .by} when {.arg .data} is a grouped data frame.")
  }

  if (missing(...)) {
    .key <- check_key(.key)
    cols <- setdiff(names(.data), dplyr::group_vars(.data))
    nest.tbl_df(.data, !!.key := all_of(cols), .names_sep = .names_sep)
  } else {
    nest.tbl_df(.data, ..., .key = .key, .names_sep = .names_sep)
  }
}

nest_info <- function(.data,
                      ...,
                      .by = NULL,
                      .key = NULL,
                      .error_call = caller_env()) {
  by <- enquo(.by)

  cols <- enquos(...)
  n_cols <- length(cols)

  key <- check_key(.key, error_call = .error_call)

  if (n_cols != 0L && !is_default_key(.key)) {
    warn_unused_key(error_call = .error_call)
  }

  cols <- with_indexed_errors(
    map(cols, function(col) {
      names(tidyselect::eval_select(
        expr = col,
        data = .data,
        allow_rename = FALSE,
        error_call = NULL
      ))
    }),
    message = function(cnd) {
      cli::format_inline("In expression named {.arg {cnd$name}}:")
    },
    .error_call = .error_call
  )

  names <- names(.data)

  outer <- names(tidyselect::eval_select(
    expr = by,
    data = .data,
    allow_rename = FALSE,
    error_call = .error_call
  ))

  inner <- list_unchop(cols, ptype = character(), name_spec = zap())
  inner <- vec_unique(inner)

  if (n_cols == 0L) {
    # Derive `inner` names from `.by`
    inner <- setdiff(names, outer)
    cols <- list2(!!key := inner)
  }

  if (quo_is_null(by)) {
    # Derive `outer` names from `...`
    outer <- setdiff(names, inner)
  }

  # Regenerate quosures for `pack()`
  cols <- map(cols, function(col) {
    quo(all_of(!!col))
  })
  cols <- new_quosures(cols)

  list(
    cols = cols,
    inner = inner,
    outer = outer
  )
}

warn_unused_key <- function(error_call = caller_env()) {
  message <- c(
    "Can't supply both {.arg .key} and {.arg ...}.",
    i = "{.arg .key} will be ignored."
  )
  cli::cli_warn(message, call = error_call)
}

check_key <- function(key, error_call = caller_env()) {
  if (is_default_key(key)) {
    "data"
  } else {
    check_string(key, allow_empty = FALSE, arg = ".key", call = error_call)
    key
  }
}

is_default_key <- function(key) {
  if (identical(maybe_missing(key), deprecated())) {
    # Temporary support for S3 method authors that set `.key = deprecated()`.
    # Remove this entire helper all methods have been updated.
    key <- NULL
  }

  is.null(key)
}
