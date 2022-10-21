#' Chop and unchop
#'
#' @description
#' Chopping and unchopping preserve the width of a data frame, changing its
#' length. `chop()` makes `df` shorter by converting rows within each group
#' into list-columns. `unchop()` makes `df` longer by expanding list-columns
#' so that each element of the list-column gets its own row in the output.
#' `chop()` and `unchop()` are building blocks for more complicated functions
#' (like [unnest()], [unnest_longer()], and [unnest_wider()]) and are generally
#' more suitable for programming than interactive data analysis.
#'
#' @details
#' Generally, unchopping is more useful than chopping because it simplifies
#' a complex data structure, and [nest()]ing is usually more appropriate
#' than `chop()`ing since it better preserves the connections between
#' observations.
#'
#' `chop()` creates list-columns of class [vctrs::list_of()] to ensure
#' consistent behaviour when the chopped data frame is emptied. For
#' instance this helps getting back the original column types after
#' the roundtrip chop and unchop. Because `<list_of>` keeps tracks of
#' the type of its elements, `unchop()` is able to reconstitute the
#' correct vector type even for empty list-columns.
#'
#' @param data A data frame.
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to chop or unchop.
#'
#'   For `unchop()`, each column should be a list-column containing generalised
#'   vectors (e.g. any mix of `NULL`s, atomic vector, S3 vectors, a lists,
#'   or data frames).
#' @param keep_empty By default, you get one row of output for each element
#'   of the list your unchopping/unnesting. This means that if there's a
#'   size-0 element (like `NULL` or an empty data frame), that entire row
#'   will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a single row
#'   of missing values.
#' @param ptype Optionally, a named list of column name-prototype pairs to
#'   coerce `cols` to, overriding the default that will be guessed from
#'   combining the individual values. Alternatively, a single empty ptype
#'   can be supplied, which will be applied to all `cols`.
#' @export
#' @examples
#' # Chop ----------------------------------------------------------------------
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% chop(c(y, z))
#' # cf nest
#' df %>% nest(data = c(y, z))
#'
#' # Unchop --------------------------------------------------------------------
#' df <- tibble(x = 1:4, y = list(integer(), 1L, 1:2, 1:3))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = TRUE)
#'
#' # unchop will error if the types are not compatible:
#' df <- tibble(x = 1:2, y = list("1", 1:3))
#' try(df %>% unchop(y))
#'
#' # Unchopping a list-col of data frames must generate a df-col because
#' # unchop leaves the column names unchanged
#' df <- tibble(x = 1:3, y = list(NULL, tibble(x = 1), tibble(y = 1:2)))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = TRUE)
chop <- function(data, cols) {
  check_data_frame(data)
  check_required(cols)
  cols <- tidyselect::eval_select(enquo(cols), data, allow_rename = FALSE)

  cols <- tidyr_new_list(data[cols])
  keys <- data[setdiff(names(data), names(cols))]

  info <- vec_group_loc(keys)
  keys <- info$key
  indices <- info$loc

  size <- vec_size(keys)

  cols <- map(cols, col_chop, indices = indices)
  cols <- new_data_frame(cols, n = size)

  out <- vec_cbind(keys, cols)

  reconstruct_tibble(data, out)
}

col_chop <- function(x, indices) {
  ptype <- vec_ptype(x)

  out <- vec_chop(x, indices)
  out <- new_list_of(out, ptype)

  out
}

#' @export
#' @rdname chop
unchop <- function(data, cols, keep_empty = FALSE, ptype = NULL) {
  check_data_frame(data)
  check_required(cols)
  check_bool(keep_empty)

  sel <- tidyselect::eval_select(enquo(cols), data)

  size <- vec_size(data)
  names <- names(data)

  # Start from first principles to avoid issues in any subclass methods
  out <- new_data_frame(data, n = size)
  cols <- out[sel]

  # Remove unchopped columns to avoid slicing them needlessly later
  out[sel] <- NULL

  result <- df_unchop(cols, ptype = ptype, keep_empty = keep_empty)
  cols <- result$val
  loc <- result$loc

  out <- vec_slice(out, loc)

  # Add unchopped columns back on then preserve original ordering
  out <- tidyr_col_modify(out, cols)
  out <- out[names]

  reconstruct_tibble(data, out)
}

# Helpers -----------------------------------------------------------------

# `df_unchop()` takes a data frame and unchops every column. This preserves the
# width, but changes the size.
#
# - If `keep_empty = TRUE`, empty elements (`NULL` and empty typed elements)
#   are retained as their size 1 missing equivalents.
# - If `keep_empty = FALSE`, rows of entirely empty elements are dropped.
# - In the `keep_empty = FALSE` case, when determining the common size of the
#   row, `NULL`s are not included in the computation, but empty typed elements
#   are (i.e. you can't recycle integer() and 1:2).
#
# `df_unchop()` returns a data frame of two columns:
# - `loc` locations that map each row to their original row in `x`. Generally
#   used to slice the data frame `x` was subset from to align it with `val`.
# - `val` the unchopped data frame.

