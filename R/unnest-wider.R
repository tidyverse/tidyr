#' Unnest a list-column into columns
#'
#' @description
#' `unnest_wider()` turns each element of a list-column into a column. It
#' is most naturally suited to list-columns where every element is named,
#' and the names are consistent from row-to-row.
#' `unnest_wider()` preserves the rows of `x` while modifying the columns.
#'
#' Learn more in `vignette("rectangle")`.
#'
#' @inheritParams unnest_longer
#' @param names_sep If `NULL`, the default, the names will be left
#'   as is. If a string, the outer and inner names will be pasted together using
#'   `names_sep` as a separator.
#'
#'   If the values being unnested are unnamed and `names_sep` is supplied, the
#'   inner names will be automatically generated as an increasing sequence of
#'   integers.
#' @param strict A single logical specifying whether or not to apply strict
#'   vctrs typing rules. If `FALSE`, typed empty values (like `list()` or
#'   `integer()`) nested within list-columns will be treated like `NULL` and
#'   will not contribute to the type of the unnested column. This is useful
#'   when working with JSON, where empty values tend to lose their type
#'   information and show up as `list()`.
#' @family rectangling
#' @export
#' @examples
#' df <- tibble(
#'   character = c("Toothless", "Dory"),
#'   metadata = list(
#'     list(
#'       species = "dragon",
#'       color = "black",
#'       films = c(
#'         "How to Train Your Dragon",
#'         "How to Train Your Dragon 2",
#'         "How to Train Your Dragon: The Hidden World"
#'       )
#'     ),
#'     list(
#'       species = "blue tang",
#'       color = "blue",
#'       films = c("Finding Nemo", "Finding Dory")
#'     )
#'   )
#' )
#' df
#'
#' # Turn all components of metadata into columns
#' df %>% unnest_wider(metadata)
#'
#' # Choose not to simplify list-cols of length-1 elements
#' df %>% unnest_wider(metadata, simplify = FALSE)
#' df %>% unnest_wider(metadata, simplify = list(color = FALSE))
#'
#' # You can also widen unnamed list-cols:
#' df <- tibble(
#'   x = 1:3,
#'   y = list(NULL, 1:3, 4:5)
#' )
#' # where you'll usually want to provide names_sep:
#' df %>% unnest_wider(y, names_sep = "_")
#'
#' # 0-length elements ---------------------------------------------------------
#' # The defaults of `unnest_wider()` treat empty types (like `list()`) as `NULL`.
#' json <- list(
#'   list(x = 1:2, y = 1:2),
#'   list(x = list(), y = 3:4),
#'   list(x = 3L, y = list())
#' )
#'
#' df <- tibble(json = json)
#' df %>%
#'   unnest_wider(json)
#'
#' # To instead enforce strict vctrs typing rules, use `strict`
#' df %>%
#'   unnest_wider(json, strict = TRUE)
unnest_wider <- function(data,
                         col,
                         names_sep = NULL,
                         simplify = TRUE,
                         strict = FALSE,
                         names_repair = "check_unique",
                         ptype = NULL,
                         transform = NULL) {

  check_data_frame(data)
  check_required(col)
  check_string(names_sep, allow_null = TRUE)
  check_bool(strict)

  cols <- tidyselect::eval_select(enquo(col), data, allow_rename = FALSE)
  col_names <- names(cols)

  for (i in seq_along(cols)) {
    col <- cols[[i]]
    col_name <- col_names[[i]]

    data[[col]] <- col_to_wide(
      col = data[[col]],
      name = col_name,
      strict = strict,
      names_sep = names_sep
    )
  }

  data <- unchop(data, all_of(cols))

  for (i in seq_along(cols)) {
    col <- cols[[i]]

    data[[col]] <- df_simplify(
      x = data[[col]],
      ptype = ptype,
      transform = transform,
      simplify = simplify
    )
  }

  unpack(data, all_of(cols), names_repair = names_repair)
}

