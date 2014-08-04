#' Unnest a list column.
#'
#' If you have a list-column, this makes each element of the list it's own
#' row.
#'
#' @inheritParams unnest_
#' @export
#' @examples
#' library(dplyr)
#' df <- data.frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   stringsAsFactors = FALSE
#' )
#' df %>%
#'   transform(y = strsplit(y, ",")) %>%
#'   unnest(y)
unnest <- function(data, col) {
  col <- col_name(substitute(col))
  unnest_(data, col)
}

#' Standard-evaluation version of \code{unnest}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param col Name of column that needs to be unnested.
#' @export
unnest_ <- function(data, col) UseMethod("unnest_")

#' @export
unnest_.data.frame <- function(data, col) {
  nested <- data[[col]]
  unnested <- list(unlist(nested))
  names(unnested) <- col

  n <- vapply(nested, length, numeric(1))
  rest <- data[rep(1:nrow(data), n), setdiff(names(data), col), drop = FALSE]
  rownames(rest) <- NULL

  append_df(rest, unnested, which(names(data) == col) - 1)
}

#' @export
unnest_.tbl_df <- function(data, col) {
  browser()
  dplyr::tbl_df(NextMethod())
}
