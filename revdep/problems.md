# BAwiR

<details>

* Version: 1.2.4
* Source code: https://github.com/cran/BAwiR
* URL: https://www.R-project.org, https://www.uv.es/vivigui, https://www.uv.es/vivigui/AppEuroACB.html
* Date/Publication: 2020-05-11 08:40:02 UTC
* Number of recursive dependencies: 126

Run `cloud_details(, "BAwiR")` for more info

</details>

## Newly broken

*   checking whether package ‘BAwiR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: 'rgl.init' failed, running with 'rgl.useNULL = TRUE'.
    See ‘/tmp/workdir/BAwiR/new/BAwiR.Rcheck/00install.out’ for details.
    ```

# HURDAT

<details>

* Version: 0.2.3.1
* Source code: https://github.com/cran/HURDAT
* URL: https://github.com/timtrice/HURDAT
* BugReports: https://github.com/timtrice/HURDAT/issues
* Date/Publication: 2020-01-28 14:20:11 UTC
* Number of recursive dependencies: 86

Run `cloud_details(, "HURDAT")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
       1. HURDAT:::parse_hurdat(txt)
       3. tidyr:::extract.data.frame(...)
       4. tidyr:::str_extract(value, into = into, regex = regex, convert = convert)
       5. tidyr:::str_match_first(x, regex)
       6. base::regexpr(regex, string, perl = TRUE)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 3 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 3 ]
      1. Error: Test AL (@test-hurdat.R#34) 
      2. Error: Test EP HURDAT (@test-hurdat.R#77) 
      3. Error: tests_no_errors (@test-hurdat.R#142) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rvest’ ‘xml2’
      All declared Imports should be used.
    ```

