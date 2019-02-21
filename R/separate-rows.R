#' Separate a collapsed column into multiple rows.
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
#'
#' df <- data.frame(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h"),
#'   z = c("1", "2,3,4", "5,6"),
#'   stringsAsFactors = FALSE
#' )
#' separate_rows(df, y, z, convert = TRUE)
separate_rows <- function(data, ..., sep = "[^[:alnum:].]+",
                          convert = FALSE) {
  UseMethod("separate_rows")
}
#' @export
separate_rows.data.frame <- function(data, ..., sep = "[^[:alnum:].]+",
                                     convert = FALSE) {
  orig <- data
  vars <- unname(tidyselect::vars_select(names(data), ...))

  data[vars] <- map(data[vars], function(x) {
    out <- stringi::stri_split_regex(x, sep)
    attr(out, "ptype") <- character()
    out
  })
  data <- unnest(data, !!! syms(vars), .drop = FALSE)
  data <- dplyr::select(data, !!! intersect(names(orig), names(data)))

  if (convert) {
    data[vars] <- map(data[vars], type.convert, as.is = TRUE)
  }

  reconstruct_tibble(orig, data, vars)
}

