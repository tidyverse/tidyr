#' Nest repeated values in a list-column of data frames
#'
#' @description
#' Nesting is implicitly a summarising operation: you get one row defined
#' by the grouping defined by the non-nested columns. This is useful in
#' conjunction with other summaries that work with whole datasets, most
#' notably models, as described in <https://r4ds.had.co.nz/many-models.html>.
#'
#' Learn more in `vignette("nesting")`.
#'
#' @section Grouped data frames:
#' `nest()` specify the columns to be nested; i.e. the columns that will appear
#' in the inner data frame. Alternatively, you `nest()` a grouped data frame
#' created by [dplyr::group_by()]. Here the grouping variables will remain
#' in the outer data frame, and all other variables will go into the inner
#' data frame. The result will be an ungrouped tibble, where each row
#' represents a group in the input.
#'
#' @param .data A data frame.
#' @param ... Name-variable pairs of the form `new_col = c(col1, col2, col3)`,
#'   that describe how you wish to nest existing columns into new columns.
#'   The right hand side can be any expression supported by tidyselect.
#'
#'   **Deprecated**: previously you could write `df %>% nest(x, y, z)`,
#'   now you should rewrite this as `df %>% nest(data = c(x, y, z))`.
#' @param .key **Deprecated**: No longer needed because of the updated `...`
#'   syntax.
#' @seealso [unnest()] for the inverse operation.
#' @export
#' @examples
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% nest(data = c(y, z))
#' # cf nest
#' df %>% chop(c(y, z))
#'
#' iris %>% nest(data = -Species)
#' chickwts %>% nest(data = weight)
#'
#' # Nesting a grouped data frame nests all variables apart from the group vars
#' fish_encounters %>%
#'   dplyr::group_by(fish) %>%
#'   nest()
nest <- function(.data, ..., .key = "DEPRECATED") {
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    col_names <- unname(tidyselect::vars_select(names(.data), !!!cols))
    cols_expr <- expr(c(!!!syms(col_names)))
    .key <- if (missing(.key)) "data" else as.character(ensym(.key))
    cols <- quos(!!.key := !!cols_expr)

    warn(paste0(
      "All elements of `...` must be named.\n",
      "Did you want `", .key, " = ", expr_text(cols_expr), "`?"
    ))

    return(nest(.data, !!!cols))
  }

  if (!missing(.key)) {
    warn(".key is deprecated")
  }

  UseMethod("nest")
}

#' @export
nest.data.frame <- function(.data, ..., .key = "DEPRECATED") {
  # The data frame print handles nested data frames poorly, so we want to
  # convert data frames (but not subclasses) to tibbles
  if (identical(class(.data), "data.frame")) {
    .data <- as_tibble(.data)
  }

  nest.tbl_df(.data, ...)
}

#' @export
nest.tbl_df <- function(.data, ..., .key = "DEPRECATED") {
  cols <- enquos(...)
  cols <- map(cols, ~ tidyselect::vars_select(names(.data), !!.x))
  asis <- setdiff(names(.data), unlist(cols))

  keys <- .data[asis]
  u_keys <- vec_unique(keys)
  out <- map(cols, ~ vec_split(.data[.x], keys)$val)

  vec_cbind(u_keys, new_data_frame(out, n = nrow(u_keys)))
}

#' @export
nest.grouped_df <- function(.data, ..., .key = "DEPRECATED") {
  if (missing(...)) {
    nest_vars <- setdiff(names(.data), dplyr::group_vars(.data))
    nest.tbl_df(.data, data = !!nest_vars)
  } else {
    NextMethod()
  }
}
