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
