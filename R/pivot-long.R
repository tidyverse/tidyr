#' Pivot data from wide to long
#'
#' @description
#' `pivot_longer()` "lengthens" data, increasing the number of rows and
#' decreasing the number of columns. The inverse transformation is
#' [pivot_wider()]
#'
#' Learn more in `vignette("pivot")`.
#'
#' @details
#' `pivot_longer()` is an updated approach to [gather()], designed to be both
#' simpler to use and to handle more use cases. We recommend you use
#' `pivot_longer()` for new code; `gather()` isn't going away but is no longer
#' under active development.
#'
#' @param data A data frame to pivot.
#' @param cols <[`tidy-select`][tidyr_tidy_select]> Columns to pivot into
#'   longer format.
#' @param cols_vary When pivoting `cols` into longer format, how should the
#'   output rows be arranged relative to their original row number?
#'
#'   * `"fastest"`, the default, keeps individual rows from `cols` close
#'     together in the output. This often produces intuitively ordered output
#'     when you have at least one key column from `data` that is not involved in
#'     the pivoting process.
#'
#'   * `"slowest"` keeps individual columns from `cols` close together in the
#'     output. This often produces intuitively ordered output when you utilize
#'     all of the columns from `data` in the pivoting process.
#' @param names_to A character vector specifying the new column or columns to
#'   create from the information stored in the column names of `data` specified
#'   by `cols`.
#'
#'   * If length 0, or if `NULL` is supplied, no columns will be created.
#'
#'   * If length 1, a single column will be created which will contain the
#'     column names specified by `cols`.
#'
#'   * If length >1, multiple columns will be created. In this case, one of
#'     `names_sep` or `names_pattern` must be supplied to specify how the
#'     column names should be split. There are also two additional character
#'     values you can take advantage of:
#'
#'     * `NA` will discard the corresponding component of the column name.
#'
#'     * `".value"` indicates that the corresponding component of the column
#'       name defines the name of the output column containing the cell values,
#'       overriding `values_to` entirely.
#' @param names_prefix A regular expression used to remove matching text
#'   from the start of each variable name.
#' @param names_sep,names_pattern If `names_to` contains multiple values,
#'   these arguments control how the column name is broken up.
#'
#'   `names_sep` takes the same specification as [separate()], and can either
#'   be a numeric vector (specifying positions to break on), or a single string
#'   (specifying a regular expression to split on).
#'
#'   `names_pattern` takes the same specification as [extract()], a regular
#'   expression containing matching groups (`()`).
#'
#'   If these arguments do not give you enough control, use
#'   `pivot_longer_spec()` to create a spec object and process manually as
#'   needed.
#' @param names_repair What happens if the output has invalid column names?
#'   The default, `"check_unique"` is to error if the columns are duplicated.
#'   Use `"minimal"` to allow duplicates in the output, or `"unique"` to
#'   de-duplicated by adding numeric suffixes. See [vctrs::vec_as_names()]
#'   for more options.
#' @param values_to A string specifying the name of the column to create
#'   from the data stored in cell values. If `names_to` is a character
#'   containing the special `.value` sentinel, this value will be ignored,
#'   and the name of the value column will be derived from part of the
#'   existing column names.
#' @param values_drop_na If `TRUE`, will drop rows that contain only `NA`s
#'   in the `value_to` column. This effectively converts explicit missing values
#'   to implicit missing values, and should generally be used only when missing
#'   values in `data` were created by its structure.
#' @param names_transform,values_transform Optionally, a list of column
#'   name-function pairs. Alternatively, a single function can be supplied,
#'   which will be applied to all columns. Use these arguments if you need to
#'   change the types of specific columns. For example, `names_transform =
#'   list(week = as.integer)` would convert a character variable called `week`
#'   to an integer.
#'
#'   If not specified, the type of the columns generated from `names_to` will
#'   be character, and the type of the variables generated from `values_to`
#'   will be the common type of the input columns used to generate them.
#' @param names_ptypes,values_ptypes Optionally, a list of column name-prototype
#'   pairs. Alternatively, a single empty prototype can be supplied, which will
#'   be applied to all columns. A prototype (or ptype for short) is a
#'   zero-length vector (like `integer()` or `numeric()`) that defines the type,
#'   class, and attributes of a vector. Use these arguments if you want to
#'   confirm that the created columns are the types that you expect. Note that
#'   if you want to change (instead of confirm) the types of specific columns,
#'   you should use `names_transform` or `values_transform` instead.
#'
#'   For backwards compatibility reasons, supplying `list()` is interpreted as
#'   being identical to `NULL` rather than as using a list prototype on all
#'   columns. Expect this to change in the future.
#' @param ... Additional arguments passed on to methods.
#' @export
#' @examples
#' # See vignette("pivot") for examples and explanation
#'
#' # Simplest case where column names are character data
#' relig_income
#' relig_income %>%
#'   pivot_longer(!religion, names_to = "income", values_to = "count")
#'
#' # Slightly more complex case where columns have common prefix,
#' # and missing missings are structural so should be dropped.
#' billboard
#' billboard %>%
#'   pivot_longer(
#'     cols = starts_with("wk"),
#'     names_to = "week",
#'     names_prefix = "wk",
#'     values_to = "rank",
#'     values_drop_na = TRUE
#'   )
#'
#' # Multiple variables stored in column names
#' who %>% pivot_longer(
#'   cols = new_sp_m014:newrel_f65,
#'   names_to = c("diagnosis", "gender", "age"),
#'   names_pattern = "new_?(.*)_(.)(.*)",
#'   values_to = "count"
#' )
#'
#' # Multiple observations per row. Since all columns are used in the pivoting
#' # process, we'll use `cols_vary` to keep values from the original columns
#' # close together in the output.
#' anscombe
#' anscombe %>%
#'   pivot_longer(
#'     everything(),
#'     cols_vary = "slowest",
#'     names_to = c(".value", "set"),
#'     names_pattern = "(.)(.)"
#'   )
pivot_longer <- function(data,
                         cols,
                         ...,
                         cols_vary = "fastest",
                         names_to = "name",
                         names_prefix = NULL,
                         names_sep = NULL,
                         names_pattern = NULL,
                         names_ptypes = NULL,
                         names_transform = NULL,
                         names_repair = "check_unique",
                         values_to = "value",
                         values_drop_na = FALSE,
                         values_ptypes = NULL,
                         values_transform = NULL) {
  check_dots_used()
  UseMethod("pivot_longer")
}

