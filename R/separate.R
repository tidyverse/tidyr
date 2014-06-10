#' Separate one column into multiple columns.
#'
#' @param col Bare column name.
#' @export
#' @inheritParams separate
#' @examples
#' df <- data.frame(x = c("a.b", "a.d", "b.c"))
#' separate(df, x, c("A", "B"))
separate <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                     convert = FALSE, ...) {
  col <- col_name(substitute(col))
  separate_(data, col, into, sep = sep, remove = remove, convert = convert, ...)
}

#' Standard-evaluation version of \code{separate}.
#'
#' @param data A data frame.
#' @param col Name of column to split, as string.
#' @param sep Separator between columns. Defaults to any sequence
#'   of non-alphanumeric values.
#' @param remove If \code{TRUE}, remove input column from data frame.
#' @param convert If \code{TRUE}, will run \code{\link{type.convert}} with
#'   \code{as.is = TRUE} on new columns. This is useful if the component
#'   columns are integer, numeric or logical.
#' @param ... Other arguments passed on to \code{\link{strsplit}} to control
#'   how the regular expression is processed.
#' @keywords internal
#' @export
separate_ <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                      convert = FALSE, ...) {

  stopifnot(is.data.frame(data))
  stopifnot(is.character(col), length(col) == 1)

  value <- as.character(data[[col]])
  pieces <- strsplit(value, sep, ...)

  ns <- vapply(pieces, length, integer(1))
  n <- length(into)
  if (any(ns != n)) {
    stop("Values not split into ", n, " pieces at ", which(ns != n),
      call. = FALSE)
  }

  # Convert into a data frame
  mat <- matrix(unlist(pieces), ncol = n, byrow = TRUE)
  l <- lapply(1:ncol(mat), function(i) mat[, i])
  names(l) <- into
  if (convert) {
    l[] <- lapply(l, type.convert, as.is = FALSE)
  }

  # Insert into existing data frame
  data <- append(data, l, which(names(data) == col))

  if (remove) {
    data[[col]] <- NULL
  }
  class(data) <- "data.frame"
  attr(data, "row.names") <- .set_row_names(length(data[[1]]))
  data
}
