#' Separate a character column into multiple columns using a regular
#' expression separator
#'
#' Given either regular expression or a vector of character positions,
#' `separate()` turns a single character column into multiple columns.
#'
#' @inheritParams extract
#' @param sep Separator between columns.
#'
#'   If character, is interpreted as a regular expression. The default
#'   value is a regular expression that matches any sequence of
#'   non-alphanumeric values.
#'
#'   If numeric, interpreted as positions to split at. Positive values start
#'   at 1 at the far-left of the string; negative value start at -1 at the
#'   far-right of the string. The length of `sep` should be one less than
#'   `into`.
#' @param extra If `sep` is a character vector, this controls what
#'   happens when there are too many pieces. There are three valid options:
#'
#'   * "warn" (the default): emit a warning and drop extra values.
#'   * "drop": drop any extra values without a warning.
#'   * "merge": only splits at most `length(into)` times
#' @param fill If `sep` is a character vector, this controls what
#'   happens when there are not enough pieces. There are three valid options:
#'
#'   * "warn" (the default): emit a warning and fill from the right
#'   * "right": fill with missing values on the right
#'   * "left": fill with missing values on the left
#' @seealso [unite()], the complement, [extract()] which uses regular
#'   expression capturing groups.
#' @export
#' @examples
#' library(dplyr)
#' df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
#' df %>% separate(x, c("A", "B"))
#'
#' # If you just want the second variable:
#' df %>% separate(x, c(NA, "B"))
#'
#' # If every row doesn't split into the same number of pieces, use
#' # the extra and fill arguments to control what happens
#' df <- data.frame(x = c("a", "a b", "a b c", NA))
#' df %>% separate(x, c("a", "b"))
#' # The same behaviour drops the c but no warnings
#' df %>% separate(x, c("a", "b"), extra = "drop", fill = "right")
#' # Another option:
#' df %>% separate(x, c("a", "b"), extra = "merge", fill = "left")
#' # Or you can keep all three
#' df %>% separate(x, c("a", "b", "c"))
#'
#' # If only want to split specified number of times use extra = "merge"
#' df <- data.frame(x = c("x: 123", "y: error: 7"))
#' df %>% separate(x, c("key", "value"), ": ", extra = "merge")
#'
#' # Use regular expressions to separate on multiple characters:
#' df <- data.frame(x = c(NA, "a?b", "a.d", "b:c"))
#' df %>% separate(x, c("A","B"), sep = "([\\.\\?\\:])")
#'
#' # convert = TRUE detects column classes
#' df <- data.frame(x = c("a:1", "a:2", "c:4", "d", NA))
#' df %>% separate(x, c("key","value"), ":") %>% str
#' df %>% separate(x, c("key","value"), ":", convert = TRUE) %>% str
#'
#' # Argument col can take quasiquotation to work with strings
#' var <- "x"
#' df %>% separate(!!var, c("key","value"), ":")
separate <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                     convert = FALSE, extra = "warn", fill = "warn", ...) {
  ellipsis::check_dots_used()
  UseMethod("separate")
}
#' @export
separate.data.frame <- function(data, col, into, sep = "[^[:alnum:]]+",
                                remove = TRUE, convert = FALSE,
                                extra = "warn", fill = "warn", ...) {
  var <- tidyselect::vars_pull(names(data), !! enquo(col))
  value <- as.character(data[[var]])

  new_cols <- str_separate(value,
    into = into,
    sep = sep,
    convert = convert,
    extra = extra,
    fill = fill
  )
  out <- append_df(data, new_cols, var, remove = remove)
  reconstruct_tibble(data, out, if (remove) var else NULL)
}

str_separate <- function(x, into, sep, convert = FALSE, extra = "warn", fill = "warn") {
  if (!is.character(into)) {
    abort("`into` must be a character vector")
  }

  if (is.numeric(sep)) {
    out <- strsep(x, sep)
  } else if (is_character(sep)) {
    out <- str_split_fixed(x, sep, length(into), extra = extra, fill = fill)
  } else {
    abort("`sep` must be either numeric or character")
  }

  names(out) <- as_utf8_character(into)
  out <- out[!is.na(names(out))]
  if (convert) {
    out[] <- map(out, type.convert, as.is = TRUE)
  }
  as_tibble(out)
}

strsep <- function(x, sep) {
  nchar <- stringi::stri_length(x)
  pos <- map(sep, function(i) {
    if (i >= 0) return(i)
    pmax(0, nchar + i)
  })
  pos <- c(list(0), pos, list(nchar))

  map(1:(length(pos) - 1), function(i) {
    stringi::stri_sub(x, pos[[i]] + 1, pos[[i + 1]])
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
  pieces <- stringi::stri_split_regex(value, sep, n_max)

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

list_indices <- function(x, max = 20) {
  if (length(x) > max) {
    x <- c(x[seq_len(max)], "...")
  }

  paste(x, collapse = ", ")
}
