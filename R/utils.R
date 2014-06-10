col_name <- function(x) {
  if (is.character(x)) return(x)
  if (is.name(x)) return(as.character(x))

  stop("Invalid column specification", call. = FALSE)
}
