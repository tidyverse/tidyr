## Test environments

* local OS X install, R 3.4.1
* ubuntu 12.04 (on travis-ci), R 3.4.1
* win-builder (devel and release)


## R CMD check results

0 errors | 0 warnings | 0 notes


## Reverse dependencies

I have run R CMD check on the 268 downstream dependencies. (Summary at
https://github.com/tidyverse/tidyr/tree/master/revdep).

There were 9 problematic packages. We carefully reviewed each failure
and determined that they were due to a deliberate backward
incompatible change to the tidyr API. Authors were notified on August
1 (two weeks ago) with a suggested fix for the problem.
