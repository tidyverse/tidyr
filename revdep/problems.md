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
       19. ├─tidyr::complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)
       20. ├─tidyr:::complete.data.frame(...)
       21. │ ├─tidyr::expand(data, ...)
       22. │ └─tidyr:::expand.data.frame(data, ...)
       23. │   └─tidyr:::grid_dots(..., `_data` = data)
       24. │     └─rlang::eval_tidy(dot, data = mask)
       25. ├─tidyr::nesting(...)
       26. │ └─tidyr:::grid_dots(...)
       27. │   └─rlang::eval_tidy(dot, data = mask)
       28. └─base::.handleSimpleError(...)
       29.   └─dplyr:::h(simpleError(msg, call))
      
      [ FAIL 12 | WARN 0 | SKIP 0 | PASS 203 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘quickstart.Rmd’ using rmarkdown
    Quitting from lines 36-38 (quickstart.Rmd) 
    Error: processing vignette 'quickstart.Rmd' failed with diagnostics:
    Problem with `summarise()` input `..1`.
    ℹ `..1 = complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)`.
    ✖ object 'level_1_region_code' not found
    ℹ The error occurred in group 1: level_1_region = "Afghanistan", level_1_region_code = "AF".
    --- failed re-building ‘quickstart.Rmd’
    
    ...
    Quitting from lines 30-34 (testing.Rmd) 
    Error: processing vignette 'testing.Rmd' failed with diagnostics:
    Test failed
    --- failed re-building ‘testing.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘quickstart.Rmd’ ‘slowstart.Rmd’ ‘testing.Rmd’
    
    Error: Vignette re-building failed.
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

# simpr

<details>

* Version: 0.2.1
* GitHub: https://github.com/statisfactions/simpr
* Source code: https://github.com/cran/simpr
* Date/Publication: 2022-01-12 10:50:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "simpr")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    pivot_wider:
      function(data, id_cols, id_expand, names_from, names_prefix,
               names_sep, names_glue, names_sort, names_vary, names_expand,
               names_repair, values_from, values_fill, values_fn,
               unused_fn, ...)
    pivot_wider.simpr_sims:
      function(data, id_cols, names_from, names_prefix, names_sep,
               names_glue, names_sort, names_repair, values_from,
               values_fill, values_fn, ...)
    
    ...
               names_sep, names_glue, names_sort, names_vary, names_expand,
               names_repair, values_from, values_fill, values_fn,
               unused_fn, ...)
    pivot_wider.simpr_spec:
      function(data, id_cols, names_from, names_prefix, names_sep,
               names_glue, names_sort, names_repair, values_from,
               values_fill, values_fn, ...)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
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

# SWMPrExtension

<details>

* Version: 2.1.0
* GitHub: https://github.com/NOAA-OCM/SWMPrExtension
* Source code: https://github.com/cran/SWMPrExtension
* Date/Publication: 2021-10-13 17:12:03 UTC
* Number of recursive dependencies: 115

Run `cloud_details(, "SWMPrExtension")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘SWMPrExtension-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: seasonal_boxplot
    > ### Title: Seasonal boxplots
    > ### Aliases: seasonal_boxplot seasonal_boxplot.swmpr
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    ...
      9. │       └─mask$eval_all_summarise(quo)
     10. ├─tidyr::complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)
     11. ├─tidyr:::complete.data.frame(...)
     12. │ ├─tidyr::expand(data, ...)
     13. │ └─tidyr:::expand.data.frame(data, ...)
     14. │   └─tidyr:::grid_dots(..., `_data` = data)
     15. │     └─rlang::eval_tidy(dot, data = mask)
     16. └─base::.handleSimpleError(...)
     17.   └─dplyr:::h(simpleError(msg, call))
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

# Tplyr

<details>

* Version: 0.4.3
* GitHub: https://github.com/atorus-research/Tplyr
* Source code: https://github.com/cran/Tplyr
* Date/Publication: 2021-12-06 17:50:02 UTC
* Number of recursive dependencies: 116

Run `cloud_details(, "Tplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Tplyr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Tplyr
    > ### Title: A grammar of summary data for clinical reports
    > ### Aliases: Tplyr Tplyr-package
    > 
    > ### ** Examples
    > 
    > # Load in pipe
    ...
     21. │     └─mask$eval_all_summarise(quo)
     22. ├─tidyr::complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)
     23. ├─tidyr:::complete.data.frame(...)
     24. │ ├─tidyr::expand(data, ...)
     25. │ └─tidyr:::expand.data.frame(data, ...)
     26. │   └─tidyr:::grid_dots(..., `_data` = data)
     27. │     └─rlang::eval_tidy(dot, data = mask)
     28. └─base::.handleSimpleError(...)
     29.   └─dplyr:::h(simpleError(msg, call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      dim(s1$formatted_data) not equal to c(3, 11).
      target is NULL, current is numeric
      ── Failure (test-shift.R:71:3): group_shift outputs the expected formatted data ──
      dim(s2$formatted_data) not equal to c(3, 11).
      target is NULL, current is numeric
      ── Failure (test-shift.R:72:3): group_shift outputs the expected formatted data ──
      dim(s3$formatted_data) not equal to c(3, 11).
      target is NULL, current is numeric
      ── Failure (test-shift.R:75:3): group_shift outputs the expected formatted data ──
      t4$layers[[1]]$formatted_data$row_label1 not equal to c("6", "8", "4").
      target is NULL, current is character
      
      [ FAIL 15 | WARN 0 | SKIP 0 | PASS 668 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Tplyr.Rmd’ using rmarkdown
    Quitting from lines 333-345 (Tplyr.Rmd) 
    Error: processing vignette 'Tplyr.Rmd' failed with diagnostics:
    Problem with `summarise()` input `..1`.
    ℹ `..1 = complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)`.
    ✖ object 'BNRIND' not found
    ℹ The error occurred in group 1: BNRIND = N, ANRIND = N, TRTA = Placebo.
    --- failed re-building ‘Tplyr.Rmd’
    
    ...
    --- failed re-building ‘shift.Rmd’
    
    --- re-building ‘table.Rmd’ using rmarkdown
    --- finished re-building ‘table.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Tplyr.Rmd’ ‘denom.Rmd’ ‘shift.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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

