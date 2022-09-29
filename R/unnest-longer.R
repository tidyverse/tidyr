#' Unnest a list-column into rows
#'
#' @description
#' `unnest_longer()` turns each element of a list-column into a row. It
#' is most naturally suited to list-columns where the elements are unnamed
#' and the length of each element varies row-to-row.
#' `unnest_longer()` preserves the columns of `x` while modifying the rows.
#'
#' Learn more in `vignette("rectangle")`.
#'
#' @inheritParams hoist
#' @inheritParams unnest
#' @param col List-column(s) to extract components from.
#'   You can use tidyselect to select multiple columns to unnest simultaneously.
#'   When using `unnest_longer()` with multiple columns, values across columns
#'   that originated from the same row are recycled to a common size.
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
#' @family rectangling
#' @export
#' @examples
#' # unnest_longer() is useful when each component of the list should
#' # form a row
#' df <- tibble(
#'   x = 1:3,
#'   y = list(NULL, 1:3, 4:5)
#' )
#' df %>% unnest_longer(y)
#'
#' # And similarly if the vectors are named
#' df <- tibble(
#'   x = 1:2,
#'   y = list(c(a = 1, b = 2), c(a = 10, b = 11, c = 12))
#' )
#' df %>% unnest_longer(y)
#'
#' # If columns are aligned, you can unnest simultaneously.
#' df <- tibble(
#'   x = 1:2,
#'   y = list(1:2, 3:4),
#'   z = list(5:6, 7:8)
#' )
#' df %>%
#'   unnest_longer(c(y, z))
#'
#' # This is important because sequential unnesting would generate the
#' # Cartesian product of the rows.
#' df %>%
#'   unnest_longer(y) %>%
#'   unnest_longer(z)
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

  check_required(col)
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

  col <- new_list_of(col, ptype = ptype)

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

