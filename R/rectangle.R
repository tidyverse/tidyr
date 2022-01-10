#' Rectangle a nested list into a tidy tibble
#'
#' @description
#' `hoist()`, `unnest_longer()`, and `unnest_wider()` provide tools for
#' rectangling, collapsing deeply nested lists into regular columns.
#' `hoist()` allows you to selectively pull components of a list-column out
#' in to their own top-level columns, using the same syntax as [purrr::pluck()].
#' `unnest_wider()` turns each element of a list-column into a column, and
#' `unnest_longer()` turns each element of a list-column into a row.
#' `unnest_auto()` picks between `unnest_wider()` or `unnest_longer()`
#' based on heuristics described below.
#'
#' Learn more in `vignette("rectangle")`.
#'
#' @seealso
#' For complex inputs where you need to rectangle a nested list according
#' to a specification, see the
#' [tibblify](https://CRAN.R-project.org/package=tibblify) package.
#'
#' @section Unnest variants:
#'
#' The three `unnest()` functions differ in how they change the shape of the
#' output data frame:
#'
#' * `unnest_wider()` preserves the rows, but changes the columns.
#' * `unnest_longer()` preserves the columns, but changes the rows
#' * [unnest()] can change both rows and columns.
#'
#' These principles guide their behaviour when they are called with a
#' non-primary data type. For example, if you `unnest_wider()` a list of data
#' frames, the number of rows must be preserved, so each column is turned into
#' a list column of length one. Or if you `unnest_longer()` a list of data
#' frames, the number of columns must be preserved so it creates a packed
#' column. I'm not sure how if these behaviours are useful in practice, but
#' they are theoretically pleasing.
#'
#' @section `unnest_auto()` heuristics:
#' `unnest_auto()` inspects the inner names of the list-col:
#' * If all elements are unnamed, it uses
#'   `unnest_longer(indices_include = FALSE)`.
#' * If all elements are named, and there's at least one name in
#'   common across all components, it uses `unnest_wider()`.
#' * Otherwise, it falls back to `unnest_longer(indices_include = TRUE)`.
#'
#' @param .data,data A data frame.
#' @param .col,col List-column to extract components from.
#'
#'   For `hoist()` and `unnest_auto()`, this must identify a single column.
#'
#'   For `unnest_wider()` and `unnest_longer()`, you can use tidyselect to
#'   select multiple columns to unnest simultaneously. When using
#'   `unnest_longer()` with multiple columns, values across columns that
#'   originated from the same row are recycled to a common size.
#' @param ... Components of `.col` to turn into columns in the form
#'   `col_name = "pluck_specification"`. You can pluck by name with a character
#'   vector, by position with an integer vector, or with a combination of the
#'   two with a list. See [purrr::pluck()] for details.
#'
#'   The column names must be unique in a call to `hoist()`, although existing
#'   columns with the same name will be overwritten. When plucking with a
#'   single string you can choose to omit the name, i.e. `hoist(df, col, "x")`
#'   is short-hand for `hoist(df, col, x = "x")`.
#' @param .simplify,simplify If `TRUE`, will attempt to simplify lists of
#'   length-1 vectors to an atomic vector. Can also be a named list containing
#'   `TRUE` or `FALSE` declaring whether or not to attempt to simplify a
#'   particular column. If a named list is provided, the default for any
#'   unspecified columns is `TRUE`.
#' @param .ptype,ptype Optionally, a named list of prototypes declaring the
#'   desired output type of each component. Alternatively, a single empty
#'   prototype can be supplied, which will be applied to all components. Use
#'   this argument if you want to check that each element has the type you
#'   expect when simplifying.
#'
#'   If a `ptype` has been specified, but `simplify = FALSE` or simplification
#'   isn't possible, then a [list-of][vctrs::list_of()] column will be returned
#'   and each element will have type `ptype`.
#' @param .transform,transform Optionally, a named list of transformation
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
#'        )
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
#' # Extract only specified components
#' df %>% hoist(metadata,
#'   "species",
#'   first_film = list("films", 1L),
#'   third_film = list("films", 3L)
#' )
#'
#' df %>%
#'   unnest_wider(metadata) %>%
#'   unnest_longer(films)
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
#' # But you'll usually want to provide names_sep:
#' df %>% unnest_wider(y, names_sep = "_")
#'
#' # And similarly if the vectors are named
#' df <- tibble(
#'   x = 1:2,
#'   y = list(c(a = 1, b = 2), c(a = 10, b = 11, c = 12))
#' )
#' df %>% unnest_wider(y)
#' df %>% unnest_longer(y)
#'
#' # Both unnest_wider() and unnest_longer() allow you to unnest multiple
#' # columns at once. This is particularly useful with unnest_longer(), where
#' # unnesting sequentially would generate a cartesian product of the rows.
#' df <- tibble(
#'   x = 1:2,
#'   y = list(1:2, 3:4),
#'   z = list(5:6, 7:8)
#' )
#' unnest_longer(df, c(y, z))
#' unnest_longer(unnest_longer(df, y), z)
#'
#' # With JSON, it is common for empty elements to be represented by `list()`
#' # rather then their typed equivalent, like `integer()`
#' json <- list(
#'   list(x = 1:2, y = 1:2),
#'   list(x = list(), y = 3:4),
#'   list(x = 3L, y = list())
#' )
#' df <- tibble(json = json)
#'
#' # The defaults of `unnest_wider()` treat empty types (like `list()`) as `NULL`.
#' # This chains nicely into `unnest_longer()`.
#' wide <- unnest_wider(df, json)
#' wide
#'
#' unnest_longer(wide, c(x, y))
#'
#' # To instead enforce strict vctrs typing rules, use `strict`
#' wide_strict <- unnest_wider(df, json, strict = TRUE)
#' wide_strict
#'
#' try(unnest_longer(wide_strict, c(x, y)))
#' @export hoist
hoist <- function(.data,
                  .col,
                  ...,
                  .remove = TRUE,
                  .simplify = TRUE,
                  .ptype = NULL,
                  .transform = NULL) {
  if (!is.data.frame(.data)) {
    abort("`.data` must be a data frame.")
  }

  check_present(.col)
  .col <- tidyselect::vars_pull(names(.data), {{.col}})

  x <- .data[[.col]]
  if (!vec_is_list(x)) {
    abort("`.col` must identify a list-column.")
  }

  pluckers <- check_pluckers(...)

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
  out <- append_df(.data, cols, after = match(.col, names(.data)) - 1L)

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
  if (every(x, is_empty)) {
    x <- NULL
  }
  out[[.col]] <- x

  out
}

