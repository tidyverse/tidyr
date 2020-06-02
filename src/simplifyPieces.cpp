#include "tidycpp/list.hpp"
#include "tidycpp/character.hpp"
#include "tidycpp/as.hpp"
#include <vector>

[[tidycpp::export]]
tidycpp::list simplifyPieces(tidycpp::list pieces, int p,
                    bool fillLeft = true) {

  std::vector<int> tooSml, tooBig;
  int n = pieces.size();

  tidycpp::writable::list list(p);
  for (int j = 0; j < p; ++j)
    list[j] = tidycpp::writable::character_vector(n);
  tidycpp::writable::list out(list);

  for (int i = 0; i < n; ++i) {
    tidycpp::character_vector x(pieces[i]);

    if (x.size() == 1 && x[0] == NA_STRING) {
      for (int j = 0; j < p; ++j)
        SET_STRING_ELT(out[j], i, NA_STRING);
    } else if (x.size() > p) { // too big
      tooBig.push_back(i + 1);

      for (int j = 0; j < p; ++j)
        tidycpp::as_cpp<tidycpp::writable::character_vector>(out[j])[i] = x[j];
    } else if (x.size() < p) { // too small
      tooSml.push_back(i + 1);

      int gap = p - x.size();
      for (int j = 0; j < p; ++j) {
        if (fillLeft) {
          SET_STRING_ELT(out[j], i, (j >= gap) ? static_cast<SEXP>(x[j - gap]) : NA_STRING);
        } else {
          SET_STRING_ELT(out[j], i, (j < x.size()) ? static_cast<SEXP>(x[j]) : NA_STRING);
        }
      }

    } else {
      for (int j = 0; j < p; ++j)
        SET_STRING_ELT(out[j], i, x[j]);
    }
  }

  using namespace tidycpp::literals;

  return tidycpp::writable::list({
    "strings"_nm = out,
    "too_big"_nm = tooBig,
    "too_sml"_nm = tooSml}
  );
}
