id <- function(.variables, drop = FALSE) {
  if (length(.variables) == 0) {
    n <- nrow(.variables) %||% 0L
    return(structure(seq_len(n), n = n))
  }

  # Special case for single variable
  if (length(.variables) == 1) {
    return(id_var(.variables[[1]], drop = drop))
  }

  # Calculate individual ids
  ids <- rev(lapply(.variables, id_var, drop = drop))
  p <- length(ids)

  # Calculate dimensions
  ndistinct <- vapply(ids, attr, "n", FUN.VALUE = numeric(1),
    USE.NAMES = FALSE)
  n <- prod(ndistinct)
  if (n > 2 ^ 31) {
    # Too big for integers, have to use strings, which will be much slower :(

    char_id <- do.call("paste", c(ids, sep = "\r"))
    res <- match(char_id, unique(char_id))
  } else {
    combs <- c(1, cumprod(ndistinct[-p]))

    mat <- do.call("cbind", ids)
    res <- c((mat - 1L) %*% combs + 1L)
  }
  attr(res, "n") <- n


  if (drop) {
    id_var(res, drop = TRUE)
  } else {
    structure(as.integer(res), n = attr(res, "n"))
  }
}

id_var <- function(x, drop = FALSE) {
  if (!is.null(attr(x, "n")) && !drop) return(x)

  if (is.factor(x) && !drop) {
    id <- as.integer(addNA(x, ifany = TRUE))
    n <- length(levels(x))
  } else if (length(x) == 0) {
    id <- integer()
    n <- 0L
  } else {
    levels <- sort(unique(x), na.last = TRUE)
    id <- match(x, levels)
    n <- max(id)
  }
  structure(id, n = n)
}
