#' Separate a collapsed column into multiple rows.
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
#'
#' @inheritParams separate_rows_
#' @inheritParams separate_
#' @param ... Specification of columns to separate. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
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
  vars <- unname(dplyr::select_vars(names(data), ...))

  data[vars] <- map(data[vars], stringi::stri_split_regex, sep)
  data <- unnest(data, !!! syms(vars))

  if (convert) {
    data[vars] <- map(data[vars], type.convert, as.is = TRUE)
  }

  if (inherits(data, "grouped_df")) {
    regroup(data, orig, vars)
  } else if (inherits(data, "tbl_df")) {
    as_tibble(data)
  } else {
    data
  }
}

#' Standard-evaluation version of \code{separate_rows}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param cols Name of columns that need to be separated.
#' @param sep Separator delimiting collapsed values.
#' @inheritParams separate_
#' @keywords internal
#' @export
separate_rows_ <- function(data, cols, sep = "[^[:alnum:].]+",
                           convert = FALSE) {
  UseMethod("separate_rows_")
}
#' @export
separate_rows_.data.frame <- function(data, cols, sep = "[^[:alnum:].]+",
                                      convert = FALSE) {
  cols <- compat_lazy_dots(cols, caller_env())
  separate_rows(data, !!! cols, sep = sep, convert = convert)
}
