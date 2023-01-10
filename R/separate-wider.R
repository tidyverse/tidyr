#' Split a string into columns
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Each of these functions takes a string column and splits it into multiple
#' new columns:
#'
#' * `separate_wider_delim()` splits by delimiter.
#' * `separate_wider_position()` splits at fixed widths.
#' * `separate_wider_regex()` splits with regular expression matches.
#'
#' These functions are equivalent to [separate()] and [extract()], but use
#' [stringr](https://stringr.tidyverse.org/) as the underlying string
#' manipulation engine, and their interfaces reflect what we've learned from
#' [unnest_wider()] and [unnest_longer()].
#'
#' @inheritParams unnest_longer
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to separate.
#' @param names_sep If supplied, output names will be composed
#'   of the input column name followed by the separator followed by the
#'   new column name. Required when `cols` selects multiple columns.
#'
#'   For `separate_wider_delim()` you can specify instead of `names`, in which
#'   case the names will be generated from the source column name, `names_sep`,
#'   and a numeric suffix.
#' @param names For `separate_wider_delim()`, a character vector of output
#'   column names. Use `NA` if there are components that you don't want
#'   to appear in the output; the number of non-`NA` elements determines the
#'   number of new columns in the result.
#' @param delim For `separate_wider_delim()`, a string giving the delimiter
#'   between values. By default, it is interpreted as a fixed string; use
#'   [stringr::regex()] and friends to split in other ways.
#' @inheritParams rlang::args_dots_empty
#' @param too_few What should happen if a value separates into too few
#'   pieces?
#'
#'   * `"error"`, the default, will throw an error.
#'   * `"debug"` adds additional columns to the output to help you
#'     locate and resolve the underlying problem. This option is intended to
#'     help you debug the issue and address and should not generally remain in
#'     your final code.
#'   * `"align_start"` aligns starts of short matches, adding `NA` on the end
#'     to pad to the correct length.
#'   * `"align_end"` (`separate_wider_delim()` only) aligns the ends of short
#'     matches, adding `NA` at the start to pad to the correct length.
#' @param too_many What should happen if a value separates into too many
#'   pieces?
#'
#'   * `"error"`, the default, will throw an error.
#'   * `"debug"` will add additional columns to the output to help you
#'     locate and resolve the underlying problem.
#'   * `"drop"` will silently drop any extra pieces.
#'   * `"merge"` (`separate_wider_delim()` only) will merge together any
#'     additional pieces.
#' @param cols_remove Should the input `cols` be removed from the output?
#'   Always `FALSE` if `too_few` or `too_many` are set to `"debug"`.
#' @returns A data frame based on `data`. It has the same rows, but different
#'   columns:
#'
#' * The primary purpose of the functions are to create new columns from
#'   components of the string.
#'   For `separate_wider_delim()` the names of new columns come from `names`.
#'   For `separate_wider_position()` the names come from the names of `widths`.
#'   For `separate_wider_regex()` the names come from the names of
#'   `patterns`.
#'
#' * If `too_few` or `too_many` is `"debug"`, the output will contain additional
#'   columns useful for debugging:
#'
#'   * `{col}_ok`: a logical vector which tells you if the input was ok or
#'     not. Use to quickly find the problematic rows.
#'   * `{col}_remainder`: any text remaining after separation.
#'   * `{col}_pieces`, `{col}_width`, `{col}_matches`: number of pieces,
#'     number of characters, and number of matches for `separate_wider_delim()`,
#'     `separate_wider_position()` and `separate_regexp_wider()` respectively.
#'
#' * If `cols_remove = TRUE` (the default), the input `cols` will be removed
#'   from the output.
#'
#' @export
#' @examples
#' df <- tibble(id = 1:3, x = c("m-123", "f-455", "f-123"))
#' # There are three basic ways to split up a string into pieces:
#' # 1. with a delimiter
#' df %>% separate_wider_delim(x, delim = "-", names = c("gender", "unit"))
#' # 2. by length
#' df %>% separate_wider_position(x, c(gender = 1, 1, unit = 3))
#' # 3. defining each component with a regular expression
#' df %>% separate_wider_regex(x, c(gender = ".", ".", unit = "\\d+"))
#'
#' # Sometimes you split on the "last" delimiter
#' df <- tibble(var = c("race_1", "race_2", "age_bucket_1", "age_bucket_2"))
#' # _delim won't help because it always splits on the first delimiter
#' try(df %>% separate_wider_delim(var, "_", names = c("var1", "var2")))
#' df %>% separate_wider_delim(var, "_", names = c("var1", "var2"), too_many = "merge")
#' # Instead, you can use _regex
#' df %>% separate_wider_regex(var, c(var1 = ".*", "_", var2 = ".*"))
#' # this works because * is greedy; you can mimic the _delim behaviour with .*?
#' df %>% separate_wider_regex(var, c(var1 = ".*?", "_", var2 = ".*"))
#'
#' # If the number of components varies, it's most natural to split into rows
#' df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
#' df %>% separate_longer_delim(x, delim = " ")
#' # But separate_wider_delim() provides some tools to deal with the problem
#' # The default behaviour tells you that there's a problem
#' try(df %>% separate_wider_delim(x, delim = " ", names = c("a", "b")))
#' # You can get additional insight by using the debug options
#' df %>%
#'   separate_wider_delim(
#'     x,
#'     delim = " ",
#'     names = c("a", "b"),
#'     too_few = "debug",
#'     too_many = "debug"
#'   )
#'
#' # But you can suppress the warnings
#' df %>%
#'   separate_wider_delim(
#'     x,
#'     delim = " ",
#'     names = c("a", "b"),
#'     too_few = "align_start",
#'     too_many = "merge"
#'   )
#'
#' # Or choose to automatically name the columns, producing as many as needed
#' df %>% separate_wider_delim(x, delim = " ", names_sep = "", too_few = "align_start")
separate_wider_delim <- function(
    data,
    cols,
    delim,
    ...,
    names = NULL,
    names_sep = NULL,
    names_repair = "check_unique",
    too_few = c("error", "debug", "align_start", "align_end"),
    too_many = c("error", "debug", "drop", "merge"),
    cols_remove = TRUE
) {
  check_installed("stringr")
  check_data_frame(data)
  check_required(cols)
  check_dots_empty()
  check_string(delim, allow_empty = FALSE)
  if (is.null(names) && is.null(names_sep)) {
    cli::cli_abort("Must specify at least one of {.arg names} or {.arg names_sep}.")
  }
  check_character(names, allow_null = TRUE)
  if (is_named(names)) {
    cli::cli_abort("{.arg names} must be an unnamed character vector.")
  }
  too_few <- arg_match(too_few)
  too_many <- arg_match(too_many)
  check_bool(cols_remove)

  error_call %<~% current_env()

  map_unpack(
    data, {{ cols }},
    function(x, col) str_separate_wider_delim(x, col,
      names = names,
      delim = delim,
      names_sep = names_sep,
      too_few = too_few,
      too_many = too_many,
      cols_remove = cols_remove,
      error_call = error_call
    ),
    names_sep = names_sep,
    names_repair = names_repair
  )
}

