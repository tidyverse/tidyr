# cutpointr

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2020-04-14 08:50:10 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"cutpointr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 493 | SKIPPED: 0 | WARNINGS: 1643 | FAILED: 10 ]
      1.  Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#681) 
      2.  Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#696) 
      3.  Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#704) 
      4.  Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#718) 
      5.  Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#729) 
      6.  Failure: cutpointr works if method / metric are called with :: (@test-cutpointr.R#1291) 
      7.  Failure: cutpointr works if method / metric are called with :: (@test-cutpointr.R#1294) 
      8.  Failure: Summary(multi_cutpointr) is silent (@test-cutpointr.R#1324) 
      9.  Failure: Summary(multi_cutpointr) is silent (@test-cutpointr.R#1331) 
      10. Failure: multi_cutpointr fetches numeric columns correctly (@test-cutpointr.R#1356) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simTool

<details>

* Version: 1.1.5
* Source code: https://github.com/cran/simTool
* URL: https://github.com/MarselScheer/simTool
* BugReports: https://github.com/MarselScheer/simTool/issues
* Date/Publication: 2020-03-15 20:10:02 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"simTool")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      fs$results not identical to fs$expected.
      names for target but not for current
      
      ── 3. Failure: Create a tibble containing the results sumamrized by one summary 
      fs$results not identical to fs$expected.
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 97 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: Simplify the simulation results (@test_eval_tibbles.R#381) 
      2. Failure: Create a tibble containing the results for every replication (@test_frame_simulation.R#33) 
      3. Failure: Create a tibble containing the results sumamrized by one summary function (@test_frame_simulation.R#73) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyjson

<details>

* Version: 0.2.4
* Source code: https://github.com/cran/tidyjson
* URL: https://github.com/colearendt/tidyjson
* BugReports: https://github.com/colearendt/tidyjson/issues
* Date/Publication: 2019-12-02 21:39:30
* Number of recursive dependencies: 89

Run `revdep_details(,"tidyjson")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 290 | SKIPPED: 7 | WARNINGS: 0 | FAILED: 10 ]
      1.  Failure: has correct complete structure with simple input (@test-append_values.R#7) 
      2.  Failure: recursive works as expected (@test-append_values.R#191) 
      3.  Failure: recursive works as expected (@test-append_values.R#206) 
      4.  Failure: works in a simple case (@test-gather_object.R#7) 
      5.  Failure: works with compound values (@test-gather_object.R#31) 
      6.  Failure: column.name works and doesn't clobber existing name (@test-gather_object.R#80) 
      7.  Error: preserves a NULL column (@test-gather_object.R#100) 
      8.  Failure: can call repeatedly without having to change column.name (@test-gather_object.R#150) 
      9.  Error: simple object works (@test-json_structure.R#27) 
      10. Error: nested object works (@test-json_structure.R#71) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# vroom

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/vroom
* URL: https://github.com/r-lib/vroom
* BugReports: https://github.com/r-lib/vroom/issues
* Date/Publication: 2020-01-13 22:40:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"vroom")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(vroom)
      > 
      > if (requireNamespace("xml2")) {
      +   test_check("vroom", reporter = MultiReporter$new(reporters = list(JunitReporter$new(file = "test-results.xml"), CheckReporter$new())))
      + } else {
      +   test_check("vroom")
      + }
      Loading required namespace: xml2
      Error: C stack usage  7969252 is too close to the limit
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.1Mb
      sub-directories of 1Mb or more:
        libs  14.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘usethis’
    ```

