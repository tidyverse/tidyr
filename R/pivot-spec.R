# where metadata becomes data

#' @export
#' @rdname pivot
pivot_spec_long <- function(df, cols, names_to = "name", values_to = "value") {
  cols <- tidyselect::vars_select(unique(names(df)), !!enquo(cols))

  tibble(
    col_name = cols,
    measure = values_to,
    !!names_to := cols
  )
}

#' @export
#' @rdname pivot
pivot_spec_wide <- function(df, names_from = name, values_from = value, sep = "_") {
  names_from <- tidyselect::vars_select(names(df), !!enquo(names_from))
  values_from <- tidyselect::vars_pull(names(df), !!enquo(values_from))

  row_ids <- vec_unique(df[names_from])
  out <- tibble(
    col_name = exec(paste, !!!row_ids, sep = sep),
    measure = values_from
  )
  vec_cbind(out, row_ids)
}

# quiet R CMD check
name <- NULL
value <- NULL
