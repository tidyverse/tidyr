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
#' @section Grouped data frames:
#' With grouped data frames created by [dplyr::group_by()], `expand()` operates
#' _within_ each group. Because of this, you cannot expand on a grouping column.
#'
#' @inheritParams expand_grid
#' @param data A data frame.
#' @param ... <[`data-masking`][tidyr_data_masking]> Specification of columns
#'   to expand or complete. Columns can be atomic vectors or lists.
#'
#'   * To find all unique combinations of `x`, `y` and `z`, including those not
#'     present in the data, supply each variable as a separate argument:
#'     `expand(df, x, y, z)` or `complete(df, x, y, z)`.
#'   * To find only the combinations that occur in the
#'     data, use `nesting`: `expand(df, nesting(x, y, z))`.
#'   * You can combine the two forms. For example,
#'     `expand(df, nesting(school_id, student_id), date)` would produce
#'     a row for each present school-student combination for all possible
#'     dates.
#'
#'   When used with factors, [expand()] and [complete()] use the full set of
#'   levels, not just those that appear in the data. If you want to use only the
#'   values seen in the data, use `forcats::fct_drop()`.
#'
#'   When used with continuous variables, you may need to fill in values
#'   that do not appear in the data: to do so use expressions like
#'   `year = 2010:2020` or `year = full_seq(year,1)`.
#' @seealso [complete()] to expand list objects. [expand_grid()]
#'   to input vectors rather than a data frame.
#' @export
#' @examples
#' # Finding combinations ------------------------------------------------------
#' fruits <- tibble(
#'   type = c("apple", "orange", "apple", "orange", "orange", "orange"),
#'   year = c(2010, 2010, 2012, 2010, 2011, 2012),
#'   size = factor(
#'     c("XS", "S", "M", "S", "S", "M"),
#'     levels = c("XS", "S", "M", "L")
#'   ),
#'   weights = rnorm(6, as.numeric(size) + 2)
#' )
#'
#' # All combinations, including factor levels that are not used
#' fruits %>% expand(type)
#' fruits %>% expand(size)
#' fruits %>% expand(type, size)
#' fruits %>% expand(type, size, year)
#'
#' # Only combinations that already appear in the data
#' fruits %>% expand(nesting(type))
#' fruits %>% expand(nesting(size))
#' fruits %>% expand(nesting(type, size))
#' fruits %>% expand(nesting(type, size, year))
#'
#' # Other uses ----------------------------------------------------------------
#' # Use with `full_seq()` to fill in values of continuous variables
#' fruits %>% expand(type, size, full_seq(year, 1))
#' fruits %>% expand(type, size, 2010:2013)
#'
#' # Use `anti_join()` to determine which observations are missing
#' all <- fruits %>% expand(type, size, year)
#' all
#' all %>% dplyr::anti_join(fruits)
#'
#' # Use with `right_join()` to fill in missing rows (like `complete()`)
#' fruits %>% dplyr::right_join(all)
#'
#' # Use with `group_by()` to expand within each group
#' fruits %>%
#'   dplyr::group_by(type) %>%
#'   expand(year, size)
expand <- function(data, ..., .name_repair = "check_unique") {
  UseMethod("expand")
}

#' @export
expand.data.frame <- function(data, ..., .name_repair = "check_unique") {
  out <- grid_dots(..., `_data` = data)
  out <- map(out, sorted_unique)

  # Flattens unnamed data frames returned from `grid_dots()`
  out <- expand_grid(!!!out, .name_repair = .name_repair)

  reconstruct_tibble(data, out)
}

#' @export
expand.grouped_df <- function(data, ..., .name_repair = "check_unique") {
  out <- dplyr::reframe(
    data,
    expand(
      data = dplyr::pick(everything()),
      ...,
      .name_repair = .name_repair
    )
  )

  drop <- dplyr::group_by_drop_default(data)

  dplyr::group_by(
    out,
    !!!dplyr::groups(data),
    .drop = drop
  )
}

# Nesting & crossing ------------------------------------------------------

#' @rdname expand
#' @export
crossing <- function(..., .name_repair = "check_unique") {
  out <- grid_dots(...)
  out <- map(out, sorted_unique)

  # Flattens unnamed data frames returned from `grid_dots()`
  expand_grid(!!!out, .name_repair = .name_repair)
}

#' @rdname expand
#' @export
nesting <- function(..., .name_repair = "check_unique") {
  out <- grid_dots(...)

  if (length(out) == 0L) {
    # This matches `crossing()`, `expand_grid()`, and `expand()`, which return
    # a 1 row / 0 col tibble. Computations involving the number of combinations
    # of an empty set should return 1.
    size <- 1L
  } else {
    size <- NULL
  }

  # Flattens unnamed data frames
  out <- data_frame(!!!out, .size = size, .name_repair = .name_repair)
  out <- tibble::new_tibble(out, nrow = vec_size(out))

  out <- sorted_unique(out)

  out
}

# expand_grid -------------------------------------------------------------

