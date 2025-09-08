#' Hoist values out of list-columns
#'
#' @description
#' `hoist()` allows you to selectively pull components of a list-column
#' into their own top-level columns, using the same syntax as [purrr::pluck()].
#'
#' Learn more in `vignette("rectangle")`.
#'
#' @param .data A data frame.
#' @param .col <[`tidy-select`][tidyr_tidy_select]> List-column to extract
#'   components from.
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Components of `.col` to turn
#'   into columns in the form `col_name = "pluck_specification"`. You can pluck
#'   by name with a character vector, by position with an integer vector, or
#'   with a combination of the two with a list. See [purrr::pluck()] for
#'   details.
#'
#'   The column names must be unique in a call to `hoist()`, although existing
#'   columns with the same name will be overwritten. When plucking with a
#'   single string you can choose to omit the name, i.e. `hoist(df, col, "x")`
#'   is short-hand for `hoist(df, col, x = "x")`.
#' @param .simplify If `TRUE`, will attempt to simplify lists of
#'   length-1 vectors to an atomic vector. Can also be a named list containing
#'   `TRUE` or `FALSE` declaring whether or not to attempt to simplify a
#'   particular column. If a named list is provided, the default for any
#'   unspecified columns is `TRUE`.
#' @param .ptype Optionally, a named list of prototypes declaring the
#'   desired output type of each component. Alternatively, a single empty
#'   prototype can be supplied, which will be applied to all components. Use
#'   this argument if you want to check that each element has the type you
#'   expect when simplifying.
#'
#'   If a `ptype` has been specified, but `simplify = FALSE` or simplification
#'   isn't possible, then a [list-of][vctrs::list_of()] column will be returned
#'   and each element will have type `ptype`.
#' @param .transform Optionally, a named list of transformation
#'   functions applied to each component. Alternatively, a single function can
#'   be supplied, which will be applied to all components. Use this argument if
#'   you want to transform or parse individual elements as they are extracted.
#'
#'   When both `ptype` and `transform` are supplied, the `transform` is applied
#'   before the `ptype`.
#' @param .remove If `TRUE`, the default, will remove extracted components
#'   from `.col`. This ensures that each value lives only in one place. If all
#'   components are removed from `.col`, then `.col` will be removed from the
#'   result entirely.
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
#' # Extract only specified components
#' df |> hoist(metadata,
#'   "species",
#'   first_film = list("films", 1L),
#'   third_film = list("films", 3L)
#' )
#' @export hoist
#' @family rectangling
hoist <- function(
  .data,
  .col,
  ...,
  .remove = TRUE,
  .simplify = TRUE,
  .ptype = NULL,
  .transform = NULL
) {
  check_data_frame(.data)
  check_required(.col)
  pluckers <- check_pluckers(...)
  check_bool(.remove)

  .col <- tidyselect::vars_pull(names(.data), {{ .col }})
  x <- .data[[.col]]
  vec_check_list(x, arg = ".data[[.col]]")

  # These are also checked in df_simplify(), but we check here to generate
  # errors with argument names
  check_list_of_ptypes(.ptype, names(x))
  check_list_of_bool(.simplify, names(x))
  check_list_of_functions(.transform, names(x))

  # In R <4.1, `::` is quite slow and this is a tight loop, so eliminating
  # the lookup has a large performance impact:
  # https://github.com/tidyverse/tidyr/issues/1001
  pluck <- purrr::pluck
  cols <- map(pluckers, function(idx) {
    map(x, ~ pluck(.x, !!!idx))
  })
  cols <- new_data_frame(cols, n = vec_size(.data))

  cols <- df_simplify(
    cols,
    ptype = .ptype,
    transform = .transform,
    simplify = .simplify
  )

  # Place new columns before old column
  out <- df_append(.data, cols, after = match(.col, names(.data)) - 1L)

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

    if (every(x, is_empty)) {
      x <- NULL
    }

    out[[.col]] <- x
  }

  reconstruct_tibble(.data, out)
}

check_pluckers <- function(..., .call = caller_env()) {
  pluckers <- list2(...)

  is_string <- map_lgl(pluckers, ~ is.character(.x) && length(.x) == 1)
  auto_name <- names2(pluckers) == "" & is_string

  if (any(auto_name)) {
    names(pluckers)[auto_name] <- unlist(pluckers[auto_name])
  }

  check_unique_names(pluckers, arg = "...", call = .call)

  # Standardize all pluckers to lists for splicing into `pluck()`
  # and for easier handling in `strike()`
  is_not_list <- !map_lgl(pluckers, vec_is_list)
  pluckers[is_not_list] <- map(pluckers[is_not_list], vec_chop)

  pluckers
}

strike <- function(x, indices) {
  if (!vec_is_list(indices)) {
    cli::cli_abort("{.arg indices} must be a list.", .internal = TRUE)
  }

  n_indices <- vec_size(indices)

  if (n_indices == 0L) {
    # Edge case corresponding to an empty plucker
    return(x)
  }

  index <- indices[[1L]]
  indices <- indices[-1L]

  size <- vec_size(x)

  is_valid_index <-
    (is.numeric(index) && (index <= size)) ||
    (is.character(index) && has_name(x, index))

  if (!is_valid_index) {
    # Nothing to do if the `pluck()` missed entirely
    return(x)
  }

  index <- vec_as_location(index, n = size, names = names(x))

  if (n_indices == 1L) {
    # At base index, remove it
    x <- x[-index]
  } else {
    # Not at base index yet, continue recursion
    x[[index]] <- strike(x[[index]], indices)
  }

  x
}
