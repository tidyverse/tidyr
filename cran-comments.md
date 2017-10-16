## Release summary

This includes two small bug fixes; one which resolves the failures on R-devel.

## Test environments

* local OS X install, R 3.4.1
* ubuntu 12.04 (on travis-ci), R 3.4.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 311 reverse dependencies (285 from CRAN + 26 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 1 new problems
 * We failed to check 9 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* REDCapR
  checking tests ...
  
  This doesn't appear to be related to tidyr changes

### Failed to check

* anomalyDetection (failed to install)
* diceR            (failed to install)
* hansard          (check timed out)
* HTSSIP           (check timed out)
* pmc              (check timed out)
* pointblank       (failed to install)
* qdap             (failed to install)
* rtable           (failed to install)
* wand             (failed to install)
