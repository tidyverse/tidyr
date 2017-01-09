This is a resubmission that fixes:

1. Non-canonical CRAN url in README.md
2. Use of ` instead of ' in package title

---

## Test environments
* local OS X install, R 3.3.2
* ubuntu 12.04 (on travis-ci), R 3.3.2
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 2 notes

* License components with restrictions and base license permitting such:
  MIT + file LICENSE
  
* checking data for non-ASCII characters ... NOTE
  Note: found 23 marked UTF-8 strings

## Downstream dependencies

I did not run R CMD check as this is a patch release to fix a test failure 
with the dev version of tibble.
