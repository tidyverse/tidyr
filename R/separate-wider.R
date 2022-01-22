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
#' @param names,names_sep Specify either either a fixed number of column
#'   `names` or use `names_sep` to generate new names from the source column
#'   name and a numeric suffix.
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
#' df %>% separate_wider_delim(x, delim = "-", c("gender", "unit"))
#' # * by length
#' df %>% separate_wider_fixed(x, c(gender = 1, 1, unit = 3))
#' # * defining each component with a regular expression
#' df %>% separate_wider_regex(x, c(gender = ".", ".", unit = "\\d+"))
#'
#' # Sometimes you split on the "last" delimiter:
#' df <- data.frame(var = c("race_1", "race_2", "age_bucket_1", "age_bucket_2"))
#' # _delim won't help because it always splits on the first delimiter
#' df %>% separate_wider_delim(var, "_", names = c("var1", "var2"), extra = "merge")
#' # Instead, you can use _regex:
#' df %>% separate_wider_regex(var, c(var1 = ".*", "_", var2 = ".*"))
#'
#' # If the number of components varies, it's most natural to split into rows
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_longer_delim(x, delim = " ")
#' # But separate_wider_delim() provides some tools to deal with the problem
#' # The default behaviour tells you where the problems lie:
#' df %>% separate_wider_delim(x, delim = " ", names = c("a", "b"))
#' # You can suppress the warnings by setting extra and fill
#' df %>% separate_wider_delim(x, c("a", "b"), delim = " ", extra = "drop", fill = "right")
#' # Or choose to handle differently
#' df %>% separate_wider_delim(x, c("a", "b"), delim = " ", extra = "merge", fill = "left")
#' # Or automatically name the columns
#' #' df %>% separate_wider_delim(x, delim = " ", names_sep = "", fill = "right")
separate_wider_delim <- function(
    data,
    cols,
    delim,
    names = NULL,
    names_sep = NULL,
    extra = c("warn", "drop", "merge"),
    fill = c("warn", "right", "left"),
    names_repair = "check_unique"
) {
  check_installed("stringr")
  check_present(cols)

  if (!xor(is.null(names), is.null(names_sep))) {
    abort("Must specify one of `names` or `names_sep`")
  }

  map_unpack(
    data, {{ cols }},
    str_separate_wider_delim,
    names = names,
    delim = delim,
    extra = extra,
    fill = fill,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
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
    names_sep = NULL,
    names_repair = "check_unique"
) {
  check_installed("stringr")
  check_present(cols)

  map_unpack(
    data, {{ cols }},
    str_separate_wider_fixed,
    widths = widths,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
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
    names_sep = NULL,
    names_repair = "check_unique"
) {
  check_installed("stringr")
  check_present(cols)

  map_unpack(
    data, {{ cols }},
    str_separate_wider_regex,
    patterns = patterns,
    match_complete = match_complete,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
}


# helpers -----------------------------------------------------------------

map_unpack <- function(data, cols, fun, ..., .names_sep, .names_repair) {
  # TODO: Use `allow_rename = FALSE` (https://github.com/r-lib/tidyselect/issues/225)
  cols <- tidyselect::eval_select(enquo(cols), data)
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- fun(data[[col]], ...)
  }
  unpack(data, all_of(col_names), names_sep = .names_sep, names_repair = .names_repair)
}

# stringr functions ----------------------------------------------------------

str_separate_wider_delim <- function(
    x,
    names,
    delim,
    extra = c("warn", "drop", "merge"),
    fill = c("warn", "right", "left")
) {

  if (!is.null(names) && (!is.character(names) || is_named(names) || length(names) == 0)) {
    abort("`names` must be an unnamed character vector")
  }
  if (!is_string(delim)) {
    abort("`delim` must be a string")
  }
  extra <- arg_match(extra)
  fill <- arg_match(fill)

  n <- if (extra == "merge") length(names) else Inf
  pieces <- stringr::str_split(x, delim, n = n)

  if (is.null(names)) {
    names <- seq_len(max(lengths(pieces)))
  }

  list2df(pieces, names,
    fill = if (fill == "left") "left" else "right",
    warn_drop = extra == "warn",
    warn_fill = fill == "warn"
  )
}

str_separate_wider_fixed <- function(x, widths) {
  if (!is_integerish(widths) || all(!have_name(widths))) {
    abort("`widths` must be a named integer vector")
  }

  skip <- names(widths) == ""
  breaks <- cumsum(c(1, unname(widths)))[-(length(widths) + 1)]
  from <- cbind(breaks, length = widths)[!skip, ]

  pieces <- stringr::str_sub_all(x, from)
  pieces <- lapply(pieces, function(x) x[x != ""])
  list2df(pieces, names(widths)[!skip], warn_fill = FALSE)
}

str_separate_wider_regex <- function(x, patterns, match_complete = TRUE) {
  if (!is.character(patterns) || all(!have_name(patterns))) {
    abort("`patterns` must be a named character vector")
  }
  if (!is_bool(match_complete)) {
    abort("`match_complete` must be TRUE or FALSE")
  }

  has_name <- names2(patterns) != ""
  into <- names2(patterns)[has_name]
  patterns[has_name] <- paste0("(?<", into, ">", patterns[has_name], ")")
  patterns[!has_name] <- paste0("(?:", patterns[!has_name], ")")
  pattern <- paste(patterns, collapse = "")

  if (match_complete) {
    pattern <- paste0("^", pattern, "$")
  }

  as_tibble(stringr::str_match(x, pattern)[, into, drop = FALSE])
}

str_split_length <- function(x, width = 1) {
  max_length <- max(stringr::str_length(x))
  idx <- seq(1, max_length, by = width)

  pieces <- stringr::str_sub_all(x, cbind(idx, length = width))
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
