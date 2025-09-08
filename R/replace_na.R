#' Replace NAs with specified values
#'
#' @param data A data frame or vector.
#' @param replace If `data` is a data frame, `replace` takes a named list of
#'   values, with one value for each column that has missing values to be
#'   replaced. Each value in `replace` will be cast to the type of the column
#'   in `data` that it being used as a replacement in.
#'
#'   If `data` is a vector, `replace` takes a single value. This single value
#'   replaces all of the missing values in the vector. `replace` will be cast
#'   to the type of `data`.
#' @param ... Additional arguments for methods. Currently unused.
#' @return
#' `replace_na()` returns an object with the same type as `data`.
#' @seealso [dplyr::na_if()] to replace specified values with `NA`s;
#'   [dplyr::coalesce()] to replaces `NA`s with values from other vectors.
#' @export
#' @examples
#' # Replace NAs in a data frame
#' df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
#' df |> replace_na(list(x = 0, y = "unknown"))
#'
#' # Replace NAs in a vector
#' df |> dplyr::mutate(x = replace_na(x, 0))
#' # OR
#' df$x |> replace_na(0)
#' df$y |> replace_na("unknown")
#'
#' # Replace NULLs in a list: NULLs are the list-col equivalent of NAs
#' df_list <- tibble(z = list(1:5, NULL, 10:20))
#' df_list |> replace_na(list(z = list(5)))
replace_na <- function(data, replace, ...) {
  check_dots_used()
  UseMethod("replace_na")
}

#' @export
replace_na.default <- function(data, replace = NA, ...) {
  check_replacement(replace, "data")

  if (vec_any_missing(data)) {
    missing <- vec_detect_missing(data)
    data <- vec_assign(
      data,
      missing,
      replace,
      x_arg = "data",
      value_arg = "replace"
    )
  }

  data
}

#' @export
replace_na.data.frame <- function(data, replace = list(), ...) {
  if (!vec_is_list(replace)) {
    cli::cli_abort(
      "{.arg replace} must be a list, not {.obj_type_friendly {replace}}."
    )
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

    if (vec_any_missing(col)) {
      missing <- vec_detect_missing(col)

      data[[name]] <- vec_assign(
        x = col,
        i = missing,
        value = value,
        x_arg = col_arg,
        value_arg = value_arg
      )
    }
  }

  data
}

check_replacement <- function(x, var, call = caller_env()) {
  n <- vec_size(x)

  if (n != 1) {
    cli::cli_abort(
      "Replacement for `{var}` must be length 1, not length {n}.",
      call = call
    )
  }
}
