#' Rectangling tools: hosting & directional unnesting
#'
#' @description
#' `hoist()`, `unnest_longer()`, and `unnest_wider()` provide tools for
#' rectangling, collapsing deeply nested lists into regular columns.
#' `hoist()` allows you to selectively pull components of a list-column out
#' in to their own top-level columns, using the same syntax as [purrr::pluck()].
#' `unnest_wider()` turns each element of a list-column into a column, and
#' `unnest_longer()` turns each element of a list-column into a row.
#'
#' Learn more in `vignette("rectangling")`.
#'
#' @section Unnest variants:
#'
#' The three `unnest()` functions differ in how they change the shape of the
#' output data frame:
#'
#' * `unnest_wider()` preserves the rows, but changes the columns.
#' * `unnest_longer()` preserves the columns, but changes the rows
#' * `unnest()` can change both rows and columns.
#'
#' These principles guide their behaviour when they are called with a
#' non-primary data type. For example, if you `unnest_wider()` a list of data
#' frames, the number of rows must be preserved, so each column is turned into
#' a list column of length one. Or if you `unnest_longer()` a list of data
#' frame, the number of columns must be preserved so it creates a packed
#' column. I'm not sure how if these behaviours are useful in practice, but
#' they are theoretically pleasing.
#'
#' @param .data,data A data frame.
#' @param .col List-column to extract components from.
#' @param ... Components of `.col` to turn into columns in the form
#'   `col_name = "pluck_specification"`. You can pluck by name with a character
#'   vector, by position with an integer vector, or with a combination of the
#'   two with a list. See [purrr::pluck()] for details.
#' @param .simplify If `TRUE`, will attempt to simplify lists of length-1
#'   vectors to an atomic vector
#' @param .ptype Optionally, a named list of prototypes declaring the desired
#'   output type of each component.
#' @param .remove If `TRUE`, the default, will remove extracted components
#'   from `.col`. This ensures that each value lives only in one place.
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
#'        )
#'     ),
#'     list(
#'       species = "clownfish",
#'       color = "blue",
#'       films = c("Finding Nemo", "Finding Dory")
#'     )
#'   )
#' )
#'
#' df
#'
#' # Turn all components of metadata into columns
#' df %>% unnest_wider(metadata)
#'
#' # Extract only specified components
#' df %>% hoist(metadata,
#'   species = "species",
#'   first_film = list("films", 1L),
#'   third_film = list("films", 3L)
#' )
#'
#' # unnest_longer() is useful when each component of the list should
#' # form a row
#' df <- tibble(
#'   x = 1:3,
#'   y = list(NULL, 1:3, 4:5)
#' )
#' df %>% unnest_longer(y)
#' # Automatically creates names if widening
#' df %>% unnest_wider(y)
#'
#' # And similarly if the vectors are named
#' df <- tibble(
#'   x = 1:2,
#'   y = list(c(a = 1, b = 2), c(a = 10, b = 11, c = 12))
#' )
#' df %>% unnest_wider(y)
#' df %>% unnest_longer(y)
#'
#' @export hoist
hoist <- function(.data, .col, ..., .remove = TRUE, .simplify = TRUE, .ptype = list()) {
  .col <- tidyselect::vars_pull(names(.data), !!enquo(.col))
  x <- .data[[.col]]
  if (!is.list(x)) {
    abort("`col` must be a list-column")
  }

  pluckers <- list(...)
  if (!is_named(pluckers)) {
    stop("All elements of `...` must be named", call. = FALSE)
  }

  new_cols <- map(pluckers, function(idx) {
    map(x, ~ purrr::pluck(.x, !!!idx))
  })
  new_cols <- map2(
    new_cols, .ptype[names(new_cols)],
    simplify_col,
    simplify = .simplify,
    keep_empty = TRUE
  )

  # Place new columns before old column
  out <- append_df(.data, new_cols, after = match(.col, names(.data)) - 1L)

  if (!.remove) {
    return(out)
  }

  x <- map(x, function(x) {
    # rev() is sneaky hack assuming that most people will remove in
    # numeric order, so this should avoid most order problems. A full
    # resolution will be considerably more work.
    for (plucker in rev(pluckers)) {
      x <- strike(x, plucker)
    }
    x
  })
  if (every(x, vec_empty)) {
    x <- NULL
  }
  out[[.col]] <- x

  out
}

