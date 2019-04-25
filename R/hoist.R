#' Selectively pull out components of a list-column
#'
#' @description
#' `hoist()` allows you to selectively pull components of a list-column out
#' in to their own top-level columns, using the same syntax as [purrr::pluck()].
#' It's a useful complement to [unnest_wider()], which turns every component
#' into its own column.
#'
#' It is particularly useful when working with deeply nested JSON data,
#' so more details in `vignette("rectangling")`.
#'
#' @param .data A data frame.
#' @param .col List-column to extract components from.
#' @param ... Components of `.col` to turn into columns in the form
#'   `col_name = "pluck_specification"`. You can pluck by name with a character
#'   vector, by position with an integer vector, or with a combination of the
#'   two with a list. See [purrr::pluck()] for details.
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
#' df %>% hoist(metadata,
#'   species = "species",
#'   first_film = list("films", 1L),
#'   third_film = list("films", 3L)
#' )
#'
#' # cf unnest_wider() which extracts all columns
#' df %>% unnest_wider(metadata)
#' @export hoist
hoist <- function(.data, .col, ..., .remove = TRUE, .ptype = list()) {
  .col <- tidyselect::vars_pull(names(.data), !!enquo(.col))
  x <- .data[[.col]]
  if (!is.list(x)) {
    abort("`col` must be a list-column")
  }

  pluckers <- list(...)
  if (!is_named(pluckers)) {
    stop("All elements of `...` must be named", call. = FALSE)
  }

  new_cols <- rep_named(names(pluckers), list())
  for (i in seq_along(new_cols)) {
    pieces <- map(x, ~ purrr::pluck(.x, !!!pluckers[[i]], .default = unspecified(1)))

    ptype <- .ptype[[names(pluckers)[[i]]]]
    if (is.null(ptype)) {
      new_cols[[i]] <- vec_simplify(pieces)
    } else {
      new_cols[[i]] <- vec_cast(pieces, ptype)
    }
  }

  if (.remove) {
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
  }

  # Place new columns before old column
  out <- append_df(.data, new_cols, after = match(.col, names(.data)) - 1L)
  out[[.col]] <- x
  out
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
