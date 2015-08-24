#include <Rcpp.h>
using namespace Rcpp;

// A debug macro -- change to 'debug(x) x' for debug output
#define debug(x)

// An optimized rep
#define DO_REP(RTYPE, CTYPE, ACCESSOR)                         \
  {                                                            \
    Shield<SEXP> output(Rf_allocVector(RTYPE, nout));          \
    for (int i = 0; i < n; ++i) {                              \
      memcpy((char*)ACCESSOR(output) + i * xn * sizeof(CTYPE), \
             (char*)ACCESSOR(x),                               \
             sizeof(CTYPE) * xn);                              \
    }                                                          \
    return output;                                             \
    break;                                                     \
  }

SEXP rep_(SEXP x, int n) {
  int xn = Rf_length(x);
  int nout = xn * n;
  switch (TYPEOF(x)) {
    case INTSXP:
      DO_REP(INTSXP, int, INTEGER);
    case REALSXP:
      DO_REP(REALSXP, double, REAL);
    case STRSXP: {
      int counter = 0;
      Shield<SEXP> output(Rf_allocVector(STRSXP, nout));
      for (int i = 0; i < n; ++i) {
        for (int j = 0; j < xn; ++j) {
          SET_STRING_ELT(output, counter, STRING_ELT(x, j));
          ++counter;
        }
      }
      return output;
      break;
    }
    case LGLSXP:
      DO_REP(LGLSXP, int, LOGICAL);
    case CPLXSXP:
      DO_REP(CPLXSXP, Rcomplex, COMPLEX);
    case RAWSXP:
      DO_REP(RAWSXP, Rbyte, RAW);
    case VECSXP:
      DO_REP(VECSXP, SEXP, STRING_PTR);
    default: {
      stop("Unhandled RTYPE");
      return R_NilValue;
    }
  }
}

// An optimized rep_each
#define DO_REP_EACH(RTYPE, CTYPE, ACCESSOR)           \
  {                                                   \
    int counter = 0;                                  \
    Shield<SEXP> output(Rf_allocVector(RTYPE, nout)); \
    CTYPE* x_ptr = ACCESSOR(x);                       \
    CTYPE* output_ptr = ACCESSOR(output);             \
    for (int i = 0; i < xn; ++i) {                    \
      for (int j = 0; j < n; ++j) {                   \
        output_ptr[counter] = x_ptr[i];               \
        ++counter;                                    \
      }                                               \
    }                                                 \
    return output;                                    \
    break;                                            \
  }

SEXP rep_each_(SEXP x, int n) {
  int xn = Rf_length(x);
  int nout = xn * n;
  switch (TYPEOF(x)) {
    case INTSXP:
      DO_REP_EACH(INTSXP, int, INTEGER);
    case REALSXP:
      DO_REP_EACH(REALSXP, double, REAL);
    case STRSXP: {
      int counter = 0;
      Shield<SEXP> output(Rf_allocVector(STRSXP, nout));
      for (int i = 0; i < xn; ++i) {
        for (int j = 0; j < n; ++j) {
          SET_STRING_ELT(output, counter, STRING_ELT(x, i));
          ++counter;
        }
      }
      return output;
      break;
    }
      DO_REP_EACH(STRSXP, SEXP, STRING_PTR);
    case LGLSXP:
      DO_REP_EACH(LGLSXP, int, LOGICAL);
    case CPLXSXP:
      DO_REP_EACH(CPLXSXP, Rcomplex, COMPLEX);
    case RAWSXP:
      DO_REP_EACH(RAWSXP, Rbyte, RAW);
    case VECSXP:
      DO_REP_EACH(VECSXP, SEXP, STRING_PTR);
    default: {
      stop("Unhandled RTYPE");
      return R_NilValue;
    }
  }
}

// Optimized factor routine for the case where we want to make
// a factor from a vector of names -- used for generating the
// 'variable' column in the melted data.frame
IntegerVector make_variable_column(CharacterVector x, int nrow) {
  IntegerVector fact = seq(1, x.size());
  IntegerVector output = rep_each_(fact, nrow);
  output.attr("levels") = x;
  output.attr("class") = "factor";
  return output;
}

// Ensure that we index in the column range of the data --
// just to double-check everything went okay upstream
void check_indices(IntegerVector ind, int ncol, std::string msg) {
  int n = ind.size();
  for (int i = 0; i < n; ++i) {
    if (ind[i] < 0) {
      stop(msg + "index less than zero");
    }
    if (ind[i] >= ncol) {
      stop(msg + "index > number of columns");
    }
    if (ind[i] == NA_INTEGER) {
      stop(msg + "no match found");
    }
  }
}

// Concatenate vectors for the 'value' column
#define DO_CONCATENATE(CTYPE)                                \
  {                                                          \
    memcpy((char*)dataptr(output) + i* nrow * sizeof(CTYPE), \
           (char*)dataptr(tmp),                              \
           nrow * sizeof(CTYPE));                            \
    break;                                                   \
  }

