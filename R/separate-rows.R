#' Separate a collapsed column into multiple rows.
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
#'
#' @inheritParams separate_rows_
#' @param ... Specification of columns to unnest. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @export
#' @examples
#'
#' df <- data.frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   stringsAsFactors = FALSE
#' )
#' separate_rows(df, y)
separate_rows <- function(data, ..., sep = "[^[:alnum:].]+") {
  cols <- unname(dplyr::select_vars(names(data), ...))
  separate_rows_(data, cols, sep)
}

#' Standard-evaluation version of \code{separate_rows}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param cols Name of columns that need to be unnested.
#' @param sep Separator delimiting collapsed values.
#' @export
separate_rows_ <- function(data, cols, sep = "[^[:alnum:].]+") UseMethod("separate_rows_")

#' @export
separate_rows_.data.frame <- function(data, cols, sep = "[^[:alnum:].]+") {
  data[cols] <- lapply(data[cols], stringi::stri_split_regex, sep)
  unnest_(data, cols)
}

#' @export
separate_rows_.tbl_df <- function(data, cols, sep = "[^[:alnum:].]+") {
  dplyr::tbl_df(NextMethod())
}
