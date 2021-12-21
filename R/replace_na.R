#' Replace NAs with specified values
#'
#' @param data A data frame or vector.
#' @param replace If `data` is a data frame, `replace` takes a list of values,
#'   with one value for each column that has `NA` values to be replaced.
#'
#'   If `data` is a vector, `replace` takes a single value. This single value
#'   replaces all of the `NA` values in the vector.
#' @param ... Additional arguments for methods. Currently unused.
#' @return
#' `replace_na()` returns an object with the same type as `data`.
#' @seealso [dplyr::na_if()] to replace specified values with `NA`s;
#'   [dplyr::coalesce()] to replaces `NA`s with values from other vectors.
#' @export
#' @examples
#' # Replace NAs in a data frame
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df %>% replace_na(list(x = 0, y = "unknown"))
#'
#' # Replace NAs in a vector
#' df %>% dplyr::mutate(x = replace_na(x, 0))
#' # OR
#' df$x %>% replace_na(0)
#' df$y %>% replace_na("unknown")
#'
#' # Replace NULLs in a list: NULLs are the list-col equivalent of NAs
#' df_list <- tibble(z = list(1:5, NULL, 10:20))
#' df_list %>% replace_na(list(z = list(5)))
replace_na <- function(data, replace, ...) {
  ellipsis::check_dots_used()
  UseMethod("replace_na")
}

#' @export
replace_na.default <- function(data, replace = NA, ...) {
  check_replacement(replace, "data")

  if (is.null(data)) {
    # TODO: Remove branch when https://github.com/r-lib/vctrs/pull/1497 is fixed
    missing <- logical(0L)
  } else {
    missing <- vec_equal_na(data)
  }

  vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  if (!vec_is_list(replace)) {
    abort("`replace` must be a list.")
  }

  names <- intersect(names(replace), names(data))

  col_args <- as.character(glue("data${names}"))
  value_args <- as.character(glue("replace${names}"))

  for (i in seq_along(names)) {
    name <- names[[i]]

    col <- data[[name]]
    value <- replace[[name]]

    col_arg <- col_args[[i]]
    value_arg <- value_args[[i]]

    check_replacement(value, col_arg)

    missing <- vec_equal_na(col)

    data[[name]] <- vec_assign(
      x = col,
      i = missing,
      value = value,
      x_arg = col_arg,
      value_arg = value_arg
    )
  }

  data
}

check_replacement <- function(x, var) {
  n <- vec_size(x)

  if (n != 1) {
    abort(glue("Replacement for `{var}` is length {n}, not length 1."))
  }
}
