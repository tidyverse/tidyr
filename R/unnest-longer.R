#' Unnest a list-column into rows
#'
#' @description
#' `unnest_longer()` turns each element of a list-column into a row. It
#' is most naturally suited to list-columns where the elements are unnamed
#' and the length of each element varies from row to row.
#'
#' `unnest_longer()` generally preserves the number of columns of `x` while
#' modifying the number of rows.
#'
#' Learn more in `vignette("rectangle")`.
#'
#' @inheritParams hoist
#' @inheritParams unnest
#' @param col <[`tidy-select`][tidyr_tidy_select]> List-column(s) to unnest.
#'
#'   When selecting multiple columns, values from the same row will be recycled
#'   to their common size.
#' @param values_to A string giving the column name (or names) to store the
#'   unnested values in. If multiple columns are specified in `col`, this can
#'   also be a glue string containing `"{col}"` to provide a template for the
#'   column names. The default, `NULL`, gives the output columns the same names
#'   as the input columns.
#' @param indices_to A string giving the column name (or names) to store the
#'   inner names or positions (if not named) of the values. If multiple columns
#'   are specified in `col`, this can also be a glue string containing `"{col}"`
#'   to provide a template for the column names. The default, `NULL`, gives the
#'   output columns the same names as `values_to`, but suffixed with `"_id"`.
#' @param indices_include A single logical value specifying whether or not to
#'   add an index column. If any value has inner names, the index column will be
#'   a character vector of those names, otherwise it will be an integer vector
#'   of positions. If `NULL`, defaults to `TRUE` if any value has inner names
#'   or if `indices_to` is provided.
#'
#'   If `indices_to` is provided, then `indices_include` can't be `FALSE`.
#' @family rectangling
#' @export
#' @examples
#' # `unnest_longer()` is useful when each component of the list should
#' # form a row
#' df <- tibble(
#'   x = 1:4,
#'   y = list(NULL, 1:3, 4:5, integer())
#' )
#' df %>% unnest_longer(y)
#'
#' # Note that empty values like `NULL` and `integer()` are dropped by
#' # default. If you'd like to keep them, set `keep_empty = TRUE`.
#' df %>% unnest_longer(y, keep_empty = TRUE)
#'
#' # If the inner vectors are named, the names are copied to an `_id` column
#' df <- tibble(
#'   x = 1:2,
#'   y = list(c(a = 1, b = 2), c(a = 10, b = 11, c = 12))
#' )
#' df %>% unnest_longer(y)
#'
#' # Multiple columns ----------------------------------------------------------
#' # If columns are aligned, you can unnest simultaneously
#' df <- tibble(
#'   x = 1:2,
#'   y = list(1:2, 3:4),
#'   z = list(5:6, 7:8)
#' )
#' df %>%
#'   unnest_longer(c(y, z))
#'
#' # This is important because sequential unnesting would generate the
#' # Cartesian product of the rows
#' df %>%
#'   unnest_longer(y) %>%
#'   unnest_longer(z)
unnest_longer <- function(data,
                          col,
                          values_to = NULL,
                          indices_to = NULL,
                          indices_include = NULL,
                          keep_empty = FALSE,
                          names_repair = "check_unique",
                          simplify = TRUE,
                          ptype = NULL,
                          transform = NULL) {

  check_data_frame(data)
  check_required(col)
  check_name(values_to, allow_null = TRUE)
  check_name(indices_to, allow_null = TRUE)
  check_bool(indices_include, allow_null = TRUE)
  check_bool(keep_empty)

  error_call <- current_env()

  cols <- tidyselect::eval_select(enquo(col), data, allow_rename = FALSE)
  col_names <- names(cols)
  n_col_names <- length(col_names)

  values_to <- values_to %||% "{col}"

  if (is.null(indices_to)) {
    indices_to <- vec_paste0(values_to, "_id")
  } else {
    if (is_false(indices_include)) {
      cli::cli_abort(
        "Can't use {.code indices_include = FALSE} when {.arg indices_to} is supplied."
      )
    }
    indices_include <- TRUE
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
      indices_include = indices_include,
      keep_empty = keep_empty
    )
  }

  data <- unchop(data, all_of(col_names), error_call = error_call)

  for (i in seq_along(cols)) {
    col <- cols[[i]]

    data[[col]] <- df_simplify(
      x = data[[col]],
      ptype = ptype,
      transform = transform,
      simplify = simplify
    )
  }

  unpack(
    data = data,
    cols = all_of(col_names),
    names_repair = names_repair,
    error_call = error_call
  )
}

