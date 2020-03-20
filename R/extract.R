#' Extract a character column into multiple columns using regular
#' expression groups
#'
#' Given a regular expression with capturing groups, `extract()` turns
#' each group into a new column. If the groups don't match, or the input
#' is NA, the output will be NA.
#'
#' @inheritParams expand
#' @param col Column name or position. This is passed to
#'   [tidyselect::vars_pull()].
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote column
#'   names or column positions).
#' @param into Names of new variables to create as character vector.
#'    Use `NA` to omit the variable in the output.
#' @param regex a regular expression used to extract the desired values.
#'   There should be one group (defined by `()`) for each element of `into`.
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
#' df <- data.frame(x = c(NA, "a-b", "a-d", "b-c", "d-e"))
#' df %>% extract(x, "A")
#' df %>% extract(x, c("A", "B"), "([[:alnum:]]+)-([[:alnum:]]+)")
#'
#' # If no match, NA:
#' df %>% extract(x, c("A", "B"), "([a-d]+)-([a-d]+)")
extract <- function(data, col, into, regex = "([[:alnum:]]+)",
                    remove = TRUE, convert = FALSE, ...) {
  ellipsis::check_dots_used()
  UseMethod("extract")
}
#' @export
extract.data.frame <- function(data, col, into, regex = "([[:alnum:]]+)",
                               remove = TRUE, convert = FALSE, ...) {
  check_present(col)
  var <- tidyselect::vars_pull(names(data), !! enquo(col))
  value <- as.character(data[[var]])

  new_cols <- str_extract(value, into = into, regex = regex, convert = convert)
  out <- append_df(data, new_cols, var, remove = remove)
  reconstruct_tibble(data, out, if (remove) var else chr())
}

str_extract <- function(x, into, regex, convert = FALSE) {
  stopifnot(
    is_string(regex),
    is_character(into)
  )

  matches <- stringi::stri_match_first_regex(x, regex)[, -1, drop = FALSE]

  if (ncol(matches) != length(into)) {
    stop(
      "`regex` should define ", length(into), " groups; ", ncol(matches), " found.",
      call. = FALSE
    )
  }

  out <- as_tibble(matches, .name_repair = "minimal")
  out <- as.list(out)

  # Handle duplicated names
  if (anyDuplicated(into)) {
    pieces <- split(out, into)
    into <- names(pieces)
    out <- map(pieces, pmap_chr, paste0, sep = "")
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
