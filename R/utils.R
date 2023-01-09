#' Pipe operator
#'
#' See \code{\link[magrittr]{%>%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

# https://github.com/r-lib/vctrs/issues/211
reconstruct_tibble <- function(input, output, ungrouped_vars = character()) {
  if (inherits(input, "grouped_df")) {
    old_groups <- dplyr::group_vars(input)
    new_groups <- intersect(setdiff(old_groups, ungrouped_vars), names(output))
    dplyr::grouped_df(output, new_groups, drop = dplyr::group_by_drop_default(input))
  } else if (inherits(input, "tbl_df")) {
    # Assume name repair carried out elsewhere
    as_tibble(output, .name_repair = "minimal")
  } else {
    output
  }
}

seq_nrow <- function(x) seq_len(nrow(x))
seq_ncol <- function(x) seq_len(ncol(x))

last <- function(x) x[[length(x)]]


#' Legacy name repair
#'
#' Ensures all column names are unique using the approach found in
#' tidyr 0.8.3 and earlier. Only use this function if you want to preserve
#' the naming strategy, otherwise you're better off adopting the new
#' tidyverse standard with `name_repair = "universal"`
#'
#' @param nm Character vector of names
#' @param prefix prefix Prefix to use for unnamed column
#' @param sep Separator to use between name and unique suffix
#' @keywords internal
#' @export
#' @examples
#' df <- tibble(x = 1:2, y = list(tibble(x = 3:5), tibble(x = 4:7)))
#'
#' # Doesn't work because it would produce a data frame with two
#' # columns called x
#' \dontrun{
#' unnest(df, y)
#' }
#'
#' # The new tidyverse standard:
#' unnest(df, y, names_repair = "universal")
#'
#' # The old tidyr approach
#' unnest(df, y, names_repair = tidyr_legacy)
tidyr_legacy <- function(nms, prefix = "V", sep = "") {
  if (length(nms) == 0) {
    return(character())
  }
  blank <- nms == ""
  nms[!blank] <- make.unique(nms[!blank], sep = sep)
  new_nms <- setdiff(paste(prefix, seq_along(nms), sep = sep), nms)
  nms[blank] <- new_nms[seq_len(sum(blank))]
  nms
}


tidyr_col_modify <- function(data, cols) {
  # Implement from first principles to avoid edge cases in
  # data frame methods for `[<-` and `[[<-`.
  # Assume each element of `cols` has the correct size.

  check_data_frame(data, .internal = TRUE)
  if (!is_list(cols)) {
    cli::cli_abort("`cols` must be a list.", .internal = TRUE)
  }


  size <- vec_size(data)
  data <- tidyr_new_list(data)

  names <- names(cols)

  for (i in seq_along(cols)) {
    name <- names[[i]]
    data[[name]] <- cols[[i]]
  }

  # Assume that we can return a bare data frame that will up restored to
  # a tibble / grouped df as needed elsewhere
  data <- new_data_frame(data, n = size)

  data
}

tidyr_new_list <- function(x) {
  if (!is_list(x)) {
    cli::cli_abort("`x` must be a list.", .internal = TRUE)
  }

  names <- names(x)

  if (is.null(names)) {
    attributes(x) <- NULL
  } else {
    attributes(x) <- list(names = names)
  }

  x
}

#' Replace `NULL` list elements
#'
#' @param x A list, but not a list-of.
#'
#' @param sizes An integer vector of sizes of the `x` elements.
#'
#' @param ptype One of:
#'
#'   - `NULL` to fill `NULL` elements with `unspecified()`.
#'
#'   - A `ptype` value to fill `NULL` elements with.
#'
#' @param size The size of the replacement value to fill with. Commonly either
#'   `0L` or `1L`.
#'
#' @returns
#' A named list holding `x` with `NULL`s replaced, and `sizes` updated to
#' have the correct size where `NULL` elements were replaced.
#'
#' @noRd
list_replace_null <- function(x, sizes, ..., ptype = NULL, size = 1L) {
  check_dots_empty0(...)

  if (!vec_is_list(x)) {
    cli::cli_abort("`x` must be a list.", .internal = TRUE)
  }
  if (is_list_of(x)) {
    cli::cli_abort("`x` can't be a list-of. Unclass first and provide `ptype`.", .internal = TRUE)
  }

  if (vec_any_missing(x)) {
    null <- vec_detect_missing(x)
    null <- which(null)

    if (is_null(ptype)) {
      replacement <- list(unspecified(size))
    } else {
      replacement <- list(vec_init(ptype, size))
    }

    x <- vec_assign(x, null, replacement)

    if (size != 0L) {
      sizes <- vec_assign(sizes, null, size)
    }
  }

  list(x = x, sizes = sizes)
}

