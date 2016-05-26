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

* This release only includes a bug fix to a function introduced in 
  0.4.0 so I have not run the reverse dependency checks.
