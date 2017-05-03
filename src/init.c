#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .Call calls */
extern SEXP tidyr_fillDown(SEXP);
extern SEXP tidyr_fillUp(SEXP);
extern SEXP tidyr_melt_dataframe(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP tidyr_simplifyPieces(SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"tidyr_fillDown",       (DL_FUNC) &tidyr_fillDown,       1},
    {"tidyr_fillUp",         (DL_FUNC) &tidyr_fillUp,         1},
    {"tidyr_melt_dataframe", (DL_FUNC) &tidyr_melt_dataframe, 9},
    {"tidyr_simplifyPieces", (DL_FUNC) &tidyr_simplifyPieces, 3},
    {NULL, NULL, 0}
};

void R_init_tidyr(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