str_separate_wider_delim <- function(
    x,
    col,
    names,
    delim,
    names_sep = NULL,
    too_few = "error",
    too_many = "error",
    cols_remove = TRUE,
    error_call = caller_env()
) {

  if (is_bare_string(delim)) {
    delim <- stringr::fixed(delim)
  }
  if (too_many == "merge") {
    if (is.null(names)) {
      cli::cli_abort(
        'Must provide {.arg names} when {.code too_many = "merge"}.',
        call = error_call
      )
    }
    n <- length(names)
  } else {
    n <- Inf
  }

  pieces <- stringr::str_split(x, delim, n = n)

  lengths <- lengths(pieces)
  n_pieces <- ifelse(is.na(x), NA, lengths)

  names <- names %||% as.character(seq_len(int_max(lengths, 0)))
  p <- length(names)

  check_df_alignment(col, p, "pieces", n_pieces,
    too_few = too_few,
    too_many = too_many,
    advice_short = c(
      i = 'Use `too_few = "debug"` to diagnose the problem.',
      i = 'Use `too_few = "align_start"/"align_end"` to silence this message.'
    ),
    advice_long = c(
      i = 'Use `too_many = "debug"` to diagnose the problem.',
      i = 'Use `too_many = "drop"/"merge"` to silence this message.'
    ),
    call = error_call
  )

  out <- df_align(
    x = pieces,
    names = names,
    align_direction = if (too_few == "align_end") "end" else "start"
  )

  if (!cols_remove || too_few == "debug" || too_many == "debug") {
    out[[col]] <- x
  }

  if (too_few == "debug" || too_many == "debug") {
    separate_warn_debug(col, names_sep, c("ok", "pieces", "remainder"))
    sep_loc <- stringr::str_locate_all(x, delim)
    sep_last <- lapply(sep_loc, function(x) if (nrow(x) < p) NA else x[p, "start"])
    remainder <- stringr::str_sub(x, sep_last)
    remainder[is.na(remainder) & !is.na(x)] <- ""

    problem <- !is.na(x) & (
        (too_few == "debug" & n_pieces < p) |
        (too_many == "debug" & n_pieces > p)
      )

    out[[debug_name(col, names_sep, "ok")]] <- !problem
    out[[debug_name(col, names_sep, "pieces")]] <- n_pieces
    out[[debug_name(col, names_sep, "remainder")]] <- remainder
  }

  out
}

