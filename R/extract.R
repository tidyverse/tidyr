#' Extract a character column into multiple columns using regular
#' expression groups
#'
#' Given a regular expression with capturing groups, `extract()` turns
#' each group into a new column. If the groups don't match, or the input
#' is NA, the output will be NA.
#'
#' @inheritParams expand
#' @param col <[`tidy-select`][tidyr_tidy_select]> Column to expand.
#' @param into Names of new variables to create as character vector.
#'    Use `NA` to omit the variable in the output.
#' @param regex A string representing a regular expression used to extract the
#'   desired values. There should be one group (defined by `()`) for each
#'   element of `into`.
#' @param remove If `TRUE`, remove input column from output data frame.
#' @param convert If `TRUE`, will run [type.convert()] with
#'   `as.is = TRUE` on new columns. This is useful if the component
#'   columns are integer, numeric or logical.
#'
#'   NB: this will cause string `"NA"`s to be converted to `NA`s.
#' @param ... Additional arguments passed on to methods.
#' @seealso [separate()] to split up by a separator.
#' @export
#' @examples
#' df <- tibble(x = c(NA, "a-b", "a-d", "b-c", "d-e"))
#' df %>% extract(x, "A")
#' df %>% extract(x, c("A", "B"), "([[:alnum:]]+)-([[:alnum:]]+)")
#'
#' # If no match, NA:
#' df %>% extract(x, c("A", "B"), "([a-d]+)-([a-d]+)")
extract <- function(data, col, into, regex = "([[:alnum:]]+)",
                    remove = TRUE, convert = FALSE, ...) {
  check_dots_used()
  UseMethod("extract")
}
#' @export
extract.data.frame <- function(data, col, into, regex = "([[:alnum:]]+)",
                               remove = TRUE, convert = FALSE, ...) {
  check_required(col)

  var <- tidyselect::vars_pull(names(data), !!enquo(col))
  value <- as.character(data[[var]])

  new_cols <- str_extract(value, into = into, regex = regex, convert = convert)
  out <- append_df(data, new_cols, var, remove = remove)
  reconstruct_tibble(data, out, if (remove) var else chr())
}

str_extract <- function(x, into, regex, convert = FALSE, error_call = caller_env()) {
  check_string(regex, call = error_call)
  check_not_stringr_pattern(regex, call = error_call)
  check_character(into, call = error_call)
  check_bool(convert, call = error_call)

  out <- str_match_first(x, regex)
  if (length(out) != length(into)) {
    cli::cli_abort(
      "{.arg regex} should define {length(into)} groups; {length(out)} found.",
      call = error_call
    )
  }

  # Handle duplicated names
  if (anyDuplicated(into)) {
    pieces <- split(out, into)
    into <- names(pieces)
    out <- map(pieces, pmap_chr, vec_paste0)
  }

  into <- as_utf8_character(into)

  non_na_into <- !is.na(into)
  out <- out[non_na_into]
  names(out) <- into[non_na_into]

  out <- as_tibble(out)

  if (convert) {
    out[] <- map(out, type.convert, as.is = TRUE)
  }

  out
}

# Helpers -----------------------------------------------------------------

str_match_first <- function(string, regex) {
  loc <- regexpr(regex, string, perl = TRUE)
  loc <- group_loc(loc)

  out <- lapply(
    seq_len(loc$matches),
    function(i) substr(string, loc$start[, i], loc$end[, i])
  )
  out[-1]
}

group_loc <- function(x) {
  start <- cbind(as.vector(x), attr(x, "capture.start"))
  end <- start + cbind(attr(x, "match.length"), attr(x, "capture.length")) - 1L

  no_match <- start == -1L
  start[no_match] <- NA
  end[no_match] <- NA

  list(matches = ncol(start), start = start, end = end)
}
