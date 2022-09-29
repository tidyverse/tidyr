#' Unite multiple columns into one by pasting strings together
#'
#' Convenience function to paste together multiple columns into one.
#'
#' @param data A data frame.
#' @param col The name of the new column, as a string or symbol.
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings
#'   and symbols). The name is captured from the expression with
#'   [rlang::ensym()] (note that this kind of interface where
#'   symbols do not represent actual objects is now discouraged in the
#'   tidyverse; we support it here for backward compatibility).
#' @param ... <[`tidy-select`][tidyr_tidy_select]> Columns to unite
#' @param sep Separator to use between values.
#' @param na.rm If `TRUE`, missing values will be removed prior to uniting
#'   each value.
#' @param remove If `TRUE`, remove input columns from output data frame.
#' @seealso [separate()], the complement.
#' @export
#' @examples
#' df <- expand_grid(x = c("a", NA), y = c("b", NA))
#' df
#'
#' df %>% unite("z", x:y, remove = FALSE)
#' # To remove missing values:
#' df %>% unite("z", x:y, na.rm = TRUE, remove = FALSE)
#'
#' # Separate is almost the complement of unite
#' df %>%
#'   unite("xy", x:y) %>%
#'   separate(xy, c("x", "y"))
#' # (but note `x` and `y` contain now "NA" not NA)
unite <- function(data, col, ..., sep = "_", remove = TRUE, na.rm = FALSE) {
  check_dots_unnamed()
  UseMethod("unite")
}
#' @export
unite.data.frame <- function(data, col, ..., sep = "_", remove = TRUE, na.rm = FALSE) {
  var <- as_string(ensym(col))

  if (dots_n(...) == 0) {
    from_vars <- set_names(seq_along(data), names(data))
  } else {
    from_vars <- tidyselect::eval_select(expr(c(...)), data)
  }

  out <- data
  if (remove) {
    out <- out[setdiff(names(out), names(from_vars))]
  }

  if (identical(na.rm, TRUE)) {
    cols <- unname(map(data[from_vars], as.character))
    rows <- transpose(cols)

    united <- map_chr(rows, function(x) paste0(x[!is.na(x)], collapse = sep))
  } else {
    cols <- unname(as.list(data[from_vars]))
    united <- exec(paste, !!!cols, sep = sep)
  }

  first_pos <- which(names(data) %in% names(from_vars))[1]
  out <- append_col(out, united, var, after = first_pos - 1L)
  reconstruct_tibble(data, out, if (remove) names(from_vars))
}
