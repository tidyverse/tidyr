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
#'
#' # You can also unnest lists
#' my_list <- lapply(split(subset(iris, select = -Species), iris$Species), "[", 1:2, )
#' unnest(my_list)
#' unnest(my_list, Species)
unnest <- function(data, col = NULL) {
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
  dplyr::tbl_df(NextMethod())
}

#' @export
unnest_.list <- function(data, col = NULL, ...) {

  is_data_frame <- unique(vapply(data, is.data.frame, logical(1)))
  if (length(is_data_frame) != 1) {
    stop("Either all inputs should be data frames or none should be",
      call. = FALSE)
  }
  if (!is_data_frame) {
    data <- lapply(data, function(x) {
      df <- list(x)
      attr(df, "row.names") <- .set_row_names(length(x))
      names(df) <- "x"
      class(df) <- "data.frame"
      df
    })
  }

  all <- dplyr::rbind_all(data)
  if (is.null(col)) return(all)

  rows <- vapply(data, .row_names_info, type = 2L, FUN.VALUE = numeric(1))

  labels <- names(data) %||% paste0("X", seq_along(data))

  labels_df <- list(rep(labels, rows))
  attr(labels_df, "row.names") <- .set_row_names(sum(rows))
  names(labels_df) <- col
  class(labels_df) <- "data.frame"

  cbind(labels_df, all)
}
