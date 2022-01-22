#' Split a string into columns
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string column and splits it into multiple
#' new columns:
#'
#' * `separate_wider_delim()` splits with a delimiter.
#' * `separate_wider_fixed()` splits using fixed widths.
#' * `separate_wider_regex()` splits using regular expression matches.
#'
#' These functions are equivalent to [separate()] and [extract()].  but use
#' [stringr](http://stringr.tidyverse.org/) as the underlying string
#' manipulation engine, and their interfaces reflect what we've learned from
#' [unnest_wider()] and [unnest_longer()].
#'
#' @inheritParams unnest_longer
#' @inheritParams separate
#' @param cols String columns to separate into pieces. If needed, you can use
#'   tidyselect to multiple columns.
#' @param delim Delimiter between columns, a stringr pattern.
#'
#'   Note that the default is a regular expression so that `delim = "."` will
#'   split on every character. If you need to split by a special character, you
#'   can use `delim = stringr::fixed(".")`.
#' @export
#' @examples
#' df <- tibble(id = 1:2, x = c("m-123", "f-455"))
#' # There are three basic ways to split up a string into pieces.
#' # * with a delimiter
#' df %>% separate_wider_delim(x, c("gender", "unit"), delim = "-")
#' # * by length
#' df %>% separate_wider_fixed(x, c(gender = 1, 1, unit = 3))
#' # * defining each component with a regular expression
#' df %>% separate_wider_regex(x, c(gender = ".", ".", unit = "\\d+"))
#'
#' # If the number of components varies, it's most natural to split into rows
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_longer_delim(x, delim = " ")
#' # But separate_wider_delim() provides some tools to deal with the problem
#' # The default behaviour tells you where the problems lie:
#' df %>% separate_wider_delim(x, c("a", "b"), delim = " ")
#' # You can suppress the warnings by setting extra and fill
#' df %>% separate_wider_delim(x, c("a", "b"), delim = " ", extra = "drop", fill = "right")
#' # Or choose to handle differently
#' df %>% separate_wider_delim(x, c("a", "b"), delim = " ", extra = "merge", fill = "left")
separate_wider_delim <- function(
    data,
    cols,
    into,
    delim,
    extra = c("warn", "drop", "merge"),
    fill = c("warn", "right", "left"),
    names_sep = NULL
) {
  check_installed("stringr")

  check_present(cols)
  if (!is.character(into) || is_named(into) || length(into) == 0) {
    abort("`into` must be an unnamed character vector")
  }
  if (!is_string(delim)) {
    abort("`delim` must be a string")
  }
  extra <- arg_match(extra)
  fill <- arg_match(fill)

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_separate_wider_delim(data[[col]],
      into = into,
      pattern = delim,
      fill = fill,
      extra = extra
    )
  }
  unpack(data, all_of(col_names), names_sep = names_sep)
}

#' @rdname separate_wider_delim
#' @param widths A named numeric vector where the names become column names,
#'   and the values specify the column width. Omit the name to leave those
#'   values out of the final output.
#' @export
separate_wider_fixed <- function(
    data,
    cols,
    widths,
    names_sep = NULL
) {
  check_installed("stringr")

  check_present(cols)
  if (!is_integerish(widths) || all(!have_name(widths))) {
    abort("`col` must be a named integer vector")
  }

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_at_wide(data[[col]], widths)
  }
  unpack(data, all_of(col_names), names_sep = names_sep)
}

#' @rdname separate_wider_delim
#' @param patterns A named character vector where the names given names of
#'   new columns in the output, and the values are regular expressions.
#'   Unnamed components will match, but not be included in the output.
#' @param match_complete Is the pattern required to match the entire string?
#' @export
separate_wider_regex <- function(
    data,
    cols,
    patterns,
    match_complete = TRUE,
    names_sep = NULL
) {
  check_installed("stringr")
  check_present(cols)

  if (!is.character(patterns) || all(!have_name(patterns))) {
    abort("`patterns` must be a named character vector")
  }
  if (!is_bool(match_complete)) {
    abort("`match_complete` must be TRUE or FALSE")
  }

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  has_name <- names2(patterns) != ""
  into <- names2(patterns)[has_name]
  patterns[has_name] <- paste0("(?<", into, ">", patterns[has_name], ")")
  patterns[!has_name] <- paste0("(?:", patterns[!has_name], ")")
  pattern <- paste(patterns, collapse = "")

  if (match_complete) {
    pattern <- paste0("^", pattern, "$")
  }

  for (col in col_names) {
    data[[col]] <- as_tibble(stringr::str_match(data[[col]], pattern)[, into])
  }
  unpack(data, all_of(col_names), names_sep = names_sep)
}