check_pluckers <- function(...) {
  pluckers <- list2(...)

  is_string <- map_lgl(pluckers, ~is.character(.x) && length(.x) == 1)
  auto_name <- names2(pluckers) == "" & is_string

  if (any(auto_name)) {
    names(pluckers)[auto_name] <- unlist(pluckers[auto_name])
  }

  if (length(pluckers) > 0 && !is_named(pluckers)) {
    abort("All elements of `...` must be named.")
  }

  if (vec_duplicate_any(names(pluckers))) {
    abort("The names of `...` must be unique.")
  }

  # Standardize all pluckers to lists for splicing into `pluck()`
  # and for easier handling in `strike()`
  is_not_list <- !map_lgl(pluckers, vec_is_list)
  pluckers[is_not_list] <- map(pluckers[is_not_list], vec_chop)

  pluckers
}

strike <- function(x, indices) {
  if (!vec_is_list(indices)) {
    abort("Internal error: `indices` must be a list.")
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

#' @export
#' @rdname hoist
#' @param values_to A string giving the column name (or names) to store the
#'   unnested values in. If multiple columns are specified in `col`, this can
#'   also be a glue string containing `"{col}"` to provide a template for the
#'   column names. The default, `NULL`, gives the output columns the same names
#'   as the input columns.
#' @param indices_to A string giving the column name (or names) to store the
#'   the inner names or positions (if not named) of the values. If multiple
#'   columns are specified in `col`, this can also be a glue string containing
#'   `"{col}"` to provide a template for the column names. The default, `NULL`,
#'   gives the output columns the same names as `values_to`, but suffixed with
#'   `"_id"`.
#' @param indices_include A single logical value specifying whether or not to
#'   add an index column. If any value has inner names, the index column will be
#'   a character vector of those names, otherwise it will be an integer vector
#'   of positions. If `NULL`, defaults to `TRUE` if any value has inner names
#'   or if `indices_to` is provided.
#'
#'   If `indices_to` is provided, then `indices_include` must not be `FALSE`.
#' @inheritParams unnest
unnest_longer <- function(data,
                          col,
                          values_to = NULL,
                          indices_to = NULL,
                          indices_include = NULL,
                          names_repair = "check_unique",
                          simplify = TRUE,
                          ptype = NULL,
                          transform = NULL) {
  if (!is.data.frame(data)) {
    abort("`data` must be a data frame.")
  }

  check_present(col)
  # TODO: Use `allow_rename = FALSE`.
  # Requires https://github.com/r-lib/tidyselect/issues/225.
  cols <- tidyselect::eval_select(enquo(col), data)
  col_names <- names(cols)
  n_col_names <- length(col_names)

  if (!is.null(indices_include) && !is_bool(indices_include)) {
    abort("`indices_include` must be `NULL` or a single `TRUE` or `FALSE`.")
  }

  if (is.null(values_to)) {
    values_to <- "{col}"
  }
  if (!is_string(values_to)) {
    abort("`values_to` must be a single string or `NULL`.")
  }

  if (is.null(indices_to)) {
    indices_to <- vec_paste0(values_to, "_id")
  } else {
    if (is_false(indices_include)) {
      abort("Can't set `indices_include` to `FALSE` when `indices_to` is supplied.")
    }
    indices_include <- TRUE
  }
  if (!is_string(indices_to)) {
    abort("`indices_to` must be a single string or `NULL`.")
  }

  values_to <- glue_col_names(values_to, col_names)
  values_to <- vec_recycle(values_to, size = n_col_names)

  indices_to <- glue_col_names(indices_to, col_names)
  indices_to <- vec_recycle(indices_to, size = n_col_names)

  for (i in seq_along(cols)) {
    col <- cols[[i]]
    col_name <- col_names[[i]]
    col_values_to <- values_to[[i]]
    col_indices_to <- indices_to[[i]]

    data[[col]] <- col_to_long(
      col = data[[col]],
      name = col_name,
      values_to = col_values_to,
      indices_to = col_indices_to,
      indices_include = indices_include
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
col_to_long <- function(col,
                        name,
                        values_to,
                        indices_to,
                        indices_include) {
  if (is.null(col)) {
    abort(glue("Invalid `NULL` column detected for column `{name}`."))
  }

  if (!vec_is_list(col)) {
    ptype <- vec_ptype(col)
    col <- vec_chop(col)
    col <- new_list_of(col, ptype = ptype)
  }

  info <- collect_indices_info(col, indices_include)
  indices_include <- info$indices_include
  indices <- info$indices
  index_ptype <- info$index_ptype

  # If we don't have a list_of, then a `NULL` `col_ptype` will get converted to
  # a 1 row, 1 col tibble for `elt_ptype`
  col_ptype <- list_of_ptype(col)
  elt_ptype <- elt_to_long(
    x = col_ptype,
    index = index_ptype,
    name = name,
    values_to = values_to,
    indices_to = indices_to,
    indices_include = indices_include
  )
  elt_ptype <- vec_ptype(elt_ptype)

  # Avoid expensive dispatch from `[[.list_of`, and allow for `[[<-`
  col <- tidyr_new_list(col)

  for (i in seq_along(col)) {
    col[[i]] <- elt_to_long(
      x = col[[i]],
      index = indices[[i]],
      name = name,
      values_to = values_to,
      indices_to = indices_to,
      indices_include = indices_include
    )
  }

  ptype <- vec_ptype_common(elt_ptype, !!!col)
  col <- vec_cast_common(!!!col, .to = ptype)

  col <- tidyr_temporary_new_list_of(col, ptype = ptype)

  col
}

# Convert a list element to a long tibble with:
# - 1 col (2 if `indices_include` is `TRUE`)
# - N rows, where `N = vec_size(x)`
elt_to_long <- function(x,
                        index,
                        name,
                        values_to,
                        indices_to,
                        indices_include) {
  if (is.null(x)) {
    x <- unspecified(1L)

    if (indices_include) {
      if (is.integer(index)) {
        index <- 1L
      } else {
        index <- NA_character_
      }
    }
  }

  if (!vec_is(x)) {
    abort(glue("Column `{name}` must contain a list of vectors."))
  }

  if (indices_include) {
    out <- list(x, index)
    names(out) <- c(values_to, indices_to)
  } else {
    out <- list(x)
    names(out) <- values_to
  }

  new_data_frame(out, n = vec_size(x))
}

collect_indices_info <- function(col, indices_include) {
  out <- list(
    indices_include = FALSE,
    indices = NULL,
    index_ptype = NULL
  )

  if (is_false(indices_include)) {
    return(out)
  }

  indices <- map(col, vec_names)
  unnamed <- vec_equal_na(indices)
  all_unnamed <- all(unnamed)

  if (is.null(indices_include) && all_unnamed) {
    # Same as `indices_include = FALSE`
    return(out)
  }

  sizes <- list_sizes(col)

  if (all_unnamed) {
    # Indices are requested, but none of the elements are named.
    # Generate integer column of sequential indices.
    indices <- map(sizes, seq_len)
    index_ptype <- integer()
  } else {
    # Indices are requested, and some elements are named.
    # For any unnamed elements, generate `NA` indices.
    indices[unnamed] <- map(sizes[unnamed], vec_rep, x = NA_character_)
    index_ptype <- character()
  }

  out$indices_include <- TRUE
  out$indices <- indices
  out$index_ptype <- index_ptype

  out
}

glue_col_names <- function(string, col_names) {
  data <- list(col = col_names)
  out <- glue::glue_data(data, string, .envir = NULL)
  out <- as.character(out)
  out
}

#' @export
#' @rdname hoist
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
unnest_wider <- function(data,
                         col,
                         names_sep = NULL,
                         simplify = TRUE,
                         strict = FALSE,
                         names_repair = "check_unique",
                         ptype = NULL,
                         transform = NULL) {
  if (!is.data.frame(data)) {
    abort("`data` must be a data frame.")
  }

  check_present(col)
  # TODO: Use `allow_rename = FALSE`.
  # Requires https://github.com/r-lib/tidyselect/issues/225.
  cols <- tidyselect::eval_select(enquo(col), data)
  col_names <- names(cols)

  if (!is.null(names_sep) && !is_string(names_sep)) {
    abort("`names_sep` must be a single string or `NULL`.")
  }
  if (!is_bool(strict)) {
    abort("`strict` must be a single `TRUE` or `FALSE`.")
  }

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
col_to_wide <- function(col, name, strict, names_sep) {
  if (is.null(col)) {
    abort(glue("Invalid `NULL` column detected for column `{name}`."))
  }

  if (!vec_is_list(col)) {
    ptype <- vec_ptype(col)
    col <- vec_chop(col)
    col <- new_list_of(col, ptype = ptype)
  }

  # If we don't have a list_of, then a `NULL` `col_ptype` will get converted to
  # a 1 row, 0 col tibble for `elt_ptype`
  col_ptype <- list_of_ptype(col)
  elt_ptype <- elt_to_wide(col_ptype, name = name, strict = strict, names_sep = names_sep)
  elt_ptype <- vec_ptype(elt_ptype)

  # Avoid expensive dispatch from `[[.list_of`
  out <- tidyr_new_list(col)
  out <- map(out, elt_to_wide, name = name, strict = strict, names_sep = names_sep)

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

  out <- tidyr_temporary_new_list_of(out, ptype = ptype)

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
elt_to_wide <- function(x, name, strict, names_sep) {
  if (is.null(x)) {
    x <- list()
  }

  if (!vec_is(x)) {
    abort(glue("Column `{name}` must contain a list of vectors."))
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
    names(x) <- vec_as_names(names2(x), repair = "unique")
  } else {
    outer <- name

    inner <- names(x)
    if (is.null(inner)) {
      inner <- as.character(seq_along(x))
    } else {
      inner <- vec_as_names(inner, repair = "unique")
    }

    names(x) <- apply_names_sep(outer, inner, names_sep)
  }

  x <- new_data_frame(x, n = 1L)

  x
}

#' @export
#' @rdname hoist
unnest_auto <- function(data, col) {
  check_present(col)
  col <- tidyselect::vars_pull(tbl_vars(data), {{ col }})

  x <- data[[col]]
  dir <- guess_dir(x, col)

  switch(dir,
    longer = unnest_longer(data, {{ col }}, indices_include = FALSE),
    longer_idx = unnest_longer(data, {{ col }}, indices_include = TRUE),
    wider = unnest_wider(data, {{ col }}, names_repair = "unique")
  )
}

guess_dir <- function(x, col) {
  names <- map(x, names)
  is_null <- unique(map_lgl(names, is.null))

  if (identical(is_null, TRUE)) {
    # all unnamed
    code <- glue::glue("unnest_longer({col}, indices_include = FALSE)")
    reason <- "no element has names"
    out <- "longer"
  } else if (identical(is_null, FALSE)) {
    # all named
    common <- reduce(names, intersect)
    n_common <- length(common)
    if (n_common == 0) {
      code <- glue::glue("unnest_longer({col}, indices_include = TRUE)")
      reason <- "elements are named, but have no names in common"
      out <- "longer_idx"
    } else {
      code <- glue::glue("unnest_wider({col})")
      reason <- glue::glue("elements have {n_common} names in common")
      out <- "wider"
    }
  } else {
    code <- glue::glue("unnest_longer({col}, indices_include = FALSE)")
    reason <- "mix of named and unnamed elements"
    out <- "longer"
  }

  message(glue::glue("Using `{code}`; {reason}"))
  out
}

# Helpers -----------------------------------------------------------------

df_simplify <- function(x,
                        ...,
                        ptype = NULL,
                        transform = NULL,
                        simplify = TRUE) {
  ellipsis::check_dots_empty()

  ptype <- check_list_of_ptypes(ptype, names(x), "ptype")
  transform <- check_list_of_functions(transform, names(x), "transform")

  if (is_bool(simplify)) {
    simplify_default <- simplify
    simplify <- list()
  } else {
    simplify_default <- TRUE
  }

  if (!vec_is_list(simplify)) {
    abort("`simplify` must be a list or a single `TRUE` or `FALSE`.")
  }
  if (length(simplify) > 0L && !is_named(simplify)) {
    abort("All elements of `simplify` must be named.")
  }
  if (vec_duplicate_any(names(simplify))) {
    abort("The names of `simplify` must be unique.")
  }

  x_n <- length(x)
  x_size <- vec_size(x)
  x_names <- names(x)

  out <- vector("list", length = x_n)
  names(out) <- x_names

  for (i in seq_len(x_n)) {
    col <- x[[i]]
    col_name <- x_names[[i]]

    col_ptype <- ptype[[col_name]]
    col_transform <- transform[[col_name]]
    col_simplify <- simplify[[col_name]] %||% simplify_default

    out[[i]] <- col_simplify(
      x = col,
      ptype = col_ptype,
      transform = col_transform,
      simplify = col_simplify
    )
  }

  new_data_frame(out, n = x_size)
}

col_simplify <- function(x,
                         ...,
                         ptype = NULL,
                         transform = NULL,
                         simplify = TRUE) {
  ellipsis::check_dots_empty()

  if (!is.null(transform)) {
    transform <- as_function(transform)
  }

  if (!vec_is_list(x)) {
    if (!is.null(transform)) {
      x <- transform(x)
    }
    if (!is.null(ptype)) {
      x <- vec_cast(x, ptype)
    }
    return(x)
  }

  if (!is.null(transform)) {
    x <- tidyr_new_list(x)
    x <- map(x, transform)
    # Can't convert result to list_of, as we can't be certain of element types
  }
  if (!is.null(ptype)) {
    x <- tidyr_new_list(x)
    x <- vec_cast_common(!!!x, .to = ptype)
    x <- tidyr_temporary_new_list_of(x, ptype = ptype)
  }

  if (!simplify) {
    return(x)
  }

  # Don't simplify lists of lists, because that typically indicates that
  # there might be multiple values.
  if (is_list_of(x)) {
    has_list_of_list <- vec_is_list(list_of_ptype(x))
  } else {
    has_list_of_list <- any(map_lgl(x, vec_is_list))
  }
  if (has_list_of_list) {
    return(x)
  }

  # Don't try and simplify non-vectors. list-of types always contain vectors.
  if (!is_list_of(x)) {
    has_non_vector <- any(!map_lgl(x, ~ vec_is(.x) || is.null(.x)))

    if (has_non_vector) {
      return(x)
    }
  }

  # Ensure empty elements are filled in with their correct size 1 equivalent
  info <- list_init_empty(x, null = TRUE, typed = TRUE)

  sizes <- info$sizes

  # Don't try to simplify if there are any size >1 left at this point
  has_non_scalar <- any(sizes != 1L)
  if (has_non_scalar) {
    return(x)
  }

  x_scalars <- info$x
  x_ptype <- list_of_ptype(x)

  # Assume that if combining fails, then we want to return the object
  # after the `ptype` and `transform` have been applied, but before the
  # empty element filling was applied
  tryCatch(
    vec_unchop(x_scalars, ptype = x_ptype),
    vctrs_error_incompatible_type = function(e) x
  )
}

tidyr_temporary_new_list_of <- function(x, ptype) {
  # TODO: Remove me and replace with `new_list_of()` when
  # https://github.com/r-lib/vctrs/pull/784 is merged / fixed.

  # This is an unfortunate hack required because vctr types currently
  # can't have `""` names, and that can easily come up when unnesting a
  # mix of named and unnamed elements.

  # Most of the time, in the places we use this helper the names
  # weren't needed at all, so it is safe to remove them. Any place
  # where this isn't the case has a test and a linked open issue.
  names <- names(x)
  if (!is.null(names) && any(names == "")) {
    x <- unname(x)
  }

  new_list_of(x, ptype = ptype)
}
