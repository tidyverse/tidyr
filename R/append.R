#' Append new columns (`y`) to an existing data frame (`x`)
#'
#' @details
#' If columns are duplicated between `x` and `y`, then `y` columns are
#' silently preferred.
#'
#' @param x A data frame.
#' @param y A named list of columns to append. Each column must be the same size
#'   as `x`.
#' @param after One of:
#'   - `NULL` to place `y` at the end.
#'   - A single column name from `x` to place `y` after.
#'   - A single integer position (including `0L`) to place `y` after.
#' @param remove Whether or not to remove the column corresponding to `after`
#'   from `x`.
#'
#' @returns
#' A bare data frame containing the columns from `x` and any appended columns
#' from `y`. The type of `x` is not maintained. It is up to the caller to
#' restore the type of `x` with `reconstruct_tibble()`.
#'
#' @noRd
df_append <- function(x, y, after = NULL, remove = FALSE) {
  size <- vec_size(x)
  row_names <- .row_names_info(x, type = 0L)

  x <- tidyr_new_list(x)
  y <- tidyr_new_list(y)

  x_names <- names(x)
  y_names <- names(y)

  n <- length(x)

  if (is.null(after)) {
    after <- n
  } else if (is.character(after)) {
    after <- match(after, x_names)
  }

  check_number_whole(after, min = 0L, max = n, .internal = TRUE)

  if (remove) {
    lhs <- seq2(1L, after - 1L)
  } else {
    lhs <- seq2(1L, after)
  }

  rhs <- seq2(after + 1L, n)

  # Prefer `y` if names are duplicated
  lhs <- setdiff(x_names[lhs], y_names)
  rhs <- setdiff(x_names[rhs], y_names)

  out <- vec_c(x[lhs], y, x[rhs])
  out <- new_data_frame(out, n = size, row.names = row_names)

  out
}