SEXP concatenate(const DataFrame& x, IntegerVector ind, bool factorsAsStrings) {

  int nrow = x.nrows();
  int n_ind = ind.size();

  // We coerce up to the 'max type' if necessary, using the fact
  // that R's SEXPTYPEs are also ordered in terms of 'precision'
  // Note: we convert factors to characters if necessary
  int max_type = 0;
  int ctype = 0;
  for (int i = 0; i < n_ind; ++i) {

    if (Rf_isFactor(x[ind[i]]) and factorsAsStrings) {
      ctype = STRSXP;
    } else {
      ctype = TYPEOF(x[ind[i]]);
    }
    max_type = ctype > max_type ? ctype : max_type;
  }

  debug(printf("Max type of value variables is %s\n", Rf_type2char(max_type)));

  Armor<SEXP> tmp;
  Shield<SEXP> output(Rf_allocVector(max_type, nrow * n_ind));
  for (int i = 0; i < n_ind; ++i) {

    // a 'tmp' pointer to the current column being iterated over, or
    // a coerced version if necessary
    if (TYPEOF(x[ind[i]]) == max_type) {
      tmp = x[ind[i]];
    } else if (Rf_isFactor(x[ind[i]]) and factorsAsStrings) {
      tmp = Rf_asCharacterFactor(x[ind[i]]);
    } else {
      tmp = Rf_coerceVector(x[ind[i]], max_type);
    }

    switch (max_type) {
      case INTSXP:
        DO_CONCATENATE(int);
      case REALSXP:
        DO_CONCATENATE(double);
      case LGLSXP:
        DO_CONCATENATE(int);
      case CPLXSXP:
        DO_CONCATENATE(Rcomplex);
      case STRSXP: {
        for (int j = 0; j < nrow; ++j) {
          SET_STRING_ELT(output, i * nrow + j, STRING_ELT(tmp, j));
        }
        break;
      }
      case RAWSXP:
        DO_CONCATENATE(Rbyte);
    }
  }

  return output;
}

// [[Rcpp::export]]
List melt_dataframe(const DataFrame& data,
                    const IntegerVector& id_ind,
                    const IntegerVector& measure_ind,
                    String variable_name,
                    String value_name,
                    SEXP measure_attributes,
                    bool factorsAsStrings,
                    bool valueAsFactor) {

  int nrow = data.nrows();

  CharacterVector data_names = as<CharacterVector>(data.attr("names"));

  int n_id = id_ind.size();
  debug(Rprintf("n_id == %i\n", n_id));

  int n_measure = measure_ind.size();
  debug(Rprintf("n_measure == %i\n", n_measure));

  // Don't melt if the value variables are non-atomic
  for (int i = 0; i < n_measure; ++i) {
    if (!Rf_isVectorAtomic(data[measure_ind[i]])) {
      stop("Can't melt data.frames with non-atomic 'measure' columns");
    }
  }

  // The output should be a data.frame with:
  // number of columns == number of id vars + 'variable' + 'value',
  // with number of rows == data.nrow() * number of value vars
  List output = no_init(n_id + 2);

  // First, allocate the ID variables
  // we repeat each ID vector n_measure times

  // A define to handle the different possible types
  #define REP(RTYPE)                                 \
    case RTYPE: {                                    \
      output[i] = rep_(data[id_ind[i]], n_measure);  \
      Rf_copyMostAttrib(data[id_ind[i]], output[i]); \
      break;                                         \
    }

  for (int i = 0; i < n_id; ++i) {
    switch (TYPEOF(data[id_ind[i]])) {
      REP(LGLSXP);
      REP(INTSXP);
      REP(REALSXP);
      REP(STRSXP);
      REP(CPLXSXP);
      REP(RAWSXP);
      REP(VECSXP);
      default: { stop("internal error: unnhandled vector type in REP"); }
    }
  }

  // Now, we assign the 'variable' and 'value' columns

  // 'variable' is made up of repeating the names of the 'measure' variables,
  // each nrow times. We want this to be a factor as well.
  CharacterVector id_names = no_init(n_measure);
  for (int i = 0; i < n_measure; ++i) {
    id_names[i] = data_names[measure_ind[i]];
  }
  output[n_id] = make_variable_column(id_names, nrow);

  // 'value' is made by concatenating each of the 'value' variables
  output[n_id + 1] = concatenate(data, measure_ind, factorsAsStrings);
  if (!Rf_isNull(measure_attributes)) {
    SET_ATTRIB(output[n_id + 1], measure_attributes);
    // we also need to make sure the OBJECT bit is set for other 'object' types
    // see: http://stackoverflow.com/questions/24059460/melt-data-frame-changes-behavior-how-posixct-columns-are-printed
    // if we've entered this code block, the measure_attributes has been
    // populated because all value variables have identical attributes
    SET_OBJECT(output[n_id + 1], OBJECT(data[measure_ind[0]]));
  }

  // Make the List more data.frame like

  // Set the row names
  output.attr("row.names") =
      IntegerVector::create(IntegerVector::get_na(), -(nrow * n_measure));

  // Set the names
  CharacterVector out_names = no_init(n_id + 2);
  for (int i = 0; i < n_id; ++i) {
    out_names[i] = data_names[id_ind[i]];
  }
  out_names[n_id] = variable_name;
  out_names[n_id + 1] = value_name;
  output.attr("names") = out_names;

  // Set the class
  output.attr("class") = "data.frame";

  return output;
}
