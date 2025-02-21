#' Automatically call `unnest_wider()` or `unnest_longer()`
#'
#' @description
#' `unnest_auto()` picks between `unnest_wider()` or `unnest_longer()`
#' by inspecting the inner names of the list-col:
#'
#' * If all elements are unnamed, it uses
#'   `unnest_longer(indices_include = FALSE)`.
#' * If all elements are named, and there's at least one name in
#'   common across all components, it uses `unnest_wider()`.
#' * Otherwise, it falls back to `unnest_longer(indices_include = TRUE)`.
#'
#' It's handy for very rapid interactive exploration but I don't recommend
#' using it in scripts, because it will succeed even if the underlying data
#' radically changes.
#'
#' @inheritParams unnest_longer
#' @export
#' @param col <[`tidy-select`][tidyr_tidy_select]> List-column to unnest.
#' @keywords internal
unnest_auto <- function(data, col) {
  check_required(col)
  col <- tidyselect::vars_pull(tbl_vars(data), {{ col }})

  x <- data[[col]]
  dir <- guess_dir(x, col)

  switch(
    dir,
    longer = unnest_longer(data, {{ col }}, indices_include = FALSE),
    longer_idx = unnest_longer(data, {{ col }}, indices_include = TRUE),
    wider = unnest_wider(data, {{ col }}, names_repair = "unique")
  )
}

guess_dir <- function(x, col) {
  names <- map(x, names)
  is_null <- unique(map_lgl(names, is.null))

  if (identical(is_null, TRUE)) {
    # all unnamed
    code <- glue::glue("unnest_longer({col}, indices_include = FALSE)")
    reason <- "no element has names"
    out <- "longer"
  } else if (identical(is_null, FALSE)) {
    # all named
    common <- reduce(names, intersect)
    n_common <- length(common)
    if (n_common == 0) {
      code <- glue::glue("unnest_longer({col}, indices_include = TRUE)")
      reason <- "elements are named, but have no names in common"
      out <- "longer_idx"
    } else {
      code <- glue::glue("unnest_wider({col})")
      reason <- glue::glue("elements have {n_common} names in common")
      out <- "wider"
    }
  } else {
    code <- glue::glue("unnest_longer({col}, indices_include = FALSE)")
    reason <- "mix of named and unnamed elements"
    out <- "longer"
  }

  message(glue::glue("Using `{code}`; {reason}"))
  out
}
