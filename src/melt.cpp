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

// FIXME: this export is just for debugging purposes
// [[Rcpp::export]]
SEXP rep_(SEXP x, int n, std::string var_name) {
  if (!Rf_isVectorAtomic(x) && TYPEOF(x) != VECSXP)
    stop("'%s' must be an atomic vector or list", var_name);

  if (Rf_inherits(x, "POSIXlt")) {
    stop("'%s' is a POSIXlt. Please convert to POSIXct.", var_name);
  }

  int xn = Rf_length(x);

  // if x is a data.frame, do replicate it recursively.
  if (Rf_inherits(x, "data.frame")) {
    List output = no_init(xn);
    DataFrame data = DataFrame(x);

    CharacterVector data_names = as<CharacterVector>(data.attr("names"));
    output.attr("names") = data_names;

    for (int i = 0; i < xn; ++i) {
      SEXP object = data[i];
      SET_VECTOR_ELT(output, i, rep_(object, n, std::string(data_names[i])));
    }

    Rf_copyMostAttrib(x, output);
    return output;
  }

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

int first_match(String x, CharacterVector y) {
  for (int i = 0; i < y.size(); i++) {
    if (x == y[i]) {
      return i;
    }
  }
  return -1;
}

// Concatenate vectors for the 'value' column
#define DO_CONCATENATE(CTYPE)                                \
  {                                                          \
    memcpy((char*)dataptr(output) + i* nrow * sizeof(CTYPE), \
           (char*)dataptr(tmp),                              \
           nrow * sizeof(CTYPE));                            \
    break;                                                   \
  }

// FIXME: this export is just for debugging purposes
// [[Rcpp::export]]
SEXP concatenate(const DataFrame& x, IntegerVector ind, bool factorsAsStrings) {

  int nrow = x.nrows();
  int n_ind = ind.size();

  // We coerce up to the 'max type' if necessary, using the fact
  // that R's SEXPTYPEs are also ordered in terms of 'precision'
  // Note: we convert factors to characters if necessary
  int max_type = 0;
  int ctype = 0;
  // Check if there's any data.frame column. We also need to check
  // if all columns are data.frame because we don't know how to join
  // an atomic vector and data.frame.
  bool all_data_frame = true;
  bool any_data_frame = false;
  for (int i = 0; i < n_ind; ++i) {

    if (Rf_isFactor(x[ind[i]]) and factorsAsStrings) {
      ctype = STRSXP;
    } else {
      ctype = TYPEOF(x[ind[i]]);
    }
    max_type = ctype > max_type ? ctype : max_type;

    bool is_data_frame = Rf_inherits(x[ind[i]], "data.frame");
    all_data_frame &= is_data_frame;
    any_data_frame |= is_data_frame;
  }

  debug(printf("Max type of value variables is %s\n", Rf_type2char(max_type)));

  // if targets are data.frame column, do concatenate them recursively.
  if (any_data_frame) {
    if (!all_data_frame)
      stop("You cannot mix data.frame columns and non-data.frame columns.");

    CharacterVector data_names_ = as<CharacterVector>(x.attr("names"));

    // Pick all column names in data.frame columns
    CharacterVector data_names(n_ind);
    CharacterVector sub_data_names_all;
    for (int i = 0; i < n_ind; ++i) {
      SET_STRING_ELT(data_names, i, STRING_ELT(data_names_, ind[i]));

      List col = List(x[ind[i]]);
      CharacterVector sub_data_names = as<CharacterVector>(col.attr("names"));
      for (int j = 0; j < sub_data_names.size(); j++) {
        sub_data_names_all.push_back(sub_data_names[j]);
      }
    }

    // TODO: sort in the original order
    CharacterVector sub_data_names_unique = unique(sub_data_names_all);
    sub_data_names_unique.sort();

    List output = no_init(sub_data_names_unique.size());
    output.attr("names") = sub_data_names_unique;
    for (int j = 0; j < sub_data_names_unique.size(); j++) {
      List tmp_df = no_init(n_ind);
      tmp_df.attr("names") = data_names;
      for (int i = 0; i < n_ind; ++i) {
        List sub_data = List(x[ind[i]]);
        CharacterVector sub_data_names = as<CharacterVector>(sub_data.attr("names"));

        int idx = first_match(sub_data_names_unique[j], sub_data_names);

        // TODO: fill non-existent columns.
        if (idx < 0) {
          stop("Some columns are missing!");
        }

        SET_VECTOR_ELT(tmp_df, i, VECTOR_ELT(sub_data, idx));
      }
      SEXP out = concatenate(tmp_df, seq(0, n_ind - 1), factorsAsStrings);
      SET_VECTOR_ELT(output, j, out);
    }

    Rf_copyMostAttrib(x, output);

    // TODO: as long as used in melt_dataframes(), concatenate() doesn't need to
    //       set row.names here since this will be overwritten by Rf_copyMostAttrib().
    output.attr("row.names") =
      IntegerVector::create(IntegerVector::get_na(), -(nrow * n_ind));

    return output;
  }

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
      stop("Must be atomic vector or list (not %s)", Rf_type2char(max_type));
    }
  }

  return output;
}

void set_rownames(List x, int n) {
  x.attr("row.names") =
    IntegerVector::create(IntegerVector::get_na(), -n);

  for (int i = 0; i < x.size(); i++) {
    SEXP col = x[i];
    if (Rf_inherits(col, "data.frame")) {
      set_rownames(col, n);
    }
  }
}

void copy_most_attrib(SEXP tmpl, SEXP x) {

  if (Rf_isNull(tmpl)) {
    return;
  }

  Rf_copyMostAttrib(tmpl, x);

  if (Rf_inherits(x, "data.frame")) {
    List data(x);
    List data_tmpl(tmpl);

    CharacterVector data_names_tmpl = as<CharacterVector>(data_tmpl.attr("names"));
    CharacterVector data_names = as<CharacterVector>(data.attr("names"));
    IntegerVector indices = match(data_names_tmpl, data_names);

    for (int i = 0; i < data.size(); i++) {
      SEXP col = data[i];
      int idx = indices[i];

      // TODO: handle missing columns
      if (idx < 0) continue;

      SEXP col_tmpl = data_tmpl[idx];
      copy_most_attrib(col_tmpl, col);
    }
  }
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
    if (!Rf_isVector(data[measure_ind[i]])) {
      stop("Must be atomic vector or list (column %i)", measure_ind[i] + 1);
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

  // TODO: do not add a value column when we gather data.frame columns?
  // 'value' is made by concatenating each of the 'value' variables
  output[n_id + 1] = concatenate(data, measure_ind, factorsAsStrings);
  copy_most_attrib(attrTemplate, output[n_id + 1]);

  // Make the List more data.frame like

  // Set the row names recursively, as Rf_copyMostAttrib does that recursively.
  set_rownames(output, nrow * n_measure);

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