df_unchop <- function(x, ..., ptype = NULL, keep_empty = FALSE, error_call = caller_env()) {
  check_dots_empty()

  ptype <- check_list_of_ptypes(ptype, names = names(x), call = error_call)

  size <- vec_size(x)

  # Avoid any data frame subclass method dispatch
  x <- new_data_frame(x, n = size)

  width <- length(x)
  names <- names(x)

  seq_len_width <- seq_len(width)
  seq_len_size <- seq_len(size)

  if (width == 0L) {
    # Algorithm requires >=1 columns
    out <- list(loc = seq_len_size, val = x)
    out <- new_data_frame(out, n = size)
    return(out)
  }

  x_is_list <- map_lgl(x, vec_is_list)

  x_sizes <- vector("list", length = width)
  x_nulls <- vector("list", length = width)

  for (i in seq_len_width) {
    col <- x[[i]]
    col_is_list <- x_is_list[[i]]

    if (!col_is_list) {
      # Optimize rare non list-cols
      x_sizes[[i]] <- vec_rep(1L, size)
      x_nulls[[i]] <- vec_rep(FALSE, size)
      next
    }

    # Always replace `NULL` elements with size 1 missing equivalent for recycling.
    # These will be reset to `NULL` in `unchop_finalize()` if the
    # entire row was missing and `keep_empty = FALSE`.
    info <- list_init_empty(
      x = col,
      null = TRUE,
      typed = keep_empty
    )

    x[[i]] <- info$x
    x_sizes[[i]] <- info$sizes
    x_nulls[[i]] <- info$null
  }

  sizes <- reduce(x_sizes, unchop_sizes2, error_call = error_call)

  info <- unchop_finalize(x, sizes, x_nulls, keep_empty)
  x <- info$x
  sizes <- info$sizes

  out_loc <- vec_rep_each(seq_len_size, sizes)

  out_size <- sum(sizes)
  out_cols <- vector("list", length = width)

  for (i in seq_len_width) {
    col <- x[[i]]
    col_name <- names[[i]]
    col_is_list <- x_is_list[[i]]

    col_ptype <- ptype[[col_name]]

    if (!col_is_list) {
      if (!is_null(col_ptype)) {
        col <- vec_cast(col, col_ptype, x_arg = col_name, call = error_call)
      }
      out_cols[[i]] <- vec_slice(col, out_loc)
      next
    }

    col_ptype <- col_ptype %||% attr(col, "ptype", exact = TRUE)

    # Drop to a bare list to avoid dispatch
    col <- unclass(col)

    # Drop outer names because inner elements have varying size
    col <- unname(col)

    col_sizes <- x_sizes[[i]]
    row_recycle <- col_sizes != sizes
    col[row_recycle] <- map2(col[row_recycle], sizes[row_recycle], vec_recycle, call = error_call)

    col <- list_unchop(col, ptype = col_ptype)

    if (is_null(col)) {
      # This can happen when both of these are true:
      # - `col` was an empty list(), or a list of all `NULL`s.
      # - No ptype was specified for `col`, either by the user or by a list-of.
      if (out_size != 0L) {
        cli::cli_abort(
          "`NULL` column generated, but output size is not `0`.",
          .internal = TRUE
        )
      }

      col <- unspecified(0L)
    }

    out_cols[[i]] <- col
  }

  names(out_cols) <- names
  out_val <- new_data_frame(out_cols, n = out_size)

  out <- list(loc = out_loc, val = out_val)
  out <- new_data_frame(out, n = out_size)

  out
}

unchop_sizes2 <- function(x, y, error_call) {
  # Standard tidyverse recycling rules, just vectorized.

  # Recycle `x` values with `y`
  x_one <- x == 1L
  if (any(x_one)) {
    x[x_one] <- y[x_one]
  }

  # Recycle `y` values with `x`.
  # Only necessary to be able to check for incompatibilities.
  y_one <- y == 1L
  if (any(y_one)) {
    y[y_one] <- x[y_one]
  }

  # Check for incompatibilities
  incompatible <- x != y
  if (any(incompatible)) {
    row <- which(incompatible)[[1]]
    x <- x[[row]]
    y <- y[[row]]
    cli::cli_abort(
      "In row {row}, can't recycle input of size {x} to size {y}.",
      call = error_call
    )
  }

  x
}

unchop_finalize <- function(x, sizes, x_nulls, keep_empty) {
  if (keep_empty) {
    return(list(x = x, sizes = sizes))
  }

  # If !keep_empty, `NULL` elements were temporarily given size 1L and
  # converted to a size 1 missing equivalent for recycling. However, if the
  # entire row was made up of `NULL`s, then we need to adjust the size back to
  # 0L and convert back to `NULL`s since that row should be dropped.
  null_row <- reduce(x_nulls, `&`)

  if (any(null_row)) {
    sizes[null_row] <- 0L
    x <- vec_assign(x, null_row, vec_init(x, n = 1L))
  }

  list(x = x, sizes = sizes)
}
