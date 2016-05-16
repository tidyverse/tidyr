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
  UseMethod("full_seq")
}

#' @export
full_seq.numeric <- function(x, period, tol = 1e-6) {
  rng <- range(x, na.rm = TRUE)
  if (any((x - rng[1]) %% period > tol)) {
    stop("`x` is not a regular sequence.", call. = FALSE)
  }

  seq(rng[1], rng[2], by = period)
}

#' @export
full_seq.Date <- function(x, period, tol = 1e-6) {
  restore(full_seq(as.numeric(x), period, tol), x)
}

#' @export
full_seq.POSIXct <- function(x, period, tol = 1e-6) {
  restore(full_seq(as.numeric(x), period, tol), x)
}


restore <- function(old, new) {
  mostattributes(new) <- attributes(old)
  new
}
