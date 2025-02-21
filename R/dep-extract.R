# nocov start

#' Extract numeric component of variable.
#'
#' DEPRECATED: please use `readr::parse_number()` instead.
#'
#' @param x A character vector (or a factor).
#' @keywords internal
#' @export
extract_numeric <- function(x) {
  message(
    "extract_numeric() is deprecated: please use readr::parse_number() instead"
  )
  as.numeric(gsub("[^0-9.-]+", "", as.character(x)))
}

# nocov end
