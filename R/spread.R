#' Spread a key-value pair across multiple columns.
#'
#' @param key,value Bare (unquoted) names of key and value columns.
#' @inheritParams spread_
#' @export
#' @examples
#' stocks <- data.frame(
#'   time = as.Date('2009-01-01') + 0:9,
#'   X = rnorm(10, 0, 1),
#'   Y = rnorm(10, 0, 2),
#'   Z = rnorm(10, 0, 4)
#' )
#' stocksm <- stocks %>% gather(stock, price, -time)
#' stocksm %>% spread(stock, price)
#' stocksm %>% spread(time, price)
#'
#' df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
#' df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)
spread <- function(data, key, value, fill = NA, convert = FALSE) {
  key_col <- col_name(substitute(key))
  value_col <- col_name(substitute(value))

  spread_(data, key_col, value_col, fill = fill, convert = convert)
}

#' Standard-evaluation version of \code{spread}.
#'
#' @param data A data frame.
#' @param key_col,value Strings giving names of key and value cols.
#' @param fill If there isn't a value for every combination of the other
#'   variables and the key column, this value will be substituted.
#' @param convert If \code{TRUE}, \code{\link{type.convert}} with
#'   \code{asis = TRUE} will be run on each of the new columns. This is
#'   useful if the value column was a mix of variables that was coerced to
#'   a string.
#' @export
spread_ <- function(data, key_col, value_col, fill = NA, convert = FALSE) {
  stopifnot(is.data.frame(data))

  col <- data[key_col]
  col_id <- dplyr::id(col)
  col_labels <- ulevels(col[[1]])

  rows <- data[setdiff(names(data), c(key_col, value_col))]
  row_id <- dplyr::id(rows)
  row_labels <- rows[match(seq_len(attr(row_id, "n")), row_id), , drop = FALSE]

  overall <- dplyr::id(list(row_id, col_id), drop = FALSE)
  n <- attr(overall, "n")

  if (any(duplicated(overall))) {
    stop("Duplicates!")
  }

  # Add in missing values, if necessary
  if (length(overall) < n) {
    overall <- match(seq_len(n), overall, nomatch = NA)
  } else {
    overall <- order(overall)
  }

  value <- data[[value_col]]
  ordered <- value[overall]
  if (!is.na(fill)) {
    ordered[is.na(ordered)] <- fill
  }

  dim(ordered) <- c(attr(row_id, "n"), attr(col_id, "n"))
  colnames(ordered) <- col_labels
  ordered <- as.data.frame(ordered)

  if (convert) {
    ordered[] <- lapply(ordered, type.convert, asis = TRUE)
  }

  out <- c(row_labels, ordered)
  class(out) <- "data.frame"
  attr(out, "row.names") <- .set_row_names(nrow(row_labels))
  out
}

ulevels <- function(x) {
  if (is.factor(x)) {
    x <- addNA(x, ifany = TRUE)
    levels(x)
  } else {
    as.character(sort(unique(x)))
  }
}
