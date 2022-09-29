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
    align_length = NULL,
    align_direction = c("start", "end", "merge"),
    align_warn = c("both", "short", "long", "none"),
    names_repair = "check_unique"
) {
  check_installed("stringr")
  check_required(cols)

  if (is.null(names) && is.null(names_sep)) {
    abort("Must specify at least one of `names` or `names_sep`")
  }

  map_unpack(
    data, {{ cols }},
    str_separate_wider_delim,
    names = names,
    delim = delim,
    align_length = align_length,
    align_direction = align_direction,
    align_warn = align_warn,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
}

str_separate_wider_delim <- function(
    x,
    names,
    delim,
    align_length = NULL,
    align_direction = c("start", "end", "merge"),
    align_warn = c("both", "short", "long", "none")
) {

  if (!is.null(names) && (!is.character(names) || is_named(names) || length(names) == 0)) {
    abort("`names` must be an unnamed character vector")
  }
  if (!is_string(delim)) {
    abort("`delim` must be a string")
  }
  align_direction <- arg_match(align_direction)
  align_warn <- arg_match(align_warn)

  n <- if (align_direction == "merge") length(names) else Inf
  pieces <- stringr::str_split(x, delim, n = n)

  if (is.null(names)) {
    names <- seq_len(align_length %||% max(lengths(pieces)))
  }

  list2df(
    pieces,
    names = names,
    align_direction = align_direction,
    align_warn = align_warn
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
    fill = c("warn", "right", "left"),
    names_sep = NULL,
    names_repair = "check_unique"
) {
  check_installed("stringr")
  check_required(cols)
  fill <- arg_match(fill)

  map_unpack(
    data, {{ cols }},
    str_separate_wider_fixed,
    widths = widths,
    fill = fill,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
}

str_separate_wider_fixed <- function(x, widths, fill = "warn") {
  if (!is_integerish(widths) || all(!have_name(widths))) {
    abort("`widths` must be a named integer vector")
  }

  skip <- names(widths) == ""
  breaks <- cumsum(c(1, unname(widths)))[-(length(widths) + 1)]
  from <- cbind(breaks, length = widths)[!skip, ]

  pieces <- stringr::str_sub_all(x, from)
  pieces <- lapply(pieces, function(x) x[x != ""])
  list2df(pieces, names(widths)[!skip],
    align_direction = if (fill == "left") "start" else "end",
    align_warn = if (fill == "warn") "both" else "none"
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
  check_required(cols)

  map_unpack(
    data, {{ cols }},
    str_separate_wider_regex,
    patterns = patterns,
    match_complete = match_complete,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
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
  patterns[has_name] <- paste0("(", patterns[has_name], ")")
  patterns[!has_name] <- paste0("(?:", patterns[!has_name], ")")
  pattern <- paste(patterns, collapse = "")

  if (match_complete) {
    pattern <- paste0("^", pattern, "$")
  }

  match <- stringr::str_match(x, pattern)
  no_match <- is.na(match[, 1]) & !is.na(x)
  if (any(no_match)) {
    n <- sum(no_match)
    idx <- list_indices(which(no_match))

    warn(glue("Failed to match {n} rows: {idx}"))
  }
  matches <- match[, -1, drop = FALSE]
  if (ncol(matches) != length(into)) {
    abort(c(
      "Invalid number of groups",
      i = "Did you use () instead of (?:) inside a pattern?"
    ))
  }

  out <- as_tibble(matches, .name_repair = "none")
  colnames(out) <- into
  out
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

list2df <- function(
    x,
    names,
    align_direction = c("start", "end", "merge"),
    align_warn = c("both", "short", "long", "none")
) {
  align_direction <- arg_match(align_direction)
  align_warn <- arg_match(align_warn)

  simp <- standardise_list_lengths(x, length(names), align_direction)
  list2df_warn(align_warn, simp$too_sml, simp$too_big, length(names))

  out <- simp$strings[!is.na(names)]
  names(out) <- names[!is.na(names)]
  tibble::as_tibble(out)
}

standardise_list_lengths <- function(x, n, direction) {
  if (!vec_is_list(x)) {
    abort("`x` must be a list.")
  }
  if (!(is_integer(n, 1L) && !is.na(n) && n >= 0L)) {
    abort("`n` must be a single non-negative integer.")
  }

  direction <- arg_match0(direction, values = c("start", "end"), arg_nm = "direction")

  sizes <- list_sizes(x)

  # Find the start location of each piece
  starts <- cumsum(c(1L, sizes))
  starts <- starts[-length(starts)]

  ptype <- vec_ptype_common(!!!x) %||% attr(x, "ptype", exact = TRUE)

  # Combine all pieces sequentially.
  # Zapping names for performance.
  x <- vec_unchop(x, ptype = ptype, name_spec = zap())

  # Look for size 1 missing values,
  # which we ignore when generating warnings
  one <- sizes == 1L
  if (any(one)) {
    x_starts <- vec_slice(x, starts)
    na <- vec_equal_na(x_starts) & one
    not_na <- !na
  } else {
    not_na <- TRUE
  }

  indices <- vector("list", n)

  # General idea is to use the `starts` to slice with, replacing them with
  # `NA` when we are too short, and then advancing the `starts` by 1 at each
  # iteration. `"left"` is a little tricky because we have to hold the start
  # location constant if we couldn't use it because the piece was too small.
  # Pieces that are too large are automatically ignored.
  if (direction == "end") {
    for (i in seq_len(n)) {
      small <- sizes < i

      index <- starts
      index[small] <- NA_integer_
      indices[[i]] <- index

      starts <- starts + 1L
    }
  } else {
    gap <- sizes - n

    for (i in seq_len(n)) {
      small <- gap < 0
      not_small <- !small

      index <- starts
      index[small] <- NA_integer_
      indices[[i]] <- index

      starts[not_small] <- starts[not_small] + 1L
      gap <- gap + 1L
    }
  }

  x <- vec_chop(x, indices)

  too_big <- which(sizes > n & not_na)
  too_sml <- which(sizes < n & not_na)

  list(
    strings = x,
    too_big = too_big,
    too_sml = too_sml
  )
}


list2df_warn <- function(align_warn, too_short, too_long, p) {
  warnings <- character()

  warn_short <- align_warn %in% c("both", "short")
  warn_long <- align_warn %in% c("both", "long")

  n_long <- length(too_long)
  if (warn_long && n_long > 0) {
    idx <- list_indices(too_long)
    warnings <- c(warnings, glue("{n_long} rows were too long: {idx}."))
  }

  n_short <- length(too_short)
  if (warn_short && n_short > 0) {
    idx <- list_indices(too_short)
    warnings <- c(warnings, glue("{n_short} rows were too short: {idx}."))
  }

  if (length(warnings) > 0) {
    warn(c(glue("Expected {p} pieces in each row."), warnings))
  }
}
