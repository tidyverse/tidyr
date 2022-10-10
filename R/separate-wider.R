#' Split a string into columns
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string column and splits it into multiple
#' new columns:
#'
#' * `separate_by_wider()` splits with a delimiter.
#' * `separate_at_wider()` splits using fixed widths.
#' * `separate_regex_wider()` splits using regular expression matches.
#'
#' These functions are equivalent to [separate()] and [extract()], but use
#' [stringr](http://stringr.tidyverse.org/) as the underlying string
#' manipulation engine, and their interfaces reflect what we've learned from
#' [unnest_wider()] and [unnest_longer()].
#'
#' @inheritParams unnest_longer
#' @inheritParams separate
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to separate.
#' @param names,names_sep If you are separating a single column, specify either
#'   a fixed number of column `names` or use `names_sep` to generate new names
#'   from the source column name, `names_sep`, and a numeric suffix.
#'
#'   If you are separating multiple columns, you must to supply `names_sep`,
#'   to avoid creating duplicated column names.
#' @param sep Separator between columns, by default, a fixed string.
#'   Use `stringr::regexp()` and friends to split in other ways.
#' @inheritParams rlang::args_dots_empty
#' @param align_direction If different rows have different numbers of
#'   observations should the `start`s or the `ends`s be aligned?
#' @param align_warn When do you want to be informed about strings that have
#'   too many or too few pieces?
#'
#'   * `"both"`, the default, when there are too few or too many.
#'   * `"short"`, only when there are too few.
#'   * `"long"`, only where there are too many.
#'   * `"none"`, never warn.
#' @export
#' @examples
#' df <- tibble(id = 1:3, x = c("m-123", "f-455", "f-123"))
#' # There are three basic ways to split up a string into pieces.
#' # * with a delimiter
#' df %>% separate_by_wider(x, sep = "-", names = c("gender", "unit"))
#' # * by length
#' df %>% separate_at_wider(x, c(gender = 1, 1, unit = 3))
#' # * defining each component with a regular expression
#' df %>% separate_regex_wider(x, c(gender = ".", ".", unit = "\\d+"))
#'
#' # Sometimes you split on the "last" delimiter:
#' df <- data.frame(var = c("race_1", "race_2", "age_bucket_1", "age_bucket_2"))
#' # _delim won't help because it always splits on the first delimiter
#' df %>% separate_by_wider(var, "_", names = c("var1", "var2"))
#' # Instead, you can use _group:
#' df %>% separate_regex_wider(var, c(var1 = ".*", "_", var2 = ".*"))
#' # this works because * is greedy; you can mimic the _by behaviour with .*?
#' df %>% separate_regex_wider(var, c(var1 = ".*?", "_", var2 = ".*"))
#'
#' # If the number of components varies, it's most natural to split into rows
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_by_longer(x, sep = " ")
#' # But separate_by_wider() provides some tools to deal with the problem
#' # The default behaviour tells you where the problems lie:
#' df %>% separate_by_wider(x, sep = " ", names = c("a", "b"))
#' # But you can can suppress the warnings:
#' df %>% separate_by_wider(x, sep = " ", names = c("a", "b"), align_warn = "none")
#' # Or choose to automatically name the columns
#' df %>% separate_by_wider(x, sep = " ", names_sep = "", align_warn = "none")
separate_by_wider <- function(
    data,
    cols,
    sep,
    ...,
    names = NULL,
    names_sep = NULL,
    names_repair = "check_unique",
    align_direction = c("start", "end"),
    align_warn = c("both", "short", "long", "none"),
    debug = FALSE
) {
  check_installed("stringr")
  check_required(cols)
  check_dots_empty()
  if (!is_string(sep)) {
    abort("`sep` must be a string")
  }
  if (is.null(names) && is.null(names_sep)) {
    abort("Must specify at least one of `names` or `names_sep`")
  }
  if (!is.null(names) && (!is.character(names) || is_named(names) || length(names) == 0)) {
    abort("`names` must be an unnamed character vector")
  }
  align_direction <- arg_match(align_direction)
  align_warn <- arg_match(align_warn)

  map_unpack(
    data, {{ cols }},
    str_separate_by_wider,
    names = names,
    sep = sep,
    align_direction = align_direction,
    align_warn = align_warn,
    debug = debug,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
}

str_separate_by_wider <- function(
    x,
    col,
    names,
    sep,
    names_sep = NULL,
    align_direction = c("start", "end"),
    align_warn = c("both", "short", "long", "none"),
    debug = FALSE
) {

  if (is_bare_string(sep)) {
    sep <- stringr::fixed(sep)
  }

  pieces <- stringr::str_split(x, sep, n = Inf)
  names <- names %||% as.character(seq_len(max(lengths(pieces))))

  out <- df_align(
    x = pieces,
    names = names,
    align_direction = align_direction,
    align_warn = if (debug) "none" else align_warn
  )

  # TODO: uses names_prefix instead
  if (debug) {
    names_sep <- names_sep %||% "_"

    p <- length(names)
    out[[paste0(col, names_sep, "pieces")]] <- lengths(pieces)

    sep_loc <- str_locate_all(x, sep)
    sep_last <- lapply(sep_loc, function(x) if (nrow(x) < p) NA else x[p, "start"])
    out[[paste0(col, names_sep, "extra")]] <- str_sub(x, sep_last)
  }

  out
}

#' @rdname separate_by_wider
#' @param widths A named numeric vector where the names become column names,
#'   and the values specify the column width. Unnamed components will match,
#'   but not be included in the output.
#' @export
separate_at_wider <- function(
    data,
    cols,
    widths,
    ...,
    names_sep = NULL,
    names_repair = "check_unique",
    align_direction = c("start", "end"),
    align_warn = c("both", "short", "long", "none")
) {
  check_installed("stringr")
  check_required(cols)
  if (!is_integerish(widths) || !any(have_name(widths))) {
    abort("`widths` must be a named integer vector")
  }
  check_dots_empty()
  align_direction <- arg_match(align_direction)
  align_warn <- arg_match(align_warn)

  map_unpack(
    data, {{ cols }},
    str_separate_at_wider,
    widths = widths,
    align_direction = align_direction,
    align_warn = align_warn,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
}

str_separate_at_wider <- function(x,
                                  widths,
                                  align_direction = c("start", "end"),
                                  align_warn = c("both", "short", "long", "none")
                                  ) {

  breaks <- cumsum(c(1, unname(widths)))[-(length(widths) + 1)]

  skip <- names(widths) == ""
  from <- cbind(start = breaks[!skip], length = widths[!skip])
  names <- names(widths)[!skip]

  pieces <- stringr::str_sub_all(x, from)
  pieces <- lapply(pieces, function(x) x[x != ""])

  df_align(
    x = pieces,
    names = names,
    align_direction = align_direction,
    align_warn = align_warn
  )
}

#' @rdname separate_by_wider
#' @param patterns A named character vector where the names become column names
#'   and the values are regular expressions that match the contents of the
#'   vector. Unnamed components will match, but not be included in the output.
#' @param match_complete Is the pattern required to match the entire string?
#' @export
separate_regex_wider <- function(
    data,
    cols,
    patterns,
    ...,
    match_complete = TRUE,
    names_sep = NULL,
    names_repair = "check_unique"
) {
  check_installed("stringr")
  check_required(cols)
  if (!is.character(patterns) || all(!have_name(patterns))) {
    abort("`patterns` must be a named character vector")
  }
  check_dots_empty()
  if (!is_bool(match_complete)) {
    abort("`match_complete` must be TRUE or FALSE")
  }

  map_unpack(
    data, {{ cols }},
    str_separate_regex_wider,
    patterns = patterns,
    match_complete = match_complete,
    .names_sep = names_sep,
    .names_repair = names_repair
  )
}

str_separate_regex_wider <- function(x, patterns, match_complete = TRUE) {
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
    data[[col]] <- fun(data[[col]], col, ..., names_sep = .names_sep)
  }

  unpack(
    data,
    all_of(col_names),
    names_sep = .names_sep,
    names_repair = .names_repair
  )
}

# cf. df_simplify
df_align <- function(
    x,
    names,
    align_direction = c("start", "end"),
    align_warn = c("both", "short", "long", "none")
) {
  vec_check_list(x)
  align_direction <- arg_match(align_direction)
  align_warn <- arg_match(align_warn)

  n <- length(x)
  p <- length(names)
  sizes <- list_sizes(x)

  df_align_warn(p, sizes, align_warn = align_warn)

  out <- df_align_transpose(x, p, sizes, align_direction = align_direction)
  out <- out[!is.na(names)]
  names(out) <- names[!is.na(names)]

  new_data_frame(out, size = n)
}

df_align_transpose <- function(x, p, sizes, align_direction = "start") {
  # Find the start location of each piece
  starts <- cumsum(c(1L, sizes[-length(sizes)]))

  # Combine all pieces sequentially, zapping names for performance.
  x <- vec_unchop(x, ptype = character(), name_spec = zap())

  indices <- vector("list", p)
  if (align_direction == "start") {
    # General idea is to use the `starts` to slice with, replacing them with
    # `NA` when we are too short, and then advancing the `starts` by 1 at each
    # iteration.
    for (i in seq_len(p)) {
      small <- sizes < i

      index <- starts
      index[small] <- NA_integer_
      indices[[i]] <- index

      starts <- starts + 1L
    }
  } else {
    # `"end"` is a little tricky because we have to hold the start
    # location constant if we couldn't use it because the piece was too small.
    # Pieces that are too large are automatically ignored.
    gap <- sizes - p

    for (i in seq_len(p)) {
      small <- gap < 0
      not_small <- !small

      index <- starts
      index[small] <- NA_integer_
      indices[[i]] <- index

      starts[not_small] <- starts[not_small] + 1L
      gap <- gap + 1L
    }
  }

  vec_chop(x, indices)
}

df_align_warn <- function(p, sizes, align_warn = "both") {
  warnings <- character()

  warn_short <- align_warn %in% c("both", "short")
  if (warn_short) {
    too_short <- which(sizes < p)
    n_short <- length(too_short)

    if (n_short > 0) {
      idx <- list_indices(too_short)
      warnings <- c(warnings, glue("{n_short} rows were too short: {idx}."))
    }
  }

  warn_long <- align_warn %in% c("both", "long")
  if (warn_long) {
    too_long <- which(sizes > p)
    n_long <- length(too_long)

    if (n_long > 0) {
      idx <- list_indices(too_long)
      warnings <- c(warnings, glue("{n_long} rows were too long: {idx}."))
    }
  }

  if (length(warnings) > 0) {
    warn(c(glue("Expected {p} pieces in each row."), warnings))
  }
}
