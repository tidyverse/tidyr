#' "Uncount" a data frame
#'
#' Performs the opposite opperation to [dplyr::count()], duplicating rows
#' acoording to a weighting variable (or expression).
#'
#' @param data A data frame, tibble, or grouped tibble.
#' @param weights A vector of weights. Evaluated in the context of `data`;
#'   supports quasiquotation.
#' @param .id Supply a string to create a new variable which gives a unique
#'   identifier for each created row.
#' @param .remove If `TRUE`, and `weights` is a signle `
#' @export
#' @examples
#' df <- tibble::tibble(x = c("a", "b"), n = c(1, 2))
#' uncount(df, n)
#' uncount(df, n, .id = "id")
#'
#' # You can also use constants
#' uncount(df, 2)
#'
#' # Or expressions
#' uncount(df, 2 / n)
uncount <- function(data, weights, .remove = TRUE, .id = NULL) {
  weights_quo <- enquo(weights)
  w <- dplyr::pull(dplyr::mutate(data, `_weight` = !! weights_quo))

  if (!is.numeric(w)) {
    stop("`weights` must evaluate to a numeric vector", call. = FALSE)
  }

  out <- data[rep(seq_nrow(data), w), , drop = FALSE]

  if (.remove && quo_is_symbol(weights_quo)) {
    out[[as_string(get_expr(weights_quo))]] <- NULL
  }

  if (!is.null(.id)) {
    out[[.id]] <- sequence(w)
  }

  reconstruct_tibble(data, out)
}
