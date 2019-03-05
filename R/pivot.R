#' Pivot data from wide to long or long to wide
#'
#' See details in `vignette("pivot")`
#'
#' @param df A data frame to reshape.
#' @param spec A data frame defining the reshaping specification.
#'   Must contain `.name` and `.value` columns that are character
#'   vectors. See [pivot_wide_spec()] and [pivot_long_spec()] for details.
#' @param na.rm If `TRUE`, will convert explicit missing values to implicit
#'   missing values. Used only when pivotting to long.
#' @param ptype A named list that optionally override the types of
#'   measured columns. Used only when pivotting to long.
#' @inheritParams pivot_long_spec
#' @export
pivot_long <- function(df,
                       cols,
                       names_to = "name",
                       values_to = "value",
                       spec = NULL,
                       na.rm = FALSE,
                       ptype = list()
                       ) {

  if (is.null(spec)) {
    cols <- enquo(cols)
    spec <- pivot_long_spec(df, !!cols, names_to = names_to, values_to = values_to)
  } else {
    spec <- check_spec(spec)
  }

  measures <- split(spec$.name, spec$.value)
  measure_keys <- split(spec[-(1:2)], spec$.value)
  keys <- vec_unique(spec[-(1:2)])

  vals <- set_names(vec_na(list(), length(measures)), names(measures))
  for (measure in names(measures)) {
    cols <- measures[[measure]]
    col_id <- vec_match(measure_keys[[measure]], keys)

    val_cols <- vec_na(list(), nrow(keys))
    val_cols[col_id] <- unname(as.list(df[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(df)))

    val_type <- vec_type_common(!!!val_cols, .ptype = ptype[[measure]])
    out <- vec_c(!!!val_cols, .ptype = val_type)
    # Interleave into correct order
    idx <- (matrix(seq_len(nrow(df) * length(val_cols)), ncol = nrow(df), byrow = TRUE))
    vals[[measure]] <- vec_slice(out, as.integer(idx))
  }
  vals <- as_tibble(vals)

  # Line up output rows by combining spec and existing data frame
  # https://github.com/tidyverse/tidyr/issues/557
  rows <- expand.grid(
    key_id = vec_along(keys),
    df_id = vec_along(df),
    KEEP.OUT.ATTRS = FALSE
  )
  rows$val_id <- vec_along(rows)

  if (na.rm) {
    # https://github.com/r-lib/vctrs/issues/201
    rows <- vec_slice(rows, !vec_equal_na(vals))
  }

  # Join together df, spec, and val to produce final tibble
  out <- vec_cbind(
    vec_slice(keys, rows$key_id),
    vec_slice(vals, rows$val_id),
  )

  # Bind original keys back on if there are any
  # Because of https://github.com/r-lib/vctrs/issues/199
  df_out <- df[setdiff(names(df), spec$.name)]
  if (ncol(df_out) > 0) {
    out <- vec_cbind(vec_slice(df_out, rows$df_id), out)
  }
  out
}

# https://github.com/r-lib/vctrs/issues/189
vec_along <- function(x) {
  seq_len(vec_size(x))
}

#' @export
#' @rdname pivot_long
#' @inheritParams pivot_wide_spec
#' @param values_fill Optionally, a named list specifying what each `value`
#'   should be filled in with when missing.
pivot_wide <- function(df,
                       names_from = name,
                       values_from = value,
                       names_prefix = "",
                       names_sep = "_",
                       values_fill = NULL,
                       spec = NULL) {

  if (is.null(spec)) {
    names_from <- enquo(names_from)
    values_from <- enquo(values_from)

    spec <- pivot_wide_spec(df,
      names_from = !!names_from,
      values_from = !!values_from,
      names_prefix = names_prefix,
      names_sep = names_sep
    )
  } else {
    spec <- check_spec(spec)
  }

  measures <- vec_unique(spec$.value)
  spec_cols <- c(names(spec)[-(1:2)], measures)

  # Figure out rows in output
  df_rows <- df[setdiff(names(df), spec_cols)]
  if (ncol(df_rows) == 0) {
    rows <- tibble(.rows = 1)
    row_id <- rep(1L, nrow(spec))
  } else {
    rows <- vec_unique(df_rows)
    row_id <- vec_match(df_rows, rows)
  }

  measure_specs <- unname(split(spec, spec$.value))
  measure_out <- vec_na(list(), length(measure_specs))

  for (i in seq_along(measure_out)) {
    spec <- measure_specs[[i]]
    measure <- spec$.value[[1]]
    val <- df[[measure]]

    cols <- df[names(spec)[-(1:2)]]
    col_id <- vec_match(cols, spec[-(1:2)])
    val_id <- data.frame(row = row_id, col = col_id)
    if (vec_duplicate_any(val_id)) {
      warn("Values are not uniquely identified; output will contain list-columns")

      # https://github.com/r-lib/vctrs/issues/196
      val <- unname(split(val, vec_duplicate_id(val_id)))
      val_id <- vec_unique(val_id)
    }

    nrow <- nrow(rows)
    ncol <- nrow(spec)

    fill <- values_fill[[measure]]
    if (is.null(fill)) {
      out <- vec_na(val, nrow * ncol)
    } else {
      stopifnot(vec_size(fill) == 1)
      fill <- vec_cast(fill, val)
      out <- vec_repeat(fill, nrow * ncol)
    }
    vec_slice(out, val_id$row + nrow * (val_id$col - 1L)) <- val

    measure_out[[i]] <- wrap_vec(out, spec$.name)
  }
  vec_cbind(rows, !!!measure_out)
}

# Wrap a "rectangular" vector into a data frame
wrap_vec <- function(vec, names) {
  ncol <- length(names)
  nrow <- length(vec) / ncol
  out <- set_names(vec_na(list(), ncol), names)
  for (i in 1:ncol) {
    out[[i]] <- vec_slice(vec, ((i - 1) * nrow + 1):(i * nrow))
  }

  as_tibble(out)
}

# Helpers -----------------------------------------------------------------

check_spec <- function(spec) {
  # Eventually should just be vec_assert() on partial_frame()
  # Waiting for https://github.com/r-lib/vctrs/issues/198

  if (!is.data.frame(spec)) {
    stop("`spec` must be a data frame", call. = FALSE)
  }

  if (!has_name(spec, ".name") || !has_name(spec, ".value")) {
    stop("`spec` must have `.name` and `.value` columns", call. = FALSE)
  }

  # Ensure .name and .value come first
  vars <- union(c(".name", ".value"), names(spec))
  spec[vars]
}
