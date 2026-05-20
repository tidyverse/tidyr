#' Chop and unchop
#'
#' @description
#' Chopping and unchopping preserve the width of a data frame, changing its
#' length. `chop()` makes `data` shorter by converting rows within each group
#' into list-columns. `unchop()` makes `data` longer by expanding list-columns
#' so that each element of the list-column gets its own row in the output.
#'
#' `chop()` and `unchop()` are building blocks for more complicated functions
#' (like [unnest()], [unnest_longer()], and [unnest_wider()]).
#'
#' @details
#' When multiple columns are being chopped at once, [nest()] is usually more
#' appropriate than `chop()` since it better preserves the connections between
#' observations.
#'
#' `chop()` creates list-columns of class [vctrs::list_of()] to ensure
#' consistent behaviour when the chopped data frame is emptied. For
#' instance this helps getting back the original column types after
#' the roundtrip chop and unchop. Because `<list_of>` keeps tracks of
#' the type of its elements, `unchop()` is able to reconstitute the
#' correct vector type even for empty list-columns.
#'
#' @section Connection to `split()`:
#'
#' `chop()` is the tidyverse version of [base::split()], with a few key changes:
#'
#' - The unique values of the columns used to chop by are preserved losslessly
#'   as output columns, rather than being converted to character labels used as
#'   names on the output list. This is particularly useful when chopping by
#'   non-string columns or multiple columns.
#'
#' - Multiple columns can be chopped at once, producing one list-column per
#'   chopped column. The closest `split()` equivalent is to split a data frame,
#'   which produces a result more similar to [nest()] than `chop()`.
#'
#' - When chopping by multiple columns, only the combinations present in the
#'   data are included in the output. This is different from `split()`, which
#'   takes the [interaction()] of the columns, leading to a potential
#'   combinatorial explosion of output elements.
#'
#' For an even lower-level version, see [vctrs::vec_split()].
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @param data A data frame.
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to chop or unchop.
#'
#'   For `chop()`, columns specified by `by` are removed from `data` before
#'   evaluating `cols`. If not supplied, `cols` is derived as all columns _not_
#'   selected by `by`. At least one of `cols` and `by` must be specified.
#'
#'   For `unchop()`, each column should be a list-column containing generalised
#'   vectors (e.g. any mix of `NULL`s, atomic vector, S3 vectors, a lists,
#'   or data frames).
#' @param by <[`tidy-select`][tidyr_tidy_select]> Columns to chop _by_.
#'
#'   If not supplied, then `by` is derived as all columns _not_ selected by
#'   `cols`. At least one of `cols` and `by` must be specified.
#' @param keep_empty By default, you get one row of output for each element
#'   of the list that you are unchopping/unnesting. This means that if there's a
#'   size-0 element (like `NULL` or an empty data frame or vector), then that
#'   entire row will be dropped from the output. If you want to preserve all
#'   rows, use `keep_empty = TRUE` to replace size-0 elements with a single row
#'   of missing values.
#' @param ptype Optionally, a named list of column name-prototype pairs to
#'   coerce `cols` to, overriding the default that will be guessed from
#'   combining the individual values. Alternatively, a single empty ptype
#'   can be supplied, which will be applied to all `cols`.
#' @export
#' @examples
#' # Chop ----------------------------------------------------------------------
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = c(1, 1, 2, 3, 3, 4), z = 1:6)
#'
#' # `chop()` is most useful as a tidyverse alternative to `base::split()`
#'
#' # Chop `z` by `x` and `y`. Note that we get one row of output for each unique
#' # combination of variables that we chop by.
#' df |> chop(by = c(x, y))
#'
#' # Compare to `split()`, notice how `x` and `y` are converted to character
#' # labels
#' df |> split(df[c("x", "y")], drop = TRUE)
#'
#' # Equivalently, specify variables to chop (rather than variables to chop by)
#' df |> chop(cols = z)
#'
#' # `cols` and `by` can be used together to drop columns you no longer need.
#' # This drops `y`:
#' df |> chop(cols = z, by = x)
#'
#' # You cannot chop a column you are also trying to chop by
#' try(df |> chop(cols = x, by = x))
#'
#' # Multiple columns can be chopped at once, producing one list-column per
#' # chopped column
#' df |> chop(by = x)
#' # Compare to `nest()`, which keeps the chopped `y` and `z` columns together
#' # in nested data frames
#' df |> nest(.by = x)
#' # `split()` is more similar to `nest()` here
#' split(df[c("y", "z")], df["x"])
#'
#' # Unchop --------------------------------------------------------------------
#' df <- tibble(x = 1:4, y = list(integer(), 1L, 1:2, 1:3))
#' df |> unchop(y)
#' df |> unchop(y, keep_empty = TRUE)
#'
#' # `unchop()` will error if the types are not compatible:
#' df <- tibble(x = 1:2, y = list("1", 1:3))
#' try(df |> unchop(y))
#'
#' # Unchopping a list-col of data frames must generate a df-col because
#' # `unchop()` leaves the column names unchanged
#' df <- tibble(x = 1:3, y = list(NULL, tibble(x = 1), tibble(y = 1:2)))
#' df |> unchop(y)
#' df |> unchop(y, keep_empty = TRUE)
chop <- function(
  data,
  cols = NULL,
  ...,
  by = NULL,
  error_call = current_env()
) {
  check_dots_empty0(...)
  check_data_frame(data, call = error_call)

  info <- chop_info(
    data,
    cols = {{ cols }},
    by = {{ by }},
    error_call = error_call
  )
  cols <- info$cols
  by <- info$by

  cols <- tidyr_new_list(data[cols])
  keys <- data[by]

  info <- vec_group_loc(keys)
  keys <- info$key
  indices <- info$loc

  size <- vec_size(keys)

  cols <- map(cols, col_chop, indices = indices)
  cols <- new_data_frame(cols, n = size)

  out <- vec_cbind(keys, cols, .error_call = error_call)

  reconstruct_tibble(data, out)
}

