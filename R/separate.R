#' Separate a character column into multiple columns with a regular
#' expression or numeric locations
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' `separate()` has been superseded in favour of [separate_wider_position()]
#' and [separate_wider_delim()] because the two functions make the two uses
#' more obvious, the API is more polished, and the handling of problems is
#' better. Superseded functions will not go away, but will only receive
#' critical bug fixes.
#'
#' Given either a regular expression or a vector of character positions,
#' `separate()` turns a single character column into multiple columns.
#'
#' @inheritParams extract
#' @param sep Separator between columns.
#'
#'   If character, `sep` is interpreted as a regular expression. The default
#'   value is a regular expression that matches any sequence of
#'   non-alphanumeric values.
#'
#'   If numeric, `sep` is interpreted as character positions to split at. Positive
#'   values start at 1 at the far-left of the string; negative value start at -1 at
#'   the far-right of the string. The length of `sep` should be one less than
#'   `into`.
#' @param extra If `sep` is a character vector, this controls what
#'   happens when there are too many pieces. There are three valid options:
#'
#'   * `"warn"` (the default): emit a warning and drop extra values.
#'   * `"drop"`: drop any extra values without a warning.
#'   * `"merge"`: only splits at most `length(into)` times
#' @param fill If `sep` is a character vector, this controls what
#'   happens when there are not enough pieces. There are three valid options:
#'
#'   * `"warn"` (the default): emit a warning and fill from the right
#'   * `"right"`: fill with missing values on the right
#'   * `"left"`: fill with missing values on the left
#' @seealso [unite()], the complement, [extract()] which uses regular
#'   expression capturing groups.
#' @export
#' @examples
#' # If you want to split by any non-alphanumeric value (the default):
#' df <- tibble(x = c(NA, "x.y", "x.z", "y.z"))
#' df %>% separate(x, c("A", "B"))
#'
#' # If you just want the second variable:
#' df %>% separate(x, c(NA, "B"))
#'
#' # We now recommend separate_wider_delim() instead:
#' df %>% separate_wider_delim(x, ".", names = c("A", "B"))
#' df %>% separate_wider_delim(x, ".", names = c(NA, "B"))
#'
#' # Controlling uneven splits -------------------------------------------------
#' # If every row doesn't split into the same number of pieces, use
#' # the extra and fill arguments to control what happens:
#' df <- tibble(x = c("x", "x y", "x y z", NA))
#' df %>% separate(x, c("a", "b"))
#' # The same behaviour as previous, but drops the c without warnings:
#' df %>% separate(x, c("a", "b"), extra = "drop", fill = "right")
#' # Opposite of previous, keeping the c and filling left:
#' df %>% separate(x, c("a", "b"), extra = "merge", fill = "left")
#' # Or you can keep all three:
#' df %>% separate(x, c("a", "b", "c"))
#'
#' # To only split a specified number of times use extra = "merge":
#' df <- tibble(x = c("x: 123", "y: error: 7"))
#' df %>% separate(x, c("key", "value"), ": ", extra = "merge")
#'
#' # Controlling column types --------------------------------------------------
#' # convert = TRUE detects column classes:
#' df <- tibble(x = c("x:1", "x:2", "y:4", "z", NA))
#' df %>% separate(x, c("key", "value"), ":") %>% str()
#' df %>% separate(x, c("key", "value"), ":", convert = TRUE) %>% str()
separate <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                     convert = FALSE, extra = "warn", fill = "warn", ...) {
  check_dots_used()
  UseMethod("separate")
}
#' @export
separate.data.frame <- function(data, col, into, sep = "[^[:alnum:]]+",
                                remove = TRUE, convert = FALSE,
                                extra = "warn", fill = "warn", ...) {
  check_required(col)
  check_bool(remove)

  var <- tidyselect::vars_pull(names(data), !!enquo(col))
  value <- as.character(data[[var]])

  new_cols <- str_separate(value,
    into = into,
    sep = sep,
    convert = convert,
    extra = extra,
    fill = fill
  )
  out <- df_append(data, new_cols, var, remove = remove)
  reconstruct_tibble(data, out, if (remove) var else NULL)
}

str_separate <- function(x, into, sep, convert = FALSE, extra = "warn", fill = "warn", error_call = caller_env()) {
  check_character(into, call = error_call)
  check_bool(convert, call = error_call)

  if (is.numeric(sep)) {
    out <- strsep(x, sep)
  } else if (is_string(sep)) {
    check_not_stringr_pattern(sep, call = error_call)
    out <- str_split_fixed(x, sep, length(into), extra = extra, fill = fill)
  } else {
    cli::cli_abort(
      "{.arg sep} must be a string or numeric vector, not {.obj_type_friendly {sep}}",
      call = error_call
    )
  }

  names(out) <- as_utf8_character(into)
  out <- out[!is.na(names(out))]
  if (convert) {
    out[] <- map(out, type.convert, as.is = TRUE)
  }
  as_tibble(out)
}

strsep <- function(x, sep) {
  nchar <- nchar(x)
  pos <- map(sep, function(i) {
    if (i >= 0) {
      i
    } else {
      pmax(0, nchar + i)
    }
  })
  pos <- c(list(0), pos, list(nchar))

  map(1:(length(pos) - 1), function(i) {
    substr(x, pos[[i]] + 1, pos[[i + 1]])
  })
}

str_split_fixed <- function(value, sep, n, extra = "warn", fill = "warn") {
  if (extra == "error") {
    warn(glue(
      "`extra = \"error\"` is deprecated. \\
       Please use `extra = \"warn\"` instead"
    ))
    extra <- "warn"
  }

  extra <- arg_match(extra, c("warn", "merge", "drop"))
  fill <- arg_match(fill, c("warn", "left", "right"))

  n_max <- if (extra == "merge") n else -1L
  pieces <- str_split_n(value, sep, n_max = n_max)

  simp <- simplifyPieces(pieces, n, fill == "left")

  n_big <- length(simp$too_big)
  if (extra == "warn" && n_big > 0) {
    idx <- list_indices(simp$too_big)
    warn(glue("Expected {n} pieces. Additional pieces discarded in {n_big} rows [{idx}]."))
  }

  n_sml <- length(simp$too_sml)
  if (fill == "warn" && n_sml > 0) {
    idx <- list_indices(simp$too_sml)
    warn(glue("Expected {n} pieces. Missing pieces filled with `NA` in {n_sml} rows [{idx}]."))
  }

  simp$strings
}

str_split_n <- function(x, pattern, n_max = -1) {
  if (is.factor(x)) {
    x <- as.character(x)
  }
  m <- gregexpr(pattern, x, perl = TRUE)
  if (n_max > 0) {
    m <- lapply(m, function(x) slice_match(x, seq_along(x) < n_max))
  }
  regmatches(x, m, invert = TRUE)
}

slice_match <- function(x, i) {
  structure(
    x[i],
    match.length = attr(x, "match.length")[i],
    index.type = attr(x, "index.type"),
    useBytes = attr(x, "useBytes")
  )
}


list_indices <- function(x, max = 20) {
  if (length(x) > max) {
    x <- c(x[seq_len(max)], "...")
  }

  paste(x, collapse = ", ")
}

check_not_stringr_pattern <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (inherits_any(x, c("pattern", "stringr_pattern"))) {
    cli::cli_abort("{.arg {arg}} can't use modifiers from stringr.", call = call)
  }
}
