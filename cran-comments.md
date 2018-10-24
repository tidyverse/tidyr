## Test environments

* OS X install: R 3.4
* win-builder: R-devel
* travis-ci: R 3.1, R 3.2, R 3.3, R 3.4, R-devel

## R CMD check results

0 errors | 0 warnings | 0 notes

> revdepcheck::revdep_report_cran()
## revdepcheck results

We checked 571 reverse dependencies (518 from CRAN + 53 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 5 new problems
 * We failed to check 19 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* anomalize
  checking examples ... ERROR
  checking tests ...
  checking re-building of vignette outputs ... WARNING
  # Error: Must supply a symbol or a string as argument

* ggfortify
  checking tests ...
  
  Appears to be unlreated: Lapack routine dgesv: system is exactly singular: U[4,4] = 0

* InjurySeverityScore
  checking examples ... ERROR
  # Error: Must supply a symbol or a string as argument

* pivot
  checking tests ...
  # Error: Must supply a symbol or a string as argument

* postal
  checking tests ...
  
  Appears to be unrelated: "cannot open the connection"

### Failed to check

* ALA4R            (check timed out)
* anomalyDetection (failed to install)
* circumplex       (failed to install)
* colorednoise     (failed to install)
* dynfrail         (failed to install)
* ggstatsplot      (check timed out)
* HTSSIP           (check timed out)
* iotables         (failed to install)
* morse            (failed to install)
* nlmixr           (failed to install)
* pmc              (check timed out)
* ppcSpatial       (failed to install)
* prisonbrief      (failed to install)
* qdap             (failed to install)
* SCORPIUS         (failed to install)
* sf               (failed to install)
* trialr           (failed to install)
* vlad             (failed to install)
* wand             (failed to install)
