#' Separate a collapsed column into multiple rows
#'
#' If a variable contains observations with multiple delimited values, this
#' separates the values and places each one in its own row.
#'
#' @inheritSection gather Rules for selection
#' @inheritParams fill
#' @inheritParams gather
#' @param sep Separator delimiting collapsed values.
#' @export
#' @examples
#' df <- data.frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   z = c("1", "2,3,4", "5,6"),
#'   stringsAsFactors = FALSE
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
  vars <- tidyselect::vars_select(tbl_vars(data), ...)

  out <- purrr::modify_at(data, vars, stringi::stri_split_regex, pattern = sep)
  out <- unchop(out, vars)
  if (convert) {
    out[vars] <- map(out[vars], type.convert, as.is = TRUE)
  }

  reconstruct_tibble(data, out, vars)
}
