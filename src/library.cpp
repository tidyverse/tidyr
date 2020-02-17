#include <Rcpp.h>

void tidyr_init_vctrs();
void tidyr_init_utils(SEXP ns);

// [[Rcpp::export]]
SEXP tidyr_init_library(SEXP ns) {
  tidyr_init_vctrs();
  tidyr_init_utils(ns);

  return R_NilValue;
}