#' @rdname separate_wider_delim
#' @param widths A named numeric vector where the names become column names,
#'   and the values specify the column width. Unnamed components will match,
#'   but not be included in the output.
#' @export
separate_wider_position <- function(
                                    data,
                                    cols,
                                    widths,
                                    ...,
                                    names_sep = NULL,
                                    names_repair = "check_unique",
                                    too_few = c("error", "debug", "align_start"),
                                    too_many = c("error", "debug", "drop"),
                                    cols_remove = TRUE
                                    ) {
  check_installed("stringr")
  check_data_frame(data)
  check_required(cols)
  if (!is_integerish(widths) || !any(have_name(widths))) {
    cli::cli_abort("{.arg widths} must be a (partially) named integer vector.")
  }
  if (any(widths <= 0)) {
    cli::cli_abort("All values of {.arg widths} must be positive.")
  }

  check_dots_empty()
  too_few <- arg_match(too_few)
  too_many <- arg_match(too_many)
  check_bool(cols_remove)

  error_call %<~% current_env()

  map_unpack(
    data, {{ cols }},
    function(x, col) str_separate_wider_position(x, col,
      widths = widths,
      names_sep = names_sep,
      too_few = too_few,
      too_many = too_many,
      cols_remove = cols_remove,
      error_call = error_call
    ),
    names_sep = names_sep,
    names_repair = names_repair
  )
}

