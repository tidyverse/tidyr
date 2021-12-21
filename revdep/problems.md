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

# cogmapr

<details>

* Version: 0.9.2
* GitHub: NA
* Source code: https://github.com/cran/cogmapr
* Date/Publication: 2021-11-20 16:20:02 UTC
* Number of recursive dependencies: 113

Run `cloud_details(, "cogmapr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cogmapr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: RelationshipTest
    > ### Title: Compare relationships weight between maps
    > ### Aliases: RelationshipTest
    > 
    > ### ** Examples
    > 
    > project_name <- "a_new_project"
    ...
      3. ├─tidyr::replace_na(., list(p.value = "NR"))
      4. └─tidyr:::replace_na.data.frame(., list(p.value = "NR"))
      5.   └─vctrs::vec_assign(...)
      6.     └─(function () ...
      7.       └─vctrs::vec_default_cast(...)
      8.         └─vctrs::stop_incompatible_cast(...)
      9.           └─vctrs::stop_incompatible_type(...)
     10.             └─vctrs:::stop_incompatible(...)
     11.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─cogmapr::RelationshipTest(project, units = c("Belgium", "Québec"))
        5. │ └─`%>%`(...)
        6. ├─tidyr::replace_na(., list(p.value = "NR"))
        7. └─tidyr:::replace_na.data.frame(., list(p.value = "NR"))
        8.   └─vctrs::vec_assign(...)
        9.     └─(function () ...
       10.       └─vctrs::vec_default_cast(...)
       11.         └─vctrs::stop_incompatible_cast(...)
       12.           └─vctrs::stop_incompatible_type(...)
       13.             └─vctrs:::stop_incompatible(...)
       14.               └─vctrs:::stop_vctrs(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 17 ]
      Error: Test failures
      Execution halted
    ```

# covid19br

<details>

* Version: 0.1.3
* GitHub: https://github.com/fndemarqui/covid19br
* Source code: https://github.com/cran/covid19br
* Date/Publication: 2021-10-17 17:50:02 UTC
* Number of recursive dependencies: 137

Run `cloud_details(, "covid19br")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘covid19br.Rmd’ using rmarkdown
    ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
    ✔ ggplot2 3.3.5          ✔ purrr   0.3.4     
    ✔ tibble  3.1.6          ✔ dplyr   1.0.7     
    ✔ tidyr   1.1.4.9000     ✔ stringr 1.4.0     
    ✔ readr   2.1.1          ✔ forcats 0.5.1     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ...
    Please, be patient...
     Done!
    Joining, by = c("region", "state", "pop", "state_code")
    --- finished re-building ‘maps.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘election2018.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.8Mb
      sub-directories of 1Mb or more:
        doc   7.5Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2385 marked UTF-8 strings
    ```

# crosstable

<details>

* Version: 0.3.2
* GitHub: https://github.com/DanChaltiel/crosstable
* Source code: https://github.com/cran/crosstable
* Date/Publication: 2021-11-27 20:00:02 UTC
* Number of recursive dependencies: 113

