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
       20. ├─tidyr:::complete.data.frame(...)
       21. │ ├─tidyr::expand(data, ...)
       22. │ └─tidyr:::expand.data.frame(data, ...)
       23. │   └─tidyr:::grid_dots(..., `_data` = data)
       24. │     └─rlang::eval_tidy(dot, data = mask)
       25. ├─tidyr::nesting(...)
       26. │ └─tidyr:::grid_dots(...)
       27. │   └─rlang::eval_tidy(dot, data = mask)
       28. └─base::.handleSimpleError(...)
       29.   └─dplyr h(simpleError(msg, call))
       30.     └─rlang::abort(bullets, class = "dplyr_error")
      
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
      6. ├─tidyr::unnest(., values)
      7. ├─tidyr::hoist(., address, "values")
      8. │ └─purrr::map(...)
      9. │   └─tidyr .f(.x[[i]], ...)
     10. │     └─tidyr:::strike(x, plucker)
     11. │       └─vctrs::vec_size(x)
     12. └─vctrs:::stop_scalar_type(`<fn>`(`<header>`), "")
     13.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
     14.     └─rlang::abort(message, class = c(class, "vctrs_error"), ...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─dplyr::rename(., address = values)
        5. ├─dplyr::select(., -address)
        6. ├─tidyr::unnest(., values)
        7. ├─tidyr::hoist(., address, "values")
        8. │ └─purrr::map(...)
        9. │   └─tidyr .f(.x[[i]], ...)
       10. │     └─tidyr:::strike(x, plucker)
       11. │       └─vctrs::vec_size(x)
       12. └─vctrs:::stop_scalar_type(`<fn>`(`<header>`), "")
       13.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
       14.     └─rlang::abort(message, class = c(class, "vctrs_error"), ...)
      
      [ FAIL 12 | WARN 4 | SKIP 12 | PASS 188 ]
      Error: Test failures
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
    Caused by error in `stop_vctrs()`:
    ! Can't convert `replace` <character> to match type of `data` <integer>.
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

*   checking dependencies in R code ... WARNING
    ```
    Namespace in Imports field not imported from: ‘lifecycle’
      All declared Imports should be used.
    Missing or unexported object: ‘rlang::is_env’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        java   3.4Mb
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
     10. ├─tidyr::complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)
     11. ├─tidyr:::complete.data.frame(...)
     12. │ ├─tidyr::expand(data, ...)
     13. │ └─tidyr:::expand.data.frame(data, ...)
     14. │   └─tidyr:::grid_dots(..., `_data` = data)
     15. │     └─rlang::eval_tidy(dot, data = mask)
     16. └─base::.handleSimpleError(...)
     17.   └─dplyr h(simpleError(msg, call))
     18.     └─rlang::abort(bullets, class = "dplyr_error")
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
      9.             └─tidyr:::replace_na.default(elem.df[record, i], 0)
     10.               └─vctrs::vec_assign(data, missing, replace, x_arg = "data", value_arg = "replace")
     11.                 └─vctrs `<fn>`()
     12.                   └─vctrs::vec_default_cast(...)
     13.                     └─vctrs::stop_incompatible_cast(...)
     14.                       └─vctrs::stop_incompatible_type(...)
     15.                         └─vctrs:::stop_incompatible(...)
     16.                           └─vctrs:::stop_vctrs(...)
     17.                             └─rlang::abort(message, class = c(class, "vctrs_error"), ...)
    Execution halted
    ```

