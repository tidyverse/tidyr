
append_df <- function(x, y, after = length(x), remove = FALSE) {
  if (is.character(after)) {
    after <- match(after, dplyr::tbl_vars(x))
  } else if (!is.integer(after)) {
    stop("`after` must be character or integer", call. = FALSE)
  }

  # Replace duplicated variables
  x_vars <- setdiff(names(x), names(y))
  if (remove) {
    x_vars <- setdiff(x_vars, names(x)[[after]])
    after <- after - 1L
  }

  append_cbind(x[x_vars], y, after = after)
}

# Same implementation as `base::append()` but with `vec_cbind()`
append_cbind <- function(x, values, after = length(x)){
  if (!after) {
    vec_cbind(values, x)
  } else if (after >= length(x)) {
    vec_cbind(x, values)
  } else {
    vec_cbind(x[1L:after], values, x[(after + 1L):length(x)])
  }
}

append_col <- function(x, col, name, after = length(x)) {
  name <- enc2utf8(name)
  col <- new_data_frame(list2(!!name := col), vec_size(col))
  append_df(x, col, after = after)
}
