#' Separate one column into multiple columns.
#'
#' Given either regular expression or a vector of character positions,
#' \code{separate()} turns a single character column into multiple columns.
#'
#' @param col Bare column name.
#' @inheritParams separate_
#' @seealso \code{\link{unite}()}, the complement.
#' @seealso \code{\link{separate_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' library(dplyr)
#' df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
#' df %>% separate(x, c("A", "B"))
#'
#' # If every row doesn't split into the same number of pieces, use
#' # the extra and file arguments to control what happens
#' df <- data.frame(x = c("a", "a b", "a b c", NA))
#' df %>% separate(x, c("a", "b"))
#' # The same behaviour but no warnings
#' df %>% separate(x, c("a", "b"), extra = "drop", fill = "right")
#' # Another option:
#' df %>% separate(x, c("a", "b"), extra = "merge", fill = "left")
#'
#' # If only want to split specified number of times use extra = "merge"
#' df <- data.frame(x = c("x: 123", "y: error: 7"))
#' df %>% separate(x, c("key", "value"), ": ", extra = "merge")
separate <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                     convert = FALSE, extra = "warn", fill = "warn", ...) {
  col <- col_name(substitute(col))
  separate_(data, col, into, sep = sep, remove = remove, convert = convert,
    extra = extra, fill = fill, ...)
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
#'   happens when there are too many pieces. There are three valid options:
#'
#'   \itemize{
#'    \item "warn" (the default): emit a warning and drop extra values.
#'    \item "drop": drop any extra values without a warning.
#'    \item "merge": only splits at most \code{length(into)} times
#'   }
#' @param fill If \code{sep} is a character vector, this controls what
#'   happens when there are not enough pieces. There are three valid options:
#'
#'   \itemize{
#'    \item "warn" (the default): emit a warning and fill from the right
#'    \item "right": fill with missing values on the right
#'    \item "left": fill with missing values on the left
#'   }
#' @param remove If \code{TRUE}, remove input column from output data frame.
#' @param convert If \code{TRUE}, will run \code{\link{type.convert}} with
#'   \code{as.is = TRUE} on new columns. This is useful if the component
#'   columns are integer, numeric or logical.
#' @param ... Defunct, will be removed in the next version of the package.
#' @keywords internal
#' @export
separate_ <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                      convert = FALSE, extra = "warn", fill = "warn", ...) {
  UseMethod("separate_")
}

#' @export
separate_.data.frame <- function(data, col, into, sep = "[^[:alnum:]]+",
                                 remove = TRUE, convert = FALSE,
                                 extra = "warn", fill = "warn", ...) {
  stopifnot(is.character(col), length(col) == 1)
  value <- as.character(data[[col]])

  if (length(list(...)) != 0) {
    warning("Using ... for passing arguments to strsplit is defunct.")
  }

  if (is.numeric(sep)) {
    l <- strsep(value, sep)
  } else if (is.character(sep)) {
    l <- str_split_fixed(value, sep, length(into), extra = extra, fill = fill)
  } else {
    stop("'sep' must be either numeric or character", .call = FALSE)
  }

  names(l) <- enc2utf8(into)
  if (convert) {
    l[] <- lapply(l, type.convert, as.is = TRUE)
  }

  # Insert into existing data frame
  data <- append_df(data, l, which(names(data) == col))
  if (remove)
    data[[col]] <- NULL

  data
}

#' @export
separate_.tbl_df <- function(data, col, into, sep = "[^[:alnum:]]+",
                             remove = TRUE, convert = FALSE,
                             extra = "warn", fill = "warn", ...) {
  as_data_frame(NextMethod())
}

#' @export
separate_.grouped_df <- function(data, col, into, sep = "[^[:alnum:]]+",
                                 remove = TRUE, convert = FALSE,
                                 extra = "warn", fill = "warn", ...) {
  regroup(NextMethod(), data, if (remove) col)
}



strsep <- function(x, sep) {
  sep <- c(0, sep, -1)

  nchar <- stringi::stri_length(x)
  pos <- lapply(sep, function(i) {
    if (i >= 0) return(i)
    nchar + i + 1
  })

  lapply(1:(length(pos) - 1), function(i) {
    stringi::stri_sub(x, pos[[i]] + 1, pos[[i + 1]])
  })
}

str_split_fixed <- function(value, sep, n, extra = "warn", fill = "warn") {
  if (extra == "error") {
    warning("extra = 'error' is deprecated. Please use extra = 'warn'",
      " instead", call. = FALSE)
    extra <- "warn"
  }

  extra <- match.arg(extra, c("warn", "merge", "drop"))
  fill <- match.arg(fill, c("warn", "left", "right"))

  n_max <- if (extra == "merge") n else -1L
  pieces <- stringi::stri_split_regex(value, sep, n_max)

  simp <- simplifyPieces(pieces, n, fill == "left")

  n_big <- length(simp$too_big)
  if (extra == "warn" && n_big > 0) {
    warning("Too many values at ", n_big, " locations: ",
      list_indices(simp$too_big), call. = FALSE)
  }
  n_sml <- length(simp$too_sml)
  if (fill == "warn" && n_sml > 0) {
    warning("Too few values at ", n_sml, " locations: ",
      list_indices(simp$too_sml), call. = FALSE)
  }

  simp$strings
}
