#' Chop data.frame into a list of data frames.
#'
#' `chop()` creates a list of data frames each containing all
#' the variables from the parent data frame.
#'
#' This function differs from base R `split()` in that `chop()` will keep any levels
#' which contain NA values, whereas `split()` silently drops them.  Also,
#' since splitting variables may only be columns within the parent data frame,
#' there is no opportunity for factor recycling (which is done in `split()`)
#'
#' This function differs from `nest()` in 2 ways: first, the result is a list
#' of data frames, and not a list-column within a data frame; second,
#' the child data frames contain all variables from the parent data frame.
#'
#' @inheritSection gather Rules for selection
#' @param data A data frame.
#' @param ... A selection of columns. If empty, then grouping variables are used.
#'   If there are no grouping variables either, then a list is returned with its
#'   single element being the passed in data frame.
#'
#'   You can supply bare variable names, select all
#'   variables between x and z with `x:z`, exclude y with `-y`. For
#'   more options, see the [dplyr::select()] documentation. See also
#'   the section on selection rules below.
#' @export
chop <- function(data, ...) {
  UseMethod("chop")
}

#' @export
chop.data.frame <- function(data, ...) {

  chop_vars <- unname(tidyselect::vars_select(names(data), ...))

  # Only use group vars if no chop vars specified
  if (is_empty(chop_vars)) {
    chop_vars <- dplyr::group_vars(data)
  }

  data <- dplyr::ungroup(data)   # Same as nest() - chopped data frames are ungrouped.
  data <- dplyr::as_tibble(data) # Ensure we consistently return a list of tibbles

  if (is_empty(chop_vars) || nrow(data) == 0) {
    return(list(data))
  }

  idx <- dplyr::group_indices(data, !!! syms(chop_vars))

  unname(split(data, idx))
}

