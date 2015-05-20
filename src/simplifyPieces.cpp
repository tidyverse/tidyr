#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List simplifyPieces(ListOf<CharacterVector> pieces, int p,
                    bool fillLeft = true) {

  std::vector<int> tooSml, tooBig;
  int n = pieces.size();

  List list(p);
  for (int j = 0; j < p; ++j)
    list[j] = CharacterVector(n);
  ListOf<CharacterVector> out(list);

  for (int i = 0; i < n; ++i) {
    CharacterVector x = pieces[i];

    if (x.size() == 1 && x[0] == NA_STRING) {
      for (int j = 0; j < p; ++j)
        out[j][i] = NA_STRING;
    } else if (x.size() > p) { // too big
      tooBig.push_back(i + 1);

      for (int j = 0; j < p; ++j)
        out[j][i] = x[j];
    } else if (x.size() < p) { // too small
      tooSml.push_back(i + 1);

      for (int j = 0; j < p; ++j) {
        int idx = fillLeft ? p - j - 1 : j;
        out[idx][i] = (j < x.size()) ? x[j] : NA_STRING;
      }

    } else {
      for (int j = 0; j < p; ++j)
        out[j][i] = x[j];
    }
  }

  return List::create(
    _["strings"] = out,
    _["too_big"] = wrap(tooBig),
    _["too_sml"] = wrap(tooSml)
  );
}
