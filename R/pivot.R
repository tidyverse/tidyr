#' Check assumptions about a pivot `spec`
#'
#' @description
#' `check_pivot_spec()` is a developer facing helper function for validating
#' the pivot spec used in [pivot_longer_spec()] or [pivot_wider_spec()]. It is
#' only useful if you are extending [pivot_longer()] or [pivot_wider()] with
#' new S3 methods.
#'
#' `check_pivot_spec()` makes the following assertions:
#' - `spec` must be a data frame.
#' - `spec` must have a character column named `.name`.
#' - `spec` must have a character column named `.value`.
#' - The `.name` column must be unique.
#' - The `.name` and `.value` columns must be the first two columns in the data
#'   frame, and will be reordered if that is not true.
#'
#' @inheritParams pivot_wider_spec
#'
#' @keywords internal
#' @export
#' @examples
#' # A valid spec
#' spec <- tibble(.name = "a", .value = "b", foo = 1)
#' check_pivot_spec(spec)
#'
#' spec <- tibble(.name = "a")
#' try(check_pivot_spec(spec))
#'
#' # `.name` and `.value` are forced to be the first two columns
#' spec <- tibble(foo = 1, .value = "b", .name = "a")
#' check_pivot_spec(spec)
check_pivot_spec <- function(spec, call = caller_env()) {
  check_data_frame(spec, call = call)

  if (!has_name(spec, ".name") || !has_name(spec, ".value")) {
    cli::cli_abort(
      "{.arg spec} must have {.var .name} and {.var .value} columns.",
      call = call
    )
  }

  check_character(spec$.name, call = call)
  if (vec_duplicate_any(spec$.name)) {
    cli::cli_abort("{.var spec$.name} must be unique.", call = call)
  }

  check_character(spec$.value, call = call)

  # Ensure `.name` and `.value` come first, in that order
  vars <- union(c(".name", ".value"), names(spec))
  spec <- spec[vars]

  spec
}

wrap_error_names <- function(code) {
  withCallingHandlers(
    code,
    vctrs_error_names = function(cnd) {
      cnd$arg <- "names_repair"
      cnd_signal(cnd)
    }
  )
}