#' Create a tibble from all combinations of inputs
#'
#' @description
#' `expand_grid()` is heavily motivated by [expand.grid()].
#' Compared to `expand.grid()`, it:
#'
#' * Produces sorted output by varying the first column the slowest by default.
#' * Returns a tibble, not a data frame.
#' * Never converts strings to factors.
#' * Does not add any additional attributes.
#' * Can expand any generalised vector, including data frames.
#'
#' @inheritParams vctrs::vec_expand_grid
#'
#' @param ... Name-value pairs. The name will become the column name in the
#'   output.
#'
#' @return A tibble with one column for each input in `...`. The output will
#'   have one row for each combination of the inputs, i.e. the size will be
#'   equal to the product of the sizes of the inputs. This implies that if any
#'   input has length 0, the output will have zero rows. The ordering of the
#'   output depends on the `.vary` argument.
#'
#' @export
#' @examples
#' # Default behavior varies the first column "slowest"
#' expand_grid(x = 1:3, y = 1:2)
#'
#' # Vary the first column "fastest", like `expand.grid()`
#' expand_grid(x = 1:3, y = 1:2, .vary = "fastest")
#'
#' # Can also expand data frames
#' expand_grid(df = tibble(x = 1:2, y = c(2, 1)), z = 1:3)
#'
#' # And matrices
#' expand_grid(x1 = matrix(1:4, nrow = 2), x2 = matrix(5:8, nrow = 2))
expand_grid <- function(..., .name_repair = "check_unique", .vary = "slowest") {
  out <- grid_dots(...)

  names <- names2(out)
  unnamed <- which(names == "")
  any_unnamed <- any(unnamed)

  if (any_unnamed) {
    # `vec_expand_grid()` requires all inputs to be named.
    # Most are auto named by `grid_dots()`, but unnamed data frames are not.
    # So we temporarily name unnamed data frames that eventually get spliced.
    names[unnamed] <- vec_paste0("...", unnamed)
    names(out) <- names
  }

  out <- vec_expand_grid(
    !!!out,
    .vary = .vary,
    .name_repair = "minimal",
    .error_call = current_env()
  )

  if (any_unnamed) {
    names[unnamed] <- ""
    names(out) <- names
  }

  size <- vec_size(out)

  # Flattens unnamed data frames after grid expansion
  out <- tidyr_new_list(out)
  out <- df_list(!!!out, .name_repair = .name_repair, .error_call = current_env())
  out <- tibble::new_tibble(out, nrow = size)

  out
}

# Helpers -----------------------------------------------------------------

sorted_unique <- function(x) {
  if (is.factor(x)) {
    fct_unique(x)
  } else if (is_bare_list(x)) {
    vec_unique(x)
  } else {
    vec_sort(vec_unique(x))
  }
}

# forcats::fct_unique
fct_unique <- function(x) {
  levels <- levels(x)
  out <- levels

  if (!anyNA(levels) && anyNA(x)) {
    out <- c(out, NA_character_)
  }

  factor(out, levels = levels, exclude = NULL, ordered = is.ordered(x))
}

grid_dots <- function(..., `_data` = NULL, .error_call = caller_env()) {
  dots <- enquos(...)
  n_dots <- length(dots)

  names <- names(dots)
  needs_auto_name <- names == ""

  # Silently uniquely repair "auto-names" to avoid collisions
  # from truncated long names. Probably not a perfect system, but solves
  # most of the reported issues.
  auto_names <- names(exprs_auto_name(
    exprs = dots[needs_auto_name],
    repair_auto = "unique",
    repair_quiet = TRUE
  ))

  names[needs_auto_name] <- auto_names

  # Set up a mask for repeated `eval_tidy()` calls that support iterative
  # expressions
  env <- new_environment()
  mask <- new_data_mask(env)
  mask$.data <- as_data_pronoun(env)

  if (!is.null(`_data`)) {
    # Pre-load the data mask with `_data`
    cols <- tidyr_new_list(`_data`)
    col_names <- names(cols)

    for (i in seq_along(cols)) {
      col <- cols[[i]]
      col_name <- col_names[[i]]
      env[[col_name]] <- col
    }
  }

  out <- vector("list", length = n_dots)
  null <- vector("logical", length = n_dots)

  for (i in seq_len(n_dots)) {
    dot <- dots[[i]]
    dot <- eval_tidy(dot, data = mask)

    if (is.null(dot)) {
      null[[i]] <- TRUE
      next
    }

    arg <- paste0("..", i)
    vec_assert(dot, arg = arg, call = .error_call)

    out[[i]] <- dot

    is_unnamed_data_frame <- is.data.frame(dot) && needs_auto_name[[i]]

    if (is_unnamed_data_frame) {
      # Signal that unnamed data frame should be spliced by setting its name
      # to `""`. Then add its individual columns into the mask.
      names[[i]] <- ""

      dot_names <- names(dot)

      for (i in seq_along(dot)) {
        dot_col <- dot[[i]]
        dot_name <- dot_names[[i]]
        env[[dot_name]] <- dot_col
      }
    } else {
      # Install `dot` in the mask for iterative evaluations
      name <- names[[i]]
      env[[name]] <- dot
    }
  }

  if (any(null)) {
    out <- out[!null]
    names <- names[!null]
  }

  names(out) <- names

  out
}
