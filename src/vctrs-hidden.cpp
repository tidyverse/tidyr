#include "vctrs-hidden.h"

R_len_t (*vec_size_common)(SEXP, R_len_t) = NULL;
SEXP (*vec_recycle_common)(SEXP, R_len_t) = NULL;

void tidyr_init_vctrs() {
  vec_size_common = (R_len_t (*)(SEXP, R_len_t)) R_GetCCallable("vctrs", "short_vec_size_common");
  vec_recycle_common = (SEXP (*)(SEXP, R_len_t)) R_GetCCallable("vctrs", "short_vec_recycle_common");
}