#' Split a string into rows
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string and splits it into multiple rows:
#'
#' * `separate_longer_delim()` splits by a delimiter.
#' * `separate_longer_fixed()` splits by a fixed width.
#'
#' @export
#' @inheritParams separate_wider_delim
#' @examples
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_longer_delim(x, delim = " ")
#'
#' # You can separate multiple columns at a time
#' df <- tibble(id = 1:3, x = c("x", "x y", "x y z"), y = c("a", "a b", "a b c"))
#' df %>% separate_longer_delim(c(x, y), delim = " ")
#'
#' # Or instead split by a fixed length
#' df <- tibble(id = 1:3, x = c("ab", "def", ""))
#' df %>% separate_longer_fixed(x, 1)
#' df %>% separate_longer_fixed(x, 2)
#' df %>% separate_longer_fixed(x, 2, keep_empty = TRUE)
separate_longer_delim <- function(
    data,
    cols,
    delim
) {
  check_installed("stringr")
  check_present(cols)

  if (!is_string(delim)) {
    abort("`delim` must be a string")
  }

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- stringr::str_split(data[[col]], delim)
  }
  unchop(data, all_of(col_names))
}

#' @param width Number of characters to split by.
#' @param keep_empty By default, you'll get `nchar(x) / width` rows for
#'   each observation. If `nchar(x)` is zero, this means the entire input
#'   row will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a missing value.
#' @rdname separate_longer_delim
#' @export
separate_longer_fixed <- function(
    data,
    cols,
    width,
    keep_empty = FALSE
) {
  check_installed("stringr")
  check_present(cols)
  if (!is_integerish(width) || length(width) != 1 || is.na(width)) {
    abort("`width` must be an integer")
  }

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_split_length(data[[col]], width)
  }
  unchop(data, all_of(col_names), keep_empty = keep_empty)
}

# helpers -----------------------------------------------------------------

str_separate_wider_delim <- function(x, into, pattern, fill = "warn", extra = "warn") {
  n <- if (extra == "merge") length(into) else Inf
  pieces <- stringr::str_split(x, pattern, n = n)
  list2df(pieces, into,
    fill = if (fill == "left") "left" else "right",
    warn_drop = extra == "warn",
    warn_fill = fill == "warn"
  )
}

str_separate_wider_fixed <- function(x, widths) {
  skip <- names(widths) == ""
  breaks <- cumsum(c(1, unname(widths)))[-(length(widths) + 1)]
  from <- cbind(breaks, length = widths)[!skip, ]

  pieces <- stringr::str_sub_all(x, from)
  pieces <- lapply(pieces, function(x) x[x != ""])
  list2df(pieces, names(widths)[!skip], warn_fill = FALSE)
}

str_split_length <- function(x, n = 1) {
  max_length <- max(stringr::str_length(x))
  idx <- seq(1, max_length, by = n)

  pieces <- stringr::str_sub_all(x, cbind(idx, length = n))
  pieces <- lapply(pieces, function(x) x[x != ""])
  pieces
}

list2df <- function(
    x,
    col_names,
    fill = c("right", "left"),
    warn_fill = TRUE,
    warn_drop = TRUE
) {
  fill <- arg_match(fill)

  simp <- simplifyPieces(x, length(col_names), fill == "left")
  list2df_warn(warn_fill, warn_drop, simp$too_sml, simp$too_big, length(col_names))

  out <- simp$strings[!is.na(col_names)]
  names(out) <- col_names[!is.na(col_names)]
  tibble::as_tibble(out)
}

list2df_warn <- function(warn_fill, warn_drop, too_sml, too_big, p) {
  warnings <- character()

  n_big <- length(too_big)
  if (warn_drop && n_big > 0) {
    idx <- list_indices(too_big)
    warnings <- c(warnings, glue("Dropped extra pieces in {n_big} rows: {idx}."))
  }

  n_sml <- length(too_sml)
  if (warn_fill && n_sml > 0) {
    idx <- list_indices(too_sml)
    warnings <- c(warnings, glue("Filled in missing pieces in {n_sml} rows: {idx}."))
  }

  if (length(warnings) > 0) {
    warn(c(glue("Expected {p} pieces in each row."), warnings))
  }
}
