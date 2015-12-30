#include <Rcpp.h>
#include <dplyr.h>
using namespace Rcpp;

// [[Rcpp::export]]
SEXP extract_groups(const List data, const CharacterVector nested_cols) {
  ListOf<IntegerVector> indices(data.attr("indices"));
  int n_slices = indices.size();

  if (n_slices == 0) {
    return data[nested_cols];
  }

  CharacterVector classes = CharacterVector::create("tbl_df", "data.frame");
  dplyr::DataFrameSubsetVisitors visitors(data);

  List out = no_init(n_slices);
  for (int i = 0; i < n_slices; ++i) {
    List out_i = visitors.subset(indices[i], classes);
    out[i] = out_i[nested_cols];
  }

  return out;
}
