#' Pivot data from long to wide
#
#' @description
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("maturing")}
#'
#' `pivot_wider()` "widens" data, increasing the number of columns and
#' decreasing the number of rows. The inverse transformation is
#' [pivot_longer()].
#'
#' Learn more in `vignette("pivot")`.
#'
#' @details
#' `pivot_wider()` is an updated approach to [spread()], designed to be both
#' simpler to use and to handle more use cases. We recommend you use
#' `pivot_wider()` for new code; `spread()` isn't going away but is no longer
#' under active development.
#'
#' @seealso [pivot_wider_spec()] to pivot "by hand" with a data frame that
#'   defines a pivotting specification.
#' @inheritParams pivot_longer
#' @param id_cols <[`tidy-select`][tidyr_tidy_select]> A set of columns that
#'   uniquely identifies each observation. Defaults to all columns in `data`
#'   except for the columns specified in `names_from` and `values_from`.
#'   Typically used when you have additional variables that are directly
#'   related.
#' @param names_from,values_from <[`tidy-select`][tidyr_tidy_select]> A pair of
#'   arguments describing which column (or columns) to get the name of the
#'   output column (`name_from`), and which column (or columns) to get the
#'   cell values from (`values_from`).
#'
#'   If `values_from` contains multiple values, the value will be added to the
#'   front of the output column.
#' @param names_sep If `names_from` or `values_from` contains multiple
#'   variables, this will be used to join their values together into a single
#'   string to use as a column name.
#' @param names_prefix String added to the start of every variable name. This is
#'   particularly useful if `names_from` is a numeric vector and you want to
#'   create syntactic variable names.
#' @param names_glue Instead of `names_sep` and `names_prefix`, you can supply
#'   a glue specification that uses the `names_from` columns (and special
#'   `.value`) to create custom column names.
#' @param values_fill Optionally, a value that specifies what each `value`
#'   should be filled in with when missing.
#'
#'   This can be a named list if you want to apply different aggregations
#'   to different value columns.
#' @param values_fn Optionally, a function applied to the `value` in each cell
#'   in the output. You will typically use this when the combination of
#'   `id_cols` and `value` column does not uniquely identify an observation.
#'
#'   This can be a named list if you want to apply different aggregations
#'   to different value columns.
#' @export
#' @examples
#' # See vignette("pivot") for examples and explanation
#'
#' fish_encounters
#' fish_encounters %>%
#'   pivot_wider(names_from = station, values_from = seen)
#' # Fill in missing values
#' fish_encounters %>%
#'   pivot_wider(names_from = station, values_from = seen, values_fill = 0)
#'
#' # Generate column names from multiple variables
#' us_rent_income
#' us_rent_income %>%
#'   pivot_wider(names_from = variable, values_from = c(estimate, moe))
#'
#' # When there are multiple `names_from` or `values_from`, you can use
#' # use `names_sep` or `names_glue` to control the output variable names
#' us_rent_income %>%
#'   pivot_wider(
#'     names_from = variable,
#'     names_sep = ".",
#'     values_from = c(estimate, moe)
#'   )
#' us_rent_income %>%
#'   pivot_wider(
#'     names_from = variable,
#'     names_glue = "{variable}_{.value}",
#'     values_from = c(estimate, moe)
#'   )
#'
#' # Can perform aggregation with values_fn
#' warpbreaks <- as_tibble(warpbreaks[c("wool", "tension", "breaks")])
#' warpbreaks
#' warpbreaks %>%
#'   pivot_wider(
#'     names_from = wool,
#'     values_from = breaks,
#'     values_fn = mean
#'   )
pivot_wider <- function(data,
                        id_cols = NULL,
                        names_from = name,
                        names_prefix = "",
                        names_sep = "_",
                        names_glue = NULL,
                        names_repair = "check_unique",
                        values_from = value,
                        values_fill = NULL,
                        values_fn = NULL) {

  names_from <- enquo(names_from)
  values_from <- enquo(values_from)
  spec <- build_wider_spec(data,
    names_from = !!names_from,
    values_from = !!values_from,
    names_prefix = names_prefix,
    names_sep = names_sep,
    names_glue = names_glue
  )

  id_cols <- enquo(id_cols)
  pivot_wider_spec(data, spec, !!id_cols,
    names_repair = names_repair,
    values_fill = values_fill,
    values_fn = values_fn
  )
}

