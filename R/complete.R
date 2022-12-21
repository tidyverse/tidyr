#' Complete a data frame with missing combinations of data
#'
#' Turns implicit missing values into explicit missing values. This is a wrapper
#' around [expand()], [dplyr::full_join()] and [replace_na()] that's useful for
#' completing missing combinations of data.
#'
#' @details
#' With grouped data frames, `complete()` operates _within_ each group. Because
#' of this, you cannot complete a grouping column.
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
#' df <- tibble(
#'   group = c(1:2, 1, 2),
#'   item_id = c(1:2, 2, 3),
#'   item_name = c("a", "a", "b", "b"),
#'   value1 = c(1, NA, 3, 4),
#'   value2 = 4:7
#' )
#' df
#'
#' # Combinations --------------------------------------------------------------
#' # Generate all possible combinations of `group`, `item_id`, and `item_name`
#' # (whether or not they appear in the data)
#' df %>% complete(group, item_id, item_name)
#'
#' # Cross all possible `group` values with the unique pairs of
#' # `(item_id, item_name)` that already exist in the data
#' df %>% complete(group, nesting(item_id, item_name))
#'
#' # Within each `group`, generate all possible combinations of
#' # `item_id` and `item_name` that occur in that group
#' df %>%
#'   dplyr::group_by(group) %>%
#'   complete(item_id, item_name)
#'
#' # Supplying values for new rows ---------------------------------------------
#' # Use `fill` to replace NAs with some value. By default, affects both new
#' # (implicit) and pre-existing (explicit) missing values.
#' df %>%
#'   complete(
#'     group,
#'     nesting(item_id, item_name),
#'     fill = list(value1 = 0, value2 = 99)
#'   )
#'
#' # Limit the fill to only the newly created (i.e. previously implicit)
#' # missing values with `explicit = FALSE`
#' df %>%
#'   complete(
#'     group,
#'     nesting(item_id, item_name),
#'     fill = list(value1 = 0, value2 = 99),
#'     explicit = FALSE
#'   )
complete <- function(data,
                     ...,
                     fill = list(),
                     explicit = TRUE) {

  UseMethod("complete")
}

on_load({
  the$has_dplyr_1_1 <- packageVersion("dplyr") >= "1.0.99"
})

#' @export
complete.data.frame <- function(data,
                                ...,
                                fill = list(),
                                explicit = TRUE) {
  check_bool(explicit)

  out <- expand(data, ...)
  names <- names(out)

  if (length(names) > 0L) {
    if (the$has_dplyr_1_1) {
      out <- dplyr::full_join(out, data, by = names, multiple = "all")
    } else {
      out <- dplyr::full_join(out, data, by = names)
    }
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

  if (the$has_dplyr_1_1) {
    reframe <- utils::getFromNamespace("reframe", ns = "dplyr")
    pick <- utils::getFromNamespace("pick", ns = "dplyr")

    out <- reframe(
      data,
      complete(
        data = pick(everything()),
        ...,
        fill = fill,
        explicit = explicit
      )
    )

    drop <- dplyr::group_by_drop_default(data)
    dplyr::group_by(out, !!!dplyr::groups(data), .drop = drop)
  } else {
    dplyr::summarise(
      data,
      complete(
        data = dplyr::cur_data(),
        ...,
        fill = fill,
        explicit = explicit
      ),
      .groups = "keep"
    )

  }
}
