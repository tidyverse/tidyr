#' Chop and unchop
#'
#' @description
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("maturing")}
#'
#' Chopping and unchopping preserve the width of a data frame, changing its
#' length. `chop()` makes `df` shorter by converting rows within each group
#' into list-columns. `unchop()` makes `df` longer by expanding list-columns
#' so that each element of the list-column gets its own row in the output.
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
#' @param cols Column to chop or unchop (automatically quoted).
#'
#'   This should be a list-column containing generalised vectors (e.g.
#'   any mix of `NULL`s, atomic vector, S3 vectors, a lists, or data frames).
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

  cols <- tidyselect::vars_select(tbl_vars(data), !!enquo(cols))

  vals <- data[cols]
  keys <- data[setdiff(names(data), cols)]
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
  cols <- tidyselect::vars_select(tbl_vars(data), !!enquo(cols))
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

  res <- vec_lengthen(cols, ptype)
  new_cols <- res$val
  slice_loc <- res$loc

  out <- vec_slice(data, slice_loc)

  out <- update_cols(out, new_cols)
  reconstruct_tibble(data, out)
}

# Helpers -----------------------------------------------------------------

vec_lengthen <- function(x, ptype = NULL) {
  width <- length(x)
  size <- vec_size(x)

  if (size == 0L) {
    cols <- map(x, vec_lengthen_ptype)
    out <- new_lengthen_df(integer(), cols, 0L, ptype)
    return(out)
  }

  seq_len_width <- seq_len(width)
  seq_len_size <- seq_len(size)

  sizes <- rep_len(NA_integer_, size)

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

  cols <- vector("list", width)
  pieces <- vector("list", size)

  names <- names(x)
  names(cols) <- names

  for (i in seq_len_width) {
    col <- x[[i]]

    for (j in seq_len_size) {
      # TODO: col[[j]] -> vec_slice2(col, j)
      elt <- col[[j]]
      size <- sizes[[j]]

      pieces[[j]] <- tidyr_recycle(elt, size)
    }

    if (has_ptype) {
      col_ptype <- ptype[[names[[i]]]]
    } else {
      col_ptype <- NULL
    }

    cols[[i]] <- vec_unchop(pieces, ptype = col_ptype)
  }

  out_size <- sum(sizes)
  loc <- rep(seq_len_size, sizes)

  new_lengthen_df(loc, cols, out_size, ptype)
}

new_lengthen_df <- function(loc, cols, n, ptype) {
  val <- new_data_frame(cols, n = n)

  if (!is.null(ptype)) {
    val <- vec_cast(val, ptype)
  }

  out <- list(loc = loc, val = val)
  new_data_frame(out, n = n)
}

vec_lengthen_ptype <- function(x) {
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

