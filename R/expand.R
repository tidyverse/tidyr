#' Expand data frame to include all possible combinations of values
#'
#' @description
#' `expand()` generates all combination of variables found in a dataset.
#' It is paired with `nesting()` and `crossing()` helpers. `crossing()`
#' is a wrapper around [expand_grid()] that de-duplicates and sorts its inputs;
#' `nesting()` is a helper that only finds combinations already present in the
#' data.
#'
#' `expand()` is often useful in conjunction with joins:
#'
#'  * use it with `right_join()` to convert implicit missing values to
#'    explicit missing values (e.g., fill in gaps in your data frame).
#'  * use it with `anti_join()` to figure out which combinations are missing
#'    (e.g., identify gaps in your data frame).
#'
#' @inheritParams expand_grid
#' @param data A data frame.
#' @param ... Specification of columns to expand. Columns can be atomic vectors
#'   or lists.
#'
#'   * To find all unique combinations of `x`, `y` and `z`, including those not
#'     present in the data, supply each variable as a separate argument:
#'     `expand(df, x, y, z)`.
#'   * To find only the combinations that occur in the
#'     data, use `nesting`: `expand(df, nesting(x, y, z))`.
#'   * You can combine the two forms. For example,
#'     `expand(df, nesting(school_id, student_id), date)` would produce
#'     a row for each present school-student combination for all possible
#'     dates.
#'
#'   When used with factors, `expand()` uses the full set of levels, not just
#'   those that appear in the data. If you want to use only the values seen in
#'   the data, use `forcats::fct_drop()`.
#'
#'   When used with continuous variables, you may need to fill in values
#'   that do not appear in the data: to do so use expressions like

#'   `year = 2010:2020` or `year = full_seq(year,1)`.
#' @seealso [complete()] to expand list objects. [expand_grid()]
#'   to input vectors rather than a data frame.
#' @export
#' @examples
#' fruits <- tibble(
#'   type   = c("apple", "orange", "apple", "orange", "orange", "orange"),
#'   year   = c(2010, 2010, 2012, 2010, 2010, 2012),
#'   size  =  factor(
#'     c("XS", "S",  "M", "S", "S", "M"),
#'     levels = c("XS", "S", "M", "L")
#'   ),
#'   weights = rnorm(6, as.numeric(size) + 2)
#' )
#'
#' # All possible combinations ---------------------------------------
#' # Note that all defined, but not necessarily present, levels of the
#' # factor variable `size` are retained.
#' fruits %>% expand(type)
#' fruits %>% expand(type, size)
#' fruits %>% expand(type, size, year)
#'
#' # Only combinations that already appear in the data ---------------
#' fruits %>% expand(nesting(type))
#' fruits %>% expand(nesting(type, size))
#' fruits %>% expand(nesting(type, size, year))
#'
#' # Other uses -------------------------------------------------------
#' # Use with `full_seq()` to fill in values of continuous variables
#' fruits %>% expand(type, size, full_seq(year, 1))
#' fruits %>% expand(type, size, 2010:2012)
#'
#' # Use `anti_join()` to determine which observations are missing
#' all <- fruits %>% expand(type, size, year)
#' all
#' all %>% dplyr::anti_join(fruits)
#'
#' # Use with `right_join()` to fill in missing rows
#' fruits %>% dplyr::right_join(all)
expand <- function(data, ..., .name_repair = "check_unique") {
  UseMethod("expand")
}

#' @export
expand.data.frame <- function(data, ..., .name_repair = "check_unique") {
  cols <- dots_cols(..., `_data` = data)
  cols[] <- map(cols, sorted_unique)

  out <- expand_grid(!!!cols, .name_repair = .name_repair)
  out <- flatten_nested(out, attr(cols, "named"), .name_repair = .name_repair)

  reconstruct_tibble(data, out)
}

#' @export
expand.grouped_df <- function(data, ..., .name_repair = "check_unique") {
  dplyr::do(data, expand(., ..., .name_repair = .name_repair))
}

# Nesting & crossing ------------------------------------------------------

#' @rdname expand
#' @export
crossing <- function(..., .name_repair = "check_unique") {
  cols <- dots_cols(...)
  cols[] <- map(cols, sorted_unique)

  out <- expand_grid(!!!cols, .name_repair = .name_repair)
  flatten_nested(out, attr(cols, "named"), .name_repair)
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

#' @rdname expand
#' @export
nesting <- function(..., .name_repair = "check_unique") {
  cols <- dots_cols(...)
  out <- sorted_unique(tibble(!!!cols, .name_repair = .name_repair))
  flatten_nested(out, attr(cols, "named"), .name_repair)
}

# expand_grid -------------------------------------------------------------

#' Create a tibble from all combinations of inputs
#'
#' @description
#' `expand_grid()` is heavily motivated by [expand.grid()].
#' Compared to `expand.grid()`, it:
#'
#' * Produces sorted output (by varying the first column the slowest, rather
#'   than the fastest).
#' * Returns a tibble, not a data frame.
#' * Never converts strings to factors.
#' * Does not add any additional attributes.
#' * Can expand any generalised vector, including data frames.
#'
#' @param ... Name-value pairs. The name will become the column name in the
#'   output.
#' @inheritParams tibble::as_tibble
#' @return A tibble with one column for each input in `...`. The output
#'   will have one row for each combination of the inputs, i.e. the size
#'   be equal to the product of the sizes of the inputs. This implies
#'   that if any input has length 0, the output will have zero rows.
#' @export
#' @examples
#' expand_grid(x = 1:3, y = 1:2)
#' expand_grid(l1 = letters, l2 = LETTERS)
#'
#' # Can also expand data frames
#' expand_grid(df = data.frame(x = 1:2, y = c(2, 1)), z = 1:3)
#' # And matrices
#' expand_grid(x1 = matrix(1:4, nrow = 2), x2 = matrix(5:8, nrow = 2))
expand_grid <- function(..., .name_repair = "check_unique") {
  dots <- dots_cols(...)

  # Generate sequence of indices
  ns <- map_int(dots, vec_size)
  n <- prod(ns)

  if (n == 0) {
    out <- map(dots, vec_slice, integer())
  } else {
    each <- n / cumprod(ns)
    times <- n / each / ns

    out <- pmap(list(x = dots, each = each, times = times), vec_repeat)
  }
  out <- as_tibble(out, .name_repair = .name_repair)

  flatten_nested(out, attr(dots, "named"), .name_repair)
}

# Helpers -----------------------------------------------------------------

dots_cols <- function(..., `_data` = NULL) {
  dots <- enquos(...)
  named <- names(dots) != ""

  dots <- quos_auto_name(dots)

  out <- as.list(`_data`)
  for (i in seq_along(dots)) {
    out[[names(dots)[[i]]]] <- eval_tidy(dots[[i]], data = out)
  }
  out <- out[names(dots)]

  is_null <- map_lgl(out, is.null)
  if (any(is_null)) {
    out <- out[!is_null]
    named <- named[!is_null]
  }

  structure(out, named = named)
}

# flatten unnamed nested data frames to preserve existing behaviour
flatten_nested <- function(x, named, .name_repair) {
  to_flatten <- !named & unname(map_lgl(x, is.data.frame))
  out <- flatten_at(x, to_flatten)
  as_tibble(out, .name_repair = .name_repair)
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
    if (cols[[i]] == 0) {
      next
    }

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

