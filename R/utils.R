
col_name <- function(x, default = abort("Please supply column name")) {
  if (identical(x, quote(expr = ))) return(default)
  switch_type(x,
    NULL = NULL,
    string = x,
    symbol = as_string(x),
    abort("Invalid column specification")
  )
}

append_df <- function(x, values, after = length(x)) {
  y <- append(x, values, after = after)
  class(y) <- class(x)
  attr(y, "row.names") <- attr(x, "row.names")

  y
}

append_col <- function(x, col, name, after = length(x)) {
  name <- enc2utf8(name)
  append_df(x, set_names(list(col), name), after = after)
}

compact <- function(x) x[map_int(x, length) > 0]

#' Extract numeric component of variable.
#'
#' DEPRECATED: please use \code{readr::parse_number()} instead.
#'
#' @param x A character vector (or a factor).
#' @keywords internal
#' @export
extract_numeric <- function(x) {
  message("extract_numeric() is deprecated: please use readr::parse_number() instead")
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
    groups <- setdiff(groups, map(except, as.name))
  }

  dplyr::grouped_df(x, groups)
}

# Allows tests to work with either dplyr 0.4 (which ignores value of
# everything), and 0.5 which exports it as a proper function
everything <- function(...) dplyr::everything(...)

is_numeric <- function(x) {
  typeof(x) %in% c("integer", "double")
}

imap <- function(.x, .f, ...) {
  map2(.x, names(.x) %||% character(0), .f, ...)
}

is_empty_character <- function(x) {
  is_character(x, 0)
}
