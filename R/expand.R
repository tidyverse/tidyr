#' Expand data frame to include all combinations of values
#'
#' `expand()` is often useful in conjunction with `left_join` if
#' you want to convert implicit missing values to explicit missing values.
#' Or you can use it in conjunction with `anti_join()` to figure
#' out which combinations are missing.
#'
#' `crossing()` is similar to [expand.grid()], this never
#' converts strings to factors, returns a `tbl_df` without additional
#' attributes, and first factors vary slowest. `nesting()` is the
#' complement to `crossing()`: it only keeps combinations of all variables
#' that appear in the data.
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
#'   completing a data frame with missing combinations.
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
  dots <- quos(..., .named = TRUE)
  if (is_empty(dots)) {
    return(reconstruct_tibble(data, data.frame()))
  }

  pieces <- map(dots, eval_tidy, data)
  df <- crossing(!!! pieces)

  reconstruct_tibble(data, df)
}
#' @export
expand.grouped_df <- function(data, ...) {
  dots <- quos(...)
  dplyr::do(data, expand(., !!! dots))
}

# Nesting & crossing ------------------------------------------------------

#' @rdname expand
#' @export
crossing <- function(...) {
  x <- tibble::lst(...)
  stopifnot(is_list(x))

  x <- drop_empty(x)
  if (length(x) == 0) {
    return(data.frame())
  }

  is_vector <- map_lgl(x, is_atomic) | map_lgl(x, is_bare_list)
  is_df <- map_lgl(x, is.data.frame)
  if (any(!is_df & !is_vector)) {
    bad <- names(x)[!is_df & !is_vector]

    problems <- paste(bad, collapse = ", ")
    abort(glue(
      "Each element must be either an atomic vector, a data frame, or a list.
       Problems: {problems}."
    ))
  }

  # turn each atomic vector into single column data frame
  col_df <- map(x[is_vector], function(x) tibble(x = ulevels(x)))
  col_df <- map2(col_df, names(x)[is_vector], set_names)
  x[is_vector] <- col_df

  Reduce(cross_df, x)
}
cross_df <- function(x, y) {
  x_idx <- rep(seq_nrow(x), each = nrow(y))
  y_idx <- rep(seq_nrow(y), nrow(x))
  dplyr::bind_cols(x[x_idx, , drop = FALSE], y[y_idx, , drop = FALSE])
}
drop_empty <- function(x, factor = TRUE) {
  empty <- map_lgl(x, function(x) length(x) == 0 & (!factor | !is.factor(x)))
  x[!empty]
}

#' @rdname expand
#' @export
nesting <- function(...) {
  x <- tibble::lst(...)

  stopifnot(is_list(x))
  x <- drop_empty(x, factor = FALSE)

  df <- as_tibble(x)
  df <- dplyr::distinct(df)
  df[do.call(order, df), , drop = FALSE]
}
