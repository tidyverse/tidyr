#ifndef TIDYR_VCTRS_H
#define TIDYR_VCTRS_H

#define R_NO_REMAP
#include <R.h>
#include <Rversion.h>
#include <Rinternals.h>

// Short callables
extern R_len_t (*vec_size)(SEXP);
extern R_len_t (*vec_size_common)(SEXP, R_len_t);
extern SEXP (*vec_recycle_common)(SEXP, R_len_t);

#endif
