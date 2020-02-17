#ifndef TIDYR_UTILS_H
#define TIDYR_UTILS_H

#include <Rcpp.h>
#include "utils.h"

SEXP tidyr_ns_env = NULL;
SEXP tidyr_unchop_rows_env = NULL;

SEXP syms_i = NULL;
SEXP syms_x = NULL;

SEXP classes_data_frame = NULL;

void tidyr_init_utils(SEXP ns) {
  tidyr_ns_env = ns;
  tidyr_unchop_rows_env = Rf_findVar(Rf_install("tidyr_unchop_rows_env"), tidyr_ns_env);

  syms_i = Rf_install("i");
  syms_x = Rf_install("x");

  classes_data_frame = Rf_allocVector(STRSXP, 1);
  R_PreserveObject(classes_data_frame);
  SET_STRING_ELT(classes_data_frame, 0, Rf_mkChar("data.frame"));
}

#endif
