#' Separate a collapsed column into multiple rows
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' `separate_rows()` has been superseded in favour of [separate_longer_delim()]
#' because it has a more consistent API with other separate functions.
#' Superseded functions will not go away, but will only receive critical bug
#' fixes.
#'
#' If a variable contains observations with multiple delimited values,
#' `separate_rows()` separates the values and places each one in its own row.
#'
#' @inheritParams drop_na
#' @inheritParams gather
#' @param sep Separator delimiting collapsed values.
#' @param ... <[`tidy-select`][tidyr_tidy_select]> Columns to separate across
#'   multiple rows
#' @export
#' @examples
#' df <- tibble(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   z = c("1", "2,3,4", "5,6")
#' )
#' separate_rows(df, y, z, convert = TRUE)
#'
#' # Now recommended
#' df |>
#'   separate_longer_delim(c(y, z), delim = ",")
separate_rows <- function(data, ..., sep = "[^[:alnum:].]+", convert = FALSE) {
  check_dots_unnamed()
  UseMethod("separate_rows")
}

#' @export
separate_rows.data.frame <- function(
  data,
  ...,
  sep = "[^[:alnum:].]+",
  convert = FALSE
) {
  check_string(sep)
  check_bool(convert)

  vars <- tidyselect::eval_select(expr(c(...)), data, allow_rename = FALSE)
  vars <- names(vars)

  out <- purrr::modify_at(data, vars, str_split_n, pattern = sep)
  out <- unchop(as_tibble(out), any_of(vars), error_call = current_env())
  if (convert) {
    out[vars] <- map(out[vars], type.convert, as.is = TRUE)
  }

  reconstruct_tibble(data, out, vars)
}
