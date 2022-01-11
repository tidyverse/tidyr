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

# eudract

<details>

* Version: 0.9.3
* GitHub: https://github.com/shug0131/eudraCT
* Source code: https://github.com/cran/eudract
* Date/Publication: 2021-02-24 15:10:06 UTC
* Number of recursive dependencies: 52

Run `cloud_details(, "eudract")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘eudract-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: eudract_convert
    > ### Title: applies a conversion using xslt from a simple xml file to a
    > ###   eudract compatible file, and checks against the schema
    > ### Aliases: eudract_convert
    > 
    > ### ** Examples
    > 
    ...
     16. │ ├─tidyr::expand(data, ...)
     17. │ └─tidyr:::expand.data.frame(data, ...)
     18. │   └─tidyr:::grid_dots(..., `_data` = data)
     19. │     └─rlang::eval_tidy(dot, data = mask)
     20. ├─tidyr::nesting(term, soc)
     21. │ └─tidyr:::grid_dots(...)
     22. │   └─rlang::eval_tidy(dot, data = mask)
     23. └─base::.handleSimpleError(...)
     24.   └─dplyr:::h(simpleError(msg, call))
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       14. ├─tidyr::complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)
       15. ├─tidyr:::complete.data.frame(...)
       16. │ ├─tidyr::expand(data, ...)
       17. │ └─tidyr:::expand.data.frame(data, ...)
       18. │   └─tidyr:::grid_dots(..., `_data` = data)
       19. │     └─rlang::eval_tidy(dot, data = mask)
       20. ├─tidyr::nesting(term, soc)
       21. │ └─tidyr:::grid_dots(...)
       22. │   └─rlang::eval_tidy(dot, data = mask)
       23. └─base::.handleSimpleError(...)
       24.   └─dplyr:::h(simpleError(msg, call))
      
      [ FAIL 10 | WARN 2 | SKIP 0 | PASS 12 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘eudract.Rmd’ using rmarkdown
    Quitting from lines 52-58 (eudract.Rmd) 
    Error: processing vignette 'eudract.Rmd' failed with diagnostics:
    Problem with `summarise()` input `..1`.
    ℹ `..1 = complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)`.
    ✖ object 'term' not found
    ℹ The error occurred in group 1: term = "Abdominal pain", soc = 10017947.
    --- failed re-building ‘eudract.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘eudract.Rmd’
    
    Error: Vignette re-building failed.
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

# ssimparser

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/ssimparser
* Date/Publication: 2021-05-11 09:10:02 UTC
* Number of recursive dependencies: 23

Run `cloud_details(, "ssimparser")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ssimparser-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: load_ssim
    > ### Title: load_ssim
    > ### Aliases: load_ssim
    > 
    > ### ** Examples
    > 
    > # Get a sample as a character vector
    ...
     18. │     ├─base::withCallingHandlers(...)
     19. │     └─mask$eval_all_summarise(quo)
     20. ├─tidyr::expand(data = dplyr::cur_data(), ..., .name_repair = .name_repair)
     21. ├─tidyr:::expand.data.frame(data = dplyr::cur_data(), ..., .name_repair = .name_repair)
     22. │ └─tidyr:::grid_dots(..., `_data` = data)
     23. │   └─rlang::eval_tidy(dot, data = mask)
     24. ├─base::seq(1:(diff_days + 1))
     25. └─base::.handleSimpleError(...)
     26.   └─dplyr:::h(simpleError(msg, call))
    Execution halted
    ```

# swissdd

<details>

* Version: 1.1.4
* GitHub: https://github.com/politanch/swissdd
* Source code: https://github.com/cran/swissdd
* Date/Publication: 2021-07-17 05:40:02 UTC
* Number of recursive dependencies: 60

Run `cloud_details(, "swissdd")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘swissdd-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: available_votedates
    > ### Title: Get a vector of available vote dates via 'get_nationalvotes' and
    > ###   'get_cantonalvotes"
    > ### Aliases: available_votedates
    > 
    > ### ** Examples
    > 
    > 
    > # Get vector of all available dates
    > federal_votedates <- available_votedates()
    Error in curl::curl_fetch_memory(url, handle = handle) : 
      transfer closed with 122250 bytes remaining to read
    Calls: available_votedates ... request_fetch -> request_fetch.write_memory -> <Anonymous>
    Execution halted
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

# wpa

<details>

* Version: 1.6.3
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2021-11-21 05:30:02 UTC
* Number of recursive dependencies: 119

Run `cloud_details(, "wpa")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wpa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: workpatterns_classify
    > ### Title: Classify working pattern personas using a rule based algorithm
    > ### Aliases: workpatterns_classify
    > 
    > ### ** Examples
    > 
    > 
    ...
     14. │     └─mask$eval_all_summarise(quo)
     15. ├─tidyr::complete(data = dplyr::cur_data(), ..., fill = fill, explicit = explicit)
     16. ├─tidyr:::complete.data.frame(...)
     17. │ ├─tidyr::expand(data, ...)
     18. │ └─tidyr:::expand.data.frame(data, ...)
     19. │   └─tidyr:::grid_dots(..., `_data` = data)
     20. │     └─rlang::eval_tidy(dot, data = mask)
     21. └─base::.handleSimpleError(...)
     22.   └─dplyr:::h(simpleError(msg, call))
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

