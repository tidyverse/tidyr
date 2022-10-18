append_df <- function(x, y, after = length(x), remove = FALSE) {
  if (is.character(after)) {
    after <- match(after, dplyr::tbl_vars(x))
  } else if (!is.integer(after)) {
    cli::cli_abort("{.arg after} must be character or integer", .internal = TRUE)
  }

  # Replace duplicated variables
  x_vars <- setdiff(names(x), names(y))
  if (remove) {
    x_vars <- setdiff(x_vars, names(x)[[after]])
    after <- after - 1L
  }

  y <- append(x[x_vars], y, after = after)
  structure(y, class = class(x), row.names = .row_names_info(x, 0L))
}

append_col <- function(x, col, name, after = length(x)) {
  name <- enc2utf8(name)
  append_df(x, set_names(list(col), name), after = after)
}