Run `cloud_details(, "crosstable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘crosstable-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_gt.crosstable
    > ### Title: Converts a 'crosstable' object into a formatted 'gt' table.
    > ### Aliases: as_gt.crosstable as_gt as_gt.default
    > 
    > ### ** Examples
    > 
    > xx = mtcars2 %>% dplyr::select(1:9)
    > crosstable(xx) %>% as_gt
    Error in vec_equal_na(data) : Unimplemented type in `vctrs_equal_na()`.
    Calls: %>% ... %>% -> replace_na -> replace_na.default -> vec_equal_na
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       7.   └─vctrs::vec_equal_na(data)
      ── Error (test-officer.R:304:5): gt is working ─────────────────────────────────
      Error in `vec_equal_na(data)`: Unimplemented type in `vctrs_equal_na()`.
      Backtrace:
          █
       1. ├─crosstable::as_gt(x1)
       2. ├─crosstable:::as_gt.crosstable(x1)
       3. │ └─attr(x, "by_levels") %>% unlist() %>% unname() %>% replace_na("NA")
       4. ├─tidyr::replace_na(., "NA")
       5. └─tidyr:::replace_na.default(., "NA")
       6.   └─vctrs::vec_equal_na(data)
      
      [ FAIL 2 | WARN 0 | SKIP 20 | PASS 323 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘crosstable-install.Rmd’ using rmarkdown
    --- finished re-building ‘crosstable-install.Rmd’
    
    --- re-building ‘crosstable-report.Rmd’ using rmarkdown
    --- finished re-building ‘crosstable-report.Rmd’
    
    --- re-building ‘crosstable-selection.Rmd’ using rmarkdown
    --- finished re-building ‘crosstable-selection.Rmd’
    
    ...
    Quitting from lines 172-175 (crosstable.Rmd) 
    Error: processing vignette 'crosstable.Rmd' failed with diagnostics:
    Unimplemented type in `vctrs_equal_na()`.
    --- failed re-building ‘crosstable.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘crosstable.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dbplyr

<details>

* Version: 2.1.1
* GitHub: https://github.com/tidyverse/dbplyr
* Source code: https://github.com/cran/dbplyr
* Date/Publication: 2021-04-06 12:50:02 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "dbplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dbplyr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pivot_longer.tbl_lazy
    > ### Title: Pivot data from wide to long
    > ### Aliases: pivot_longer.tbl_lazy
    > 
    > ### ** Examples
    > 
    > # See vignette("pivot") for examples and explanation
    ...
      3. └─dbplyr:::pivot_longer.tbl_lazy(., -id)
      4.   └─tidyr::build_longer_spec(...)
      5.     └─vctrs::vec_cast(names[[col]], ptype)
      6.       └─(function () ...
      7.         └─vctrs::vec_default_cast(...)
      8.           └─vctrs::stop_incompatible_cast(...)
      9.             └─vctrs::stop_incompatible_type(...)
     10.               └─vctrs:::stop_incompatible(...)
     11.                 └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─`%>%`(...) test-verb-pivot-longer.R:151:2
        2. ├─tidyr::pivot_longer(., x1:x2, names_to = "x", values_to = "v")
        3. └─dbplyr:::pivot_longer.tbl_lazy(., x1:x2, names_to = "x", values_to = "v")
        4.   └─tidyr::build_longer_spec(...)
        5.     └─vctrs::vec_cast(names[[col]], ptype)
        6.       └─(function () ...
        7.         └─vctrs::vec_default_cast(...)
        8.           └─vctrs::stop_incompatible_cast(...)
        9.             └─vctrs::stop_incompatible_type(...)
       10.               └─vctrs:::stop_incompatible(...)
       11.                 └─vctrs:::stop_vctrs(...)
      
      [ FAIL 8 | WARN 0 | SKIP 111 | PASS 728 ]
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

* Version: 0.0.4
* GitHub: https://github.com/palderman/DSSAT
* Source code: https://github.com/cran/DSSAT
* Date/Publication: 2021-09-02 16:20:06 UTC
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

# ftExtra

<details>

* Version: 0.2.0
* GitHub: https://github.com/atusy/ftExtra
* Source code: https://github.com/cran/ftExtra
* Date/Publication: 2021-03-28 12:40:02 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "ftExtra")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ftExtra-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: span_header
    > ### Title: Span the header based on delimiters
    > ### Aliases: span_header
    > 
    > ### ** Examples
    > 
    > iris %>%
    ...
     10. └─tidyr:::pivot_longer.data.frame(...)
     11.   └─tidyr::build_longer_spec(...)
     12.     └─vctrs::vec_cast(names[[col]], ptype)
     13.       └─(function () ...
     14.         └─vctrs::vec_default_cast(...)
     15.           └─vctrs::stop_incompatible_cast(...)
     16.             └─vctrs::stop_incompatible_type(...)
     17.               └─vctrs:::stop_incompatible(...)
     18.                 └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. ├─tidyr::fill(., "val")
       12. ├─tidyr::pivot_longer(...)
       13. └─tidyr:::pivot_longer.data.frame(...)
       14.   └─tidyr::build_longer_spec(...)
       15.     └─vctrs::vec_cast(names[[col]], ptype)
       16.       └─(function () ...
       17.         └─vctrs::vec_default_cast(...)
       18.           └─vctrs::stop_incompatible_cast(...)
       19.             └─vctrs::stop_incompatible_type(...)
       20.               └─vctrs:::stop_incompatible(...)
       21.                 └─vctrs:::stop_vctrs(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 40 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘format_columns.Rmd’ using rmarkdown
    --- finished re-building ‘format_columns.Rmd’
    
    --- re-building ‘group-rows.Rmd’ using rmarkdown
    --- finished re-building ‘group-rows.Rmd’
    
    --- re-building ‘transform-headers.Rmd’ using rmarkdown
    Quitting from lines 53-54 (transform-headers.Rmd) 
    Error: processing vignette 'transform-headers.Rmd' failed with diagnostics:
    Can't convert <character> to <integer>.
    --- failed re-building ‘transform-headers.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘transform-headers.Rmd’
    
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

# lcsm

<details>

* Version: 0.1.2
* GitHub: https://github.com/milanwiedemann/lcsm
* Source code: https://github.com/cran/lcsm
* Date/Publication: 2020-07-24 18:00:02 UTC
* Number of recursive dependencies: 141

Run `cloud_details(, "lcsm")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘v0-longitudinal-plots.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    ...
    --- failed re-building ‘v3-extract-tutorial.Rmd’
    
    --- re-building ‘v4-simulate-data.Rmd’ using rmarkdown
    --- finished re-building ‘v4-simulate-data.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘v3-extract-tutorial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘data.table’ ‘utf8’
      All declared Imports should be used.
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

