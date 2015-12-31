#' Create an evenly spaced sequence of values from lowest to highest.
#'
#' @param x A numeric vector
#' @param n Number of values
#' @export
#' @examples
#' seq_range(1:100, 5)
seq_range <- function(x, n) {
  rng <- range(x, na.rm = TRUE)
  seq(rng[1], rng[2], length = n)
}


seq_time <- function(x, period) {
  if (any(x %% period > 1e-6)) {
    stop("`x` is not a regular sequence.", call. = FALSE)
  }

  rng <- range(x, na.rm = TRUE)
  seq(rng[1], rng[2], by = period)
}
