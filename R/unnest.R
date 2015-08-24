#' Unnest a list column.
#'
#' If you have a list-column, this makes each element of the list it's own
#' row. List-columns can either be atomic vectors or data frames. Each
#' row must have the same number of entries.
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
#' df <- data_frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h")
#' )
#' df %>%
#'   transform(y = strsplit(y, ",")) %>%
#'   unnest(y)
#'
#' # It also works if you have a column that contains other data frames!
#' df <- data_frame(
#'   x = 1:2,
#'   y = list(
#'    data_frame(z = 1),
#'    data_frame(z = 3:4)
#'  )
#' )
#' df %>% unnest(y)
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
  n <- lapply(nested, function(x) vapply(x, NROW, numeric(1)))
  if (length(unique(n)) != 1) {
    stop("All nested columns must have the same number of elements.",
      call. = FALSE)
  }

  types <- vapply(nested, list_col_type, character(1))
  nested <- split.default(nested, types)
  if (length(nested$mixed) > 0) {
    probs <- paste(names(nested$mixed), collapse = ",")
    stop("Each column must either be a list of vectors or a list of ",
      "data frames [", probs , "]", call. = FALSE)
  }

  unnested_atomic <- lapply(nested$atomic, dplyr::combine)
  if (length(unnested_atomic) > 0)
    unnested_atomic <- dplyr::as_data_frame(unnested_atomic)

  unnested_dataframe <- lapply(nested$dataframe, dplyr::bind_rows)
  if (length(unnested_dataframe) > 0)
    unnested_dataframe <- dplyr::bind_cols(unnested_dataframe)

  group_cols <- setdiff(names(data), unnest_cols)
  rest <- data[rep(1:nrow(data), n[[1]]), group_cols, drop = FALSE]

  # Simplify after https://github.com/hadley/dplyr/issues/1148
  dplyr::bind_cols(compact(list(rest, unnested_atomic, unnested_dataframe)))
}

list_col_type <- function(x) {
  is_data_frame <- vapply(x, is.data.frame, logical(1))
  is_atomic <- vapply(x, is.atomic, logical(1))

  if (all(is_data_frame)) {
    "dataframe"
  } else if (all(is_atomic)) {
    "atomic"
  } else {
    "mixed"
  }
}

#' @export
unnest_.tbl_df <- function(data, unnest_cols) {
  dplyr::tbl_df(NextMethod())
}
