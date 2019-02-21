pivot <- function(df, spec, na.rm = FALSE) {
  check_spec(spec)

  # Check colnames match up and error otherwise
  df_in_spec <- all(spec$col_name %in% names(df))
  spec_in_df <- all(setdiff(names(spec), c("col_name", "measure")) %in% names(df))

  if (df_in_spec) {
    pivot_to_long(df, spec, na.rm = na.rm)
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
}

pivot_to_long <- function(df, spec, na.rm = FALSE) {
  # need to handle multiple measure vars
  # and specify their ptypes
  measure_var <- spec$measure[[1]]

  # Find common type
  vals <- unname(as.list(df[spec$col_name]))
  val_type <- vctrs::vec_type_common(!!!vctrs::vec_type(vals))
  val <- vctrs::vec_c(!!!vals, .ptype = val_type)

  # Duplicate rows in keys and spec approriately
  keys <- df[setdiff(names(df), spec$col_name)]
  key_ids <- rep(seq_len(vctrs::vec_size(df)), each = vctrs::vec_size(spec))

  spec <- spec[setdiff(names(spec), c("col_name", "measure"))]
  spec_ids <- rep(seq_len(vctrs::vec_size(spec)), vctrs::vec_size(df))

  if (na.rm) {
    miss <- is.na(val)
    val <- val[!miss]
    key_ids <- key_ids[!miss]
    spec_ids <- spec_ids[!miss]
  }

  out <- vctrs::vec_cbind(
    vctrs::vec_slice(spec, spec_ids),
    tibble(!!measure_var := val),
  )
  # Bind original keys back on if there are any
  # Because of https://github.com/r-lib/vctrs/issues/199
  if (ncol(keys) > 0) {
    out <- vctrs::vec_cbind(vctrs::vec_slice(keys, key_ids), out)
  }
  out
}

pivot_to_wide <- function(df, spec) {
  measure <- df[[spec$measure[[1]]]]
  spec_cols <- c(setdiff(names(spec), c("col_name", "measure")), spec$measure[[1]])

  rows <- vctrs::vec_unique(df[setdiff(names(df), spec_cols)])
  if (ncol(rows) == 0) {
    rows <- tibble(.rows = 1)
    row_id <- rep(1L, nrow(spec))
  } else {
    # https://github.com/r-lib/vctrs/issues/199
    row_id <- vctrs::vec_match(df[setdiff(names(df), spec_cols)], rows)
  }

  cols <- df[spec_cols[-length(spec_cols)]]
  col_id <- vctrs::vec_match(cols, spec[spec_cols[-length(spec_cols)]])

  nrow <- nrow(rows)
  ncol <- nrow(spec)

  idx <- data.frame(row = row_id, col = col_id)
  if (vctrs::vec_duplicate_any(idx)) {
    warn("Values are not uniquely identified; output will contain list-columns")

    # https://github.com/r-lib/vctrs/issues/196
    measure <- unname(split(measure, vctrs::vec_duplicate_id(idx)))
    idx <- vctrs::vec_unique(idx)
    row_id <- idx$row
    col_id <- idx$col
  }

  # use col-major vector
  # then converting to data frame with subsetting

  type <- vctrs::vec_type(measure)
  out <- matrix(vctrs::vec_na(type, nrow * ncol), ncol = ncol)

  out[cbind(row_id, col_id)] <- measure
  out <- tibble:::matrixToDataFrame(out)
  names(out) <- spec$col_name

  vctrs::vec_cbind(rows, out)
}

