## Test environments
* local OS X install, R 3.1.2
* ubuntu 12.04 (on travis-ci), R 3.1.2
* win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs.

There was one NOTE:

  * Possibly mis-spelled words in DESCRIPTION:  dplyr (7:5)

    dplyr is the name of another package.  (Is there a reason that package
    names aren't automatically added to the list of valid words?)

## Downstream dependencies
I have also run R CMD check on the two downstream dependencies of tidyr 
(https://github.com/hadley/tidyr/blob/master/revdep/summary.md). Both packages passed without ERRORs, WARNINGs or NOTEs.