str_separate_wider_position <- function(x,
                                        col,
                                        widths,
                                        names_sep = NULL,
                                        too_few = "error",
                                        too_many = "error",
                                        cols_remove = TRUE,
                                        error_call = caller_env()
                                        ) {

  breaks <- cumsum(c(1L, unname(widths)))[-(length(widths) + 1L)]
  expected_width <- sum(widths)

  width <- stringr::str_length(x)
  check_df_alignment(col, expected_width, "characters", width,
    too_few = too_few,
    too_many = too_many,
    advice_short = c(
      i = 'Use `too_few = "debug"` to diagnose the problem.',
      i = 'Use `too_few = "start"` to silence this message.'
    ),
    advice_long = c(
      i = 'Use `too_many = "debug"` to diagnose the problem.',
      i = 'Use `too_many = "drop"` to silence this message.'
    ),
    call = error_call
  )

  skip <- names(widths) == ""
  from <- cbind(start = breaks[!skip], length = widths[!skip])
  names <- names(widths)[!skip]

  pieces <- stringr::str_sub_all(x, from)
  pieces <- lapply(pieces, function(x) x[x != ""])

  out <- df_align(
    x = pieces,
    names = names,
    align_direction = if (too_few == "end") "end" else "start"
  )

  if (!cols_remove || too_few == "debug" || too_many == "debug") {
    out[[col]] <- x
  }

  if (too_few == "debug" || too_many == "debug") {
    separate_warn_debug(col, names_sep, c("ok", "width", "remainder"))
    problem <- !is.na(x) & (
        (too_few == "debug" & width < expected_width) |
        (too_many == "debug" & width > expected_width)
      )

    out[[debug_name(col, names_sep, "width")]] <- width
    out[[debug_name(col, names_sep, "remainder")]] <- stringr::str_sub(x, expected_width + 1, width)
    out[[debug_name(col, names_sep, "ok")]] <- !problem
  }


  out
}

#' @rdname separate_wider_delim
#' @param patterns A named character vector where the names become column names
#'   and the values are regular expressions that match the contents of the
#'   vector. Unnamed components will match, but not be included in the output.
#' @export
separate_wider_regex <- function(
                                 data,
                                 cols,
                                 patterns,
                                 ...,
                                 names_sep = NULL,
                                 names_repair = "check_unique",
                                 too_few = c("error", "debug", "align_start"),
                                 cols_remove = TRUE
                                 ) {
  check_installed("stringr")
  check_data_frame(data)
  check_required(cols)
  check_character(patterns)
  if (length(patterns) > 0 && all(!have_name(patterns))) {
    cli::cli_abort("{.arg patterns} must be a named character vector.")
  }
  check_dots_empty()
  check_string(names_sep, allow_null = TRUE)
  too_few <- arg_match(too_few)
  check_bool(cols_remove)

  error_call %<~% current_env()

  map_unpack(
    data, {{ cols }},
    function(x, col) str_separate_wider_regex(x, col,
      patterns = patterns,
      names_sep = names_sep,
      too_few = too_few,
      cols_remove = cols_remove,
      error_call = error_call
    ),
    names_sep = names_sep,
    names_repair = names_repair
  )
}

str_separate_wider_regex <- function(x,
                                     col,
                                     patterns,
                                     names_sep = NULL,
                                     too_few = "error",
                                     cols_remove = TRUE,
                                     error_call = caller_env()) {
  has_name <- names2(patterns) != ""
  groups <- stringr::str_c("(", ifelse(has_name, "", "?:"), patterns, ")")
  full_match <- stringr::str_c("^", stringr::str_flatten(groups, collapse = ""), "$")

  match <- stringr::str_match(x, full_match)
  if (ncol(match) != sum(has_name) + 1L) {
    cli::cli_abort(c(
      "Invalid number of groups.",
      i = 'Did you use "()" instead of "(?:)" inside {.arg patterns}?'
    ), call = error_call)
  }

  matches <- match[, -1, drop = FALSE]
  out <- as_tibble(matches, .name_repair = "none")
  colnames(out) <- names2(patterns)[has_name]

  if (!cols_remove || too_few == "debug") {
    out[[col]] <- x
  }

  match_count <- ifelse(is.na(x), NA, length(patterns))
  remainder <- ifelse(is.na(x), NA, "")
  problems <- !is.na(x) & is.na(match[, 1])
  no_match <- which(problems)

  if (length(no_match) > 0) {

    if (too_few == "error") {
      cli::cli_abort(c(
        "Expected each value of {.var {col}} to match the pattern, the whole pattern, and nothing but the pattern.",
        "!" = "{length(no_match)} value{?s} {?has/have} problem{?s}.",
        i = 'Use {.code too_few = "debug"} to diagnose the problem.',
        i = 'Use {.code too_few = "start"} to silence this message.'
      ), call = error_call)
    }

    # Progressively relax the matches
    for (i in rev(seq_along(groups))) {
      partial <- paste0("^", paste(groups[1:i], collapse = ""), "(.*)$")
      match <- stringr::str_match(x[no_match], partial)
      has_match <- !is.na(match[, 1])
      match_idx <- no_match[has_match]
      if (length(match_idx) == 0) {
        next
      }

      matches <- as_tibble(match[has_match, -1, drop = FALSE], .name_repair = "none")
      cols <- names2(patterns)[has_name][1:(ncol(matches) - 1)]
      out[match_idx, cols] <- matches[1:(ncol(matches) - 1)]
      remainder[match_idx] <- matches[[ncol(matches)]]
      match_count[match_idx] <- i

      no_match <- no_match[!has_match]
      if (length(no_match) == 0) {
        break
      }
    }

    if (length(no_match) > 0) {
      match_count[no_match] <- 0L
      remainder[no_match] <- x[no_match]
    }
  }


  if (too_few == "debug") {
    separate_warn_debug(col, names_sep, c("ok", "matches", "remainder"))
    out[debug_name(col, names_sep, "ok")] <- !problems
    out[debug_name(col, names_sep, "matches")] <- match_count
    out[debug_name(col, names_sep, "remainder")] <- remainder
  }

  out
}

