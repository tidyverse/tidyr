#' Extract one column into multiple columns.
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
#' @param regex a regular expression used to extract the desired values.
#' @param remove If `TRUE`, remove input column from output data frame.
#' @param convert If `TRUE`, will run [type.convert()] with
#'   `as.is = TRUE` on new columns. This is useful if the component
#'   columns are integer, numeric or logical.
#' @param ... Other arguments passed on to [regexec()] to control
#'   how the regular expression is processed.
#' @export
#' @examples
#' library(dplyr)
#' df <- data.frame(x = c(NA, "a-b", "a-d", "b-c", "d-e"))
#' df %>% extract(x, "A")
#' df %>% extract(x, c("A", "B"), "([[:alnum:]]+)-([[:alnum:]]+)")
#'
#' # If no match, NA:
#' df %>% extract(x, c("A", "B"), "([a-d]+)-([a-d]+)")
extract <- function(data, col, into, regex = "([[:alnum:]]+)",
                    remove = TRUE, convert = FALSE, ...) {
  UseMethod("extract")
}
#' @export
extract.default <- function(data, col, into, regex = "([[:alnum:]]+)",
                            remove = TRUE, convert = FALSE, ...) {
  extract_(data,
    col = compat_as_lazy(enquo(col)),
    into = into,
    regex = regex,
    remove = remove,
    convert = convert,
    ...
  )
}
#' @export
extract.data.frame <- function(data, col, into, regex = "([[:alnum:]]+)",
                               remove = TRUE, convert = FALSE, ...) {
  var <- tidyselect::vars_pull(names(data), !! enquo(col))
  stopifnot(
    is_string(regex),
    is_character(into)
  )

  # Extract matching groups
  value <- as.character(data[[var]])
  matches <- stringi::stri_match_first_regex(value, regex)[, -1, drop = FALSE]

  # Use as_tibble post https://github.com/hadley/dplyr/issues/876
  l <- map(seq_len(ncol(matches)), function(i) matches[, i])
  names(l) <- enc2utf8(into)

  if (convert) {
    l[] <- map(l, type.convert, as.is = TRUE)
  }

  # Insert into existing data frame
  out <- append_df(data, l, match(var, dplyr::tbl_vars(data)))
  if (remove) {
    out[[var]] <- NULL
  }

  reconstruct_tibble(data, out, if (remove) var else chr())
}


#' @rdname deprecated-se
#' @inheritParams extract
#' @export
extract_ <- function(data, col, into, regex = "([[:alnum:]]+)", remove = TRUE,
                      convert = FALSE, ...) {
  UseMethod("extract_")
}
#' @export
extract_.data.frame <- function(data, col, into, regex = "([[:alnum:]]+)",
                                remove = TRUE, convert = FALSE, ...) {
  col <- compat_lazy(col, caller_env())
  extract(data,
    col = !! col,
    into = into,
    regex = regex,
    remove = remove,
    convert = convert,
    ...
  )
}
