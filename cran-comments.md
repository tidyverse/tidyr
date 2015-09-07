## Test environments
* local OS X install, R 3.1.2
* ubuntu 12.04 (on travis-ci), R 3.1.2
* win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs. There is one NOTE:

* License components with restrictions and base license permitting such:
  MIT + file LICENSE

## Downstream dependencies

* I have also run R CMD check on the 27 downstream dependencies of tidyr
  (Summary at https://github.com/hadley/tidyr/blob/master/revdep/summary.md). 
  
* There are three new failures:

  * emil, quickpsy: imports too many packages completely so now has warning
  * radiant: an example fails

* I notified all authors on Aug 24, giving them two weeks to make changes.

* I re-notified the 3 authors today.
