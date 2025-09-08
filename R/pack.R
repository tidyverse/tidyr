#' Pack and unpack
#'
#' @description
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
#' @inheritParams rlang::args_error_context
#'
#' @param data,.data A data frame.
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to unpack.
#' @param names_sep,.names_sep If `NULL`, the default, the names will be left
#'   as is. In `pack()`, inner names will come from the former outer names;
#'   in `unpack()`, the new outer names will come from the inner names.
#'
#'   If a string, the inner and outer names will be used together. In
#'   `unpack()`, the names of the new outer columns will be formed by pasting
#'   together the outer and the inner column names, separated by `names_sep`. In
#'   `pack()`, the new inner names will have the outer names + `names_sep`
#'   automatically stripped. This makes `names_sep` roughly symmetric between
#'   packing and unpacking.
#' @param ... For `pack()`, <[`tidy-select`][tidyr_tidy_select]> columns to
#'   pack, specified using name-variable pairs of the form
#'   `new_col = c(col1, col2, col3)`. The right hand side can be any valid tidy
#'   select expression.
#'
#'   For `unpack()`, these dots are for future extensions and must be empty.
#' @export
#' @examples
#' # Packing -------------------------------------------------------------------
#' # It's not currently clear why you would ever want to pack columns
#' # since few functions work with this sort of data.
#' df <- tibble(x1 = 1:3, x2 = 4:6, x3 = 7:9, y = 1:3)
#' df
#' df |> pack(x = starts_with("x"))
#' df |> pack(x = c(x1, x2, x3), y = y)
#'
#' # .names_sep allows you to strip off common prefixes; this
#' # acts as a natural inverse to name_sep in unpack()
#' iris |>
#'   as_tibble() |>
#'   pack(
#'     Sepal = starts_with("Sepal"),
#'     Petal = starts_with("Petal"),
#'     .names_sep = "."
#'   )
#'
#' # Unpacking -----------------------------------------------------------------
#' df <- tibble(
#'   x = 1:3,
#'   y = tibble(a = 1:3, b = 3:1),
#'   z = tibble(X = c("a", "b", "c"), Y = runif(3), Z = c(TRUE, FALSE, NA))
#' )
#' df
#' df |> unpack(y)
#' df |> unpack(c(y, z))
#' df |> unpack(c(y, z), names_sep = "_")
pack <- function(.data, ..., .names_sep = NULL, .error_call = current_env()) {
  check_data_frame(.data, call = .error_call)
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    cli::cli_abort("All elements of `...` must be named.", call = .error_call)
  }
  check_string(.names_sep, allow_null = TRUE, call = .error_call)

  cols <- with_indexed_errors(
    map(cols, function(col) {
      tidyselect::eval_select(
        expr = col,
        data = .data,
        allow_rename = FALSE,
        error_call = NULL
      )
    }),
    message = function(cnd) {
      cli::format_inline("In expression named {.arg {cnd$name}}:")
    },
    .error_call = .error_call
  )

  unpacked <- setdiff(names(.data), unlist(map(cols, names)))
  unpacked <- .data[unpacked]

  packed <- map(cols, ~ .data[.x])

  if (!is.null(.names_sep)) {
    packed <- imap(packed, strip_names, names_sep = .names_sep)
  }

  packed <- new_data_frame(packed, n = vec_size(.data))

  out <- vec_cbind(unpacked, packed, .error_call = .error_call)

  reconstruct_tibble(.data, out)
}

