#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
SEXP fillVector(SEXP x, bool rev = false) {
  int n = Rf_length(x);
  SEXP out = Rf_allocVector(TYPEOF(x), n);

  switch(TYPEOF(x)) {
  case LGLSXP: {
    int* xin = LOGICAL(x);
    int* xout = LOGICAL(out);

    int lastVal = xin[0];

    for (int i = 0; i < n; ++i) {
      if (xin[i] != NA_LOGICAL)
        lastVal = xin[i];
      xout[i] = lastVal;
    }
    break;
  }
  case INTSXP: {
    int* xin = INTEGER(x);
    int* xout = INTEGER(out);

    int lastVal = xin[0];

    for (int i = 0; i < n; ++i) {
      if (xin[i] != NA_INTEGER)
        lastVal = xin[i];
      xout[i] = lastVal;
    }
    break;

  }
  case REALSXP: {
    double* xin = REAL(x);
    double* xout = REAL(out);

    double lastVal = xin[0];

    for (int i = 0; i < n; ++i) {
      if (!ISNA(xin[i]))
        lastVal = xin[i];
      xout[i] = lastVal;
    }
    break;

  }
  case STRSXP: {
    SEXP lastVal = NA_STRING;

    for (int i = 0; i < n; ++i) {
      if (STRING_ELT(x, i) != NA_STRING)
        lastVal = STRING_ELT(x, i);
      SET_STRING_ELT(out, i, lastVal);
    }
    break;

  }
  default:
    stop("Don't know how to handle column of type", Rf_type2char(TYPEOF(x)));
  }

  return out;
}
