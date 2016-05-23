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
  cols <- unname(dplyr::select_vars(names(data), ...))
  separate_rows_(data, cols, sep)
}

#' Standard-evaluation version of \code{separate_rows}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param cols Name of columns that need to be separated.
#' @param sep Separator delimiting collapsed values.
#' @inheritParams separate_
#' @export
separate_rows_ <- function(data, cols, sep = "[^[:alnum:].]+",
                           convert = FALSE) {
  UseMethod("separate_rows_")
}

#' @export
separate_rows_.data.frame <- function(data, cols, sep = "[^[:alnum:].]+",
                                      convert = FALSE) {

  data[cols] <- lapply(data[cols], stringi::stri_split_regex, sep)
  data <- unnest_(data, cols)

  if (convert) {
    data[cols] <- lapply(data[cols], type.convert, as.is = TRUE)
  }

  data
}

#' @export
separate_rows_.tbl_df <- function(data, cols, sep = "[^[:alnum:].]+",
                                  convert = FALSE) {
  as_data_frame(NextMethod())
}
