## Test environments
* local OS X install, R 3.2.2
* ubuntu 12.04 (on travis-ci), R 3.2.2
* win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs. There is one NOTE:

* License components with restrictions and base license permitting such:
  MIT + file LICENSE

## Downstream dependencies

* I have also run R CMD check on the 45 downstream dependencies of tidyr
  (Summary at https://github.com/hadley/tidyr/blob/master/revdep/summary.md). 
  
* There is one failure possible related to tidyr: eurostat.  I have reported to 
  maintainer, but remains unfixed. I'll remind again today.

* All revdep maintainers were notified of the release on Jan 2.

