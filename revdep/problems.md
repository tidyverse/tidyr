# archiveRetriever

<details>

* Version: 0.1.0
* GitHub: https://github.com/liserman/archiveRetriever
* Source code: https://github.com/cran/archiveRetriever
* Date/Publication: 2021-05-27 10:40:02 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "archiveRetriever")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `retrieve_urls(...)` threw an error with unexpected message.
      Expected match: "Homepage has never been saved in the Internet Archive"
      Actual message: "Homepage could not be loaded. Please check whether the page exists or try again."
      Backtrace:
          █
       1. ├─testthat::expect_error(...) test_retrieve_urls.R:62:12
       2. │ └─testthat:::quasi_capture(...)
       3. │   ├─testthat:::.capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─archiveRetriever::retrieve_urls(...)
      
      [ FAIL 1 | WARN 0 | SKIP 16 | PASS 37 ]
      Error: Test failures
      Execution halted
    ```

# causact

<details>

* Version: 0.4.0
* GitHub: https://github.com/flyaflya/causact
* Source code: https://github.com/cran/causact
* Date/Publication: 2021-01-25 17:00:11 UTC
* Number of recursive dependencies: 85

Run `cloud_details(, "causact")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘causact-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dag_diagrammer
    > ### Title: The graph object should be of class 'causact_graph' and created
    > ###   using 'dag_create()'.
    > ### Aliases: dag_diagrammer
    > 
    > ### ** Examples
    > 
    ...
     14. ├─tidyr::replace_na(., "")
     15. └─tidyr:::replace_na.default(., "")
     16.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     17.     └─(function () ...
     18.       └─vctrs::vec_default_cast(...)
     19.         └─vctrs::stop_incompatible_cast(...)
     20.           └─vctrs::stop_incompatible_type(...)
     21.             └─vctrs:::stop_incompatible(...)
     22.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# covidregionaldata

<details>

* Version: 0.9.2
* GitHub: https://github.com/epiforecasts/covidregionaldata
* Source code: https://github.com/cran/covidregionaldata
* Date/Publication: 2021-07-05 11:20:06 UTC
* Number of recursive dependencies: 139

Run `cloud_details(, "covidregionaldata")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("covidregionaldata")
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-processing.R:102:3): complete_cumulative_columns works ────────
      colnames(actual_data) (`actual`) not equal to colnames(expected_data) (`expected`).
      
          actual                | expected                 
      [1] "level_1_region"      - "date"                [1]
      [2] "date"                - "level_1_region"      [2]
      [3] "level_1_region_code" | "level_1_region_code" [3]
      [4] "cases"               | "cases"               [4]
      [5] "cases_total"         | "cases_total"         [5]
      
      [ FAIL 1 | WARN 3 | SKIP 0 | PASS 269 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 200 marked UTF-8 strings
    ```

# crosstable

<details>

* Version: 0.3.2
* GitHub: https://github.com/DanChaltiel/crosstable
* Source code: https://github.com/cran/crosstable
* Date/Publication: 2021-11-27 20:00:02 UTC
* Number of recursive dependencies: 114

Run `cloud_details(, "crosstable")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   └─attr(ct, "by_levels") %>% replace_na("NA") %>% unlist()
        4. ├─base::unlist(.)
        5. ├─tidyr::replace_na(., "NA")
        6. └─tidyr:::replace_na.default(., "NA")
        7.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
        8.     └─(function () ...
        9.       └─vctrs::vec_default_cast(...)
       10.         └─vctrs::stop_incompatible_cast(...)
       11.           └─vctrs::stop_incompatible_type(...)
       12.             └─vctrs:::stop_incompatible(...)
       13.               └─vctrs:::stop_vctrs(...)
      
      [ FAIL 1 | WARN 0 | SKIP 20 | PASS 326 ]
      Error: Test failures
      Execution halted
    ```

# DiagrammeR

<details>

* Version: 1.0.6.1
* GitHub: https://github.com/rich-iannone/DiagrammeR
* Source code: https://github.com/cran/DiagrammeR
* Date/Publication: 2020-05-08 21:40:02 UTC
* Number of recursive dependencies: 93

Run `cloud_details(, "DiagrammeR")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘graphviz-mermaid.Rmd’ using rmarkdown
    --- finished re-building ‘graphviz-mermaid.Rmd’
    
    --- re-building ‘node-edge-data-frames.Rmd’ using rmarkdown
    --- finished re-building ‘node-edge-data-frames.Rmd’
    
    --- re-building ‘selections.Rmd’ using rmarkdown
    --- finished re-building ‘selections.Rmd’
    
    ...
    --- failed re-building ‘simple-graphs-ndfs-edfs.Rmd’
    
    --- re-building ‘traversals.Rmd’ using rmarkdown
    --- finished re-building ‘traversals.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘simple-graphs-ndfs-edfs.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.2Mb
      sub-directories of 1Mb or more:
        doc           9.7Mb
        htmlwidgets   2.9Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# DSSAT

<details>

* Version: 0.0.5
* GitHub: https://github.com/palderman/DSSAT
* Source code: https://github.com/cran/DSSAT
* Date/Publication: 2021-12-21 16:32:02 UTC
* Number of recursive dependencies: 46

Run `cloud_details(, "DSSAT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘DSSAT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_v_fmt
    > ### Title: Adds variable format information to a tibble
    > ### Aliases: add_v_fmt
    > 
    > ### ** Examples
    > 
    > 
    ...
     19. ├─tidyr::replace_na(.data$width, "")
     20. └─tidyr:::replace_na.default(.data$width, "")
     21.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     22.     └─(function () ...
     23.       └─vctrs::vec_default_cast(...)
     24.         └─vctrs::stop_incompatible_cast(...)
     25.           └─vctrs::stop_incompatible_type(...)
     26.             └─vctrs:::stop_incompatible(...)
     27.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# emayili

<details>

* Version: 0.7.0
* GitHub: https://github.com/datawookie/emayili
* Source code: https://github.com/cran/emayili
* Date/Publication: 2021-12-13 09:30:09 UTC
* Number of recursive dependencies: 77

Run `cloud_details(, "emayili")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘emayili-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: parties
    > ### Title: Extract sender and recipient(s)
    > ### Aliases: parties
    > 
    > ### ** Examples
    > 
    > email <- envelope() %>%
    ...
      5. ├─dplyr::select(., -address)
      6. ├─tidyr::unnest(., values)
      7. ├─tidyr::hoist(., address, "values")
      8. │ └─purrr::map(...)
      9. │   └─tidyr:::.f(.x[[i]], ...)
     10. │     └─tidyr:::strike(x, plucker)
     11. │       └─vctrs::vec_size(x)
     12. └─vctrs:::stop_scalar_type(...)
     13.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. ├─dplyr::mutate(...)
        4. ├─dplyr::rename(., address = values)
        5. ├─dplyr::select(., -address)
        6. ├─tidyr::unnest(., values)
        7. ├─tidyr::hoist(., address, "values")
        8. │ └─purrr::map(...)
        9. │   └─tidyr:::.f(.x[[i]], ...)
       10. │     └─tidyr:::strike(x, plucker)
       11. │       └─vctrs::vec_size(x)
       12. └─vctrs:::stop_scalar_type(...)
       13.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      [ FAIL 12 | WARN 4 | SKIP 12 | PASS 188 ]
      Error: Test failures
      Execution halted
    ```

# heuristicsmineR

<details>

* Version: 0.2.5
* GitHub: https://github.com/bupaverse/heuristicsmineR
* Source code: https://github.com/cran/heuristicsmineR
* Date/Publication: 2021-10-11 18:50:05 UTC
* Number of recursive dependencies: 103

Run `cloud_details(, "heuristicsmineR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘heuristicsmineR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: causal_custom
    > ### Title: Custom map profile
    > ### Aliases: causal_custom
    > 
    > ### ** Examples
    > 
    > causal_net(L_heur_1,
    ...
     18. ├─tidyr::replace_na(., "")
     19. └─tidyr:::replace_na.default(., "")
     20.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     21.     └─(function () ...
     22.       └─vctrs::vec_default_cast(...)
     23.         └─vctrs::stop_incompatible_cast(...)
     24.           └─vctrs::stop_incompatible_type(...)
     25.             └─vctrs:::stop_incompatible(...)
     26.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        libs   4.4Mb
    ```

# iotables

<details>

* Version: 0.4.7
* GitHub: https://github.com/rOpenGov/iotables
* Source code: https://github.com/cran/iotables
* Date/Publication: 2021-12-22 17:30:02 UTC
* Number of recursive dependencies: 115

Run `cloud_details(, "iotables")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘environmental_impact.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    Columns and rows of CPA_L68A, CPA_T, CPA_U are all zeros and will be removed.
    Joining, by = c("prod_na", "CPA_A01", "CPA_A02", "CPA_A03", "CPA_B", "CPA_C10-12", "CPA_C13-15", "CPA_C16", "CPA_C17", "CPA_C18", "CPA_C19", "CPA_C20", "CPA_C21", "CPA_C22", "CPA_C23", "CPA_C24", "CPA_C25", "CPA_C26", "CPA_C27", "CPA_C28", "CPA_C29", "CPA_C30", "CPA_C31_32", "CPA_C33", "CPA_D", "CPA_E36", "CPA_E37-39", "CPA_F", "CPA_G45", "CPA_G46", "CPA_H49", "CPA_H50", "CPA_H51", "CPA_H52", "CPA_H53", "CPA_I", "CPA_J58", "CPA_J59_60", "CPA_J61", "CPA_J62_63", "CPA_K64", "CPA_K65", "CPA_K66", "CPA_L68B", "CPA_M69_70", "CPA_M71", "CPA_M72", "CPA_M73", "CPA_M74_75", "CPA_N77", "CPA_N78", "CPA_N79", "CPA_N80-82", "CPA_O", "CPA_P", "CPA_Q86", "CPA_Q87_88", "CPA_R90-92", "CPA_R93", "CPA_S94", "CPA_S95", "CPA_S96")
    Columns and rows of CPA_L68A are all zeros and will be removed.
    --- finished re-building ‘working_with_eurostat.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘environmental_impact.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# PheVis

<details>

* Version: 1.0.2
* GitHub: NA
* Source code: https://github.com/cran/PheVis
* Date/Publication: 2021-02-23 09:40:21 UTC
* Number of recursive dependencies: 81

Run `cloud_details(, "PheVis")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      sum((result$cum_month - expected_vec1)^2) not equal to 0.
      1/1 mismatches
      [1] 9 - 0 == 9
      ── Failure (test-traintest_phevis.R:54:9): test all pipeline is working ────────
      check_value[1] not equal to 0.
      1/1 mismatches
      [1] -0.000951 - 0 == -0.000951
      ── Failure (test-traintest_phevis.R:55:9): test all pipeline is working ────────
      check_value[2] not equal to 0.
      1/1 mismatches
      [1] -0.00151 - 0 == -0.00151
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 1 ]
      Error: Test failures
      Execution halted
    ```

# processanimateR

<details>

* Version: 1.0.4
* GitHub: https://github.com/bupaverse/processanimateR
* Source code: https://github.com/cran/processanimateR
* Date/Publication: 2021-10-11 18:50:02 UTC
* Number of recursive dependencies: 116

Run `cloud_details(, "processanimateR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘processanimateR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: animate_process
    > ### Title: Animate cases on a process map
    > ### Aliases: animate_process
    > 
    > ### ** Examples
    > 
    > data(example_log)
    ...
     15. ├─tidyr::replace_na(., "")
     16. └─tidyr:::replace_na.default(., "")
     17.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     18.     └─(function () ...
     19.       └─vctrs::vec_default_cast(...)
     20.         └─vctrs::stop_incompatible_cast(...)
     21.           └─vctrs::stop_incompatible_type(...)
     22.             └─vctrs:::stop_incompatible(...)
     23.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘use-external-data-to-change-tokens.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    
    --- re-building ‘use-with-shiny.Rmd’ using rmarkdown
    --- finished re-building ‘use-with-shiny.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘use-external-data-to-change-tokens.Rmd’
      ‘use-timestamp-change-token-aes.Rmd’ ‘use-token_scales.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.9Mb
      sub-directories of 1Mb or more:
        doc          11.1Mb
        htmlwidgets   2.6Mb
    ```

# r2dii.analysis

<details>

* Version: 0.1.12
* GitHub: https://github.com/2DegreesInvesting/r2dii.analysis
* Source code: https://github.com/cran/r2dii.analysis
* Date/Publication: 2021-08-18 07:30:02 UTC
* Number of recursive dependencies: 71

Run `cloud_details(, "r2dii.analysis")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      round(out$adjusted_scenario_b2ds$emission_factor_value, 2) not equal to c(6.45, 5.42, 4.39, 3.35, 2.32, 1.29).
      Lengths differ: 2 is not 6
      ── Failure (test-target_sda.R:225:3): with known input outputs as expected ─────
      round(out$adjusted_scenario_sds$emission_factor_value, 2) not equal to c(6.45, 6.19, 5.93, 5.68, 5.42, 5.16).
      Lengths differ: 2 is not 6
      ── Failure (test-target_sda.R:229:3): with known input outputs as expected ─────
      round(out$target_b2ds$emission_factor_value, 2) not equal to c(0.9, 0.98, 1.06, 1.13, 1.21, 1.29).
      Lengths differ: 2 is not 6
      ── Failure (test-target_sda.R:233:3): with known input outputs as expected ─────
      round(out$target_sds$emission_factor_value, 2) not equal to c(0.9, 1.75, 2.6, 3.46, 4.31, 5.16).
      Lengths differ: 2 is not 6
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 208 ]
      Error: Test failures
      Execution halted
    ```

# RavenR

<details>

* Version: 2.1.4
* GitHub: https://github.com/rchlumsk/RavenR
* Source code: https://github.com/cran/RavenR
* Date/Publication: 2021-09-23 15:50:02 UTC
* Number of recursive dependencies: 123

Run `cloud_details(, "RavenR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RavenR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: rvn_rvi_process_diagrammer
    > ### Title: Plot Raven hydrologic process network using DiagrammeR
    > ### Aliases: rvn_rvi_process_diagrammer
    > 
    > ### ** Examples
    > 
    > d1 <- rvn_rvi_read(system.file("extdata","Nith.rvi", package="RavenR")) %>%
    ...
     14. ├─tidyr::replace_na(., "")
     15. └─tidyr:::replace_na.default(., "")
     16.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     17.     └─(function () ...
     18.       └─vctrs::vec_default_cast(...)
     19.         └─vctrs::stop_incompatible_cast(...)
     20.           └─vctrs::stop_incompatible_type(...)
     21.             └─vctrs:::stop_incompatible(...)
     22.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc       1.1Mb
        extdata   1.3Mb
        libs      2.0Mb
    ```

# skater

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/skater
* Date/Publication: 2021-12-03 18:50:02 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "skater")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘basic_usage.Rmd’ using rmarkdown
    Quitting from lines 185-195 (basic_usage.Rmd) 
    Error: processing vignette 'basic_usage.Rmd' failed with diagnostics:
    Problem with `mutate()` column `degree_truth`.
    ℹ `degree_truth = tidyr::replace_na(degree_truth, "unrelated")`.
    ✖ Can't convert `replace` <character> to match type of `data` <integer>.
    --- failed re-building ‘basic_usage.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘basic_usage.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sparklyr

<details>

* Version: 1.7.4
* GitHub: https://github.com/sparklyr/sparklyr
* Source code: https://github.com/cran/sparklyr
* Date/Publication: 2022-01-08 11:20:02 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "sparklyr")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    pivot_wider:
      function(data, id_cols, id_expand, names_from, names_prefix,
               names_sep, names_glue, names_sort, names_vary, names_expand,
               names_repair, values_from, values_fill, values_fn,
               unused_fn, ...)
    pivot_wider.tbl_spark:
      function(data, id_cols, names_from, names_prefix, names_sep,
               names_glue, names_sort, names_repair, values_from,
               values_fill, values_fn, ...)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        java   3.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lifecycle’
      All declared Imports should be used.
    ```

# tabshiftr

<details>

* Version: 0.3.0
* GitHub: https://github.com/EhrmannS/tabshiftr
* Source code: https://github.com/cran/tabshiftr
* Date/Publication: 2021-07-01 07:10:02 UTC
* Number of recursive dependencies: 70

Run `cloud_details(, "tabshiftr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tabshiftr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: .find
    > ### Title: Determine row or column on the fly
    > ### Aliases: .find
    > 
    > ### ** Examples
    > 
    > # use regular expressions to find cell positions
    ...
     19.         └─tidyselect:::vars_select_eval(...)
     20.           └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
     21.             └─tidyselect:::as_indices_sel_impl(...)
     22.               └─tidyselect:::as_indices_impl(x, vars, strict = strict)
     23.                 └─tidyselect:::chr_as_locations(x, vars)
     24.                   └─vctrs::vec_as_location(x, n = length(vars), names = vars)
     25.                     └─(function () ...
     26.                       └─vctrs:::stop_subscript_oob(...)
     27.                         └─vctrs:::stop_subscript(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       21.         │ └─tidyselect:::instrument_base_errors(expr)
       22.         │   └─base::withCallingHandlers(...)
       23.         └─tidyselect:::vars_select_eval(...)
       24.           └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
       25.             └─tidyselect:::as_indices_sel_impl(...)
       26.               └─tidyselect:::as_indices_impl(x, vars, strict = strict)
       27.                 └─tidyselect:::chr_as_locations(x, vars)
       28.                   └─vctrs::vec_as_location(x, n = length(vars), names = vars)
       29.                     └─(function () ...
       30.                       └─vctrs:::stop_subscript_oob(...)
       31.                         └─vctrs:::stop_subscript(...)
      
      [ FAIL 12 | WARN 0 | SKIP 0 | PASS 116 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘tabshiftr.Rmd’ using rmarkdown
    Quitting from lines 189-192 (tabshiftr.Rmd) 
    Error: processing vignette 'tabshiftr.Rmd' failed with diagnostics:
    Can't subset columns that don't exist.
    ✖ Column `value` doesn't exist.
    --- failed re-building ‘tabshiftr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘tabshiftr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidygate

<details>

* Version: 0.4.8
* GitHub: https://github.com/stemangiola/tidygate
* Source code: https://github.com/cran/tidygate
* Date/Publication: 2022-01-03 23:20:02 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "tidygate")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygate-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gate
    > ### Title: DEPRECATED - use gate_chr, gate_int instead inside a
    > ###   dplyr::mutate() statement
    > ### Aliases: gate gate.spec_tbl_df gate.tbl_df
    > ### Keywords: internal
    > 
    > ### ** Examples
    ...
     17. ├─tidyr::replace_na(gate, 0)
     18. └─tidyr:::replace_na.default(gate, 0)
     19.   └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     20.     └─(function () ...
     21.       └─vctrs::vec_default_cast(...)
     22.         └─vctrs::stop_incompatible_cast(...)
     23.           └─vctrs::stop_incompatible_type(...)
     24.             └─vctrs:::stop_incompatible(...)
     25.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

# tidytidbits

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/tidytidbits
* Date/Publication: 2021-03-08 16:22:06 UTC
* Number of recursive dependencies: 29

Run `cloud_details(, "tidytidbits")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytidbits-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: count_at
    > ### Title: Count by multiple variables
    > ### Aliases: count_at
    > 
    > ### ** Examples
    > 
    > library(magrittr)
    ...
     10. ├─tidyr::replace_na(., na_replacement_list)
     11. └─tidyr:::replace_na.data.frame(., na_replacement_list)
     12.   └─vctrs::vec_assign(...)
     13.     └─(function () ...
     14.       └─vctrs::vec_default_cast(...)
     15.         └─vctrs::stop_incompatible_cast(...)
     16.           └─vctrs::stop_incompatible_type(...)
     17.             └─vctrs:::stop_incompatible(...)
     18.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# xml2relational

<details>

* Version: 0.1.0
* GitHub: https://github.com/jsugarelli/xml2relational
* Source code: https://github.com/cran/xml2relational
* Date/Publication: 2020-05-11 12:40:03 UTC
* Number of recursive dependencies: 25

Run `cloud_details(, "xml2relational")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xml2relational-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getCreateSQL
    > ### Title: Exporting the relational data model and data to a database
    > ### Aliases: getCreateSQL
    > 
    > ### ** Examples
    > 
    > # Find path to custmers.xml example file in package directory
    ...
      8.             ├─tidyr::replace_na(elem.df[record, i], 0)
      9.             └─tidyr:::replace_na.default(elem.df[record, i], 0)
     10.               └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     11.                 └─(function () ...
     12.                   └─vctrs::vec_default_cast(...)
     13.                     └─vctrs::stop_incompatible_cast(...)
     14.                       └─vctrs::stop_incompatible_type(...)
     15.                         └─vctrs:::stop_incompatible(...)
     16.                           └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

