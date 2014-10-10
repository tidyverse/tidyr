#' Separate one column into multiple columns.
#'
#' Given either regular expression or a vector of character positions,
#' \code{separate()} turns a single character column into multiple columns.
#'
#' @param col Bare column name.
#' @export
#' @inheritParams separate_
#' @examples
#' library(dplyr)
#' df <- data.frame(x = c("a.b", "a.d", "b.c"))
#' df %>% separate(x, c("A", "B"))
#'
#' # If every row doesn't split into the same number of pieces, use
#' # the extra argument to control what happens
#' df <- data.frame(x = c("a", "a b", "a b c", NA))
#' df %>% separate(x, c("a", "b"), extra = "merge")
#' df %>% separate(x, c("a", "b"), extra = "drop")
#'
#' # If only want to split specified number of times use extra = "merge"
#' df <- data.frame(x = c("x: 123", "y: error: 7"))
#' df %>% separate(x, c("key", "value"), ": ", extra = "merge")
separate <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                     convert = FALSE, extra = "error", ...) {
  col <- col_name(substitute(col))
  separate_(data, col, into, sep = sep, remove = remove, convert = convert,
    extra = extra, ...)
}

#' Standard-evaluation version of \code{separate}.
#'
#' This is a S3 generic.
#'
#' @param data A data frame.
#' @param col Name of column to split, as string.
#' @param into Names of new variables to create as character vector.
#' @param sep Separator between columns.
#'
#'   If character, is interpreted as a regular expression. The default
#'   value is a regular expression that matches any sequence of
#'   non-alphanumeric values.
#'
#'   If numeric, interpreted as positions to split at. Positive values start
#'   at 1 at the far-left of the string; negative value start at -1 at the
#'   far-right of the string. The length of \code{sep} should be one less than
#'   \code{into}.
#'
#' @param extra If \code{sep} is a character vector, this controls what
#'   happens when the number of pieces doesn't match \code{into}. There are
#'   three valid options:
#'
#'   \itemize{
#'    \item "error" (the default): throws error if pieces aren't right length
#'    \item "drop": always returns \code{length(into)} pieces by dropping or
#'      expanding as necessary
#'    \item "merge": only splits at most \code{length(into)} times
#'   }
#' @param remove If \code{TRUE}, remove input column from output data frame.
#' @param convert If \code{TRUE}, will run \code{\link{type.convert}} with
#'   \code{as.is = TRUE} on new columns. This is useful if the component
#'   columns are integer, numeric or logical.
#' @param ... Other arguments passed on to \code{\link{strsplit}} to control
#'   how the regular expression is processed.
#' @keywords internal
#' @export
separate_ <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                      convert = FALSE, extra = "error", ...) {
  UseMethod("separate_")
}

#' @export
separate_.data.frame <- function(data, col, into, sep = "[^[:alnum:]]+",
                                 remove = TRUE, convert = FALSE, extra = "error",
                                 ...) {

  stopifnot(is.character(col), length(col) == 1)

  value <- as.character(data[[col]])

  if (is.numeric(sep)) {
    l <- strsep(value, sep)
  } else if (is.character(sep)) {
    l <- str_split_fixed(value, sep, length(into), extra = extra)
  } else {
    stop("'sep' must be either numeric or character", .call = FALSE)
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
separate_.tbl_df <- function(data, col, into, sep = "[^[:alnum:]]+",
                             remove = TRUE, convert = FALSE, ...) {
  dplyr::tbl_df(NextMethod())
}


strsep <- function(x, sep) {
  sep <- c(0, sep, -1)

  nchar <- nchar(x)
  pos <- lapply(sep, function(i) {
    if (i >= 0) return(i)
    nchar + i + 1
  })

  lapply(1:(length(pos) - 1), function(i) {
    substr(x, pos[[i]] + 1, pos[[i + 1]])
  })
}

str_split_fixed <- function(value, sep, n, extra = "error") {
  extra <- match.arg(extra, c("error", "merge", "drop"))

  n_max <- if (extra == "merge") n else -1L
  pieces <- stringi::stri_split_regex(value, sep, n_max)

  ns <- vapply(pieces, length, integer(1))

  if (any(ns != n)) {
    if (extra == "error") {
      stop("Values not split into ", n, " pieces at ",
        paste0(which(ns != n), collapse = ', '), call. = FALSE)
    } else {
      pieces <- lapply(pieces, function(x) x[seq_len(n)])
    }
  }

  # Convert into a list of columns
  mat <- matrix(unlist(pieces), ncol = n, byrow = TRUE)
  lapply(1:ncol(mat), function(i) mat[, i])
}