# Converts a column of any type to a `list_of<tbl>`
col_to_wide <- function(col, name, strict, names_sep, error_call = caller_env()) {
  if (!vec_is_list(col)) {
    ptype <- vec_ptype(col)
    col <- vec_chop(col)
    col <- new_list_of(col, ptype = ptype)
  }

  # If we don't have a list_of, then a `NULL` `col_ptype` will get converted to
  # a 1 row, 0 col tibble for `elt_ptype`
  col_ptype <- list_of_ptype(col)
  elt_ptype <- elt_to_wide(col_ptype, name = name, strict = strict, names_sep = names_sep, error_call = error_call)
  elt_ptype <- vec_ptype(elt_ptype)

  # Avoid expensive dispatch from `[[.list_of`
  out <- tidyr_new_list(col)

  out <- lapply(
    out,
    function(x) elt_to_wide(
      x = x,
      name = name,
      strict = strict,
      names_sep = names_sep,
      error_call = error_call
    )
  )

  # In the sole case of a list_of<data_frame>, we can be sure that the
  # elements of `out` will all be of the same type. Otherwise,
  # - If `col` isn't a list-of, we don't know the element type.
  # - If `col` is a list-of but not one with a data frame ptype, then we
  #   don't actually know if all elements have the same ptype, because the
  #   number of resulting columns per element depends on that element's size.
  has_identical_elements <- is_list_of(col) && is.data.frame(col_ptype)

  if (has_identical_elements) {
    ptype <- elt_ptype
  } else {
    ptype <- vec_ptype_common(elt_ptype, !!!out)
    out <- vec_cast_common(!!!out, .to = ptype)
  }

  out <- new_list_of(out, ptype = ptype)

  out
}

# Convert a list element to a wide tibble with:
# - 1 row
# - N cols, where `N = vec_size(x)`
# - Column names come from `vec_names(x)`
# - Data frames are treated specially. They are treated like heterogeneous lists
#   where we know the type of each list element.
# - When !strict, lists are treated specially as well. Any typed empty elements
#   are replaced with `NULL` so their type doesn't interfere with the final
#   common type. This is extremely useful for JSON data,
#   where round tripping a typed empty cell results in an empty `list()` that
#   won't be able to combine with other typed non-empty cells. However, it
#   can create inconsistencies with vctrs typing rules.
elt_to_wide <- function(x, name, strict, names_sep, error_call = caller_env()) {
  if (is.null(x)) {
    x <- list()
  }

  if (!vec_is(x)) {
    cli::cli_abort(
      "List-column {.var {name}} must contain only vectors.",
      call = error_call
    )
  }

  if (is.data.frame(x)) {
    # Extremely special case for data.frames,
    # which we want to treat like lists where we know the type of each element
    x <- tidyr_new_list(x)
    x <- map(x, list_of)
  } else {
    if (!strict && vec_is_list(x)) {
      empty <- list_sizes(x) == 0L
      if (any(empty)) {
        # Can't use vec_assign(), see https://github.com/r-lib/vctrs/issues/1424
        x[empty] <- list(NULL)
      }
    }

    names <- vec_names(x)

    if (is.null(names)) {
      x <- vec_chop(x)
    } else {
      # Promote names to column names
      x <- vec_set_names(x, NULL)
      x <- vec_chop(x)
      x <- vec_set_names(x, names)
    }
  }

  if (is.null(names_sep)) {
    names(x) <- vec_as_names(names2(x), repair = "unique", call = error_call)
  } else {
    outer <- name

    inner <- names(x)
    if (is.null(inner)) {
      inner <- as.character(seq_along(x))
    } else {
      inner <- vec_as_names(inner, repair = "unique", call = error_call)
    }

    names(x) <- apply_names_sep(outer, inner, names_sep)
  }

  x <- new_data_frame(x, n = 1L)

  x
}
