## Test environments

* OS X install: R 3.5
* win-builder: R-devel
* travis-ci: R 3.1, R 3.2, R 3.3, R 3.4, R-devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 996 reverse dependencies (874 from CRAN + 122 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 4 new problems
 * We failed to check 17 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* amt
  checking examples ... ERROR

* cutpointr
  checking examples ... ERROR
  checking tests ... ERROR
  Fixed in development version

* processR
  checking whether package ‘processR’ can be installed ... WARNING
  False positive - related to RGL

* SEERaBomb
  checking whether package ‘SEERaBomb’ can be installed ... WARNING
  False positive - related to RGL
  

### Failed to check

* CB2              (NA)
* crawl            (NA)
* dartR            (NA)
* diceR            (NA)
* dimRed           (NA)
* fingertipscharts (NA)
* GADMTools        (NA)
* ggmsa            (NA)
* PWFSLSmoke       (NA)
* rmapzen          (NA)
* SimDesign        (NA)
* simplevis        (NA)
* stats19          (NA)
* sugarbag         (NA)
* tidygeocoder     (NA)
* tmap             (NA)
* wrswoR           (NA)
