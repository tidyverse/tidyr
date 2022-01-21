#' Separate a character column with a delimiter
#'
#' `separate_delim_wider()` produces a fixed number of new columns defined by
#' `into`. `separate_delim_longer()` produces a variable number of rows.
#'
#' @inheritParams unnest_longer
#' @inheritParams separate
#' @param cols String columns to separate into pieces. If neeeded, you can use
#'   tidyselect to multiple columns.
#' @param delim Delimer between columns, a stringr regular expression.
#' @export
#' @examples
#' # If the number of components varies, it's most natural to split into rows
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_by_longer(x, pattern = " ")
#'
#' # But it's still possible to split into rows
#' df %>% separate_by_wider(x, c("a", "b"), pattern = " ")
#' # You can suppress the warnings by setting extra and fill
#' df %>% separate(x, c("a", "b"), extra = "drop", fill = "right")
#'
#' # You can separate multiple columns at a time
#' df <- tibble(id = 1:3, x = c("x", "x y", "x y z"), y = c("a", "a b", "a b c"))
#' df %>% separate_by_longer(c(x, y), " ")
separate_delim_wider <- function(
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
  extra <- arg_match(extra)
  fill <- arg_match(fill)

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_split_wider(data[[col]],
      into = into,
      delim = delim,
      fill = fill,
      extra = extra
    )
  }
  unpack(data, all_of(col_names), names_sep = names_sep)
}

#' @export
#' @rdname separate_delim_wider
separate_delim_longer <- function(
    data,
    cols,
    delim
) {
  check_installed("stringr")
  check_present(cols)

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- stringr::str_split(data[[col]], delim)
  }
  unchop(data, all_of(col_names))
}

#' Separate a character column by widths
#'
#' @inheritParams separate_delim_wider
#' @param widths A named numeric vector where the names become column names,
#'   and the values specify the column width. Omit the name to leave those
#'   values out of the final output.
#' @export
#' @examples
#' df <- tibble(id = 1:2, x = c("m-123", "f-455"))
#' df %>% separate_width_wider(x, c(gender = 1, 1, unit = 3, test = 2))
#'
#' df <- tibble(id = 1:3, x = c("ab", "def", ""))
#' df %>% separate_width_longer(x, 1)
#' df %>% separate_width_longer(x, 2)
separate_width_wider <- function(
    data,
    cols,
    widths,
    names_sep = NULL
) {
  check_installed("stringr")
  check_present(cols)

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_at_wide(data[[col]], widths)
  }
  unpack(data, all_of(col_names), names_sep = names_sep)
}

#' @export
#' @param width Number of characters to split by.
#' @param keep_empty By default, you'll get `nchar(x) / width` rows for
#'   each observation. If `nchar(x)` is zero, this means the entire input
#'   row will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a missing value.
#' @rdname separate_width_wider
separate_width_longer <- function(
    data,
    cols,
    width,
    keep_empty = FALSE
) {
  check_installed("stringr")
  check_present(cols)

  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- str_split_length(data[[col]], width)
  }
  unchop(data, all_of(col_names), keep_empty = keep_empty)
}

#' Separate a character column by matching patterns
#'
#' @inheritParams separate_delim_wider
#' @param patterns A named character vector where the names given names of
#'   new columns in the output, and the values are regular expressions.
#'   Unnamed components will match, but not be included in the output.
#' @param match_complete Is the pattern required to match the entire string?
#' @export
#' @examples
#' df <- tibble(id = 1:2, x = c("m-123", "f_4559"))
#' df %>% separate_match(x, c(gender = ".", ".", unit = "\\d+"))
separate_match <- function(
    data,
    cols,
    patterns,
    match_complete = TRUE,
    names_sep = NULL
) {
  check_installed("stringr")
  check_present(cols)

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
    data[[col]] <- as.data.frame(stringr::str_match(data[[col]], pattern)[, into])
  }
  unpack(data, all_of(col_names), names_sep = names_sep)
}

# helpers -----------------------------------------------------------------

str_split_wider <- function(x, into, pattern, fill = "warn", extra = "warn") {
  n <- if (extra == "merge") length(into) else Inf
  pieces <- stringr::str_split(x, pattern, n = n)
  list2df(pieces, into,
    fill = if (fill == "right") "right" else "left",
    warn_drop = extra == "warn",
    warn_fill = fill == "warn"
  )
}

str_at_wide <- function(x, widths) {
  skip <- names(widths) == ""
  breaks <- cumsum(c(1, unname(widths)))[-(length(widths) + 1)]
  from <- cbind(breaks, length = widths)[!skip, ]

  pieces <- stringi::stri_sub_all(x, from)
  pieces <- lapply(pieces, function(x) x[x != ""])
  list2df(pieces, names(widths)[!skip], warn_fill = FALSE)
}

str_split_length <- function(x, n = 1) {
  max_length <- max(stri_length(x))
  idx <- seq(1, max_length, by = n)

  pieces <- stri_sub_all(x, cbind(idx, length = n))
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
  list2df_warn(warn_fill, warn_drop, simp$too_sml, simp$too_big)

  out <- simp$strings[!is.na(col_names)]
  names(out) <- col_names[!is.na(col_names)]
  tibble::as_tibble(out)
}

list2df_warn <- function(warn_fill, warn_drop, too_sml, too_big) {
  warnings <- character()

  n_big <- length(too_big)
  if (warn_drop && n_big > 0) {
    idx <- list_indices(too_big)
    warnings <- c(warnings, glue("Dropped additional in {n_big} rows: {idx}."))
  }

  n_sml <- length(too_sml)
  if (warn_fill && n_sml > 0) {
    idx <- list_indices(too_sml)
    warnings <- c(warnings, glue("Filled in missing pieces in {n_sml} rows {idx}."))
  }

  if (length(warnings) > 0) {
    warn(c(glue("Expected {n} pieces in each row."), warnings))
  }
}
