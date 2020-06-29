#include "cpp11/list.hpp"
#include "cpp11/strings.hpp"
#include "cpp11/as.hpp"
#include <vector>

[[cpp11::register]]
cpp11::list simplifyPieces(cpp11::list pieces, int p,
                    bool fillLeft = true) {

  std::vector<int> tooSml, tooBig;
  int n = pieces.size();

  cpp11::writable::list list(p);
  for (int j = 0; j < p; ++j)
    list[j] = cpp11::writable::strings(n);
  cpp11::writable::list out(list);

  for (int i = 0; i < n; ++i) {
    cpp11::strings x(pieces[i]);

    if (x.size() == 1 && x[0] == NA_STRING) {
      for (int j = 0; j < p; ++j)
        SET_STRING_ELT(out[j], i, NA_STRING);
    } else if (x.size() > p) { // too big
      tooBig.push_back(i + 1);

      for (int j = 0; j < p; ++j)
        SET_STRING_ELT(out[j], i, x[j]);
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

  using namespace cpp11::literals;

  return cpp11::writable::list({
    "strings"_nm = out,
    "too_big"_nm = tooBig,
    "too_sml"_nm = tooSml}
  );
}