#' Pivot data from long to wide using a spec
#'
#' This is a low level interface to pivotting, inspired by the cdata package,
#' that allows you to describe pivotting with a data frame.
#'
#' @keywords internal
#' @export
#' @inheritParams pivot_wider
#' @param spec A specification data frame. This is useful for more complex
#'  pivots because it gives you greater control on how metadata stored in the
#'  columns become column names in the result.
#'
#'   Must be a data frame containing character `.name` and `.value` columns.
#'   Additional columns in `spec` should be named to match columns in the
#'   long format of the dataset and contain values corresponding to columns
#'   pivoted from the wide format.
#'   The special `.seq` variable is used to disambiguate rows internally;
#'   it is automatically removed after pivotting.
#'
#' @examples
#' # See vignette("pivot") for examples and explanation
#'
#' us_rent_income
#' spec1 <- us_rent_income %>%
#'   build_wider_spec(names_from = variable, values_from = c(estimate, moe))
#' spec1
#'
#' us_rent_income %>%
#'   pivot_wider_spec(spec1)
#'
#' # Is equivalent to
#' us_rent_income %>%
#'   pivot_wider(names_from = variable, values_from = c(estimate, moe))
#'
#' # `pivot-wider_spec()` provides more control over column names and output format
#' # instead of creating columns with estimate_ and moe_ prefixes,
#' # keep original variable name for estimates and attach _moe as suffix
#' spec2 <- tibble(
#'   .name = c("income", "rent", "income_moe", "rent_moe"),
#'   .value = c("estimate", "estimate", "moe", "moe"),
#'   variable = c("income", "rent", "income", "rent")
#' )
#'
#' us_rent_income %>%
#'   pivot_wider_spec(spec2)
pivot_wider_spec <- function(data,
                                  spec,
                                  names_repair = "check_unique",
                                  id_cols = NULL,
                                  values_fill = NULL,
                                  values_fn = NULL) {
  spec <- check_spec(spec)

  if (is.function(values_fn)) {
    values_fn <- rep_named(unique(spec$.value), list(values_fn))
  }

  if (is_scalar(values_fill)) {
    values_fill <- rep_named(unique(spec$.value), list(values_fill))
  }

  values <- vec_unique(spec$.value)
  spec_cols <- c(names(spec)[-(1:2)], values)

  id_cols <- enquo(id_cols)
  if (!quo_is_null(id_cols)) {
    key_vars <- names(tidyselect::eval_select(enquo(id_cols), data))
  } else {
    key_vars <- tbl_vars(data)
  }
  key_vars <- setdiff(key_vars, spec_cols)

  # Figure out rows in output
  df_rows <- data[key_vars]
  if (ncol(df_rows) == 0) {
    rows <- tibble(.rows = 1)
    nrow <- 1L
    row_id <- rep(1L, nrow(df_rows))
  } else {
    row_id <- vec_group_id(df_rows)
    nrow <- attr(row_id, "n")
    rows <- vec_slice(df_rows, vec_unique_loc(row_id))
  }

  value_specs <- unname(split(spec, spec$.value))
  value_out <- vec_init(list(), length(value_specs))

  for (i in seq_along(value_out)) {
    spec_i <- value_specs[[i]]
    value <- spec_i$.value[[1]]
    val <- data[[value]]

    cols <- data[names(spec_i)[-(1:2)]]
    col_id <- vec_match(as_tibble(cols), spec_i[-(1:2)])
    val_id <- data.frame(row = row_id, col = col_id)

    dedup <- vals_dedup(
      key = val_id,
      val = val,
      value = value,
      summarize = values_fn[[value]]
    )
    val_id <- dedup$key
    val <- dedup$val

    ncol <- nrow(spec_i)

    fill <- values_fill[[value]]
    if (is.null(fill)) {
      out <- vec_init(val, nrow * ncol)
    } else {
      stopifnot(vec_size(fill) == 1)
      fill <- vec_cast(fill, val)
      out <- vec_repeat(fill, nrow * ncol)
    }
    vec_slice(out, val_id$row + nrow * (val_id$col - 1L)) <- val

    value_out[[i]] <- wrap_vec(out, spec_i$.name)
  }

  out <- wrap_error_names(vec_cbind(as_tibble(rows), !!!value_out, .name_repair = names_repair))

  # recreate desired column order
  # https://github.com/r-lib/vctrs/issues/227
  if (all(spec$.name %in% names(out))) {
    out <- out[c(names(rows), spec$.name)]
  }

  reconstruct_tibble(data, out)

}

