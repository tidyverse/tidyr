#' Unnest a collapsed column.
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
#'
#' @inheritParams unnest_string_
#' @export
#' @examples
#'
#' df <- data.frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   stringsAsFactors = FALSE
#' )
#' unnest_string(df, y)
unnest_string <- function(data, col, sep = "[^[:alnum:]]+") {
  col <- col_name(substitute(col))
  unnest_string_(data, col, sep)
}

#' Standard-evaluation version of \code{unnest_string}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param col Name of column that needs to be unnested.
#' @param sep Separator delimiting collapsed values.
#' @export
unnest_string_ <- function(data, col, sep = "[^[:alnum:]]+") UseMethod("unnest_string_")

#' @export
unnest_string_.data.frame <- function(data, col, sep = "[^[:alnum:]]+") {
  data[[col]] <- stringi::stri_split_regex(data[[col]], sep)
  unnest_(data, col)
}

#' @export
unnest_string_.tbl_df <- function(data, col, sep = "[^[:alnum:]]+") {
  dplyr::tbl_df(NextMethod())
}
