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
#' df |> unite("z", x:y, remove = FALSE)
#' # To remove missing values:
#' df |> unite("z", x:y, na.rm = TRUE, remove = FALSE)
#'
#' # Separate is almost the complement of unite
#' df |>
#'   unite("xy", x:y) |>
#'   separate(xy, c("x", "y"))
#' # (but note `x` and `y` contain now "NA" not NA)
unite <- function(data, col, ..., sep = "_", remove = TRUE, na.rm = FALSE) {
  check_dots_unnamed()
  UseMethod("unite")
}
#' @export
unite.data.frame <- function(
  data,
  col,
  ...,
  sep = "_",
  remove = TRUE,
  na.rm = FALSE
) {
  check_required(col)
  check_string(sep)
  check_bool(remove)
  check_bool(na.rm)

  col <- as_string(ensym(col))
  col <- enc2utf8(col)

  if (dots_n(...) == 0) {
    selection <- set_names(seq_along(data), names(data))
  } else {
    selection <- tidyselect::eval_select(
      expr(c(...)),
      data,
      allow_rename = FALSE
    )
  }

  empty_selection <- length(selection) == 0L

  out <- data
  if (remove) {
    out <- out[setdiff(names(out), names(selection))]
  }

  if (empty_selection) {
    # Use initial value implied by the reduction algorithm (#1570)
    united <- vec_rep("", times = vec_size(data))
  } else if (identical(na.rm, TRUE)) {
    cols <- unname(map(data[selection], as.character))
    rows <- transpose(cols)
    united <- map_chr(rows, function(x) paste0(x[!is.na(x)], collapse = sep))
  } else {
    cols <- unname(as.list(data[selection]))
    united <- exec(paste, !!!cols, sep = sep)
  }

  united <- list(united)
  names(united) <- col

  if (empty_selection) {
    after <- length(data)
  } else {
    loc_first_selection <- which(names(data) %in% names(selection))[[1L]]
    after <- loc_first_selection - 1L
  }

  out <- df_append(out, united, after = after)

  reconstruct_tibble(
    input = data,
    output = out,
    ungrouped_vars = if (remove) names(selection)
  )
}
