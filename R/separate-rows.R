#' Separate a collapsed column into multiple rows
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
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
separate_rows <- function(data,
                          ...,
                          sep = "[^[:alnum:].]+",
                          convert = FALSE) {
  ellipsis::check_dots_unnamed()
  UseMethod("separate_rows")
}

#' @export
separate_rows.data.frame <- function(data,
                                     ...,
                                     sep = "[^[:alnum:].]+",
                                     convert = FALSE) {
  vars <- tidyselect::eval_select(expr(c(...)), data)

  out <- purrr::modify_at(data, vars, stringi::stri_split_regex, pattern = sep)
  out <- unchop(as_tibble(out), any_of(vars))
  if (convert) {
    out[vars] <- map(out[vars], type.convert, as.is = TRUE)
  }

  reconstruct_tibble(data, out, names(vars))
}
