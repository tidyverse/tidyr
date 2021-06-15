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

  # In case `x` is a grouped data frame and any `cols` are lists,
  # in which case `[.grouped_df` will error
  cols <- new_data_frame(unclass(data)[cols])

  res <- df_unchop_info(cols, ptype, keep_empty = keep_empty)
  new_cols <- res$val
  slice_loc <- res$loc

  # efficiency: `vec_slice()` only on the columns not in `cols`
  # `ungroup()` so that select doesn't automatically add grouping columns
  out <- dplyr::select(dplyr::ungroup(data), -names(dplyr::all_of(cols)))
  out <- vec_slice(out, slice_loc)

  out <- update_cols(out, new_cols)
  out <- dplyr::relocate(out, colnames(data))
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

df_unchop_info <- function(x, ptype, keep_empty = FALSE) {
  width <- length(x)
  size <- vec_size(x)

  seq_len_width <- seq_len(width)
  seq_len_size <- seq_len(size)

  # Gather the common size of each row.
  # For `keep_empty = FALSE`: NULL` elements are ignored in the size calculation
  # by treating their size as `NA` and then deferring to the size of any other
  # element in the row.
  # If only `NULL` values are in the row, the `NA` size is finalised to `0`.
  col_sizes <- map(x, tidyr_sizes, keep_empty = keep_empty)
  sizes <- reduce(col_sizes, tidyr_sizes2, keep_empty = keep_empty)
  sizes <- tidyr_sizes_finalise(sizes, keep_empty)

  loc <- vec_rep_each(seq_len_size, sizes)

  has_ptype <- !is.null(ptype)
  if (has_ptype && !is.data.frame(ptype)) {
    abort("`ptype` must be a data frame")
  }

  # Initialize `cols` with ptypes to retain types when `x` has 0 size
  cols <- map(x, df_unchop_ptype)

  names <- names(x)
  names(cols) <- names

  for (i in seq_len_width) {
    col <- x[[i]]

    if (has_ptype) {
      col_ptype <- ptype[[names[[i]]]]
    } else {
      col_ptype <- NULL
    }

    if (vec_is_list(col)) {
      col <- unchop_by_lengths(
        col,
        sizes,
        col_sizes[[i]],
        keep_empty = keep_empty,
        ptype = col_ptype
      )
    } else {
      col <- vec_slice(col, loc)
    }

    # Avoid `NULL` assignment, which removes elements from the list
    if (is.null(col)) {
      next
    }

    cols[[i]] <- col
  }

  out_size <- sum(sizes)

  val <- new_data_frame(cols, n = out_size)
  if (!is.null(ptype)) {
    val <- vec_cast(val, ptype)
  }

  out <- list(loc = loc, val = val)
  new_data_frame(out, n = out_size)
}

unchop_by_lengths <- function(x, lengths_out, x_sizes = list_sizes(x), keep_empty = FALSE, ptype = NULL) {
  # replace `NULL` with `unspecified()`
  if (keep_empty) {
    unspecified_indices <- x_sizes == 0L
  } else {
    unspecified_indices <- vec_equal_na(x) & lengths_out != 0L
  }
  vec_slice(x, unspecified_indices)[] <- list(unspecified(1L))
  x_sizes[unspecified_indices] <- 1L

  needs_recycling <- lengths_out != x_sizes
  x[needs_recycling] <- map2(
    x[needs_recycling], lengths_out[needs_recycling],
    vec_recycle
  )

  vec_c(!!!x, ptype, .name_spec = rlang::zap())
}

df_unchop_ptype <- function(x) {
  if (vec_is_list(x)) {
    attr(x, "ptype") %||% unspecified(0L)
  } else {
    vec_ptype(x)
  }
}

tidyr_sizes_finalise <- function(sizes, keep_empty) {
  if (keep_empty) {
    sizes[sizes == 0L] <- 1L
  } else {
    sizes[is.na(sizes)] <- 0L
  }
  sizes
}

tidyr_sizes <- function(x, keep_empty) {
  if (vec_is_list(x)) {
    col_sizes <- list_sizes(x)

    empty_flag <- col_sizes == 0L
    if (keep_empty) {
      col_sizes[empty_flag] <- 0L
    } else {
      null_flag <- vec_equal_na(x[empty_flag])
      col_sizes[empty_flag] <- ifelse(null_flag, NA, 0L)
    }
  } else {
    # for efficiency reason just return one value for vectors
    if (vec_is_empty(x)) {
      col_sizes <- integer()
    } else {
      col_sizes <- 1L
    }
  }

  col_sizes
}

tidyr_sizes2 <- function(x, y, keep_empty) {
  if (length(y) == 1L) {
    y <- vec_rep(y, length(x))
  }

  # always overwrite NA
  if (keep_empty) {
    x_is_na <- x == 0L
  } else {
    x_is_na <- is.na(x)
  }
  x[x_is_na] <- y[x_is_na]

  # recycle size 1
  recyle_flag <- !is.na(y) & x == 1L
  x[recyle_flag] <- y[recyle_flag]

  # incompatible sizes
  incompatible_sizes <- (x != y) & y > 1
  if (any(incompatible_sizes, na.rm = TRUE)) {
    incompatible_sizes <- stats::na.omit(incompatible_sizes)
    bad_x <- x[incompatible_sizes]
    bad_y <- y[incompatible_sizes]

    # TODO could use column names but how to track where the size comes from?
    stop_incompatible_size(
      bad_x, bad_y,
      x_size = bad_x[[1]], y_size = bad_y[[1]],
      x_arg = NULL, y_arg = NULL
    )
  }

  x
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