# helpers -----------------------------------------------------------------

map_unpack <- function(data, cols, fun, names_sep, names_repair, error_call = caller_env()) {
  cols <- tidyselect::eval_select(
    enquo(cols),
    data = data,
    allow_rename = FALSE,
    allow_empty = FALSE,
    error_call = error_call
  )
  col_names <- names(cols)

  for (col in col_names) {
    data[[col]] <- fun(data[[col]], col)
  }

  unpack(
    data = data,
    cols = all_of(col_names),
    names_sep = names_sep,
    names_repair = names_repair,
    error_call = error_call
  )
}

# cf. df_simplify
df_align <- function(
    x,
    names,
    align_direction = c("start", "end")
) {
  vec_check_list(x)
  if (length(x) == 0) {
    return(new_data_frame(rep_named(names, list(character())), size = 0))
  }

  align_direction <- arg_match(align_direction)

  n <- length(x)
  p <- length(names)

  out <- df_align_transpose(x, p, align_direction = align_direction)
  out <- out[!is.na(names)]
  names(out) <- names[!is.na(names)]

  new_data_frame(out, size = n)
}

df_align_transpose <- function(x, p, align_direction = "start") {
  sizes <- list_sizes(x)
  # Find the start location of each piece
  starts <- cumsum(c(1L, sizes[-length(sizes)]))

  # Combine all pieces sequentially, zapping names for performance.
  x <- list_unchop(x, ptype = character(), name_spec = zap())

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

check_df_alignment <- function(
                               col,
                               p,
                               type,
                               sizes,
                               too_few,
                               too_many,
                               advice_short = NULL,
                               advice_long = NULL,
                               call = caller_env()) {
  n_short <- sum(sizes < p, na.rm = TRUE)
  n_long <- sum(sizes > p, na.rm = TRUE)

  error_short <- too_few == "error" && n_short > 0
  error_long <- too_many == "error" && n_long > 0

  if (!error_short && !error_long) {
    return()
  }

  cli::cli_abort(c(
    "Expected {p} {type} in each element of {.var {col}}.",
    "!" = if (error_short) "{n_short} value{?s} {?was/were} too short.",
    if (error_short) advice_short,
    "!" = if (error_long) "{n_long} value{?s} {?was/were} too long.",
    if (error_long) advice_long
  ), call = call)
}


separate_warn_debug <- function(col, names_sep, vars) {
  vars <- debug_name(col, names_sep, vars)

  cli::cli_warn("Debug mode activated: adding variables {.var {vars}}.")
}

debug_name <- function(col, names_sep, var) {
  paste0(col, names_sep %||% "_", var)
}