#' @export
#' @rdname hoist
#' @param cols Columns to unnest.
#' @param values_to Name of column to store vector values.
#' @param indices_to A string giving the name of a new column which will
#'   contain the inner names of the values. If unnamed, `col` will instead
#'   contain numeric indices.
#' @inheritParams unnest
unnest_longer <- function(data, cols,
                          values_to = "value",
                          indices_to = "index",
                          names_sep = NULL,
                          names_repair = "check_unique"
                          ) {

  cols <- tidyselect::vars_select(names(data), !!enquo(cols))

  for (col in cols) {
    data[[col]][] <- map(
      data[[col]], vec_to_long,
      col = col,
      values_to = values_to,
      indices_to = indices_to
    )
  }

  data <- unchop(data, !!cols, keep_empty = TRUE)
  unpack(data, !!cols, names_sep = names_sep, names_repair = names_repair)
}

#' @export
#' @rdname hoist
#' @param simplify If `TRUE`, will attempt to simplify lists of length-1
#'   vectors to an atomic vector
unnest_wider <- function(data, cols,
                         names_sep = NULL,
                         simplify = TRUE,
                         names_repair = "check_unique",
                         ptype = list()) {
  cols <- tidyselect::vars_select(names(data), !!enquo(cols))

  for (col in cols) {
    data[[col]][] <- map(data[[col]], vec_to_wide, col = col)
  }

  data <- unchop(data, !!cols, keep_empty = TRUE)

  for (col in cols) {
    inner_cols <- names(data[[col]])

    data[[col]][] <- map2(
      data[[col]], ptype[inner_cols],
      simplify_col,
      keep_empty = TRUE,
      simplify = simplify
    )
  }

  unpack(data, !!cols, names_sep = names_sep, names_repair = names_repair)
}

# Helpers -----------------------------------------------------------------

strike <- function(x, idx) {
  if (length(idx) == 0) (
    x
  ) else if (length(idx) == 1) {
    if (is.list(idx)) {
      idx <- idx[[1]]
    }

    if (is.numeric(idx)) {
      x[-idx]
    } else if (is.character(idx)) {
      if (has_name(x, idx)) {
        x[setdiff(names(x), idx)]
      } else {
        x
      }
    } else {
      x
    }
  } else {
    cur_idx <- idx[[1]]
    idx <- idx[-1]

    if (is.numeric(cur_idx)) {
      if (cur_idx > length(x)) {
        x
      } else {
        x[[cur_idx]] <- strike(x[[cur_idx]], idx)
        x
      }
    } else if (is.character(cur_idx)) {
      if (!has_name(x, cur_idx)) {
        x
      } else {
        x[[cur_idx]] <- strike(x[[cur_idx]], idx)
        x
      }
    } else {
      x
    }
  }
}

simplify_col <- function(x, ptype, keep_empty = FALSE, simplify = FALSE) {
  if (!is.list(x) || is.data.frame(x)) {
    return(x)
  }

  if (is_empty(x)) {
    return(attr(x, "ptype") %||% unspecified(0))
  }

  if (keep_empty) {
    x[] <- map_if(x, is_empty, ~ vec_na(.x, 1) %||% unspecified(1))
  }

  if (!is.null(ptype)) {
    x <- vec_cast(x, ptype)
  } else if (simplify) {
    x <- vec_simplify(x)
  }

  x
}

vec_simplify <- function(x) {
  n <- map_int(x, vec_size)
  if (!all(n == 1)) {
    return(x)
  }

  tryCatch(
    vec_c(!!!x),
    vctrs_error_incompatible_type = function(e) x
  )
}


# 1 row; n cols
vec_to_wide <- function(x, col) {
  if (is.null(x)) {
    NULL
  } else if (is.data.frame(x)) {
    as_tibble(map(x, list))
  } else if (vec_is(x)) {
    if (is.list(x)) {
      x <- purrr::compact(x)
      x <- map(x, list)
    } else {
      x <- as.list(x)
    }
    as_tibble(x, .name_repair = "unique", .rows = 1L)
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

# 1 col; n rows
vec_to_long <- function(x, col, values_to = "values", indices_to = "index") {
  if (is.null(x)) {
    NULL
  } else if (is.data.frame(x)) {
    tibble(!!col := x)
  } else if (vec_is(x)) {
    if (is.null(indices_to)) {
      tibble(!!values_to := x)
    } else {
      tibble(
        !!values_to := x,
        !!indices_to := index(x)
      )
    }
  } else {
    stop("Input must be list of vectors", call. = FALSE)
  }
}

index <- function(x) {
  names(x) %||% seq_along(x)
}