#' @export
#' @rdname pack
#' @param names_repair Used to check that output data frame has valid
#'   names. Must be one of the following options:
#'
#'   * `"minimal`": no name repair or checks, beyond basic existence,
#'   * `"unique`": make sure names are unique and not empty,
#'   * `"check_unique`": (the default), no name repair, but check they are unique,
#'   * `"universal`": make the names unique and syntactic
#'   * a function: apply custom name repair.
#'   * [tidyr_legacy]: use the name repair from tidyr 0.8.
#'   * a formula: a purrr-style anonymous function (see [rlang::as_function()])
#'
#'   See [vctrs::vec_as_names()] for more details on these terms and the
#'   strategies used to enforce them.
unpack <- function(
  data,
  cols,
  ...,
  names_sep = NULL,
  names_repair = "check_unique",
  error_call = current_env()
) {
  check_dots_empty0(...)
  check_data_frame(data, call = error_call)
  check_required(cols, call = error_call)
  check_string(names_sep, allow_null = TRUE, call = error_call)

  # Start from first principles to avoid issues in any subclass methods
  out <- tidyr_new_list(data)

  cols <- tidyselect::eval_select(
    expr = enquo(cols),
    data = data,
    allow_rename = FALSE,
    error_call = error_call
  )
  cols <- out[cols]
  cols <- cols[map_lgl(cols, is.data.frame)]

  cols_names <- names(cols)

  if (is.null(names_sep) && is_string(names_repair, "check_unique")) {
    # Only perform checks if user hasn't supplied `names_sep` or `names_repair`.
    # We let `vec_as_names()` catch any remaining problems.
    check_inner_inner_duplicate(cols, error_call = error_call)
    check_outer_inner_duplicate(cols, names(data), error_call = error_call)
  }

  if (!is.null(names_sep)) {
    out[cols_names] <- map2(
      cols,
      cols_names,
      rename_with_names_sep,
      names_sep = names_sep
    )
  }

  # Signal to tell `df_list()` to unpack
  names <- names(out)
  names[names %in% cols_names] <- ""
  names(out) <- names

  size <- vec_size(data)
  out <- df_list(!!!out, .size = size, .name_repair = "minimal")
  out <- tibble::new_tibble(out, nrow = size)

  names(out) <- vec_as_names(
    names = names(out),
    repair = names_repair,
    repair_arg = "names_repair",
    call = error_call
  )

  reconstruct_tibble(data, out)
}

check_inner_inner_duplicate <- function(x, error_call = caller_env()) {
  n <- length(x)

  if (n == 0L || n == 1L) {
    # Nothing to duplicate across
    return(invisible())
  }

  outer <- names(x)
  x <- unname(x)

  inner <- map(x, names)
  inner <- map(inner, unique)

  outer <- vec_rep_each(outer, times = list_sizes(inner))
  inner <- list_unchop(inner, ptype = character())

  problems <- vec_duplicate_detect(inner)

  if (!any(problems)) {
    return(invisible())
  }

  outer <- vec_slice(outer, problems)
  inner <- vec_slice(inner, problems)

  split <- vec_split(outer, inner)

  inners <- split$key
  outers <- split$val

  bullets <- map2_chr(inners, outers, function(inner, outer) {
    cli::format_inline("{.code {inner}}, within {.code {outer}}.")
  })
  bullets <- set_names(bullets, "i")
  bullets <- cli::format_bullets_raw(bullets)
  bullets <- set_names(bullets, " ")

  message <- c(
    "Can't duplicate names within the affected columns.",
    x = "These names are duplicated:",
    bullets,
    i = "Use `names_sep` to disambiguate using the column name.",
    i = "Or use `names_repair` to specify a repair strategy."
  )

  cli::cli_abort(message, call = error_call)
}

check_outer_inner_duplicate <- function(x, outer, error_call = caller_env()) {
  # Names of unpacked columns will disappear so aren't considered
  outer <- setdiff(outer, names(x))

  inner <- map(x, names)
  inner <- map(inner, unique)

  problems <- map(inner, function(x) intersect(x, outer))
  problems <- vec_slice(problems, list_sizes(problems) != 0L)

  if (length(problems) == 0L) {
    return(invisible())
  }

  bullets <- map2_chr(problems, names(problems), function(inner, outer) {
    cli::format_inline("{.code {inner}}, from {.code {outer}}.")
  })
  bullets <- set_names(bullets, "i")
  bullets <- cli::format_bullets_raw(bullets)
  bullets <- set_names(bullets, " ")

  message <- c(
    "Can't duplicate names between the affected columns and the original data.",
    x = "These names are duplicated:",
    bullets,
    i = "Use `names_sep` to disambiguate using the column name.",
    i = "Or use `names_repair` to specify a repair strategy."
  )

  cli::cli_abort(message, call = error_call)
}

rename_with_names_sep <- function(x, outer, names_sep) {
  inner <- names(x)
  names <- apply_names_sep(outer, inner, names_sep)
  set_names(x, names)
}

strip_names <- function(df, base, names_sep) {
  base <- vec_paste0(base, names_sep)
  names <- names(df)

  has_prefix <- regexpr(base, names, fixed = TRUE) == 1L
  names[has_prefix] <- substr(
    names[has_prefix],
    nchar(base) + 1,
    nchar(names[has_prefix])
  )

  set_names(df, names)
}
