#' "Uncount" a data frame
#'
#' Performs the opposite operation to [dplyr::count()], duplicating rows
#' according to a weighting variable (or expression).
#'
#' @param data A data frame, tibble, or grouped tibble.
#' @param weights A vector of weights. Evaluated in the context of `data`;
#'   supports quasiquotation.
#' @param ... Additional arguments passed on to methods.
#' @param .id Supply a string to create a new variable which gives a unique
#'   identifier for each created row.
#' @param .remove If `TRUE`, and `weights` is the name of a column in `data`,
#'   then this column is removed.
#' @export
#' @examples
#' df <- tibble(x = c("a", "b"), n = c(1, 2))
#' uncount(df, n)
#' uncount(df, n, .id = "id")
#'
#' # You can also use constants
#' uncount(df, 2)
#'
#' # Or expressions
#' uncount(df, 2 / n)
uncount <- function(data, weights, ..., .remove = TRUE, .id = NULL) {
  check_dots_used()
  UseMethod("uncount")
}

#' @export
uncount.data.frame <- function(data, weights, ..., .remove = TRUE, .id = NULL) {
  check_bool(.remove)
  check_name(.id, allow_null = TRUE)

  weights_quo <- enquo(weights)
  w <- dplyr::pull(dplyr::mutate(data, `_weight` = !!weights_quo))

  out <- vec_rep_each(
    data,
    w,
    error_call = current_env(),
    times_arg = "weights"
  )

  # NOTE it was decided to also remove grouping variables as there is no clear
  # best answer. See https://github.com/tidyverse/tidyr/pull/1070
  if (.remove && quo_is_symbol(weights_quo)) {
    out[[as_string(get_expr(weights_quo))]] <- NULL
  }

  if (!is.null(.id)) {
    out[[.id]] <- sequence(w)
  }

  reconstruct_tibble(data, out)
}
