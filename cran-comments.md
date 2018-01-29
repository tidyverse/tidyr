## Test environments

* OS X install: R 3.4
* win-builder: R-devel
* travis-ci: R 3.2, R 3.3, R 3.4, R-devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 364 reverse dependencies (338 from CRAN + 26 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 4 new problems
 * We failed to check 5 packages

Issues with CRAN packages are summarised below.

All maintainers were notified on Jan 7, and again today.

### New problems
(This reports the first line of each new failure)

* GetTDData
  checking examples ... ERROR
  checking re-building of vignette outputs ... WARNING
  
  This is due to a tidyr API change: author was notified 3 weeks ago.

* jpmesh
  checking installed package size ... NOTE
  
  It seems unlikely that this is related to tidyr, but I'm not sure why
  the installed size of the R directory would (a) be so large or (b)
  change.

* survtmle
  checking examples ... ERROR
  checking re-building of vignette outputs ... WARNING
  
  Same problem as GetTDData

* syuzhet
  checking installed package size ... NOTE
  
  Same problem as jpmesh

### Failed to check

* anomalyDetection (failed to install)
* dynfrail         (failed to install)
* pmc              (check timed out)
* visdat           (NA)
* wand             (failed to install)
