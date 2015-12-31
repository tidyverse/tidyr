#' Create the full sequence of values in a vector.
#'
#' This is useful if you want to fill in missing values that should have
#' been observed but weren't. For example, \code{full_seq(c(1, 2, 4, 6), 1)}
#' will return \code{1:6}.
#'
#' @param x A numeric vector.
#' @param period Gap between each observation. The existing data will be
#'   checked to ensure that it is actually of this periodicity.
#' @param tol Numerical tolerance for checking periodicity.
#' @export
#' @examples
#' full_seq(c(1, 2, 4, 5, 10), 1)
full_seq <- function(x, period, tol = 1e-6) {
  if (any(x %% period > tol)) {
    stop("`x` is not a regular sequence.", call. = FALSE)
  }

  rng <- range(x, na.rm = TRUE)
  seq(rng[1], rng[2], by = period)
}
