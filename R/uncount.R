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
  
  # Handle removal of weight column for both direct symbols and .data pronoun
  # Fixes #1583 - support for .data$column syntax
  if (.remove) {
    weights_expr <- get_expr(weights_quo)
    
    if (quo_is_symbol(weights_quo)) {
      # Simple case: uncount(df, w)
      out[[as_string(weights_expr)]] <- NULL
    } else if (is_call(weights_expr, "$", n = 2) && 
               identical(weights_expr[[2]], sym(".data"))) {
      # .data pronoun case: uncount(df, .data$w)
      col_name <- as_string(weights_expr[[3]])
      out[[col_name]] <- NULL
    }
  }

  if (!is.null(.id)) {
    out[[.id]] <- sequence(w)
  }

  reconstruct_tibble(data, out)
}
