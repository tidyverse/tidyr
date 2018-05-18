## Test environments

* OS X install: R 3.4
* win-builder: R-devel
* travis-ci: R 3.1, R 3.2, R 3.3, R 3.4, R-devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 436 reverse dependencies (406 from CRAN + 30 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 1 new problems
 * We failed to check 39 packages

Issues with CRAN packages are summarised below. I do not believe these are related to tidyr changes.

### New problems
(This reports the first line of each new failure)

* alphavantager
  checking tests ...
  
  This was a random http failure.

### Failed to check

There were more failures than usual so I double checked - the root cause was the failure of my automated system to install data.table.

* ARTool          (failed to install)
* BAwiR           (failed to install)
* bootnet         (failed to install)
* dlookr          (failed to install)
* eemR            (failed to install)
* genogeographer  (failed to install)
* geomnet         (failed to install)
* ggCompNet       (failed to install)
* ggeffects       (failed to install)
* ggmosaic        (failed to install)
* ggstatsplot     (failed to install)
* highcharter     (failed to install)
* IDE             (failed to install)
* morse           (failed to install)
* neuropsychology (failed to install)
* NOAAWeather     (failed to install)
* olsrr           (failed to install)
* OutliersO3      (failed to install)
* patentsview     (check timed out)
* pmc             (check timed out)
* processanimateR (failed to install)
* psycho          (failed to install)
* qdap            (failed to install)
* radiant.basics  (failed to install)
* radiant.data    (failed to install)
* radiant.model   (failed to install)
* refund.shiny    (failed to install)
* rprev           (failed to install)
* RtutoR          (failed to install)
* Seurat          (failed to install)
* sf              (failed to install)
* simmer.plot     (failed to install)
* sjmisc          (failed to install)
* sjPlot          (failed to install)
* sjstats         (failed to install)
* staRdom         (failed to install)
* survminer       (failed to install)
* theseus         (failed to install)
* wand            (failed to install)
