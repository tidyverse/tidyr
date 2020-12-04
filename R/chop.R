#' Chop and unchop
#'
#' @description
#' `r lifecycle::badge("maturing")`
#'
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
#' that `chop()`ing` since it better preserves the connections between
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
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to chop or unchop
#'   (automatically quoted).
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
#' @param ptype Optionally, supply a data frame prototype for the output `cols`,
#'   overriding the default that will be guessed from the combination of
#'   individual values.
#' @export
#' @examples
#' # Chop ==============================================================
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% chop(c(y, z))
#' # cf nest
#' df %>% nest(data = c(y, z))
#'
#' # Unchop ============================================================
#' df <- tibble(x = 1:4, y = list(integer(), 1L, 1:2, 1:3))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = TRUE)
#'
#' # Incompatible types -------------------------------------------------
#' # If the list-col contains types that can not be natively
#' df <- tibble(x = 1:2, y = list("1", 1:3))
#' try(df %>% unchop(y))
#'
#' # Unchopping data frames -----------------------------------------------------
#' # Unchopping a list-col of data frames must generate a df-col because
#' # unchop leaves the column names unchanged
#' df <- tibble(x = 1:3, y = list(NULL, tibble(x = 1), tibble(y = 1:2)))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = TRUE)
chop <- function(data, cols) {
  if (missing(cols)) {
    return(data)
  }

  cols <- tidyselect::eval_select(enquo(cols), data)

  vals <- data[cols]
  keys <- data[setdiff(names(data), names(cols))]
  split <- vec_split(vals, keys)

  if (length(split$val)) {
    split_vals <- transpose(split$val)
    vals <- map2(split_vals, vec_ptype(vals), new_list_of)
    vals <- new_data_frame(vals)
  }

  out <- vec_cbind(split$key, vals)
  reconstruct_tibble(data, out)
}

#' @export
#' @rdname chop
unchop <- function(data, cols, keep_empty = FALSE, ptype = NULL) {
  cols <- tidyselect::eval_select(enquo(cols), data)
  if (length(cols) == 0) {
    return(data)
  }

  if (keep_empty) {
    for (col in cols) {
      data[[col]][] <- map(data[[col]], init_col)
    }
  }

  # In case `x` is a grouped data frame and any `cols` are lists,
  # in which case `[.grouped_df` will error
  cols <- new_data_frame(unclass(data)[cols])

  res <- df_unchop_info(cols, ptype)
  new_cols <- res$val
  slice_loc <- res$loc

  out <- vec_slice(data, slice_loc)

  out <- update_cols(out, new_cols)
  reconstruct_tibble(data, out)
}

# Helpers -----------------------------------------------------------------

# `df_unchop_info()` takes a data frame and unchops every column separately.
# This preserves the width, but changes the size. Rows that are made entirely of
# list column elements of `NULL` are dropped. If `x` has any data frame columns,
# these will be improperly treated as lists until `vec_slice2()` is implemented,
# but this should be extremely rare.

# `df_unchop_info()` returns a data frame of two columns:
# - `loc` locations that map each row to their original row in `x`. Generally
#   used to slice the data frame `x` was subset from to align it with `val`.
# - `val` the unchopped data frame.

df_unchop_info <- function(x, ptype) {
  width <- length(x)
  size <- vec_size(x)

  seq_len_width <- seq_len(width)
  seq_len_size <- seq_len(size)

  sizes <- rep_len(NA_integer_, size)

  # Gather the common size of each row.
  # Effectively equivalent to creating a `[vec_size(x), length(x)]` matrix,
  # taking the size of each individual element of `x`, and then taking the
  # common size of each row.
  # `NULL` elements are ignored in the size calculation by treating their
  # size as `NA` and then deferring to the size of any other element in the row.
  # If only `NULL` values are in the row, the `NA` size is finalised to `0`.
  for (i in seq_len_width) {
    col <- x[[i]]

    for (j in seq_len_size) {
      # TODO: col[[j]] -> vec_slice2(col, j)
      elt <- col[[j]]

      old_size <- sizes[[j]]
      new_size <- tidyr_size(elt)

      sizes[[j]] <- tidyr_size2(old_size, new_size)
    }
  }

  sizes <- map_int(sizes, tidyr_size_finalise)

  has_ptype <- !is.null(ptype)
  if (has_ptype && !is.data.frame(ptype)) {
    abort("`ptype` must be a data frame")
  }

  # Initialize `cols` with ptypes to retain types when `x` has 0 size
  cols <- map(x, df_unchop_ptype)
  pieces <- vector("list", size)

  names <- names(x)
  names(cols) <- names

  for (i in seq_len_width) {
    col <- x[[i]]

    for (j in seq_len_size) {
      # TODO: col[[j]] -> vec_slice2(col, j)
      elt <- col[[j]]
      size <- sizes[[j]]

      # Recycle each row element to the common size of that row
      pieces[[j]] <- tidyr_recycle(elt, size)
    }

    if (has_ptype) {
      col_ptype <- ptype[[names[[i]]]]
    } else {
      col_ptype <- NULL
    }

    # After unchopping, all columns will have the same size
    # thanks to recycling
    col <- vec_unchop(pieces, ptype = col_ptype)

    # Avoid `NULL` assignment, which removes elements from the list
    if (is.null(col)) {
      next
    }

    cols[[i]] <- col
  }

  out_size <- sum(sizes)

  loc <- rep(seq_len_size, sizes)

  val <- new_data_frame(cols, n = out_size)
  if (!is.null(ptype)) {
    val <- vec_cast(val, ptype)
  }

  out <- list(loc = loc, val = val)
  out <- new_data_frame(out, n = out_size)

  out
}

df_unchop_ptype <- function(x) {
  if (vec_is_list(x)) {
    attr(x, "ptype") %||% unspecified(0L)
  } else {
    vec_ptype(x)
  }
}

tidyr_size_finalise <- function(size) {
  if (is.na(size)) {
    0L
  } else {
    size
  }
}

tidyr_recycle <- function(x, size) {
  if (is.null(x)) {
    unspecified(size)
  } else {
    vec_recycle(x, size)
  }
}

tidyr_size <- function(x) {
  if (is.null(x)) {
    NA_integer_
  } else {
    vec_size(x)
  }
}

tidyr_size2 <- function(x, y) {
  if (is.na(x)) {
    y
  } else if (is.na(y)) {
    x
  } else if (x == y) {
    x
  } else if (x == 1L) {
    y
  } else if (y == 1L) {
    x
  } else {
    abort(paste0("Incompatible lengths: ", x, ", ", y, "."))
  }
}

init_col <- function(x) {
  if (is_null(x)) {
    NA
  } else if (vec_is_empty(x)) {
    vec_init(x, 1)
  } else {
    x
  }
}