chop_info <- function(data, cols, by, error_call) {
  by <- enquo(by)
  has_by <- !quo_is_null(by)

  cols <- enquo(cols)
  has_cols <- !quo_is_null(cols)

  if (!has_cols && !has_by) {
    cli::cli_abort(
      "At least one of {.var cols} or {.var by} must be supplied.",
      call = error_call
    )
  }

  names <- names(data)

  if (has_by) {
    by <- names(tidyselect::eval_select(
      expr = by,
      data = data,
      allow_rename = FALSE,
      error_call = error_call
    ))
  } else {
    by <- character()
  }

  if (has_cols) {
    # Remove `by` names before evaluating `cols`. This:
    # - Avoids double selection like `chop(cols = x, by = x)`, which would cause
    #   name collisions otherwise.
    # - Enables a meaningful `chop(cols = everything(), by = x)`.
    # Consistent with `pivot_wider(id_cols = )`.
    try_fetch(
      cols <- names(tidyselect::eval_select(
        expr = cols,
        data = data[setdiff(names, by)],
        allow_rename = FALSE,
        error_call = error_call
      )),
      vctrs_error_subscript_oob = function(cnd) {
        maybe_throw_already_selected_error(
          cnd[["i"]],
          "cols",
          by,
          "by",
          error_call
        )
        zap()
      }
    )
  } else {
    cols <- character()
  }

  if (!has_cols) {
    # Derive `cols` names from `by`
    cols <- setdiff(names, by)
  }

  if (!has_by) {
    # Derive `by` names from `cols`
    by <- setdiff(names, cols)
  }

  list(
    cols = cols,
    by = by
  )
}

col_chop <- function(x, indices) {
  ptype <- vec_ptype(x)

  out <- vec_chop(x, indices)
  out <- new_list_of(out, ptype)

  out
}