#' @export
#' @rdname pivot_wider_spec
#' @inheritParams pivot_wider
build_wider_spec <- function(data,
                             names_from = name,
                             values_from = value,
                             names_prefix = "",
                             names_sep = "_",
                             names_glue = NULL) {
  names_from <- tidyselect::eval_select(enquo(names_from), data)
  values_from <- tidyselect::eval_select(enquo(values_from), data)

  row_ids <- vec_unique(data[names_from])
  row_names <- exec(paste, !!!row_ids, sep = names_sep)

  out <- tibble(
    .name = paste0(names_prefix, row_names)
  )

  if (length(values_from) == 1) {
    out$.value <- names(values_from)
  } else {
    out <- vec_repeat(out, times = vec_size(values_from))
    out$.value <- vec_repeat(names(values_from), each = vec_size(row_ids))
    out$.name <- paste0(out$.value, names_sep, out$.name)

    row_ids <- vec_repeat(row_ids, times = vec_size(values_from))
  }

  out <- vec_cbind(out, as_tibble(row_ids), .name_repair = "minimal")
  if (!is.null(names_glue)) {
    out$.name <- as.character(glue::glue_data(out, names_glue))
  }

  out
}

# quiet R CMD check
name <- value <- NULL

# Helpers -----------------------------------------------------------------

# Not a great name as it now also casts
vals_dedup <- function(key, val, value, summarize = NULL) {

  if (is.null(summarize)) {
    if (!vec_duplicate_any(key)) {
      return(list(key = key, val = val))
    }

    warn(glue::glue(
      "Values are not uniquely identified; output will contain list-cols.\n",
      "* Use `values_fn = list` to suppress this warning.\n",
      "* Use `values_fn = length` to identify where the duplicates arise\n",
      "* Use `values_fn = {{summary_fun}}` to summarise duplicates"
    ))
  }

  out <- vec_split(val, key)
  if (!is.null(summarize) && !identical(summarize, list)) {
    summarize <- as_function(summarize)
    # This is only correct if `values_fn` always returns a single value
    # Needs https://github.com/r-lib/vctrs/issues/183
    out$val <- vec_c(!!!map(out$val, summarize))
  }

  out
}

# Wrap a "rectangular" vector into a data frame
wrap_vec <- function(vec, names) {
  ncol <- length(names)
  nrow <- vec_size(vec) / ncol
  out <- set_names(vec_init(list(), ncol), names)
  for (i in 1:ncol) {
    out[[i]] <- vec_slice(vec, ((i - 1) * nrow + 1):(i * nrow))
  }

  as_tibble(out)
}

is_scalar <- function(x) {
  if (is.null(x)) {
    return(FALSE)
  }

  if (is.list(x)) {
    (length(x) == 1) && !have_name(x)
  } else {
    TRUE
  }
}
