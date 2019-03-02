#' Expand data frame to include all combinations of values
#'
#' `expand()` is often useful in conjunction with `left_join()` if
#' you want to convert implicit missing values to explicit missing values.
#' Or you can use it in conjunction with `anti_join()` to figure
#' out which combinations are missing.
#'
#' `crossing()` is a wrapper around [expand_grid()] that deduplicates and sorts
#' each input. `nesting()` is the complement to `crossing()`: it only keeps
#' combinations of values that appear in the data.
#'
#' @param data A data frame.
#' @param ... Specification of columns to expand. Columns can be atomic vectors
#'   or lists.
#'
#'   To find all unique combinations of x, y and z, including those not
#'   found in the data, supply each variable as a separate argument.
#'   To find only the combinations that occur in the data, use nest:
#'   `expand(df, nesting(x, y, z))`.
#'
#'   You can combine the two forms. For example,
#'   `expand(df, nesting(school_id, student_id), date)` would produce
#'   a row for every student for each date.
#'
#'   For factors, the full set of levels (not just those that appear in the
#'   data) are used. For continuous variables, you may need to fill in values
#'   that don't appear in the data: to do so use expressions like
#'   `year = 2010:2020` or `year = \link{full_seq}(year,1)`.
#'
#'   Length-zero (empty) elements are automatically dropped.
#' @seealso [complete()] for a common application of `expand`:
#'   completing a data frame with missing combinations. [expand_grid()]
#'   is low-level that doesn't deduplicate or sort values.
#' @export
#' @examples
#' library(dplyr)
#' # All possible combinations of vs & cyl, even those that aren't
#' # present in the data
#' expand(mtcars, vs, cyl)
#'
#' # Only combinations of vs and cyl that appear in the data
#' expand(mtcars, nesting(vs, cyl))
#'
#' # Implicit missings ---------------------------------------------------------
#' df <- tibble(
#'   year   = c(2010, 2010, 2010, 2010, 2012, 2012, 2012),
#'   qtr    = c(   1,    2,    3,    4,    1,    2,    3),
#'   return = rnorm(7)
#' )
#' df %>% expand(year, qtr)
#' df %>% expand(year = 2010:2012, qtr)
#' df %>% expand(year = full_seq(year, 1), qtr)
#' df %>% complete(year = full_seq(year, 1), qtr)
#'
#' # Nesting -------------------------------------------------------------------
#' # Each person was given one of two treatments, repeated three times
#' # But some of the replications haven't happened yet, so we have
#' # incomplete data:
#' experiment <- tibble(
#'   name = rep(c("Alex", "Robert", "Sam"), c(3, 2, 1)),
#'   trt  = rep(c("a", "b", "a"), c(3, 2, 1)),
#'   rep = c(1, 2, 3, 1, 2, 1),
#'   measurment_1 = runif(6),
#'   measurment_2 = runif(6)
#' )
#'
#' # We can figure out the complete set of data with expand()
#' # Each person only gets one treatment, so we nest name and trt together:
#' all <- experiment %>% expand(nesting(name, trt), rep)
#' all
#'
#' # We can use anti_join to figure out which observations are missing
#' all %>% anti_join(experiment)
#'
#' # And use right_join to add in the appropriate missing values to the
#' # original data
#' experiment %>% right_join(all)
#' # Or use the complete() short-hand
#' experiment %>% complete(nesting(name, trt), rep)
#'
#' # Generate all combinations with expand():
#' formulas <- list(
#'   formula1 = Sepal.Length ~ Sepal.Width,
#'   formula2 = Sepal.Length ~ Sepal.Width + Petal.Width,
#'   formula3 = Sepal.Length ~ Sepal.Width + Petal.Width + Petal.Length
#' )
#' data <- split(iris, iris$Species)
#' crossing(formula = formulas, data)
expand <- function(data, ...) {
  UseMethod("expand")
}

#' @export
expand.data.frame <- function(data, ...) {
  cols <- enquos(...)
  has_name <- names(cols) != ""
  cols <- quos_auto_name(cols)
  cols <- map(cols, eval_tidy, data)

  out <- crossing(!!!cols)

  # flatten unnamed nested data frames to preserve existing behaviour
  to_flatten <- !has_name & unname(map_lgl(out, is.data.frame))
  out <- flatten_at(out, to_flatten)
  out <- as_tibble(out)

  # https://github.com/r-lib/vctrs/issues/211
  reconstruct_tibble(data, out)
}

#' @export
expand.grouped_df <- function(data, ...) {
  dplyr::do(data, expand(., ...))
}

# Nesting & crossing ------------------------------------------------------

#' @rdname expand
#' @export
crossing <- function(...) {
  dots <- enquos(..., .named = TRUE)
  dots <- map(dots, eval_tidy)
  dots <- discard(dots, is.null)

  cols <- map(dots, sorted_unique)
  expand_grid(!!!cols)
}

#' @rdname expand
#' @export
nesting <- function(...) {
  # https://github.com/tidyverse/tibble/issues/580
  dots <- enquos(..., .named = TRUE)
  dots <- map(dots, eval_tidy)
  dots <- discard(dots, is.null)

  sorted_unique(tibble::tibble(!!!dots))
}


# expand_grid -------------------------------------------------------------

#' Create a tibble from all combinations of inputs
#'
#' @section Compared to [expand.grid]:
#' * Varies the first element fastest.
#' * Never converts strings to factors.
#' * Does not add any additional attributes.
#' * Returns a tibble, not a data frame.
#' * Can expand any generalised vector, including data frames.
#' @param ... Name-value pairs. The name will become the column name in the
#'   output.
#' @return A tibble with one column for each input in `...`. The output
#'   will have one row for each combination of the inputs (i.e. the size
#'   be equal to the product of the sizes of the inputs).
#' @export
#' @examples
#' expand_grid(x = 1:3, y = 1:2)
#' expand_grid(l1 = letters, l2 = LETTERS)
#'
#' # Can also expand data frames
#' expand_grid(df = data.frame(x = 1:2, y = c(2, 1)), z = 1:3)
#' # And matrices
#' expand_grid(x1 = matrix(1:4, nrow = 2), x2 = matrix(5:8, nrow = 2))
expand_grid <- function(...) {
  dots <- enquos(..., .named = TRUE)
  dots <- map(dots, eval_tidy)
  dots <- discard(dots, is.null)

  # Generate sequence of indices
  ns <- map_int(dots, vec_size)
  n <- prod(ns)
  each <- n / cumprod(ns)
  times <- n / each / ns

  out <- pmap(list(x = dots, each = each, times = times), vec_repeat)
  as_tibble(out)
}

sorted_unique <- function(x) {
  if (is.factor(x)) {
    # forcats::fct_unique
    factor(levels(x), levels(x), exclude = NULL, ordered = is.ordered(x))
  } else if (is_bare_list(x)) {
    vec_unique(x)
  } else {
    vec_sort(vec_unique(x))
  }
}


flatten_at <- function(x, to_flatten) {
  if (!any(to_flatten)) {
    return(x)
  }

  cols <- rep(1L, length(x))
  cols[to_flatten] <- map_int(x[to_flatten], length)

  out <- vector("list", sum(cols))
  names <- vector("character", sum(cols))
  j <- 1
  for (i in seq_along(x)) {
    if (to_flatten[[i]]) {
      out[j:(j + cols[[i]] - 1)] <- x[[i]]
      names[j:(j + cols[[i]] - 1)] <- names(x[[i]])
    } else {
      out[[j]] <- x[[i]]
      names[[j]] <- names(x)[[i]]
    }
    j <- j + cols[[i]]
  }
  names(out) <- names
  out
}
