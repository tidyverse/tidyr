#include <Rcpp.h>
using namespace Rcpp;

// A debug macro -- change to 'debug(x) x' for debug output
#define debug(x)

// An optimized rep
#define DO_REP(RTYPE, CTYPE, ACCESSOR)                         \
  {                                                            \
    for (int i = 0; i < n; ++i) {                              \
      memcpy((char*)ACCESSOR(output) + i * xn * sizeof(CTYPE), \
             (char*)ACCESSOR(x),                               \
             sizeof(CTYPE) * xn);                              \
    }                                                          \
  }

SEXP rep_(SEXP x, int n, std::string var_name) {
  if (!Rf_isVectorAtomic(x) && TYPEOF(x) != VECSXP) {
    Rf_errorcall(
      R_NilValue,
      "All columns must be atomic vectors or lists. Problem with '%s'",
      var_name.c_str()
    );
  }

  if (Rf_inherits(x, "POSIXlt")) {
    stop("'%s' is a POSIXlt. Please convert to POSIXct.", var_name);
  }

  int xn = Rf_length(x);
  int nout = xn * n;

  Shield<SEXP> output(Rf_allocVector(TYPEOF(x), nout));
  switch (TYPEOF(x)) {
    case INTSXP:
      DO_REP(INTSXP, int, INTEGER);
      break;
    case REALSXP:
      DO_REP(REALSXP, double, REAL);
      break;
    case LGLSXP:
      DO_REP(LGLSXP, int, LOGICAL);
      break;
    case CPLXSXP:
      DO_REP(CPLXSXP, Rcomplex, COMPLEX);
      break;
    case RAWSXP:
      DO_REP(RAWSXP, Rbyte, RAW);
      break;
    case STRSXP: {
      int counter = 0;
      for (int i = 0; i < n; ++i) {
        for (int j = 0; j < xn; ++j) {
          SET_STRING_ELT(output, counter, STRING_ELT(x, j));
          ++counter;
        }
      }
      break;
    }
    case VECSXP: {
      int counter = 0;
      for (int i = 0; i < n; ++i) {
        for (int j = 0; j < xn; ++j) {
          SET_VECTOR_ELT(output, counter, VECTOR_ELT(x, j));
          ++counter;
        }
      }
      break;
    }
    default: {
      stop("Unhandled RTYPE in '%s'", var_name);
      return R_NilValue;
    }
  }

  Rf_copyMostAttrib(x, output);
  return output;
}

// Optimized factor routine for the case where we want to make
// a factor from a vector of names -- used for generating the
// 'variable' column in the melted data.frame
IntegerVector make_variable_column_factor(CharacterVector x, int nrow) {
  IntegerVector output = no_init(x.size() * nrow);

  int idx = 0;
  for (int i = 0; i < x.size(); ++i)
    for (int j = 0; j < nrow; ++j)
      output[idx++] = i + 1;

  output.attr("levels") = x;
  output.attr("class") = "factor";
  return output;
}

CharacterVector make_variable_column_character(CharacterVector x, int nrow) {
  CharacterVector output = no_init(x.size() * nrow);

  int idx = 0;
  for (int i = 0; i < x.size(); ++i)
    for (int j = 0; j < nrow; ++j)
      output[idx++] = x[i];

  return output;
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
    SEXP col = x[ind[i]];

    if (Rf_inherits(col, "POSIXlt")) {
      stop("Column %i is a POSIXlt. Please convert to POSIXct.", i + 1);
    }

    // a 'tmp' pointer to the current column being iterated over, or
    // a coerced version if necessary
    if (TYPEOF(col) == max_type) {
      tmp = col;
    } else if (Rf_isFactor(col) and factorsAsStrings) {
      tmp = Rf_asCharacterFactor(col);
    } else {
      tmp = Rf_coerceVector(col, max_type);
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
      case VECSXP: {
        for (int j = 0; j < nrow; ++j) {
          SET_VECTOR_ELT(output, i * nrow + j, VECTOR_ELT(tmp, j));
        }
        break;
      }
    default:
      Rf_errorcall(
        R_NilValue,
        "All columns be atomic vectors or lists (not %s)", Rf_type2char(max_type)
      );
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
                    SEXP attrTemplate,
                    bool factorsAsStrings,
                    bool valueAsFactor,
                    bool variableAsFactor) {

  int nrow = data.nrows();

  CharacterVector data_names = as<CharacterVector>(data.attr("names"));

  int n_id = id_ind.size();
  debug(Rprintf("n_id == %i\n", n_id));

  int n_measure = measure_ind.size();
  debug(Rprintf("n_measure == %i\n", n_measure));

  // Don't melt if the value variables are non-atomic
  for (int i = 0; i < n_measure; ++i) {
    if (!Rf_isVector(data[measure_ind[i]]) || Rf_inherits(data[measure_ind[i]], "data.frame")) {
      Rf_errorcall(
        R_NilValue,
        "All columns must be atomic vectors or lists. Problem with column %i.",
        measure_ind[i] + 1
      );
    }
  }

  // The output should be a data.frame with:
  // number of columns == number of id vars + 'variable' + 'value',
  // with number of rows == data.nrow() * number of value vars
  List output = no_init(n_id + 2);

  // First, allocate the ID variables
  // we repeat each ID vector n_measure times
  for (int i = 0; i < n_id; ++i) {
    SEXP object = data[id_ind[i]];
    std::string var_name = std::string(data_names[id_ind[i]]);
    output[i] = rep_(object, n_measure, var_name);
  }

  // Now, we assign the 'variable' and 'value' columns

  // 'variable' is made up of repeating the names of the 'measure' variables,
  // each nrow times. We want this to be a factor as well.
  CharacterVector id_names = no_init(n_measure);
  for (int i = 0; i < n_measure; ++i) {
    id_names[i] = data_names[measure_ind[i]];
  }
  if (variableAsFactor) {
    output[n_id] = make_variable_column_factor(id_names, nrow);
  } else {
    output[n_id] = make_variable_column_character(id_names, nrow);
  }

  // 'value' is made by concatenating each of the 'value' variables
  output[n_id + 1] = concatenate(data, measure_ind, factorsAsStrings);
  if (!Rf_isNull(attrTemplate)) {
    Rf_copyMostAttrib(attrTemplate, output[n_id + 1]);
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
