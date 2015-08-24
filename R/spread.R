#' Spread a key-value pair across multiple columns.
#'
#' @param key,value Bare (unquoted) names of key and value columns.
#' @inheritParams spread_
#' @export
#' @examples
#' library(dplyr)
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
#' # Spread and gather are complements
#' df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
#' df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)
spread <- function(data, key, value, fill = NA, convert = FALSE, drop = TRUE) {
  key_col <- col_name(substitute(key))
  value_col <- col_name(substitute(value))

  spread_(data, key_col, value_col, fill = fill, convert = convert, drop = drop)
}

#' Standard-evaluation version of \code{spread}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param key_col,value_col Strings giving names of key and value cols.
#' @param fill If set, missing values will be replaced with this value.
#'   Note that there are two types of missingness in the input: explicit
#'   missing values (i.e. \code{NA}), and implicit missings, rows that
#'   simply aren't present. Both types of missing value will be replaced by
#'   \code{fill}.
#' @param convert If \code{TRUE}, \code{\link{type.convert}} with
#'   \code{asis = TRUE} will be run on each of the new columns. This is
#'   useful if the value column was a mix of variables that was coerced to
#'   a string.
#' @param drop If \code{FALSE}, will keep factor levels that don't appear
#'   in the data, filling in missing combinations with \code{fill}.
#' @export
spread_ <- function(data, key_col, value_col, fill = NA, convert = FALSE,
                    drop = TRUE) {
  if (!(key_col %in% names(data))) {
    stop("Key column '", key_col, "' does not exist in input.", call. = FALSE)
  }
  if (!(value_col %in% names(data))) {
    stop("Value column '", value_col, "' does not exist in input.", call. = FALSE)
  }

  UseMethod("spread_")
}

#' @export
spread_.data.frame <- function(data, key_col, value_col, fill = NA,
                               convert = FALSE, drop = TRUE) {

  col <- data[key_col]
  col_id <- dplyr::id(col, drop = drop)
  col_labels <- split_labels(col, col_id, drop = drop)

  rows <- data[setdiff(names(data), c(key_col, value_col))]
  row_id <- dplyr::id(rows, drop = drop)
  row_labels <- split_labels(rows, row_id, drop = drop)
  rownames(row_labels) <- NULL

  overall <- dplyr::id(list(col_id, row_id), drop = FALSE)
  n <- attr(overall, "n")
  # Check that each output value occurs in unique location
  if (anyDuplicated(overall)) {
    groups <- split(seq_along(overall), overall)
    groups <- groups[vapply(groups, length, integer(1)) > 1]

    str <- vapply(groups, function(x) paste0("(", paste0(x, collapse = ", "), ")"),
      character(1))

    stop("Duplicate identifiers for rows ", paste(str, collapse = ", "),
      call. = FALSE)
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
  if (convert) {
    ordered <- type.convert(ordered, as.is = TRUE)
  }

  dim(ordered) <- c(attr(row_id, "n"), attr(col_id, "n"))
  colnames(ordered) <- as.character(col_labels[[1]])

  append_df(row_labels, matrixToDataFrame(ordered))
}

#' @export
spread_.tbl_df <- function(data, key_col, value_col, fill = NA,
                           convert = FALSE, drop = TRUE) {
  dplyr::tbl_df(NextMethod())
}

split_labels <- function(df, id, drop = TRUE) {
  if (length(df) == 0) {
    return(df)
  }

  if (drop) {
    representative <- match(sort(unique(id)), id)
    df[representative, , drop = FALSE]
  } else {
    unique_values <- lapply(df, ulevels)
    rev(expand.grid(rev(unique_values), stringsAsFactors = FALSE))
  }
}

ulevels <- function(x) {
  if (is.factor(x)) {
    x <- addNA(x, ifany = TRUE)
    levs <- levels(x)
    factor(levs, levels = levs)
  } else {
    sort(unique(x))
  }
}
