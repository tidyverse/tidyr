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
#' * If `data` is a data frame, `replace_na()` returns a data frame.
#' * If `data` is a vector, `replace_na()` returns a vector of the same type.
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
  missing <- vec_equal_na(data)
  data <- vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
  data
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  stopifnot(is_list(replace))

  replace_vars <- intersect(names(replace), names(data))

  data_args <- paste0("data$", replace_vars)
  replace_args <- paste0("value$", replace_vars)

  for (i in seq_along(replace_vars)) {
    var <- replace_vars[[i]]
    data_arg <- data_args[[i]]
    replace_arg <- replace_args[[i]]

    check_replacement(replace[[var]], data_arg)

    missing <- vec_equal_na(data[[var]])

    data[[var]] <- vec_assign(
      data[[var]],
      missing,
      replace[[var]],
      x_arg = data_arg,
      value_arg = replace_arg
    )
  }

  data
}

check_replacement <- function(x, var) {
  n <- vec_size(x)
  if (n == 1) {
    return()
  }

  abort(glue("Replacement for `{var}` is length {n}, not length 1"))
}