#' @export
pivot_longer.data.frame <- function(data,
                                    cols,
                                    ...,
                                    cols_vary = "fastest",
                                    names_to = "name",
                                    names_prefix = NULL,
                                    names_sep = NULL,
                                    names_pattern = NULL,
                                    names_ptypes = NULL,
                                    names_transform = NULL,
                                    names_repair = "check_unique",
                                    values_to = "value",
                                    values_drop_na = FALSE,
                                    values_ptypes = NULL,
                                    values_transform = NULL) {
  spec <- build_longer_spec(
    data = data,
    cols = {{ cols }},
    names_to = names_to,
    values_to = values_to,
    names_prefix = names_prefix,
    names_sep = names_sep,
    names_pattern = names_pattern,
    names_ptypes = names_ptypes,
    names_transform = names_transform
  )

  pivot_longer_spec(
    data = data,
    spec = spec,
    cols_vary = cols_vary,
    names_repair = names_repair,
    values_drop_na = values_drop_na,
    values_ptypes = values_ptypes,
    values_transform = values_transform
  )
}


#' Pivot data from wide to long using a spec
#'
#' This is a low level interface to pivoting, inspired by the cdata package,
#' that allows you to describe pivoting with a data frame.
#'
#' @keywords internal
#' @export
#' @inheritParams rlang::args_dots_empty
#' @inheritParams pivot_longer
#' @param spec A specification data frame. This is useful for more complex
#'  pivots because it gives you greater control on how metadata stored in the
#'  column names turns into columns in the result.
#'
#'   Must be a data frame containing character `.name` and `.value` columns.
#'   Additional columns in `spec` should be named to match columns in the
#'   long format of the dataset and contain values corresponding to columns
#'   pivoted from the wide format.
#'   The special `.seq` variable is used to disambiguate rows internally;
#'   it is automatically removed after pivoting.
#'
#' @examples
#' # See vignette("pivot") for examples and explanation
#'
#' # Use `build_longer_spec()` to build `spec` using similar syntax to `pivot_longer()`
#' # and run `pivot_longer_spec()` based on `spec`.
#' spec <- relig_income %>% build_longer_spec(
#'   cols = !religion,
#'   names_to = "income",
#'   values_to = "count"
#' )
#' spec
#'
#' pivot_longer_spec(relig_income, spec)
#'
#' # Is equivalent to:
#' relig_income %>% pivot_longer(
#'   cols = !religion,
#'   names_to = "income",
#'   values_to = "count"
#' )
pivot_longer_spec <- function(data,
                              spec,
                              ...,
                              cols_vary = "fastest",
                              names_repair = "check_unique",
                              values_drop_na = FALSE,
                              values_ptypes = NULL,
                              values_transform = NULL) {
  check_dots_empty0(...)

  spec <- check_pivot_spec(spec)
  spec <- deduplicate_spec(spec, data)

  cols_vary <- arg_match0(
    arg = cols_vary,
    values = c("fastest", "slowest")
  )

  # Quick hack to ensure that split() preserves order
  v_fct <- factor(spec$.value, levels = unique(spec$.value))
  values <- split(spec$.name, v_fct)
  value_names <- names(values)
  value_keys <- split(spec[-(1:2)], v_fct)
  keys <- vec_unique(spec[-(1:2)])

  if (identical(values_ptypes, list())) {
    # TODO: Remove me after https://github.com/tidyverse/tidyr/issues/1296
    values_ptypes <- NULL
  }
  values_ptypes <- check_list_of_ptypes(values_ptypes, value_names)
  values_transform <- check_list_of_functions(values_transform, value_names)

  vals <- set_names(vec_init(list(), length(values)), value_names)
  for (value in value_names) {
    cols <- values[[value]]
    col_id <- vec_match(value_keys[[value]], keys)

    n_val_cols <- nrow(keys)

    val_cols <- vec_init(list(), n_val_cols)
    val_cols[col_id] <- unname(as.list(data[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(data)))

    if (has_name(values_transform, value)) {
      val_cols <- lapply(val_cols, values_transform[[value]])
    }

    # Name inputs that came from `data`, just for good error messages when
    # taking the common type and casting
    names <- vec_rep("", times = n_val_cols)
    names[col_id] <- cols

    names(val_cols) <- names
    val_type <- vec_ptype_common(!!!val_cols[col_id], .ptype = values_ptypes[[value]])
    val_cols <- vec_cast_common(!!!val_cols, .to = val_type)
    val_cols <- unname(val_cols)

    if (cols_vary == "slowest") {
      vals[[value]] <- list_unchop(val_cols, ptype = val_type)
    } else if (cols_vary == "fastest") {
      vals[[value]] <- vec_interleave(!!!val_cols, .ptype = val_type)
    } else {
      cli::cli_abort("Unknown {arg cols_vary} value.", .internal = TRUE)
    }
  }
  vals <- as_tibble(vals)

  # Join together data, keys, and vals to produce final tibble
  data_cols <- drop_cols(as_tibble(data, .name_repair = "minimal"), spec$.name)

  times_keys <- vec_size(data_cols)
  times_data_cols <- vec_size(keys)

  if (cols_vary == "slowest") {
    data_cols <- vec_rep(data_cols, times_data_cols)
    keys <- vec_rep_each(keys, times_keys)
  } else if (cols_vary == "fastest") {
    data_cols <- vec_rep_each(data_cols, times_data_cols)
    keys <- vec_rep(keys, times_keys)
  } else {
    cli::cli_abort("Unknown {arg cols_vary} value.", .internal = TRUE)
  }

  out <- wrap_error_names(vec_cbind(
    data_cols,
    keys,
    vals,
    .name_repair = names_repair,
    .error_call = current_env()
  ))

  if (values_drop_na && vec_any_missing(vals)) {
    out <- vec_slice(out, !vec_detect_missing(vals))
  }

  out$.seq <- NULL

  reconstruct_tibble(data, out)
}

#' @rdname pivot_longer_spec
#' @export
build_longer_spec <- function(data,
                              cols,
                              ...,
                              names_to = "name",
                              values_to = "value",
                              names_prefix = NULL,
                              names_sep = NULL,
                              names_pattern = NULL,
                              names_ptypes = NULL,
                              names_transform = NULL) {
  check_dots_empty0(...)
  check_data_frame(data)
  check_required(cols)
  check_character(names_to, allow_null = TRUE)

  cols <- tidyselect::eval_select(enquo(cols), data[unique(names(data))], allow_rename = FALSE)
  cols <- names(cols)

  if (length(cols) == 0) {
    cli::cli_abort("{.arg cols} must select at least one column.")
  }

  if (is.null(names_prefix)) {
    names <- cols
  } else {
    names <- gsub(vec_paste0("^", names_prefix), "", cols)
  }

  if (is.null(names_to)) {
    names_to <- character(0L)
  }

  n_names_to <- length(names_to)
  has_names_sep <- !is.null(names_sep)
  has_names_pattern <- !is.null(names_pattern)

  if (n_names_to == 0L) {
    names <- tibble::new_tibble(x = list(), nrow = length(names))
  } else if (n_names_to == 1L) {
    if (has_names_sep) {
      cli::cli_abort("{.arg names_sep} can't be used with a length 1 {.arg names_to}.")
    }
    if (has_names_pattern) {
      names <- str_extract(names, names_to, regex = names_pattern)[[1]]
    }

    names <- tibble(!!names_to := names)
  } else {
    if (!xor(has_names_sep, has_names_pattern)) {
      cli::cli_abort(paste0(
        "If you supply multiple names in {.arg names_to} you must also supply one",
        " of {.arg names_sep} or {.arg names_pattern}."
      ))
    }

    if (has_names_sep) {
      names <- str_separate(names, names_to, sep = names_sep)
    } else {
      names <- str_extract(names, names_to, regex = names_pattern)
    }
  }

  if (".value" %in% names_to) {
    values_to <- NULL
  } else {
    vec_assert(values_to, ptype = character(), size = 1)
  }

  if (identical(names_ptypes, list())) {
    # TODO: Remove me after https://github.com/tidyverse/tidyr/issues/1296
    names_ptypes <- NULL
  }
  names_ptypes <- check_list_of_ptypes(names_ptypes, names(names), "names_ptypes")
  names_transform <- check_list_of_functions(names_transform, names(names), "names_transform")

  # Optionally, transform cols
  for (col in names(names_transform)) {
    f <- names_transform[[col]]
    names[[col]] <- f(names[[col]])
  }

  # Optionally, cast variables generated from columns
  for (col in names(names_ptypes)) {
    ptype <- names_ptypes[[col]]
    names[[col]] <- vec_cast(names[[col]], ptype, x_arg = col)
  }

  out <- tibble(.name = cols)
  out[[".value"]] <- values_to
  out <- vec_cbind(out, names)
  out
}

drop_cols <- function(df, cols) {
  if (is.character(cols)) {
    df[setdiff(names(df), cols)]
  } else if (is.integer(cols)) {
    df[-cols]
  } else {
    cli::cli_abort("Invalid input", .internal = TRUE)
  }
}

# Ensure that there's a one-to-one match from spec to data by adding
# a special .seq variable which is automatically removed after pivoting.
deduplicate_spec <- function(spec, df) {

  # Ensure each .name has a unique output identifier
  key <- spec[setdiff(names(spec), ".name")]
  if (vec_duplicate_any(key)) {
    pos <- vec_group_loc(key)$loc
    seq <- vector("integer", length = nrow(spec))
    for (i in seq_along(pos)) {
      seq[pos[[i]]] <- seq_along(pos[[i]])
    }
    spec$.seq <- seq
  }

  # Match spec to data, handling duplicated column names
  col_id <- vec_match(names(df), spec$.name)
  has_match <- !is.na(col_id)

  if (!vec_duplicate_any(col_id[has_match])) {
    return(spec)
  }

  spec <- vec_slice(spec, col_id[has_match])
  # Need to use numeric indices because names only match first
  spec$.name <- seq_along(df)[has_match]

  pieces <- vec_split(seq_len(nrow(spec)), col_id[has_match])
  copy <- integer(nrow(spec))
  for (i in seq_along(pieces$val)) {
    idx <- pieces$val[[i]]
    copy[idx] <- seq_along(idx)
  }

  spec$.seq <- copy
  spec
}
