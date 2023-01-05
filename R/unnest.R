#' Unnest a list-column of data frames into rows and columns
#'
#' Unnest expands a list-column containing data frames into rows and columns.
#'
#' @inheritSection nest New syntax
#' @inheritParams unchop
#' @inheritParams unpack
#' @param cols <[`tidy-select`][tidyr_tidy_select]> List-columns to unnest.
#'
#'   When selecting multiple columns, values from the same row will be recycled
#'   to their common size.
#' @param ... `r lifecycle::badge("deprecated")`:
#'   previously you could write `df %>% unnest(x, y, z)`.
#'   Convert to `df %>% unnest(c(x, y, z))`. If you previously created a new
#'   variable in `unnest()` you'll now need to do it explicitly with `mutate()`.
#'   Convert `df %>% unnest(y = fun(x, y, z))`
#'   to `df %>% mutate(y = fun(x, y, z)) %>% unnest(y)`.
#' @param names_sep If `NULL`, the default, the outer names will come from the
#'   inner names. If a string, the outer names will be formed by pasting
#'   together the outer and the inner column names, separated by `names_sep`.
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
#' @family rectangling
#' @examples
#' # unnest() is designed to work with lists of data frames
#' df <- tibble(
#'   x = 1:3,
#'   y = list(
#'     NULL,
#'     tibble(a = 1, b = 2),
#'     tibble(a = 1:3, b = 3:1, c = 4)
#'   )
#' )
#' # unnest() recycles input rows for each row of the list-column
#' # and adds a column for each column
#' df %>% unnest(y)
#'
#' # input rows with 0 rows in the list-column will usually disappear,
#' # but you can keep them (generating NAs) with keep_empty = TRUE:
#' df %>% unnest(y, keep_empty = TRUE)
#'
#' # Multiple columns ----------------------------------------------------------
#' # You can unnest multiple columns simultaneously
#' df <- tibble(
#'   x = 1:2,
#'   y = list(
#'     tibble(a = 1, b = 2),
#'     tibble(a = 3:4, b = 5:6)
#'   ),
#'   z = list(
#'     tibble(c = 1, d = 2),
#'     tibble(c = 3:4, d = 5:6)
#'   )
#' )
#' df %>% unnest(c(y, z))
#'
#' # Compare with unnesting one column at a time, which generates
#' # the Cartesian product
#' df %>%
#'   unnest(y) %>%
#'   unnest(z)
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
    lifecycle::deprecate_warn(
      "1.0.0",
      "unnest(.preserve = )",
      details = "All list-columns are now preserved",
      always = TRUE
    )
    deprecated <- TRUE
    .preserve <- tidyselect::vars_select(tbl_vars(data), !!enquo(.preserve))
  } else {
    .preserve <- NULL
  }

  if (missing(cols) && missing(...)) {
    list_cols <- names(data)[map_lgl(data, is_list)]
    cols <- expr(c(!!!syms(setdiff(list_cols, .preserve))))
    cli::cli_warn(c(
      "`cols` is now required when using `unnest()`.",
      i = "Please use `cols = {expr_text(cols)}`."
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
    cli::cli_warn(c(
      "`unnest()` has a new interface. See `?unnest` for details.",
      i = "Try `df %>% {expr_text(unnest_call)}`, with `mutate()` if needed."
    ))
    deprecated <- TRUE
  }

  if (!is_missing(.drop)) {
    lifecycle::deprecate_warn(
      "1.0.0",
      "unnest(.drop = )",
      details = "All list-columns are now preserved.",
      always = TRUE
    )
    deprecated <- TRUE
  }

  if (!is_missing(.id)) {
    lifecycle::deprecate_warn(
      "1.0.0",
      "unnest(.id = )",
      details = "Manually create column of names instead.",
      always = TRUE
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
unnest.data.frame <- function(data,
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
unnest.rowwise_df <- function(data,
                              cols,
                              ...,
                              keep_empty = FALSE,
                              ptype = NULL,
                              names_sep = NULL,
                              names_repair = "check_unique") {
  out <- unnest.data.frame(as_tibble(data), {{ cols }},
    keep_empty = keep_empty,
    ptype = ptype,
    names_sep = names_sep,
    names_repair = names_repair
  )

  out <- dplyr::grouped_df(out, dplyr::group_vars(data))

  out
}
