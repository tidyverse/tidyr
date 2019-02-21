pivot <- function(df, spec, na.rm = FALSE, .ptype = NULL) {
  spec <- check_spec(spec)

  # Check colnames match up and error otherwise
  df_in_spec <- all(spec$col_name %in% names(df))
  spec_in_df <- all(setdiff(names(spec), c("col_name", "measure")) %in% names(df))

  if (df_in_spec) {
    pivot_to_long(df, spec, na.rm = na.rm, .ptype = .ptype)
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

pivot_to_long <- function(df, spec, na.rm = FALSE, .ptype = .ptype) {
  # need to handle multiple measure vars
  # and specify their ptypes
  measure_var <- spec$measure[[1]]

  # Coerce multiple value columns to single type
  val_cols <- unname(as.list(df[spec$col_name]))
  val_type <- vec_type_common(!!!val_cols, .ptype = .ptype)
  val <- vec_c(!!!val_cols, .ptype = val_type)

  # Line up output rows by combining spec and existing data frame
  # https://github.com/tidyverse/tidyr/issues/557
  rows <- expand.grid(
    spec_id = vec_along(spec),
    df_id = vec_along(df),
    KEEP.OUT.ATTRS = FALSE
  )
  rows$val <- val

  if (na.rm) {
    rows <- vec_slice(rows, !vec_equal_na(val))
  }

  # Join together df, spec, and val to produce final tibble
  df_out <- df[setdiff(names(df), spec$col_name)]
  spec_out <- spec[-(1:2)]

  out <- vec_cbind(
    vec_slice(spec_out, rows$spec_id),
    tibble(!!measure_var := rows$val),
  )
  # Bind original keys back on if there are any
  # Because of https://github.com/r-lib/vctrs/issues/199
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
  val <- df[[spec$measure[[1]]]]
  spec_cols <- c(names(spec)[-(1:2)], spec$measure[[1]])

  # Figure out rows in output
  df_rows <- df[setdiff(names(df), spec_cols)]
  if (ncol(df_rows) == 0) {
    rows <- tibble(.rows = 1)
    row_id <- rep(1L, nrow(spec))
  } else {
    rows <- vec_unique(df_rows)
    # https://github.com/r-lib/vctrs/issues/199
    row_id <- vec_match(df_rows, rows)
  }

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
  out[val_id$row + nrow * (val_id$col - 1L)] <- val

  vec_cbind(rows, wrap_vec(out, spec$col_name))
}

# Wrap a "rectangular" vector into a data frame
wrap_vec <- function(vec, names) {
  ncol <- length(names)
  nrow <- length(vec) / ncol
  out <- set_names(vec_na(list(), ncol), names)
  for (i in 1:ncol) {
    out[[i]] <- vec[((i - 1) * nrow + 1):(i * nrow)]
  }

  as_tibble(out)
}
