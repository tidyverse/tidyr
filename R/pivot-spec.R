# where metadata becomes data

#' @export
#' @rdname pivot
pivot_spec_long <- function(df, cols, measure = "value", variable = "variable") {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  tibble(
    col_name = cols,
    measure = measure,
    !!variable := cols
  )
}

#' @export
#' @rdname pivot
pivot_spec_wide <- function(df, cols, measure = value, sep = "_") {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))
  measure <- tidyselect::vars_pull(names(df), !!enquo(measure))

  row_ids <- vec_unique(df[cols])
  out <- tibble(
    col_name = exec(paste, !!!row_ids, sep = sep),
    measure = measure
  )
  vec_cbind(out, row_ids)
}

# quiet R CMD check
value <- NULL

# wrappers ----------------------------------------------------------------

pivot_long <- function(df,
                       cols,
                       measure = "value",
                       variable = "variable",
                       na.rm = TRUE
                       ) {

  spec <- pivot_spec_long(
    df, !!enquo(cols),
    measure = measure,
    variable = variable
  )
  pivot(df, spec, na.rm = na.rm)
}

pivot_wide <- function(df,
                       cols,
                       measure = value,
                       sep = "_"
                       ) {

  spec <- pivot_spec_wide(
    df, !!enquo(cols),
    measure = !!enquo(measure),
    sep  = sep
  )
  pivot(df, spec)
}
