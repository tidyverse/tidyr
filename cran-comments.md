This is basically a resubmission of tidyr 0.5.0 - I've fixed a small buglet that caused a failure on R-oldrel.  Sorry for only noticing it after the release! (I've started routinely testing on oldrel so hopefully this will be less of a problem in the future)

---

## Test environments
* local OS X install, R 3.2.3
* ubuntu 12.04 (on travis-ci), R 3.2.3
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 2 note

* License components with restrictions and base license permitting such:
  MIT + file LICENSE
  
* Missing or unexported object: 'dplyr::everything'

  This is a bit of a hack to get tidyr working with both dplyr 0.4 and 
  dplyr 0.5.  It'll disappear once dplyr 0.5 is out.

## Downstream dependencies

I ran `R CMD check` on all 73 reverse dependencies.
Results at https://github.com/hadley/tidyr/tree/master/revdep/.

Problems are summarised below. The are 8 problems caused by a deliberate change to tidyr. I notified authors on May 26 and again today.

### Caused by tidyr update

A number of packages fail because tidyr now returns objects of class c("tbl_df", "tbl", "data.frame"), and the $.tbl_df method throws error instead of returning NULL for non-existant variables:

* broom: checking examples ... ERROR
* ezsummary: checking tests ... ERROR
* ggmcmc: checking examples ... ERROR
* heemod: checking tests ... ERROR
* pixiedust: checking re-building of vignette outputs ... WARNING
* quickpsy: checking examples ... ERROR
* R6Frame: checking tests ... ERROR
* RNeXML: checking examples ... ERROR

Other problems:

* pmc: checking tests ... ERROR
  I'm not sure what the cause of this one is

* rgho: checking examples ... ERROR
  Caused by assuming that column names are characters (which they should be!)

### Unrelated to tidyr

* ggRandomForests: checking examples ... ERROR
  This same error is present on CRAN

* glycanr: checking examples ... ERROR
  Examples is missing check for installation of suggested package

* tigger: checking re-building of vignette outputs ... WARNING
  Vigentte is missing check missing check for installation of suggested package
