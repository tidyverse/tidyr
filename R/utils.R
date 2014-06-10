col_name <- function(x) {
  if (is.character(x)) return(x)
  if (is.name(x)) return(as.character(x))

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