# Converts a column of any type to a `list_of<tbl>`
col_to_long <- function(col,
                        name,
                        values_to,
                        indices_to,
                        indices_include,
                        keep_empty,
                        error_call = caller_env()) {
  if (vec_is_list(col)) {
    ptype <- list_of_ptype(col)
  } else {
    ptype <- vec_ptype(col)
    col <- vec_chop(col)
  }

  # Avoid expensive dispatch from `[[.list_of`, and allow for `[[<-`.
  # We've already captured the `ptype`.
  col <- tidyr_new_list(col)

  if (!list_all_vectors2(col)) {
    cli::cli_abort(
      "List-column {.var {name}} must contain only vectors or `NULL`.",
      call = error_call
    )
  }

  sizes <- list_sizes(col)

  # Collect index info before replacing `NULL`s so `keep_empty` works correctly
  info <- collect_indices_info(col, sizes, indices_include, keep_empty)
  indices_include <- info$indices_include
  indices <- info$indices
  index_ptype <- info$index_ptype

  size_null <- as.integer(keep_empty)

  info <- list_replace_null(col, sizes, ptype = ptype, size = size_null)
  col <- info$x
  sizes <- info$sizes

  if (keep_empty) {
    info <- list_replace_empty_typed(col, sizes, ptype = ptype, size = 1L)
    col <- info$x
    sizes <- info$sizes
  }

  if (is.null(ptype)) {
    # Initialize `ptype` to generate a `ptype` version of the output data frame.
    # Important in the size 0 input case.
    ptype <- unspecified()
  }

  if (indices_include) {
    names <- c(values_to, indices_to)
    ptype <- new_long_indexed_frame(ptype, index_ptype, 0L, names)
    col <- pmap(
      list(col, indices, sizes),
      function(elt, index, size) new_long_indexed_frame(elt, index, size, names)
    )
  } else {
    name <- values_to
    ptype <- new_long_frame(ptype, 0L, name)
    col <- map2(
      col,
      sizes,
      function(elt, size) new_long_frame(elt, size, name)
    )
  }

  ptype <- vec_ptype_common(ptype, !!!col)
  col <- vec_cast_common(!!!col, .to = ptype)

  col <- new_list_of(col, ptype = ptype)

  col
}

new_long_frame <- function(x, size, name) {
  out <- list(x)
  names(out) <- name
  new_data_frame(out, n = size)
}
new_long_indexed_frame <- function(x, index, size, names) {
  out <- list(x, index)
  names(out) <- names
  new_data_frame(out, n = size)
}

collect_indices_info <- function(col, sizes, indices_include, keep_empty) {
  out <- list(
    indices_include = FALSE,
    indices = NULL,
    index_ptype = NULL
  )

  if (is_false(indices_include)) {
    return(out)
  }

  indices <- map(col, vec_names)
  unnamed <- vec_detect_missing(indices)
  all_unnamed <- all(unnamed)

  if (is.null(indices_include) && all_unnamed) {
    # Same as `indices_include = FALSE`
    return(out)
  }

  if (all_unnamed) {
    # Indices are requested, but none of the elements are named.
    # Generate integer column of sequential indices.
    indices <- map(sizes, seq_len)
    index_ptype <- integer()
  } else {
    # Indices are requested, and some elements are named.
    # For any unnamed elements, generate `NA` indices.
    indices[unnamed] <- map(sizes[unnamed], vec_rep, x = "")
    index_ptype <- character()
  }

  if (keep_empty) {
    empty <- sizes == 0L

    if (any(empty)) {
      # `NULL` or typed empty elements get an `NA` index of the right type
      index_empty <- vec_init(index_ptype)
      indices[empty] <- list(index_empty)
    }
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

