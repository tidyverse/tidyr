#' Pivot a data frame from wide to long or long to wide
#'
#' `pivot()` is provides rectangular reshaping like `gather()` and `spread()`.
#' It differs primarily from existing approaches in tidyr because the details
#' of the reshaping a described by a data frame, `spec`. For simple cases, you
#' can construct the spec with `pivot_spec_long()` and `pivot_spec_wide()`.
#' See details in `vignette("pivot")`
#'
#' @param df A data frame to reshape.
#' @param spec A data frame defining the reshaping specification.
#'   Must contain `col_name` and `measure` columns that are character
#'   vectors.
#' @param na.rm If `TRUE`, will convert explicit missing values to implicit
#'   missing values. Used only when pivotting to long.
#' @param .ptype A named list that optionally override the types of
#'   measured columns. Used only when pivotting to long.
#' @keywords internal
#' @export
pivot <- function(df, spec, na.rm = FALSE, ptypes = NULL) {
  spec <- check_spec(spec)

  # Check colnames match up and error otherwise
  df_in_spec <- all(spec$col_name %in% names(df))
  spec_in_df <- all(setdiff(names(spec), c("col_name", "measure")) %in% names(df))

  if (df_in_spec) {
    pivot_to_long(df, spec, na.rm = na.rm, .ptype = ptypes)
  } else if (spec_in_df) {
    pivot_to_wide(df, spec)
  } else {
    stop("Mismatch between spec and df. Need better message")
  }
}

check_spec <- function(spec) {
  # Eventually should just be vec_assert() on partial_frame()
  # Waiting for https://github.com/r-lib/vctrs/issues/198

  if (!is.data.frame(spec)) {
    stop("`spec` must be a data frame", call. = FALSE)
  }

  if (!has_name(spec, "col_name") || !has_name(spec, "measure")) {
    stop("`spec` must have `col_name` and `measure` columns", call. = FALSE)
  }

  # Ensure col_name and measure come first
  vars <- union(c("col_name", "measure"), names(spec))
  spec[vars]
}

pivot_to_long <- function(df, spec, na.rm = FALSE, .ptype = list()) {
  measures <- split(spec$col_name, spec$measure)
  measure_keys <- split(spec[-(1:2)], spec$measure)
  keys <- vec_unique(spec[-(1:2)])

  vals <- set_names(vec_na(list(), length(measures)), names(measures))
  for (measure in names(measures)) {
    cols <- measures[[measure]]
    col_id <- vec_match(measure_keys[[measure]], keys)

    val_cols <- vec_na(list(), nrow(keys))
    val_cols[col_id] <- unname(as.list(df[cols]))
    val_cols[-col_id] <- list(rep(NA, nrow(df)))

    val_type <- vec_type_common(!!!val_cols, .ptype = .ptype[[measure]])
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
  df_out <- df[setdiff(names(df), spec$col_name)]
  if (ncol(df_out) > 0) {
    out <- vec_cbind(vec_slice(df_out, rows$df_id), out)
  }
  out
}

# https://github.com/r-lib/vctrs/issues/189
vec_along <- function(x) {
  seq_len(vec_size(x))
}

pivot_to_wide <- function(df, spec) {
  measures <- vec_unique(spec$measure)
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

  measure_specs <- unname(split(spec, spec$measure))
  measure_out <- vec_na(list(), length(measure_specs))

  for (i in seq_along(measure_out)) {
    spec <- measure_specs[[i]]
    measure <- spec$measure[[1]]
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
    out <- vec_na(val, nrow * ncol)
    vec_slice(out, val_id$row + nrow * (val_id$col - 1L)) <- val

    measure_out[[i]] <- wrap_vec(out, spec$col_name)
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
