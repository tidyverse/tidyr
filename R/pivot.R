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
check_pivot_spec <- function(spec) {
  if (!is.data.frame(spec)) {
    abort("`spec` must be a data frame.")
  }

  if (!has_name(spec, ".name") || !has_name(spec, ".value")) {
    abort("`spec` must have `.name` and `.value` columns.")
  }

  if (!is.character(spec$.name)) {
    abort("The `.name` column of `spec` must be a character vector.")
  }
  if (vec_duplicate_any(spec$.name)) {
    abort("The `.name` column of `spec` must be unique.")
  }

  if (!is.character(spec$.value)) {
    abort("The `.value` column of `spec` must be a character vector.")
  }

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
