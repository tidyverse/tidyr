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
  name <- enc2utf8(name)
  append_df(x, setNames(list(col), name), after = after)
}

compact <- function(x) x[vapply(x, length, integer(1)) > 0]

#' Extract numeric component of variable.
#'
#' DEPRECATED: please use \code{readr::parse_numeric()} instead.
#'
#' @param x A character vector (or a factor).
#' @export
extract_numeric <- function(x) {
  message("extract_numeric() is deprecated: please use readr::parse_numeric() instead")
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

regroup <- function(x, y, except = NULL) {
  groups <- dplyr::groups(y)
  if (!is.null(except)) {
    groups <- setdiff(groups, lapply(except, as.name))
  }

  dplyr::grouped_df(x, groups)
}

# Allows tests to work with either dplyr 0.4 (which ignores value of
# everything), and 0.5 which exports it as a proper function
everything <- function(...) dplyr::everything(...)

is_numeric <- function(x) {
  typeof(x) %in% c("integer", "double")
}
