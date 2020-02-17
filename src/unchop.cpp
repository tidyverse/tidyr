#include <Rcpp.h>
#include "vctrs-hidden.h"
#include "utils.h"

/*
 * `unchop_rows()` takes a data frame of `cols` to unchop and splits each row
 * into its own data frame. Any lists are "flattened" by using `[[` to extract
 * the row element for each column, and then the single row elements for all
 * columns are recycled against each other before reconstructing a data frame
 * for that row.
 *
 * The size of each new data frame is recorded as well, for later use to slice
 * the original `data` to the correct new total size.
 *
 * If, on any row, a `NULL` is detected in one of the columns to be unchopped,
 * then that particular column is completely removed from the data frame
 * constructed for that row. A usage of `keep_empty = TRUE` prevents this at
 * the R level by replacing `NULL` elements with `unspecified(1)`.
 */

static SEXP unchop_rows_impl(SEXP cols, R_len_t size);

// [[Rcpp::export]]
SEXP unchop_rows(SEXP cols, SEXP size) {
  R_len_t size_ = INTEGER(size)[0];

  return unchop_rows_impl(cols, size_);
}

static inline SEXP unchop_row(SEXP rows_elt, int* sizes_elt, SEXP cols, SEXP names, SEXP call, R_len_t n, R_len_t* current);
static inline SEXP unchop_row_with_null(SEXP rows_elt, int* sizes_elt, SEXP cols, SEXP names, SEXP call, R_len_t n, R_len_t current);

static inline void init_data_frame(SEXP x, SEXP names, R_len_t size);

static SEXP unchop_rows_impl(SEXP cols, R_len_t size) {
  R_len_t n = Rf_length(cols);

  if (n == 0) {
    Rf_errorcall(R_NilValue, "Internal error: 0-column case should be handled at the R level");
  }

  SEXP names = PROTECT(Rf_getAttrib(cols, R_NamesSymbol));

  if (names == R_NilValue) {
    Rf_errorcall(R_NilValue, "`data` must have column names");
  }

  SEXP rows = PROTECT(Rf_allocVector(VECSXP, size));

  SEXP sizes = PROTECT(Rf_allocVector(INTSXP, size));
  int* p_sizes = INTEGER(sizes);

  // TODO: Should be vec_slice2(). Think about data frame columns!
  SEXP call = PROTECT(Rf_lang3(R_Bracket2Symbol, syms_x, syms_i));

  SEXP index = PROTECT(Rf_allocVector(INTSXP, 1));
  int* p_index = INTEGER(index);

  for (R_len_t i = 0; i < size; ++i) {
    SEXP rows_elt = PROTECT(Rf_allocVector(VECSXP, n));
    int sizes_elt;

    *p_index = i + 1;
    Rf_defineVar(syms_i, index, tidyr_unchop_rows_env);

    R_len_t current = -1;

    // Normal case. Assign i-th element of each column into their own row.
    rows_elt = PROTECT(unchop_row(rows_elt, &sizes_elt, cols, names, call, n, &current));

    // NULL detected. Continue unchopping while removing NULLs.
    if (current != -1) {
      rows_elt = unchop_row_with_null(rows_elt, &sizes_elt, cols, names, call, n, current);
    }

    SET_VECTOR_ELT(rows, i, rows_elt);
    p_sizes[i] = sizes_elt;
    UNPROTECT(2);
  }

  SEXP out = PROTECT(Rf_allocVector(VECSXP, 2));
  SET_VECTOR_ELT(out, 0, rows);
  SET_VECTOR_ELT(out, 1, sizes);

  UNPROTECT(6);
  return out;
}

static inline SEXP unchop_row(SEXP rows_elt,
                              int* sizes_elt,
                              SEXP cols,
                              SEXP names,
                              SEXP call,
                              R_len_t n,
                              R_len_t* current) {
  for (R_len_t j = 0; j < n; ++j) {
    SEXP col = VECTOR_ELT(cols, j);
    Rf_defineVar(syms_x, col, tidyr_unchop_rows_env);
    SEXP elt = Rf_eval(call, tidyr_unchop_rows_env);

    // Return current state of `rows_elt` and current location
    // so we can pick up where we left off
    if (elt == R_NilValue) {
      *current = j;
      return rows_elt;
    }

    SET_VECTOR_ELT(rows_elt, j, elt);
  }

  R_len_t common_size = vec_size_common(rows_elt, 0);

  rows_elt = PROTECT(vec_recycle_common(rows_elt, common_size));
  *sizes_elt = common_size;

  init_data_frame(rows_elt, names, common_size);

  UNPROTECT(1);
  return rows_elt;
}

static inline SEXP unchop_row_with_null(SEXP rows_elt,
                                        int* sizes_elt,
                                        SEXP cols,
                                        SEXP names,
                                        SEXP call,
                                        R_len_t n,
                                        R_len_t current) {
  names = PROTECT(Rf_duplicate(names));
  SEXP* p_names = STRING_PTR(names);

  R_len_t n_null = 1;
  R_len_t loc = current;
  ++current;

  for (R_len_t j = current; j < n; ++j) {
    SEXP col = VECTOR_ELT(cols, j);
    Rf_defineVar(syms_x, col, tidyr_unchop_rows_env);
    SEXP elt = Rf_eval(call, tidyr_unchop_rows_env);

    if (elt == R_NilValue) {
      ++n_null;
      continue;
    }

    SET_VECTOR_ELT(rows_elt, loc, elt);
    p_names[loc] = p_names[j];
    ++loc;
  }

  R_len_t n_cols = n - n_null;

  rows_elt = PROTECT(Rf_lengthgets(rows_elt, n_cols));
  names = PROTECT(Rf_lengthgets(names, n_cols));

  R_len_t common_size = vec_size_common(rows_elt, 0);

  rows_elt = PROTECT(vec_recycle_common(rows_elt, common_size));
  *sizes_elt = common_size;

  init_data_frame(rows_elt, names, common_size);

  UNPROTECT(4);
  return rows_elt;
}


static inline SEXP new_row_name_info(R_len_t size) {
  SEXP out = PROTECT(Rf_allocVector(INTSXP, 2));
  int* p_out = INTEGER(out);

  p_out[0] = NA_INTEGER;
  p_out[1] = -size;

  UNPROTECT(1);
  return out;
}

static inline void init_data_frame(SEXP x, SEXP names, R_len_t size) {
  Rf_setAttrib(x, R_NamesSymbol, names);
  Rf_setAttrib(x, R_ClassSymbol, classes_data_frame);
  Rf_setAttrib(x, R_RowNamesSymbol, new_row_name_info(size));
}
