# where metadata becomes data
pivot_spec_long <- function(df, cols, measure = "value", variable = "variable") {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  tibble(
    col_name = cols,
    measure = measure,
    !!variable := col_name
  )
}

pivot_spec_wide <- function(df, cols, measure = value, sep = "_") {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))
  measure <- tidyselect::vars_pull(names(df), !!enquo(measure))

  row_ids <- vctrs::vec_unique(df[cols])
  out <- tibble(
    col_name = exec(paste, !!!row_ids, sep = sep),
    measure = measure
  )
  vctrs::vec_cbind(out, row_ids)
}
