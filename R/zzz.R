# nocov start

tidyr_unchop_rows_env <- NULL

.onLoad <- function(libname, pkgname) {
  # Load vctrs namespace for access to C callables
  requireNamespace("vctrs", quietly = TRUE)

  # Use child of global env to allow custom `[[` methods
  tidyr_unchop_rows_env <<- new.env(parent = globalenv())

  # Initialize vctrs callables
  tidy_init_library(asNamespace("tidyr"))
}

# nocov end
