col_name <- function(x, default = stop("Please supply column name", call. = FALSE)) {
  if (is.character(x)) return(x)
  if (identical(x, quote(expr = ))) return(default)
  if (is.name(x)) return(as.character(x))
  if (is.null(x)) return(x)

  stop("Invalid column specification", call. = FALSE)
}

append_df <- function(x, values, after = length(x)) {
  y <- append(x, values, after = after)
  class(y) <- class(x)
  attr(y, "row.names") <- attr(x, "row.names")

  y
}

append_col <- function(x, col, name, after = length(x)) {
  append_df(x, setNames(list(col), name), after = after)
}

compact <- function(x) x[vapply(x, length, integer(1)) > 0]

#' Extract numeric component of variable.
#'
#' This uses a regular expression to strip all non-numeric character from
#' a string and then coerces the result to a number. This is useful for
#' strings that are numbers with extra formatting (e.g. $1,200.34).
#'
#' @param x A character vector (or a factor).
#' @export
#' @examples
#' extract_numeric("$1,200.34")
#' extract_numeric("-2%")
#'
#' # The heuristic is not perfect - it won't fail for things that
#' # clearly aren't numbers
#' extract_numeric("-2-2")
#' extract_numeric("12abc34")
extract_numeric <- function(x) {
  as.numeric(gsub("[^0-9.-]+", "", as.character(x)))
}

#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

list_indices <- function(x, max = 20) {
  if (length(x) > max)
    x <- c(x[seq_len(max)], "...")

  paste(x, collapse = ", ")
}

`%||%` <- function(x, y) if (length(x) == 0) y else x

regroup <- function(x, y, except) {
  group_vars <- vapply(dplyr::groups(x), as.character, character(1))
  group_vars <- setdiff(group_vars, except)
  group_vars <- lapply(group_vars, as.name)

  dplyr::grouped_df(y, group_vars)
}
