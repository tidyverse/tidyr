#' Extract one column into multiple columns.
#'
#' @param col Bare column name.
#' @export
#' @inheritParams extract_
#' @examples
#' library(dplyr)
#' df <- data.frame(x = c("a.b", "a.d", "b.c"))
#' df %>% extract(x, "A")
#' df %>% extract(x, c("A", "B"), "([[:alnum:]]+)\\.([[:alnum:]]+)")
extract <- function(data, col, into, regex = "([[:alnum:]]+)", remove = TRUE,
                     convert = FALSE, ...) {
  col <- col_name(substitute(col))
  extract_(data, col, into, regex = regex, remove = remove, convert = convert, ...)
}

#' Standard-evaluation version of \code{extract}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param col Name of column to split, as string.
#' @param into Names of new variables to create as character vector.
#' @param regex a regular expression used to extract the desired values.
#' @param remove If \code{TRUE}, remove input column from output data frame.
#' @param convert If \code{TRUE}, will run \code{\link{type.convert}} with
#'   \code{as.is = TRUE} on new columns. This is useful if the component
#'   columns are integer, numeric or logical.
#' @param ... Other arguments passed on to \code{\link{regexpr}} to control
#'   how the regular expression is processed.  The perl option is always set to
#'   TRUE
#' @keywords internal
#' @export
extract_ <- function(data, col, into, regex = "([[:alnum:]]+)", remove = TRUE,
                      convert = FALSE, ...) {
  UseMethod("extract_")
}

#' @export
extract_.data.frame <- function(data, col, into, regex = "([[:alnum:]]+)",
                                 remove = TRUE, convert = FALSE, ...) {

  stopifnot(is.character(col), length(col) == 1)

  value <- as.character(data[[col]])

  if (is.character(regex)) {
    matches <- regexpr(regex, value, perl = TRUE, ...)

    starts <- attr(matches, "capture.start")
    lengths <- attr(matches, "capture.length")

    n <- length(into)

    if (length(starts) / n != length(value)) {
      stop("'into' must be the same length as the regex capture groups",
           call. = FALSE)
    }

    if (any(starts == -1)) {
      stop("Values not extracted at ",
           paste0(which(starts == -1), collapse = ", "),
        call. = FALSE)
    }

    pieces <- substring(value, starts, starts + lengths - 1)
    # Convert into a data frame
    mat <- matrix(pieces, ncol = n, byrow = TRUE)
    str(mat)
    l <- lapply(1:ncol(mat), function(i) mat[, i])

  }

  names(l) <- into
  if (convert) {
    l[] <- lapply(l, type.convert, as.is = FALSE)
  }

  # Insert into existing data frame
  data <- append_df(data, l, which(names(data) == col))
  if (remove) {
    data[[col]] <- NULL
  }
  data
}

#' @export
extract_.tbl_df <- function(data, col, into, regex = "([[:alnum:]]+)",
                             remove = TRUE, convert = FALSE, ...) {
  dplyr::tbl_df(NextMethod())
}
