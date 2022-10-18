
# Helpers -----------------------------------------------------------------

df_simplify <- function(x,
                        ...,
                        ptype = NULL,
                        transform = NULL,
                        simplify = TRUE,
                        error_call = caller_env()) {
  check_dots_empty()

  ptype <- check_list_of_ptypes(ptype, names(x), call = error_call)
  transform <- check_list_of_functions(transform, names(x), call = error_call)
  simplify <- check_list_of_bool(simplify, names(x), call = error_call)

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
    col_simplify <- simplify[[col_name]] %||% TRUE

    out[[i]] <- col_simplify(
      x = col,
      ptype = col_ptype,
      transform = col_transform,
      simplify = col_simplify,
      error_call = error_call
    )
  }

  new_data_frame(out, n = x_size)
}

col_simplify <- function(x,
                         ...,
                         ptype = NULL,
                         transform = NULL,
                         simplify = TRUE,
                         error_call = caller_env()) {
  check_dots_empty()

  if (!is.null(transform)) {
    transform <- as_function(transform)
  }

  if (!vec_is_list(x)) {
    if (!is.null(transform)) {
      x <- transform(x)
    }
    if (!is.null(ptype)) {
      x <- vec_cast(x, ptype, call = error_call)
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
    x <- vec_cast_common(!!!x, .to = ptype, .call = error_call)
    x <- new_list_of(x, ptype = ptype)
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
    list_unchop(x_scalars, ptype = x_ptype),
    vctrs_error_incompatible_type = function(e) x
  )
}
