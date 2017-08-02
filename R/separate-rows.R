#' Separate a collapsed column into multiple rows.
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
#'
#' @inheritSection gather Rules for selection
#' @inheritParams gather
#' @inheritParams separate
#' @param sep Separator delimiting collapsed values.
#' @export
#' @examples
#'
#' df <- data.frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   z = c("1", "2,3,4", "5,6"),
#'   stringsAsFactors = FALSE
#' )
#' separate_rows(df, y, z, convert = TRUE)
separate_rows <- function(data, ..., sep = "[^[:alnum:].]+",
                          convert = FALSE) {
  UseMethod("separate_rows")
}
#' @export
separate_rows.default <- function(data, ..., sep = "[^[:alnum:].]+",
                                  convert = FALSE) {
  cols <- compat_as_lazy_dots(...)
  separate_rows_(data, cols = cols, sep = sep)
}
#' @export
separate_rows.data.frame <- function(data, ..., sep = "[^[:alnum:].]+",
                                     convert = FALSE) {
  orig <- data
  vars <- unname(tidyselect::vars_select(names(data), ...))

  data[vars] <- map(data[vars], stringi::stri_split_regex, sep)
  data <- unnest(data, !!! syms(vars))

  if (convert) {
    data[vars] <- map(data[vars], type.convert, as.is = TRUE)
  }

  reconstruct_tibble(orig, data, vars)
}

#' @rdname deprecated-se
#' @inheritParams separate_rows
#' @export
separate_rows_ <- function(data, cols, sep = "[^[:alnum:].]+",
                           convert = FALSE) {
  UseMethod("separate_rows_")
}
#' @export
separate_rows_.data.frame <- function(data, cols, sep = "[^[:alnum:].]+",
                                      convert = FALSE) {
  cols <- syms(cols)
  separate_rows(data, !!! cols, sep = sep, convert = convert)
}