#' Replace empty typed list elements
#'
#' @details
#' Importantly, `x` can't contain any `NULL` values. These must have already
#' been processed by `list_replace_null()`. This is not checked for.
#'
#' @param x A list, but not a list-of.
#'
#' @param sizes An integer vector of sizes of the `x` elements.
#'
#' @param ptype One of:
#'
#'   - `NULL` to initialize empty typed elements with `size`d equivalents of
#'     themselves.
#'
#'   - A `ptype` value to replace all empty typed elements with. Useful if you
#'     know `x` is a homogeneous list.
#'
#' @param size The size of the replacement value to fill with. Can't be `0L`,
#'   as that makes no sense.
#'
#' @returns
#' A named list holding `x` with empty typed elements replaced, and `sizes`
#' updated to have the correct size where empty typed elements were replaced.
#'
#' @noRd
list_replace_empty_typed <- function(x, sizes, ..., ptype = NULL, size = 1L) {
  check_dots_empty0(...)

  if (!vec_is_list(x)) {
    cli::cli_abort("`x` must be a list.", .internal = TRUE)
  }
  if (is_list_of(x)) {
    cli::cli_abort("`x` can't be a list-of. Unclass first.", .internal = TRUE)
  }
  if (size == 0L) {
    cli::cli_abort("`size` should never be 0.", .internal = TRUE)
  }

  empty <- sizes == 0L

  if (any(empty)) {
    empty <- which(empty)

    if (is_null(ptype)) {
      replacement <- map(vec_slice(x, empty), function(elt) vec_init(elt, size))
    } else {
      replacement <- list(vec_init(ptype, size))
    }

    x <- vec_assign(x, empty, replacement)
    sizes <- vec_assign(sizes, empty, size)
  }

  list(x = x, sizes = sizes)
}

# TODO: Remove after https://github.com/r-lib/vctrs/issues/1762 is implemented
list_all_vectors2 <- function(x) {
  if (vec_any_missing(x)) {
    missing <- vec_detect_missing(x)
    x <- vec_slice(x, !missing)
  }
  list_all_vectors(x)
}

list_of_ptype <- function(x) {
  ptype <- attr(x, "ptype", exact = TRUE)

  # ptypes should always be unnamed, but this isn't guaranteed right now.
  # See https://github.com/r-lib/vctrs/pull/1020#discussion_r411327472
  ptype <- vec_set_names(ptype, NULL)

  ptype
}

apply_names_sep <- function(outer, inner, names_sep) {
  # Need to avoid `paste0()` recycling issue. Not using `vec_paste0()`
  # because that is too slow to be applied to each element (#1427).
  # `outer` and `names_sep` are required to be length 1,
  # so we only need to check `inner`.
  if (length(inner) == 0L) {
    character()
  } else {
    paste0(outer, names_sep, inner)
  }
}

vec_paste0 <- function(...) {
  # Use tidyverse recycling rules to avoid size zero recycling bugs
  args <- vec_recycle_common(...)
  exec(paste0, !!!args)
}

check_data_frame <- function(x, ..., arg = caller_arg(x), call = caller_env()) {
  if (!is.data.frame(x)) {
    cli::cli_abort("{.arg {arg}} must be a data frame, not {.obj_type_friendly {x}}.", ..., call = call)
  }
}

check_unique_names <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (length(x) > 0L && !is_named(x)) {
    cli::cli_abort("All elements of {.arg {arg}} must be named.", call = call)
  }
  if (vec_duplicate_any(names(x))) {
    cli::cli_abort("The names of {.arg {arg}} must be unique.", call = call)
  }
}

check_list_of_ptypes <- function(x, names, arg = caller_arg(x), call = caller_env()) {
  if (is.null(x)) {
    set_names(list(), character())
  } else if (vec_is(x) && vec_is_empty(x)) {
    rep_named(names, list(x))
  } else if (vec_is_list(x)) {
    check_unique_names(x, arg = arg, call = call)

    # Silently drop user supplied names not found in the data
    x[intersect(names(x), names)]
  } else {
    cli::cli_abort(
      "{.arg {arg}} must be `NULL`, an empty ptype, or a named list of ptypes.",
      call = call
    )
  }
}

check_list_of_functions <- function(x, names, arg = caller_arg(x), call = caller_env()) {
  if (is.null(x)) {
    x <- set_names(list(), character())
  } else if (is.function(x) || is_formula(x)) {
    x <- rep_named(names, list(x))
  } else if (!vec_is_list(x)) {
    cli::cli_abort(
      "{.arg {arg}} must be `NULL`, a function, or a named list of functions.",
      call = call
    )
  }

  check_unique_names(x, arg = arg, call = call)

  x <- lapply(set_names(seq_along(x), names(x)), function(i) {
    as_function(x[[i]], arg = glue("{arg}[[{i}]]"), call = call)
  })

  # Silently drop user supplied names not found in the data
  x <- x[intersect(names(x), names)]

  x
}

check_list_of_bool <- function(x, names, arg = caller_arg(x), call = caller_env()) {
  if (is_bool(x)) {
    rep_named(names, x)
  } else if (vec_is_list(x)) {
    check_unique_names(x, arg = arg, call = call)
    x[intersect(names(x), names)]
  } else  {
    cli::cli_abort(
      "{.arg {arg}} must be a list or a single `TRUE` or `FALSE`.",
      call = call
    )
  }
}

int_max <- function(x, default = -Inf) {
  if (length(x) == 0) {
    default
  } else {
    max(x)
  }
}
