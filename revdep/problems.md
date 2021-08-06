# ffscrapr

<details>

* Version: 1.4.5
* GitHub: https://github.com/ffverse/ffscrapr
* Source code: https://github.com/cran/ffscrapr
* Date/Publication: 2021-07-25 14:30:05 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "ffscrapr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       27. │   └─`%>%`(...)
       28. ├─dplyr::mutate_all(., as.character)
       29. │ └─dplyr:::check_grouped(.tbl, "mutate", "all", alt = TRUE)
       30. │   └─dplyr::is_grouped_df(tbl)
       31. ├─tidyr::pivot_longer(...)
       32. ├─tidyr:::pivot_longer.data.frame(...)
       33. │ └─tidyr::pivot_longer_spec(...)
       34. │   ├─base::t(matrix(seq_len(n_vals), ncol = n_vals/nrow(data)))
       35. │   └─base::matrix(seq_len(n_vals), ncol = n_vals/nrow(data))
       36. └─base::.handleSimpleError(...)
       37.   └─dplyr:::h(simpleError(msg, call))
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 117 ]
      Error: Test failures
      Execution halted
    ```

# r2dii.analysis

<details>

* Version: 0.1.10
* GitHub: https://github.com/2DegreesInvesting/r2dii.analysis
* Source code: https://github.com/cran/r2dii.analysis
* Date/Publication: 2021-07-09 12:30:02 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "r2dii.analysis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘r2dii.analysis-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: target_sda
    > ### Title: Add targets for CO2 emissions per unit production at the
    > ###   portfolio level, using the SDA approach
    > ### Aliases: target_sda
    > 
    > ### ** Examples
    > 
    ...
    > 
    > ald2 <- subset(ald, !is.na(emission_factor))
    > anyNA(ald2$emission_factor)
    [1] FALSE
    > 
    > out <- target_sda(matched, ald2, co2_intensity_scenario = co2_scenario)
    Error in matrix(seq_len(n_vals), ncol = n_vals/nrow(data)) : 
      invalid 'ncol' value (too large or NA)
    Calls: target_sda ... pivot_longer.data.frame -> pivot_longer_spec -> t -> matrix
    Execution halted
    ```

# simTool

<details>

* Version: 1.1.7
* GitHub: https://github.com/MarselScheer/simTool
* Source code: https://github.com/cran/simTool
* Date/Publication: 2020-09-22 16:00:03 UTC
* Number of recursive dependencies: 55

Run `cloud_details(, "simTool")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘tinytest.R’
    Running the tests in ‘tests/tinytest.R’ failed.
    Last 13 lines of output:
      test_unnest_simulation.R......    2 tests [0;32mOK[0m 
      test_unnest_simulation.R......    2 tests [0;32mOK[0m 
      test_unnest_simulation.R......    3 tests [0;32mOK[0m 
      test_unnest_simulation.R......    3 tests [0;32mOK[0m 
      test_unnest_simulation.R......    4 tests [0;32mOK[0m [0;36m48ms[0m
      ----- FAILED[attr]: test_eval_tibbles.R<297--297>
       call| simplify_the_simulation_results()
       call| -->expect_identical(expected_result, eg$simulation$results)
       diff| names for current but not for target
      Error: 1 out of 56 tests failed
      In addition: Warning message:
      The `.dots` argument of `group_by()` is deprecated as of dplyr 1.0.0.
      This warning is displayed once every 8 hours.
      Call `lifecycle::last_warnings()` to see where this warning was generated. 
      Execution halted
    ```

# strand

<details>

* Version: 0.2.0
* GitHub: https://github.com/strand-tech/strand
* Source code: https://github.com/cran/strand
* Date/Publication: 2020-11-19 21:40:06 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "strand")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Error: invalid 'ncol' value (too large or NA)
      Backtrace:
          █
       1. ├─sim$run() test_Simulation.R:389:2
       2. │ └─`%>%`(...)
       3. ├─dplyr::filter(., shares != 0)
       4. ├─tidyr::pivot_longer(...)
       5. └─tidyr:::pivot_longer.data.frame(...)
       6.   └─tidyr::pivot_longer_spec(...)
       7.     ├─base::t(matrix(seq_len(n_vals), ncol = n_vals/nrow(data)))
       8.     └─base::matrix(seq_len(n_vals), ncol = n_vals/nrow(data))
      
      [ FAIL 1 | WARN 1 | SKIP 0 | PASS 86 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# tidyjson

<details>

* Version: 0.3.1
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2020-05-31 21:30:03 UTC
* Number of recursive dependencies: 96

Run `cloud_details(, "tidyjson")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Failure (test-gather_object.R:149:3): can call repeatedly without having to change column.name ──
      suppressWarnings(...) not identical to tbl_json(...).
      Component "..JSON": names for current but not for target
      ── Failure (test-json_structure.R:44:3): simple object works ───────────────────
      `actual` not identical to `expected`.
      Component "length": names for current but not for target
      Component "..JSON": names for current but not for target
      ── Failure (test-json_structure.R:75:3): nested object works ───────────────────
      "{\"k1\": {\"k2\": \"value\"}}" %>% json_structure not identical to tbl_json(...).
      Component "length": names for current but not for target
      Component "..JSON": names for current but not for target
      
      [ FAIL 7 | WARN 0 | SKIP 10 | PASS 352 ]
      Error: Test failures
      Execution halted
    ```

# visR

<details>

* Version: 0.2.0
* GitHub: https://github.com/openpharma/visR
* Source code: https://github.com/cran/visR
* Date/Publication: 2021-06-14 09:00:02 UTC
* Number of recursive dependencies: 123

Run `cloud_details(, "visR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(visR)
      > library(vdiffr)
      > library(survival)
      > 
      > test_check("visR")
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (12)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-get_tableone.R:153:3): T4.4. An error when the `summary_function` is `summarize_long` ──
      `visR::get_tableone(data = data, summary_function = summarize_long)` did not throw an error.
      
      [ FAIL 1 | WARN 0 | SKIP 12 | PASS 535 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘parcats’
      All declared Imports should be used.
    ```

