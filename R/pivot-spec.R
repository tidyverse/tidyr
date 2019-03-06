# where metadata becomes data

#' @rdname pivot_long
#' @export
pivot_long_spec <- function(df, cols, names_to = "name", values_to = "value") {
  cols <- tidyselect::vars_select(unique(names(df)), !!enquo(cols))

  tibble(
    .name = cols,
    .value = values_to,
    !!names_to := cols
  )
}

#' @export
#' @rdname pivot_wide
pivot_wide_spec <- function(df,
                            names_from = name,
                            values_from = value,
                            names_prefix = "",
                            names_sep = "_") {
  names_from <- tidyselect::vars_select(names(df), !!enquo(names_from))
  values_from <- tidyselect::vars_pull(names(df), !!enquo(values_from))

  row_ids <- vec_unique(df[names_from])
  out <- tibble(
    .name = paste0(names_prefix, exec(paste, !!!row_ids, sep = names_sep)),
    .value = values_from
  )
  vec_cbind(out, row_ids)
}

# quiet R CMD check
name <- NULL
value <- NULL
