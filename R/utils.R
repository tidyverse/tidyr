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

regroup <- function(output, input, except = NULL) {
  groups <- dplyr::group_vars(input)
  if (!is.null(except)) {
    groups <- setdiff(groups, except)
  }

  dplyr::grouped_df(output, groups)
}
reconstruct_tibble <- function(input, output, ungrouped_vars = chr()) {
  if (inherits(input, "grouped_df")) {
    regroup(output, input, ungrouped_vars)
  } else if (inherits(input, "tbl_df")) {
    as_tibble(output)
  } else {
    output
  }
}


imap <- function(.x, .f, ...) {
  map2(.x, names(.x) %||% character(0), .f, ...)
}

seq_nrow <- function(x) seq_len(nrow(x))
seq_ncol <- function(x) seq_len(ncol(x))