#' @export
#' @rdname chop
unchop <- function(
  data,
  cols,
  ...,
  keep_empty = FALSE,
  ptype = NULL,
  error_call = current_env()
) {
  check_dots_empty0(...)
  check_data_frame(data, call = error_call)
  check_required(cols, call = error_call)
  check_bool(keep_empty, call = error_call)

  sel <- tidyselect::eval_select(
    expr = enquo(cols),
    data = data,
    allow_rename = FALSE,
    error_call = error_call
  )

  size <- vec_size(data)
  names <- names(data)

  # Start from first principles to avoid issues in any subclass methods
  out <- new_data_frame(data, n = size)
  cols <- out[sel]

  # Remove unchopped columns to avoid slicing them needlessly later
  out[sel] <- NULL

  result <- df_unchop(
    x = cols,
    ptype = ptype,
    keep_empty = keep_empty,
    error_call = error_call
  )
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

df_unchop <- function(
  x,
  ...,
  ptype = NULL,
  keep_empty = FALSE,
  error_call = caller_env()
) {
  check_dots_empty()

  ptype <- check_list_of_ptypes(ptype, names = names(x), call = error_call)

  size <- vec_size(x)

  # Avoid any data frame subclass method dispatch
  x <- new_data_frame(x, n = size)

  width <- length(x)
  x_names <- names(x)

  seq_len_width <- seq_len(width)
  seq_len_size <- seq_len(size)

  if (width == 0L) {
    # Algorithm requires >=1 columns
    out <- list(loc = seq_len_size, val = x)
    out <- new_data_frame(out, n = size)
    return(out)
  }

  x_ptypes <- map2(x, x_names, function(col, name) {
    ptype[[name]] %||% list_of_ptype(col)
  })

  x_is_list <- map_lgl(x, vec_is_list)

  x_sizes <- vector("list", length = width)
  x_nulls <- vector("list", length = width)

  for (i in seq_len_width) {
    col <- x[[i]]
    col_name <- x_names[[i]]
    col_ptype <- x_ptypes[[i]]
    col_is_list <- x_is_list[[i]]

    if (!col_is_list) {
      # Optimize rare non list-cols
      x_sizes[[i]] <- vec_rep(1L, size)
      x_nulls[[i]] <- vec_rep(FALSE, size)
      next
    }

    col <- tidyr_new_list(col)
    col_sizes <- list_sizes(col)
    col_nulls <- vec_detect_missing(col)

    # Always replace `NULL` elements with size 1 missing equivalent for recycling.
    # These will be reset to `NULL` in `unchop_finalize()` if the
    # entire row was missing and `keep_empty = FALSE`.
    info <- list_replace_null(col, col_sizes, ptype = col_ptype)
    col <- info$x
    col_sizes <- info$sizes

    if (keep_empty) {
      info <- list_replace_empty_typed(col, col_sizes, ptype = col_ptype)
      col <- info$x
      col_sizes <- info$sizes
    }

    x[[i]] <- col
    x_sizes[[i]] <- col_sizes
    x_nulls[[i]] <- col_nulls
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
    col_name <- x_names[[i]]
    col_ptype <- x_ptypes[[i]]
    col_is_list <- x_is_list[[i]]
    col_sizes <- x_sizes[[i]]

    if (!col_is_list) {
      # Optimize rare non list-cols
      if (!is_null(col_ptype)) {
        col <- vec_cast(
          x = col,
          to = col_ptype,
          x_arg = col_name,
          call = error_call
        )
      }
      out_cols[[i]] <- vec_slice(col, out_loc)
      next
    }

    # Drop outer names because inner elements have varying size
    col <- unname(col)

    row_recycle <- col_sizes != sizes
    col[row_recycle] <- map2(
      col[row_recycle],
      sizes[row_recycle],
      vec_recycle,
      call = error_call
    )

    col <- list_unchop(
      x = col,
      ptype = col_ptype,
      error_arg = col_name,
      error_call = error_call
    )

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

  names(out_cols) <- x_names
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
