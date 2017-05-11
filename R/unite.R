#' Unite multiple columns into one.
#'
#' Convenience function to paste together multiple columns into one.
#'
#' @param data A data frame.
#' @param col Bare name of column to add.
#'
#'   This variable is passed by expression, supports quasiquotation
#'   (you can unquote strings and symbols), and the name is captured
#'   with [rlang::quo_name()] (note that this kind of interface where
#'   symbols do not represent real objects is now discouraged in the
#'   tidyverse).
#' @param ... Specification of columns to unite. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @param from Names of existing columns as character vector
#' @param sep Separator to use between values.
#' @param remove If \code{TRUE}, remove input columns from output data frame.
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
  UseMethod("unite")
}
#' @export
unite.default <- function(data, col, ..., sep = "_", remove = TRUE) {
  col <- compat_as_lazy(enquo(col))
  from <- compat_as_lazy_dots(...)
  unite_(data, col, from, sep = sep, remove = remove)
}
#' @export
unite.data.frame <- function(data, col, ..., sep = "_", remove = TRUE) {
  var <- quo_name(enquo(col))
  from_vars <- dplyr::select_vars(colnames(data), ...)

  out <- data
  if (remove) {
    out <- out[setdiff(names(out), from_vars)]
  }

  first_pos <- which(names(data) %in% from_vars)[1]
  united <- invoke(paste, c(data[from_vars], list(sep = sep)))

  out <- append_col(out, united, var, after = first_pos - 1)
  reconstruct_tibble(data, out, if (remove) from_vars)
}


#' Standard-evaluation version of \code{unite}
#'
#' This is a S3 generic.
#'
#' @inheritParams unite
#' @keywords internal
#' @export
unite_ <- function(data, col, from, sep = "_", remove = TRUE) {
  UseMethod("unite_")
}
#' @export
unite_.data.frame <- function(data, col, from, sep = "_", remove = TRUE) {
  col <- compat_lazy(col, caller_env())
  from <- compat_lazy_dots(from, caller_env())
  unite(data, !! col, !!! from, sep = sep, remove = remove)
}
