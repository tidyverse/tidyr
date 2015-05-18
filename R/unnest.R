#' Unnest a list column.
#'
#' If you have a list-column, this makes each element of the list it's own
#' row.
#'
#' @inheritParams unnest_
#' @param ... Specification of columns to nest. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#'
#'   If ommitted, defaults to all list-cols.
#' @seealso \code{\link{nest}} for the inverse operation.
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
#' # You can also unnest multiple columns simultaneously
#' df <- data_frame(
#'  a = list(c("a", "b"), "c"),
#'  b = list(1:2, 3),
#'  c = c(11, 22)
#' )
#' df %>% unnest(a, b)
#' # If you omit the column names, it'll unnest all list-cols
#' df %>% unnest()
#'
#' # Nest and unnest are inverses
#' df <- data.frame(x = c(1, 1, 2), y = 3:1)
#' df %>% nest(y)
#' df %>% nest(y) %>% unnest(y)
unnest <- function(data, ...) {
  unnest_cols <- unname(dplyr::select_vars(names(data), ...))
  if (length(unnest_cols) == 0) {
    unnest_cols <- names(data)[vapply(data, is.list, logical(1))]
  }

  unnest_(data, unnest_cols)
}

#' Standard-evaluation version of \code{unnest}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param unnest_cols Name of columns that needs to be unnested.
#' @export
unnest_ <- function(data, unnest_cols) UseMethod("unnest_")

#' @export
unnest_.data.frame <- function(data, unnest_cols) {
  nested <- data[unnest_cols]
  n <- lapply(nested, function(x) vapply(x, length, numeric(1)))
  if (length(unique(n)) != 1) {
    stop("All nested columns must have the same number of elements.",
      call. = FALSE)
  }

  unnested <- lapply(nested, unlist, use.names = FALSE, recursive = FALSE)
  names(unnested) <- unnest_cols

  group_cols <- setdiff(names(data), unnest_cols)
  rest <- data[rep(1:nrow(data), n[[1]]), group_cols, drop = FALSE]
  rownames(rest) <- NULL

  idx <- match(names(data), c(group_cols, unnest_cols))
  append_df(rest, unnested)[idx]
}

#' @export
unnest_.tbl_df <- function(data, unnest_cols) {
  dplyr::tbl_df(NextMethod())
}
