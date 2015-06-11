#' Unnest a collapsed column.
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
#'
#' @inheritParams unnest_string_
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
#' unnest_string(df, y)
unnest_string <- function(data, ..., sep = "[^[:alnum:].]+") {
  unnest_cols <- unname(dplyr::select_vars(names(data), ...))
  unnest_string_(data, unnest_cols, sep)
}

#' Standard-evaluation version of \code{unnest_string}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param unnest_cols Name of columns that need to be unnested.
#' @param sep Separator delimiting collapsed values.
#' @export
unnest_string_ <- function(data, unnest_cols, sep = "[^[:alnum:].]+") UseMethod("unnest_string_")

#' @export
unnest_string_.data.frame <- function(data, unnest_cols, sep = "[^[:alnum:].]+") {
  data[unnest_cols] <- lapply(data[unnest_cols], stringi::stri_split_regex, sep)
  unnest_(data, unnest_cols)
}

#' @export
unnest_string_.tbl_df <- function(data, unnest_cols, sep = "[^[:alnum:].]+") {
  dplyr::tbl_df(NextMethod())
}
