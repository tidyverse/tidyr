## Test environments
* local OS X install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.3.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* License components with restrictions and base license permitting such:
  MIT + file LICENSE

* Found the following (possibly) invalid URLs:
  https://www.eecs.berkeley.edu/Pubs/TechRpts/2000/CSD-00-1110.pdf
  
  Not sure what the problem is here: curl reports "error:14077102:SSL
  routines:SSL23_GET_SERVER_HELLO:unsupported protocol" but the page
  loads fine in my browser.

## Downstream dependencies

I ran `R CMD check` on all 90 reverse dependencies.
Results at https://github.com/hadley/tidyr/tree/master/revdep/.

As far as I can tell, there were no problems related to this tidyr release.
