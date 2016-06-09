#' Unite multiple columns into one.
#'
#' Convenience function to paste together multiple columns into one.
#'
#' @inheritParams unite_
#' @param col (Bare) name of column to add
#' @param ... Specification of columns to unite. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @seealso \code{\link{separate}()}, the complement.
#' @seealso \code{\link{unite_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' library(dplyr)
#' unite_(mtcars, "vs_am", c("vs","am"))
#'
#' # Separate is the complement of unite
#' mtcars %>%
#'   unite(vs_am, vs, am) %>%
#'   separate(vs_am, c("vs", "am"))
unite <- function(data, col, ..., sep = "_", remove = TRUE) {
  col <- col_name(substitute(col))
  from <- dplyr::select_vars(colnames(data), ...)

  unite_(data, col, from, sep = sep, remove = remove)
}

#' Standard-evaluation version of \code{unite}
#'
#' This is a S3 generic.
#'
#' @keywords internal
#' @param data A data frame.
#' @param col Name of new column as string.
#' @param from Names of existing columns as character vector
#' @param sep Separator to use between values.
#' @param remove If \code{TRUE}, remove input columns from output data frame.
#' @export
unite_ <- function(data, col, from, sep = "_", remove = TRUE) {
  UseMethod("unite_")
}

#' @export
unite_.data.frame <- function(data, col, from, sep = "_", remove = TRUE) {
  united <- do.call("paste", c(data[from], list(sep = sep)))

  first_col <- which(names(data) %in% from)[1]

  data2 <- data
  if (remove) {
    data2 <- data2[setdiff(names(data2), from)]
  }

  append_col(data2, united, col, after = first_col - 1)
}

#' @export
unite_.tbl_df <- function(data, col, from, sep = "_", remove = TRUE) {
  as_data_frame(NextMethod())
}

#' @export
unite_.grouped_df <- function(data, col, from, sep = "_", remove = TRUE) {
  regroup(NextMethod(), data, if (remove) from)
}

