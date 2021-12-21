#' Complete a data frame with missing combinations of data
#'
#' Turns implicit missing values into explicit missing values. This is a wrapper
#' around [expand()], [dplyr::full_join()] and [replace_na()] that's useful for
#' completing missing combinations of data.
#'
#' @details
#' With grouped data frames, `complete()` operates _within_ each group.
#'
#' @inheritParams expand
#' @param fill A named list that for each variable supplies a single value to
#'   use instead of `NA` for missing combinations.
#' @param explicit Should both implicit (newly created) and explicit
#'   (pre-existing) missing values be filled by `fill`? By default, this is
#'   `TRUE`, but if set to `FALSE` this will limit the fill to only implicit
#'   missing values.
#' @export
#' @examples
#' library(dplyr, warn.conflicts = FALSE)
#' df <- tibble(
#'   group = c(1:2, 1, 2),
#'   item_id = c(1:2, 2, 3),
#'   item_name = c("a", "a", "b", "b"),
#'   value1 = c(1, NA, 3, 4),
#'   value2 = 4:7
#' )
#'
#' complete(df, group, nesting(item_id, item_name))
#'
#' # You can also choose to fill in missing values. By default, both implicit
#' # (new) and explicit (pre-existing) missing values are filled.
#' complete(
#'   df,
#'   group,
#'   nesting(item_id, item_name),
#'   fill = list(value1 = 0, value2 = 99)
#' )
#'
#' # You can limit the fill to only implicit missing values by setting
#' # `explicit` to `FALSE`
#' complete(
#'   df,
#'   group,
#'   nesting(item_id, item_name),
#'   fill = list(value1 = 0, value2 = 99),
#'   explicit = FALSE
#' )
#'
#' # You can complete within a group by calling `complete()`
#' # on a grouped data frame
#' gdf <- group_by(df, group)
#'
#' complete(df, item_id, item_name)
#' complete(gdf, item_id, item_name)
complete <- function(data,
                     ...,
                     fill = list(),
                     explicit = TRUE) {
  UseMethod("complete")
}

#' @export
complete.data.frame <- function(data,
                                ...,
                                fill = list(),
                                explicit = TRUE) {
  if (!is_bool(explicit)) {
    abort("`explicit` must be a single `TRUE` or `FALSE`.")
  }

  out <- expand(data, ...)
  names <- names(out)

  if (length(names) > 0L) {
    out <- dplyr::full_join(out, data, by = names)
  } else {
    # Avoid joining the 1x0 result from `expand()` with `data`.
    # That causes issues when `data` has zero rows.
    out <- data
  }

  if (explicit) {
    out <- replace_na(out, replace = fill)
  } else {
    new <- !vec_in(out[names], data[names])
    slice <- vec_slice(out, new)
    slice <- replace_na(slice, replace = fill)
    out <- vec_assign(out, new, slice)
  }

  reconstruct_tibble(data, out)
}

#' @export
complete.grouped_df <- function(data,
                                ...,
                                fill = list(),
                                explicit = TRUE) {
  dplyr::summarise(
    data,
    complete(
      data = dplyr::cur_data_all(),
      ...,
      fill = fill,
      explicit = explicit
    ),
    .groups = "keep"
  )
}