* Version: 1.7.3
* GitHub: https://github.com/sparklyr/sparklyr
* Source code: https://github.com/cran/sparklyr
* Date/Publication: 2021-11-30 12:30:02 UTC
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

* Version: 0.4.7
* GitHub: https://github.com/stemangiola/tidygate
* Source code: https://github.com/cran/tidygate
* Date/Publication: 2021-05-03 09:10:02 UTC
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

# tidyseurat

<details>

* Version: 0.3.0
* GitHub: https://github.com/stemangiola/tidyseurat
* Source code: https://github.com/cran/tidyseurat
* Date/Publication: 2021-10-19 04:50:02 UTC
* Number of recursive dependencies: 183

Run `cloud_details(, "tidyseurat")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidyseurat-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pivot_longer
    > ### Title: Pivot data from wide to long
    > ### Aliases: pivot_longer
    > 
    > ### ** Examples
    > 
    > # See vignette("pivot") for examples and explanation
    ...
      6. └─tidyr:::pivot_longer.data.frame(...)
      7.   └─tidyr::build_longer_spec(...)
      8.     └─vctrs::vec_cast(names[[col]], ptype)
      9.       └─(function () ...
     10.         └─vctrs::vec_default_cast(...)
     11.           └─vctrs::stop_incompatible_cast(...)
     12.             └─vctrs::stop_incompatible_type(...)
     13.               └─vctrs:::stop_incompatible(...)
     14.                 └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        7. │ └─`%>%`(...)
        8. ├─tidyr::pivot_longer(...)
        9. └─tidyr:::pivot_longer.data.frame(...)
       10.   └─tidyr::build_longer_spec(...)
       11.     └─vctrs::vec_cast(names[[col]], ptype)
       12.       └─(function () ...
       13.         └─vctrs::vec_default_cast(...)
       14.           └─vctrs::stop_incompatible_cast(...)
       15.             └─vctrs::stop_incompatible_type(...)
       16.               └─vctrs:::stop_incompatible(...)
       17.                 └─vctrs:::stop_vctrs(...)
      
      [ FAIL 1 | WARN 3 | SKIP 1 | PASS 25 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘figures_article.Rmd’ using knitr
    --- finished re-building ‘figures_article.Rmd’
    
    --- re-building ‘introduction.Rmd’ using knitr
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
    ...
    Quitting from lines 52-53 (./../man/fragments/intro.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    Can't convert <character> to <list>.
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
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

