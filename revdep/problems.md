# anomalize

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/anomalize
* URL: https://github.com/business-science/anomalize
* BugReports: https://github.com/business-science/anomalize/issues
* Date/Publication: 2019-09-21 04:10:03 UTC
* Number of recursive dependencies: 161

Run `revdep_details(,"anomalize")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > tidyverse_cran_downloads %>%
    +     ungroup() %>%
    +     filter(package == "tidyquant") %>%
    +     decompose_stl(count)
    Error in time_frequency(data, period = frequency, message = message) : 
      Error time_frequency(): Cannot use on a grouped data frame.
    Frequency should be performed on a single time series.
    Calls: %>% ... withVisible -> <Anonymous> -> decompose_stl -> time_frequency
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 53 | SKIPPED: 0 | WARNINGS: 12 | FAILED: 14 ]
      1. Error: returns a ggplot (@test-plot_anomalies.R#8) 
      2. Error: returns a ggplot (@test-plot_anomaly_decomposition.R#10) 
      3. Error: grouped_tbl_time works (@test-time_apply.R#11) 
      4. Error: tbl_time works (@test-time_apply.R#17) 
      5. Failure: single tbl_df (@test-time_decompose.R#20) 
      6. Error: time_frequency works: period = 'auto' (@test-time_frequency.R#26) 
      7. Error: time_frequency works: period = '1 month' (@test-time_frequency.R#35) 
      8. Error: time_frequency works: period = 5 (@test-time_frequency.R#44) 
      9. Error: time_trend works: period = 'auto' (@test-time_frequency.R#55) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# BAwiR

<details>

* Version: 1.2.3
* Source code: https://github.com/cran/BAwiR
* URL: https://www.R-project.org, https://www.uv.es/vivigui, https://www.uv.es/vivigui/AppEuroACB.html
* Date/Publication: 2020-04-14 11:20:02 UTC
* Number of recursive dependencies: 126

Run `revdep_details(,"BAwiR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > df <- do_join_games_bio("ACB", acb_games_1718, acb_players_1718)
    > df1 <- do_add_adv_stats(df)
    > df_four_factors <- do_four_factors_df(df1, "Valencia")
    Error: Assigned data `paste(df6[df6$Team == i, 3:6], " (", orders_cols, ")", sep = "")` must be compatible with row subscript `df6$Team == i`.
    ✖ 1 row must be assigned.
    ✖ Assigned data has 4 rows.
    ℹ Row updates require a list value. Do you need `list()` or `as.list()`?
    Backtrace:
        █
     1. └─BAwiR::do_four_factors_df(df1, "Valencia")
     2.   ├─base::`[<-`(...)
     3.   └─tibble:::`[<-.tbl_df`(...)
     4.     └─tibble:::tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
     5.       └─tibble:::vectbl_recycle_rhs(...)
     6.         └─base::tryCatch(...)
     7.           └─base:::tryCatchList(expr, classes, parentenv, handlers)
     8.             └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
     9.               └─value[[3L]](cond)
    Execution halted
    ```

# bdl

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/bdl
* URL: https://github.com/statisticspoland/R_Package_to_API_BDL
* BugReports: https://github.com/statisticspoland/R_Package_to_API_BDL/issues
* Date/Publication: 2020-04-01 13:40:03 UTC
* Number of recursive dependencies: 155

Run `revdep_details(,"bdl")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component 4: Modes: numeric, character
      Component 4: target is numeric, current is character
      Component 5: Mean relative difference: 2.2
      Component 6: Modes: character, numeric
      ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 34 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: Proper data (@test-requests.R#72) 
      2. Failure: Proper data (@test-requests.R#127) 
      3. Failure: Proper data (@test-requests.R#179) 
      4. Failure: Proper data (@test-requests.R#244) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# brickr

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/brickr
* URL: https://github.com/ryantimpe/brickr
* BugReports: https://github.com/ryantimpe/brickr/issues
* Date/Publication: 2020-04-06 17:42:06 UTC
* Number of recursive dependencies: 85

Run `revdep_details(,"brickr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +  bricks_from_excel(piece_table = demo_pieces) %>% 
    +  build_bricks()
    Error: Can't combine `..1$brick_name` <logical> and `..2$brick_name` <character>.
    Backtrace:
         █
      1. ├─`%>%`(...)
      2. │ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3. │ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─`_fseq`(`_lhs`)
      6. │       └─magrittr::freduce(value, `_function_list`)
      7. │         └─function_list[[i]](value)
      8. │           └─brickr::bricks_from_excel(., piece_table = demo_pieces)
      9. │             └─`%>%`(...)
     10. │               ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     11. │               └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     12. │                 └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13. │                   └─brickr:::`_fseq`(`_lhs`)
     14. │                     └─magrittr::freduce(value, `_function_list`)
     15. │                       ├─bas
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘scales’
      All declared Imports should be used.
    ```

# broom.mixed

<details>

* Version: 0.2.5
* Source code: https://github.com/cran/broom.mixed
* URL: http://github.com/bbolker/broom.mixed
* BugReports: http://github.com/bbolker/broom.mixed/issues
* Date/Publication: 2020-04-19 04:50:08 UTC
* Number of recursive dependencies: 146

Run `revdep_details(,"broom.mixed")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      x[1]: "(Intercept)"
      y[1]: "1"
      
      x[2]: "sin(2 * pi * Time)"
      y[2]: "2"
      
      x[3]: "cos(2 * pi * Time)"
      y[3]: "3"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 237 | SKIPPED: 0 | WARNINGS: 12 | FAILED: 1 ]
      1. Failure: basic gls tidying (@test-nlme.R#146) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘dplyr::as.tbl_cube’
    ```

# codebook

<details>

* Version: 0.8.2
* Source code: https://github.com/cran/codebook
* URL: https://github.com/rubenarslan/codebook
* BugReports: https://github.com/rubenarslan/codebook/issues
* Date/Publication: 2020-01-09 16:20:07 UTC
* Number of recursive dependencies: 178

Run `revdep_details(,"codebook")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > # will generate figures in a temporary directory
    > old_base_dir <- knitr::opts_knit$get("base.dir")
    > knitr::opts_knit$set(base.dir = tempdir())
    > on.exit(knitr::opts_knit$set(base.dir = old_base_dir))
    > data("bfi")
    > bfi <- bfi[, c("BFIK_open_1", "BFIK_open_1")]
    > md <- codebook(bfi, survey_repetition = "single", metadata_table = FALSE)
    No missing values.
    Error: Argument 1 must be a data frame or a named atomic vector
    Backtrace:
        █
     1. └─codebook::codebook(bfi, survey_repetition = "single", metadata_table = FALSE)
     2.   └─codebook::metadata_jsonld(results)
     3.     └─codebook::metadata_list(results)
     4.       └─codebook::codebook_table(results)
     5.         └─codebook:::skim_to_wide_labelled(results)
     6.           └─dplyr::bind_rows(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘jsonlite’ ‘pander’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# comperes

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/comperes
* URL: https://github.com/echasnovski/comperes
* BugReports: https://github.com/echasnovski/comperes/issues
* Date/Publication: 2019-12-14 21:40:03 UTC
* Number of recursive dependencies: 58

Run `revdep_details(,"comperes")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Component "class": Lengths (4, 1) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      ── 2. Failure: get_matchups works (@test-utils.R#177)  ─────────────────────────
      `output` not equal to `output_ref`.
      Attributes: < Component "class": Lengths (4, 3) differ (string compare on first 3) >
      Attributes: < Component "class": 3 string mismatches >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 260 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 2 ]
      1. Failure: as_widecr.default throws an error if no column is matched (@test-results-widecr.R#133) 
      2. Failure: get_matchups works (@test-utils.R#177) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# correlationfunnel

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/correlationfunnel
* URL: https://github.com/business-science/correlationfunnel
* BugReports: https://github.com/business-science/correlationfunnel/issues
* Date/Publication: 2019-08-06 09:30:09 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"correlationfunnel")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── 4. Failure: Check correlation (@test-correlate.R#61)  ───────────────────────
      nrow(marketing_correlated_tbl) not equal to 74.
      1/1 mismatches
      [1] 65 - 74 == -9
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 12 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: Check binarize - numeric (@test-binarize.R#47) 
      2. Error: Check binarize - numeric (@test-binarize.R#45) 
      3. Error: (unknown) (@test-binarize.R#45) 
      4. Failure: Check correlation (@test-correlate.R#61) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc    3.0Mb
        help   1.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

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
      [ OK: 489 | SKIPPED: 0 | WARNINGS: 1778 | FAILED: 14 ]
      1. Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#681) 
      2. Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#696) 
      3. Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#704) 
      4. Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#718) 
      5. Failure: LOESS smoothing does not return warnings or errors (@test-cutpointr.R#729) 
      6. Failure: cutpointr works if method / metric are called with :: (@test-cutpointr.R#1291) 
      7. Failure: cutpointr works if method / metric are called with :: (@test-cutpointr.R#1294) 
      8. Failure: Summary(multi_cutpointr) is silent (@test-cutpointr.R#1324) 
      9. Failure: Summary(multi_cutpointr) is silent (@test-cutpointr.R#1331) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cvms

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/cvms
* URL: https://github.com/ludvigolsen/cvms
* BugReports: https://github.com/ludvigolsen/cvms/issues
* Date/Publication: 2020-04-19 09:30:02 UTC
* Number of recursive dependencies: 120

Run `revdep_details(,"cvms")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 3754 | SKIPPED: 61 | WARNINGS: 426 | FAILED: 15 ]
      1. Failure: the grid order is as expected with create_computation_grid() (@test_compational_grid.R#260) 
      2. Failure: model using dot in formula ( y ~ . ) works with cross_validate() (@test_cross_validate.R#949) 
      3. Failure: model using inline functions in formulas works with cross_validate() (@test_cross_validate.R#980) 
      4. Failure: multinomial evaluations with one predicted class column is correctly unpacked in evaluate() (@test_evaluate.R#1361) 
      5. Failure: multinomial evaluations with one predicted class column is correctly unpacked in evaluate() (@test_evaluate.R#1369) 
      6. Failure: multinomial evaluations with one predicted class column is correctly unpacked in evaluate() (@test_evaluate.R#1377) 
      7. Failure: multinomial evaluations with one predicted class column is correctly unpacked in evaluate() (@test_evaluate.R#1385) 
      8. Failure: multinomial evaluations with one predicted class column is correctly unpacked in evaluate() (@test_evaluate.R#1393) 
      9. Failure: evaluate() and confusion_matrix() has same metric values (@test_evaluate.R#4015) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cytominer

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/cytominer
* URL: https://github.com/cytomining/cytominer
* BugReports: https://github.com/cytomining/cytominer/issues
* Date/Publication: 2020-03-23 10:40:02 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"cytominer")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Component "class": Lengths (3, 1) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 7 ]
      1. Failure: `aggregate` aggregates data (@test-aggregate.R#17) 
      2. Failure: `aggregate` aggregates data (@test-aggregate.R#33) 
      3. Failure: `aggregate` aggregates data (@test-aggregate.R#49) 
      4. Failure: `drop_na_rows` removes rows have only NAs (@test-drop_na_rows.R#34) 
      5. Failure: `extract_subpopulations` extracts and assigns each point to a subpopulation (@test-extract_subpopulations.R#89) 
      6. Failure: `extract_subpopulations` extracts and assigns each point to a subpopulation (@test-extract_subpopulations.R#94) 
      7. Failure: `generalized_log` generalized_logs data (@test-generalized_log.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# DiagrammeR

<details>

* Version: 1.0.5
* Source code: https://github.com/cran/DiagrammeR
* URL: https://github.com/rich-iannone/DiagrammeR
* BugReports: https://github.com/rich-iannone/DiagrammeR/issues
* Date/Publication: 2020-01-16 17:20:03 UTC
* Number of recursive dependencies: 86

Run `revdep_details(,"DiagrammeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `filter()` input `..1`.
    ✖ object 'node_edge__' not found
    ℹ Input `..1` is `node_edge__ == "node"`.
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           └─function_list[[i]](value)
      8.             └─DiagrammeR::set_df_as_node_attr(., node = 1, df = df_1)
      9.               └─`%>%`(...)
     10.                 ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     11.                 └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     12.                   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13.                     └─DiagrammeR:::`_fseq`(`_lhs`)
     14.                       └─magrittr::freduce(value, `_function_list`)
     15.                 
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 2128 | SKIPPED: 0 | WARNINGS: 5 | FAILED: 11 ]
      1. Error: combine_edges (@test-datatable_compatability.R#29) 
      2. Error: Printing a summary line for stored data frames works (@test-print.R#520) 
      3. Error: rescaling node attributes in a graph is possible (@test-rescale_node_edge_attrs.R#17) 
      4. Error: rescaling edge attributes in a graph is possible (@test-rescale_node_edge_attrs.R#88) 
      5. Error: setting DFs as node attributes is possible (@test-set_get_dfs_as_attrs.R#25) 
      6. Error: setting DFs as edge attributes is possible (@test-set_get_dfs_as_attrs.R#115) 
      7. Error: getting DFs as node/edge attributes is possible (@test-set_get_dfs_as_attrs.R#206) 
      8. Error: Getting node attributes with a selection is possible (@test-set_get_node_edge_attrs.R#370) 
      9. Failure: copying values with `trav_in_edge()` works (@test-traversals_copying_attr_vals.R#112) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 17.1Mb
      sub-directories of 1Mb or more:
        doc           9.7Mb
        htmlwidgets   5.9Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# dm

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/dm
* Date/Publication: 2020-05-04 11:20:02 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"dm")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    src_tbls:
      function(x, ...)
    src_tbls.dm:
      function(x)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

# docxtools

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/docxtools
* URL: https://graphdr.github.io/docxtools
* BugReports: https://github.com/graphdr/docxtools/issues
* Date/Publication: 2019-02-09 18:43:13 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"docxtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > data("CO2")
    > x <- head(CO2, n = 5L)
    > format_engr(x)
    Error: Problem with `mutate()` input `observ_index`.
    ✖ Input `observ_index` can't be recycled to size 0.
    ℹ Input `observ_index` is `1:dplyr::n()`.
    ℹ Input `observ_index` must be size 0 or 1, not 2.
    Backtrace:
         █
      1. └─docxtools::format_engr(x)
      2.   └─docxtools:::obs_add(numeric_as_is)
      3.     ├─dplyr::mutate(x, observ_index = 1:dplyr::n())
      4.     └─dplyr:::mutate.data.frame(x, observ_index = 1:dplyr::n())
      5.       └─dplyr:::mutate_cols(.data, ...)
      6.         └─base::tryCatch(...)
      7.           └─base:::tryCatchList(expr, classes, parentenv, handlers)
      8.             └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      9.               └─value[[3L]](cond)
     10.                 └─dplyr:::stop_mutate_recycle_incompatible_size(e, index = i, dots = dots)
     11.                   └─dplyr:::stop_dplyr(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. dplyr:::mutate_cols(.data, ...)
        7. base::tryCatch(...)
        8. base:::tryCatchList(expr, classes, parentenv, handlers)
        9. base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
       10. value[[3L]](cond)
       11. dplyr:::stop_mutate_recycle_incompatible_size(e, index = i, dots = dots)
       12. dplyr:::stop_dplyr(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: Factors are returned unaffected (@test_format_engr.R#14) 
      2. Error: (unknown) (@test_format_engr.R#55) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# DSSAT

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/DSSAT
* BugReports: https://github.com/palderman/DSSAT/issues
* Date/Publication: 2020-03-19 12:40:08 UTC
* Number of recursive dependencies: 42

Run `revdep_details(,"DSSAT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Warning: Can't combine <tibble> and <DSSAT_tbl>; falling back to <tibble>.
    ℹ Convert all inputs to the same class to avoid this warning.
    ℹ See <https://vctrs.r-lib.org/reference/faq-warning-convert-inputs.html>.
    Error: Problem with `summarise()` input `n`.
    ✖ could not find function "n"
    ℹ Input `n` is `n()`.
    ℹ The error occured in group 1: PEDON = "IB00000001", SOURCE = "IBSNAT", TEXTURE = "SIC", DEPTH = 210, DESCRIPTION = "DEFAULT - DEEP SILTY CLAY", SITE = "Generic", COUNTRY = "Generic", LAT = NA, LONG = NA, SCS FAMILY = "Generic", SCOM = NA, SALB = 0.11, SLU1 = 6, SLDR = 0.3, SLRO = 85, SLNF = 1, SLPF = 1, SMHB = "IB001", SMPX = "IB001", SMKE = "IB001".
    Backtrace:
         █
      1. └─DSSAT::read_soil_profile(sample_sol)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─DSSAT:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               └─DSSAT:::collapse_rows(.)
     10.                 └─`%>%`(...)
     11.      
    Execution halted
    ```

# dynwrap

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/dynwrap
* URL: https://github.com/dynverse/dynwrap
* BugReports: https://github.com/dynverse/dynwrap/issues
* Date/Publication: 2020-03-09 15:10:02 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"dynwrap")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 5. Failure: Testing add_prior_information (@test-wrap_add_prior_information.R
      join_check$group_id not equal to join_check$milestone_id.
      Attributes: < names for current but not for target >
      Attributes: < Length mismatch: comparison on first 0 components >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1254 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: Testing calculate_geodesic_distances with zero length self loops (@test-calculate_geodesic_distances.R#195) 
      2. Error: Testing calculate_geodesic_distances with zero length self loops (@test-calculate_geodesic_distances.R#194) 
      3. Error: (unknown) (@test-calculate_geodesic_distances.R#194) 
      4. Failure: Testing generate_prior_information (@test-wrap_add_prior_information.R#300) 
      5. Failure: Testing add_prior_information (@test-wrap_add_prior_information.R#361) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘FNN’
      All declared Imports should be used.
    ```

# easyalluvial

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/easyalluvial
* URL: https://github.com/erblast/easyalluvial
* Date/Publication: 2019-12-09 10:30:05 UTC
* Number of recursive dependencies: 141

Run `revdep_details(,"easyalluvial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ Problem at position 2
    Backtrace:
         █
      1. └─easyalluvial::alluvial_model_response(pred, dspace, imp, degree = 3)
      2.   ├─base::do.call(...)
      3.   └─(function (from, target, ...) ...
      4.     ├─`%>%`(...)
      5.     │ └─base::eval(lhs, parent, parent)
      6.     │   └─base::eval(lhs, parent, parent)
      7.     ├─base::levels(...)
      8.     └─easyalluvial::manip_bin_numerics(...)
      9.       └─df_min %>% left_join(df_max, by = join_by)
     10.         ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     11.         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     12.           └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13.             └─easyalluvial:::`_fseq`(`_lhs`)
     14.               └─magrittr::freduce(value, `_function_list`)
     15.                 ├─base::withVisible(function_list[[k]](value))
     16.                 └─function_list[[k]](value)
     17.                   ├─
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 43 | SKIPPED: 28 | WARNINGS: 0 | FAILED: 12 ]
      1. Error: pdp_methods (@test_alluvial_model_response.R#44) 
      2. Error: alluvial_model_response (@test_alluvial_model_response.R#65) 
      3. Error: alluvial_model_response_caret (@test_alluvial_model_response.R#227) 
      4. Error: params_bin_numeric_pred (@test_alluvial_model_response.R#305) 
      5. Error: n_feats == degree (@test_alluvial_model_response.R#343) 
      6. Error: manip_bin_numerics (@test_manip.R#47) 
      7. Error: manip_bin_numerics with vector (@test_manip.R#116) 
      8. Error: manip_bin_numerics_NA (@test_manip.R#144) 
      9. Error: plot_imp (@test_plot_imp.R#14) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# egor

<details>

* Version: 0.20.03
* Source code: https://github.com/cran/egor
* URL: https://github.com/tilltnet/egor, https://tilltnet.github.io/egor/
* BugReports: https://github.com/tilltnet/egor/issues
* Date/Publication: 2020-03-03 00:20:02 UTC
* Number of recursive dependencies: 73

Run `revdep_details(,"egor")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    group_modify:
      function(.data, .f, ..., keep)
    group_modify.egor:
      function(.tbl, .f, ..., keep)
    
    pull:
      function(.data, var, name)
    pull.egor:
      function(.data, var)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

# eia

<details>

* Version: 0.3.4
* Source code: https://github.com/cran/eia
* URL: https://docs.ropensci.org/eia (website) https://github.com/ropensci/eia
* BugReports: https://github.com/ropensci/eia/issues
* Date/Publication: 2019-11-27 12:10:05 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"eia")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(eia)
      > 
      > test_check("eia")
      ── 1. Failure: eia_report returns as expected (@test-reports.R#10)  ────────────
      names(x$data) not equal to `v`.
      Lengths differ: 9 is not 6
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 36 | SKIPPED: 6 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: eia_report returns as expected (@test-reports.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# embed

<details>

* Version: 0.0.6
* Source code: https://github.com/cran/embed
* URL: https://tidymodels.github.io/embed, https://github.com/tidymodels/embed
* BugReports: https://github.com/tidymodels/embed/issues
* Date/Publication: 2020-03-17 16:10:02 UTC
* Number of recursive dependencies: 148

Run `revdep_details(,"embed")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component 1: target is numeric, current is factor
      Component 2: Mean relative difference: 0.836517
      Component 3: Mean relative difference: 0.4840334
      Component 4: 'current' is not a factor
      Component 5: Attributes: < Component "levels": Lengths (2, 5) differ (string compare on first 2) >
      Component 5: Attributes: < Component "levels": 2 string mismatches >
      Component 5: 'is.NA' value mismatch: 1 in current 0 in target
      ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 154 | SKIPPED: 10 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: step_woe (@test_woe.R#142) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# eph

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/eph
* URL: https://github.com/holatam/eph
* BugReports: https://github.com/holatam/eph/issues
* Date/Publication: 2020-03-08 16:10:02 UTC
* Number of recursive dependencies: 132

Run `revdep_details(,"eph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + map_agglomerates(agglomerates = AGLOMERADO,indicator = tasa_actividad)
    Error: All columns in a tibble must be vectors.
    ✖ Column `geometry` is a `sfc_POINT/sfc` object.
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             └─eph::map_agglomerates(., agglomerates = AGLOMERADO, indicator = tasa_actividad)
     10.               └─`%>%`(...)
     11.                 ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     12.                 └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13.                   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     14.                     └─eph:::`_fseq`(`_lhs`)
     15.                       └─magri
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       11. dplyr::summarise(...)
       16. dplyr:::summarise_cols(.data, ...)
       17. base::tryCatch(...)
       18. base:::tryCatchList(expr, classes, parentenv, handlers)
       19. base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
       20. value[[3L]](cond)
       21. dplyr:::stop_dplyr(i, dots, fn = "summarise", problem = conditionMessage(e))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 13 | SKIPPED: 3 | WARNINGS: 2 | FAILED: 2 ]
      1. Error: tabla simple (@test-map_agglomerates.R#6) 
      2. Error: consistencia constante (@test-organize_panels.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘readr’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 122 marked UTF-8 strings
    ```

# episheet

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/episheet
* URL: https://github.com/epijim/episheet
* BugReports: https://github.com/epijim/episheet/issues
* Date/Publication: 2019-01-23 20:30:03 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"episheet")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `summarise()` input `n`.
    ✖ could not find function "n"
    ℹ Input `n` is `n()`.
    Backtrace:
         █
      1. └─episheet::risk(data = dat, exposure = exposure_var, outcome = outcome_var)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─episheet:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               ├─dplyr::summarise(., n = n())
     10.               └─dplyr:::summarise.data.frame(., n = n())
     11.                 └─dplyr:::summarise_cols(.data, ...)
     12.                   └─base::tryCatch(...)
     13.                     └─base:::tryCatchList(expr, classes, parentenv, handlers)
     14.                       └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
     15.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 6 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 9 ]
      1. Error: Test risk_ratio returns exected estimate (@test-risk.R#16) 
      2. Error: Test risk_ratio returns exected lci (@test-risk.R#21) 
      3. Error: Test risk_ratio returns exected uci (@test-risk.R#26) 
      4. Error: Test risk_diff returns exected estimate (@test-risk.R#31) 
      5. Error: Test risk_diff returns exected lci (@test-risk.R#36) 
      6. Error: Test risk_diff returns exected uci (@test-risk.R#41) 
      7. Error: rrmh returns expected value (@test-stratified_risk.R#6) 
      8. Error: lci return expected value (@test-stratified_risk.R#13) 
      9. Error: uci return expected value (@test-stratified_risk.R#28) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# escalation

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/escalation
* Date/Publication: 2020-04-14 15:10:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"escalation")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 3148 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 8 ]
      1. Failure: get_dose_paths does what it should (@test_dose_paths.R#25) 
      2. Failure: get_dose_paths does what it should (@test_dose_paths.R#32) 
      3. Failure: get_dose_paths does what it should (@test_dose_paths.R#89) 
      4. Failure: get_dose_paths does what it should (@test_dose_paths.R#96) 
      5. Failure: get_dose_paths does what it should (@test_dose_paths.R#103) 
      6. Failure: get_dose_paths does what it should (@test_dose_paths.R#161) 
      7. Failure: get_dose_paths does what it should (@test_dose_paths.R#168) 
      8. Failure: get_dose_paths does what it should (@test_dose_paths.R#175) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# expstudies

<details>

* Version: 0.0.5
* Source code: https://github.com/cran/expstudies
* Date/Publication: 2019-06-14 11:20:03 UTC
* Number of recursive dependencies: 53

Run `revdep_details(,"expstudies")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 9 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 17 ]
      1. Failure: Correct handling of end dates prior to start dates (@test-exposure_functions.R#20) 
      2. Failure: Policy year exposure calculation works (@test-exposure_functions.R#30) 
      3. Failure: Policy month exposure calculation works (@test-exposure_functions.R#33) 
      4. Failure: Policy year with calendar year exposure calculation works, mid and start (@test-exposure_functions.R#36) 
      5. Failure: Policy year with calendar year exposure calculation works, mid and start (@test-exposure_functions.R#37) 
      6. Failure: Policy year with calendar month exposure calculation works, mid and start (@test-exposure_functions.R#40) 
      7. Failure: Policy year with calendar month exposure calculation works, mid and start (@test-exposure_functions.R#41) 
      8. Failure: Policy month with calendar year exposure calculation works, mid and start (@test-exposure_functions.R#44) 
      9. Failure: Policy month with calendar year exposure calculation works, mid and start (@test-exposure_functions.R#45) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# exuber

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/exuber
* URL: https://github.com/kvasilopoulos/exuber
* BugReports: https://github.com/kvasilopoulos/exuber/issues
* Date/Publication: 2020-05-04 17:10:08 UTC
* Number of recursive dependencies: 91

Run `revdep_details(,"exuber")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    2    84  87        3
    
    > 
    > # Choose minimum window
    > datestamp(rsim_data, min_duration = psy_ds(nrow(sim_data)))
    Using 'radf_crit' for 'cv'.
    
    ── Datestamp (min_duration = 5) ───────────────────────────────── Monte Carlo ──
    
    psy1 :
      Start End Duration
    1    44  56       12
    
    psy2 :
      Start End Duration
    1    22  41       19
    2    62  71        9
    
    > 
    > autoplot(ds_data)
    Error: Tibble columns must have compatible sizes.
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 150 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 20 ]
      1. Error: (unknown) (@test-autoplot.R#5) 
      2. Error: Correct output in summary/datestamp (@test-summary.R#58) 
      3. Failure: no problem running rp/ds/dg (mc) (@test-summary.R#73) 
      4. Error: no problem running rp/ds/dg (mc) (@test-summary.R#73) 
      5. Failure: no problem running summary (lag, mc) (@test-summary.R#89) 
      6. Error: no problem running summary (lag, mc) (@test-summary.R#89) 
      7. Failure: no problem running summary (wb) (@test-summary.R#100) 
      8. Error: no problem running summary (wb) (@test-summary.R#100) 
      9. Failure: no problem running summary (lag,wb) (@test-summary.R#113) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# ezplot

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/ezplot
* Date/Publication: 2020-04-25 16:30:03 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"ezplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > variable_plot(ansett, "Week", "Passengers", facet_x = "Class")
    Error: Can't join on `x$x` x `y$x` because of incompatible types. 
    ℹ `x$x` is of type <date>>.
    ℹ `y$x` is of type <date>>.
    Backtrace:
         █
      1. └─ezplot::variable_plot(ansett, "Week", "Passengers", facet_x = "Class")
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─ezplot:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             ├─base::withVisible(function_list[[k]](value))
      9.             └─function_list[[k]](value)
     10.               ├─dplyr::left_join(., gdata, by = setdiff(names(gdata), c("value")))
     11.               └─dplyr:::left_join.data.frame(...)
     12.                 └─dplyr:::join_mutate(...)
     13.                   └─dplyr:::join_rows(x_key, y_key, type = type, na_equal = na_equal)
     14.                     └
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        2. tidyr::unnest(., x)
       10. dplyr::left_join(., gdata, by = setdiff(names(gdata), c("value")))
       12. dplyr:::join_mutate(...)
       13. dplyr:::join_rows(x_key, y_key, type = type, na_equal = na_equal)
       14. base::tryCatch(...)
       15. base:::tryCatchList(expr, classes, parentenv, handlers)
       16. base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
       17. value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 80 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: variable_plot line geom works (@test-variable_plot.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# fable

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/fable
* URL: https://fable.tidyverts.org, https://github.com/tidyverts/fable
* BugReports: https://github.com/tidyverts/fable/issues
* Date/Publication: 2020-04-22 13:12:08 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"fable")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ `vars` must be a character vector
    ℹ Input `cmp` is `map(.fit, components)`.
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             ├─generics::components(.)
     10.             └─fabletools:::components.mdl_df(.)
     11.               ├─dplyr::transmute(...)
     12.               └─dplyr:::transmute.data.frame(...)
     13.                 ├─dplyr::mutate(.data, ..., .keep = "none")
     14.                 └─dplyr:::mutate.data.frame(.data, ..., .keep = "none")
     15.                   └─dplyr:::mutate_cols(.data, ...)
     16.         
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       28. tibble:::repaired_names(...)
       29. tibble:::subclass_name_repair_errors(...)
       30. base::tryCatch(...)
       31. base:::tryCatchList(expr, classes, parentenv, handlers)
       32. base:::tryCatchOne(...)
       33. value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 90 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: Manual ETS selection (@test-ets.R#44) 
      2. Error: Automatic NNETAR selection (@test-nnetar.R#13) 
      3. Error: SNAIVE (@test-rw.R#105) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# fabletools

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/fabletools
* URL: http://fabletools.tidyverts.org/, https://github.com/tidyverts/fabletools
* BugReports: https://github.com/tidyverts/fabletools/issues
* Date/Publication: 2020-03-24 07:10:02 UTC
* Number of recursive dependencies: 92

Run `revdep_details(,"fabletools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    2 observations are missing between 2010 Q3 and 2010 Q4
    Error: `vars` must be a character vector
    Backtrace:
         █
      1. └─fc %>% accuracy(aus_production)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             ├─fabletools::accuracy(., aus_production)
     10.             └─fabletools:::accuracy.fbl_ts(., aus_production)
     11.               ├─dplyr::transmute(object, .fc = !!resp, .dist = !!dist, !!!syms(by))
     12.               └─tsibble:::transmute.tbl_ts(...)
     13.                 ├─dplyr::mutate(.data, !!!lst_quos)
     14.                 ├─fabletools:::mutate.fbl_ts(.data, !!!lst_quos)
     15.                 │ └─fabletools::as_fable(...)
     16.                 
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       21. tsibble:::retain_tsibble(mut_data, key(.data), index(.data))
       22. tsibble:::duplicated_key_index(data, key, index)
       23. dplyr::grouped_df(as_tibble(data), key)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 264 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: Out-of-sample accuracy (@test-accuracy.R#52) 
      2. Error: fable dplyr verbs (@test-fable.R#32) 
      3. Failure: features() (@test-features.R#23) 
      4. Error: generate (@test-generate.R#6) 
      5. Error: generate seed setting (@test-generate.R#31) 
      6. Error: reconciliation (@test-reconciliation.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# finalfit

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/finalfit
* URL: https://github.com/ewenharrison/finalfit
* BugReports: https://github.com/ewenharrison/finalfit/issues
* Date/Publication: 2020-04-21 11:50:02 UTC
* Number of recursive dependencies: 134

Run `revdep_details(,"finalfit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      mort_5yr mort_5yr.num   n
    1    Alive            1 511
    2     Died            2 404
    3     <NA>           NA  14
    
    $counts[[19]]
      sex.factor2 age.factor2   n
    1           M   <60 years 204
    2           M   60+ years 241
    3           F   <60 years 210
    4           F   60+ years 274
    
    
    > 
    > # Select a tibble and expand
    > out$counts[[9]] %>%
    +   print(n = Inf)
    Error in print.default(m, ..., quote = quote, right = right, max = max) : 
      invalid 'na.print' specification
    Calls: %>% ... print -> print.data.frame -> print -> print.default
    Execution halted
    ```

# foieGras

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/foieGras
* URL: https://cran.r-project.org/package=foieGras
* BugReports: https://github.com/ianjonsen/foieGras/issues
* Date/Publication: 2019-10-07 22:10:03 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"foieGras")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: fit_ssm
    > ### Title: Fit a continuous-time state-space model to filter Argos
    > ###   satellite geolocation data
    > ### Aliases: fit_ssm
    > 
    > ### ** Examples
    > 
    > ## fit rw model to one seal with Argos KF data
    > data(ellie)
    > fit <- fit_ssm(ellie, model = "rw", time.step = 24)
    
    pre-filtering data...
    
    fitting SSM...
    Warning in sqrt(as.numeric(object$diag.cov.random)) : NaNs produced
    > 
    > ## time series plots of predicted value fits
    > plot(fit, what = "predicted", type = 1)
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 2. Error: (unknown) (@test-plot.R#7)  ───────────────────────────────────────
      Can't subset columns that don't exist.
      ✖ Column `shut.up` doesn't exist.
      Backtrace:
        1. graphics::plot(fssm, what = "fitted")
       31. vctrs:::stop_subscript_oob(...)
       32. vctrs:::stop_subscript(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 30 | SKIPPED: 14 | WARNINGS: 2 | FAILED: 2 ]
      1. Error: (unknown) (@test-join.R#7) 
      2. Error: (unknown) (@test-plot.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 35.2Mb
      sub-directories of 1Mb or more:
        libs  34.0Mb
    ```

# forecastML

<details>

* Version: 0.8.0
* Source code: https://github.com/cran/forecastML
* URL: https://github.com/nredell/forecastML/
* Date/Publication: 2020-02-28 22:40:12 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"forecastML")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. forecastML::create_lagged_df(...)
       20. data.table:::`[.data.table`(...)
       21. [ base::eval(...) ] with 1 more call
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 22 | SKIPPED: 23 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: lagged_df, training data, grouped with dates is correct (@test_create_lagged_df_grouped.R#43) 
      2. Error: lagged_df, training data, grouped with dates is correct (@test_create_lagged_df_grouped_multi_output.R#46) 
      3. Error: lagged_df, training and forecasting data lookback_control skips groups and static and dynamic features (@test_create_lagged_df_lookback.R#88) 
      4. Error: lagged_df, training data lookback_control appropriately drops lagged features (@test_create_lagged_df_lookback.R#133) 
      5. Error: multi_output, lagged_df, training and forecasting data lookback_control skips groups and static and dynamic features (@test_create_lagged_df_lookback_multi_output.R#88) 
      6. Error: multi_output, lagged_df, training data lookback_control appropriately drops lagged features (@test_create_lagged_df_lookback_multi_output.R#133) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gaiah

<details>

* Version: 0.0.2
* Source code: https://github.com/cran/gaiah
* Date/Publication: 2017-03-02 18:54:59
* Number of recursive dependencies: 72

Run `revdep_details(,"gaiah")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ could not find function "n"
    ℹ Input `cnt` is `n()`.
    ℹ The error occured in group 1: Location = "100 Mile House".
    Backtrace:
         █
      1. └─gaiah::group_birds_by_location(...)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─gaiah:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             ├─base::withVisible(function_list[[k]](value))
      9.             └─function_list[[k]](value)
     10.               ├─dplyr::summarise_(...)
     11.               └─dplyr:::summarise_.tbl_df(...)
     12.                 ├─dplyr::summarise(.data, !!!dots)
     13.                 ├─dplyr:::summarise.grouped_df(.data, !!!dots)
     14.                 ├─base::NextMethod()
     15.                 └─dplyr:::summ
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggplot2’ ‘maptools’ ‘rgeos’ ‘stringr’ ‘tidyr’
      All declared Imports should be used.
    ```

# getTBinR

<details>

* Version: 0.7.0
* Source code: https://github.com/cran/getTBinR
* URL: https://www.samabbott.co.uk/getTBinR, https://github.com/seabbs/getTBinR
* BugReports: https://github.com/seabbs/getTBinR/issues
* Date/Publication: 2019-09-03 13:50:06 UTC
* Number of recursive dependencies: 148

Run `revdep_details(,"getTBinR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Names: 2 string mismatches >
      Attributes: < Length mismatch: comparison on first 2 components >
      Attributes: < Component 1: Modes: character, externalptr >
      Attributes: < Component 1: Lengths: 3, 1 >
      Attributes: < Component 1: target is character, current is externalptr >
      Attributes: < Component 2: Modes: numeric, character >
      Attributes: < Component 2: Lengths: 1, 3 >
      Attributes: < Component 2: target is numeric, current is character >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 95 | SKIPPED: 50 | WARNINGS: 2 | FAILED: 1 ]
      1. Failure: Variable search for a known variable returns expected results (@test-search_data_dict.R#28) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggcharts

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/ggcharts
* URL: https://github.com/thomas-neitmann/ggcharts
* BugReports: https://github.com/thomas-neitmann/ggcharts/issues
* Date/Publication: 2020-03-26 17:00:03 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"ggcharts")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(ggcharts)
      Loading required package: ggplot2
      > 
      > test_check("ggcharts")
      ── 1. Failure: x is converted to factor with levels in order of y when sort = TR
      pre_process_data(df, cat, val) not equal to dplyr::tibble(...).
      Component "cat": 2 string mismatches
      Component "val": Mean relative difference: 1
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 3 | SKIPPED: 7 | WARNINGS: 3 | FAILED: 1 ]
      1. Failure: x is converted to factor with levels in order of y when sort = TRUE (@test-pre_process_data.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggedit

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/ggedit
* URL: https://github.com/metrumresearchgroup/ggedit
* BugReports: https://github.com/metrumresearchgroup/ggedit/issues
* Date/Publication: 2018-07-03 21:50:02 UTC
* Number of recursive dependencies: 79

Run `revdep_details(,"ggedit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `filter()` input `..1`.
    ✖ object 'VAR' not found
    ℹ Input `..1` is `!is.null(VAR)`.
    Backtrace:
         █
      1. └─ggedit::layersList(p)
      2.   ├─ggedit:::rmNullObs(lapply(obj, layersListFull))
      3.   └─base::lapply(obj, layersListFull)
      4.     └─ggedit:::FUN(X[[i]], ...)
      5.       └─ggedit:::fetch_aes_ggplotBuild(obj, geom_list = geom_list(obj))
      6.         └─ggedit:::class_layer(p)
      7.           └─base::lapply(...)
      8.             └─ggedit:::FUN(X[[i]], ...)
      9.               └─`%>%`(...)
     10.                 ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     11.                 └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     12.                   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13.                     └─ggedit:::`_fseq`(`_lhs`)
     14.                       └─magrittr::freduce(value, `_function_list`)
     15.                         ├─base::withVisible(function_list[[k]](value))
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# ggformula

<details>

* Version: 0.9.4
* Source code: https://github.com/cran/ggformula
* URL: https://github.com/ProjectMOSAIC/ggformula
* BugReports: https://github.com/ProjectMOSAIC/ggformula/issues
* Date/Publication: 2020-03-04 09:40:08 UTC
* Number of recursive dependencies: 180

Run `revdep_details(,"ggformula")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Corrupt `grouped_df` using old (< 0.8.0) format
    ℹ Strip off old grouping with `ungroup()`
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             ├─dplyr::filter(., city == "Chicago", year == 2016, month <= 4)
     10.             └─dplyr:::filter.data.frame(...)
     11.               └─dplyr:::filter_rows(.data, ...)
     12.                 └─DataMask$new(.data, caller_env())
     13.                   └─.subset2(public_bind_env, "initialize")(...)
     14.                     └─dplyr::group_rows(data)
     15.                       ├─dplyr::group_data(.data)
     16.             
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. ggformula::gf_linerange(...)
        5. ggplot2:::fortify.grouped_df(data)
        7. dplyr:::group_indices.data.frame(model)
        8. dplyr::group_rows(.data)
       10. dplyr:::group_data.grouped_df(.data)
       11. dplyr::validate_grouped_df(.data)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 110 | WARNINGS: 4 | FAILED: 2 ]
      1. Error: gf_area() & gf_ribbon() (@test-layer-factory.R#54) 
      2. Error: gf_linerange() and gf_pointrange() 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘quantreg’
    ```

# gratia

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/gratia
* URL: https://gavinsimpson.github.io/gratia
* BugReports: https://github.com/gavinsimpson/gratia/issues
* Date/Publication: 2020-03-29 18:30:05 UTC
* Number of recursive dependencies: 111

Run `revdep_details(,"gratia")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. testthat::expect_silent(d <- derivatives(m))
       14. vctrs::stop_incompatible_size(...)
       15. vctrs:::stop_incompatible(...)
       16. vctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 697 | SKIPPED: 74 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: derivatives() returns derivatives for all smooths in a factor by GAM (@test-derivatives.R#183) 
      2. Error: derivatives() returns derivatives for all smooths in a factor by GAM (@test-derivatives.R#225) 
      3. Error: derivatives() works for factor by smooths issue 47 (@test-derivatives.R#339) 
      4. Error: derivatives() works for fs smooths issue 57 (@test-derivatives.R#389) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# groupedstats

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/groupedstats
* URL: https://indrajeetpatil.github.io/groupedstats/, https://github.com/IndrajeetPatil/groupedstats/
* BugReports: https://github.com/IndrajeetPatil/groupedstats/issues/
* Date/Publication: 2020-04-05 09:00:02 UTC
* Number of recursive dependencies: 128

Run `revdep_details(,"groupedstats")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── 5. Failure: grouped_proptest works - with NAs (@test-grouped_proptest.R#111) 
      df2$statistic not equal to c(...).
      names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 101 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 5 ]
      1. Failure: grouped_proptest works - without NAs (@test-grouped_proptest.R#37) 
      2. Failure: grouped_proptest works - without NAs (@test-grouped_proptest.R#49) 
      3. Failure: grouped_proptest works - without NAs (@test-grouped_proptest.R#52) 
      4. Failure: grouped_proptest works - with NAs (@test-grouped_proptest.R#87) 
      5. Failure: grouped_proptest works - with NAs (@test-grouped_proptest.R#111) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gt

<details>

* Version: 0.2.0.5
* Source code: https://github.com/cran/gt
* URL: https://github.com/rstudio/gt
* BugReports: https://github.com/rstudio/gt/issues
* Date/Publication: 2020-03-31 10:10:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"gt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ could not find function "n"
    ℹ Input `pizzas_sold` is `n()`.
    ℹ The error occured in group 1: month = 1.
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           └─function_list[[i]](value)
      8.             ├─dplyr::summarize(., pizzas_sold = n())
      9.             ├─dplyr:::summarise.grouped_df(., pizzas_sold = n())
     10.             ├─base::NextMethod()
     11.             └─dplyr:::summarise.data.frame(., pizzas_sold = n())
     12.               └─dplyr:::summarise_cols(.data, ...)
     13.                 └─base::tryCatch(...)
     14.                   └─base:::tryCatchList(expr, classes, parentenv, handlers)
     15.            
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        help   5.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 116 marked UTF-8 strings
    ```

# HaDeX

<details>

* Version: 1.1
* Source code: https://github.com/cran/HaDeX
* Date/Publication: 2020-02-06 13:50:02 UTC
* Number of recursive dependencies: 127

Run `revdep_details(,"HaDeX")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: quality_control
    > ### Title: Experiment quality control
    > ### Aliases: quality_control
    > 
    > ### ** Examples
    > 
    > # load example data
    > dat <- read_hdx(system.file(package = "HaDeX", "HaDeX/data/KD_180110_CD160_HVEM.csv"))
    > 
    > # calculate mean uncertainty 
    > (result <- quality_control(dat = dat,
    +                            state_first = "CD160",
    +                            state_second = "CD160_HVEM", 
    +                            chosen_time = 1, 
    +                            in_time = 0.001))    
    Error in `[.data.table`(dat, "Exposure") : 
      When i is a data.table (or character vector), the columns to join by must be specified using 'on=' argument (see ?data.table), by keying x (i.e. sorted, and, marked as sorted, see ?setkey), or by sharing column names between x and i (i.e., a natural join). Keyed joins might have further speed benefits on very large data due to x being sorted in RAM.
    Calls: quality_control -> unique -> [ -> [.data.table
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── 2. Error: size is right  ────────────────────────────────────────────────────
      When i is a data.table (or character vector), the columns to join by must be specified using 'on=' argument (see ?data.table), by keying x (i.e. sorted, and, marked as sorted, see ?setkey), or by sharing column names between x and i (i.e., a natural join). Keyed joins might have further speed benefits on very large data due to x being sorted in RAM.
      Backtrace:
       1. testthat::expect_equal(...)
       6. HaDeX::quality_control(...)
       9. data.table:::`[.data.table`(dat, "Exposure")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 16 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: class is right 
      2. Error: size is right 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘gsubfn’ ‘stringr’
      All declared Imports should be used.
    ```

# healthcareai

<details>

* Version: 2.4.0
* Source code: https://github.com/cran/healthcareai
* URL: http://docs.healthcare.ai
* BugReports: https://github.com/HealthCatalyst/healthcareai-r/issues
* Date/Publication: 2020-02-28 18:00:05 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"healthcareai")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `filter()` input `..1`.
    ✖ object 'patient' not found
    ℹ Input `..1` is `n_distinct(patient) >= min_obs`.
    ℹ The error occured in group 1: drug = "Dexamethasone".
    Backtrace:
         █
      1. └─healthcareai::get_best_levels(...)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─healthcareai:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               ├─dplyr::filter(., n_distinct(!!id) >= min_obs)
     10.               └─dplyr:::filter.data.frame(., n_distinct(!!id) >= min_obs)
     11.                 └─dplyr:::filter_rows(.data, ...)
     12.                   └─base::tryCatch(...)
     13.                     └─base:::tryCatchList(expr, classes, parentenv, handlers)
     14.            
    Execution halted
    ```

# idmodelr

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/idmodelr
* URL: http://www.samabbott.co.uk/idmodelr, https://github.com/seabbs/idmodelr
* BugReports: https://github.com/seabbs/idmodelr/issues
* Date/Publication: 2019-09-10 22:50:10 UTC
* Number of recursive dependencies: 126

Run `revdep_details(,"idmodelr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 4. Failure: generate_parameter_permutations can use a single parameter sample
      `df_results` not equal to `df_check`.
      Names: 2 string mismatches
      Component 3: Mean absolute difference: 1
      Component 4: Mean relative difference: 1
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 48 | SKIPPED: 41 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: Holding out of time works as expected (@test-combine_to_age_model.R#25) 
      2. Failure: Specifying compartments, automatically specifies hold out variables (@test-combine_to_age_model.R#31) 
      3. Failure: Specifying hold out variables, automatically specifies compartments (@test-combine_to_age_model.R#37) 
      4. Failure: generate_parameter_permutations can use a single parameter sample (@test-generate_parameter_permutations.R#26) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# IncucyteDRC

<details>

* Version: 0.5.4
* Source code: https://github.com/cran/IncucyteDRC
* URL: https://github.com/chapmandu2/IncucyteDRC
* BugReports: https://github.com/chapmandu2/IncucyteDRC/issues
* Date/Publication: 2016-04-23 14:21:03
* Number of recursive dependencies: 119

Run `revdep_details(,"IncucyteDRC")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > test_idrc_set <- fitDoseResponseCurve(test_idrc_set)
    Error: Problem with `mutate()` input `idx`.
    ✖ could not find function "row_number"
    ℹ Input `idx` is `row_number()`.
    ℹ The error occured in group 1: sampleid = "PDD00017273", conc = 0.3703704.
    Backtrace:
         █
      1. └─IncucyteDRC::fitDoseResponseCurve(test_idrc_set)
      2.   └─IncucyteDRC::exportDRCDataToDataFrame(idrc_set, include_control)
      3.     └─`%>%`(...)
      4.       ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      7.           └─IncucyteDRC:::`_fseq`(`_lhs`)
      8.             └─magrittr::freduce(value, `_function_list`)
      9.               └─function_list[[i]](value)
     10.                 ├─dplyr::mutate(., idx = row_number())
     11.                 └─dplyr:::mutate.data.frame(., idx = row_number())
     12.                   └─dplyr:::mutate_cols(.data, ...)
     13.                     └─base::tryCatch(.
    Execution halted
    ```

# InjurySeverityScore

<details>

* Version: 0.0.0.2
* Source code: https://github.com/cran/InjurySeverityScore
* URL: https://github.com/dajuntian/InjurySeverityScore
* BugReports: https://github.com/dajuntian/InjurySeverityScore/issues
* Date/Publication: 2019-05-19 04:11:18 UTC
* Number of recursive dependencies: 24

Run `revdep_details(,"InjurySeverityScore")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > pat_id <- c(2,2,2,2,2,1,2,1,2,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1)
    > icd9 <- c('874.2', '874.8', '900.81', '900.82', '900.89', '805.06', 
    +           'E966', '805.07', 'V14.0', '807.02', 'V70.4', '821.01', '823.20', 
    +           '860.0', '861.01', '861.21', '861.22', '863.84', '864.04', '865.04', 
    +           '865.09', '866.02', '868.04', '958.4')
    > sample_data <- data.frame(subj = pat_id, code = icd9, stringsAsFactors = FALSE)
    > injury_score(sample_data, subj, code)
    Warning in max(severity) :
      no non-missing arguments to max; returning -Inf
    Error: Argument 2 must be an integer vector, not a double vector
    Backtrace:
        █
     1. └─InjurySeverityScore::injury_score(sample_data, subj, code)
     2.   ├─base::cbind(...)
     3.   └─dplyr::coalesce(iss_br$max_wo_9, iss_br$max_w_9, as.integer(iss_br$severity_default))
     4.     └─dplyr:::replace_with(...)
     5.       └─dplyr:::check_type(val, x, name)
     6.         └─dplyr:::glubort(header, "must be {friendly_type_of(template)}, not {friendly_type_of(x)}")
    Execution halted
    ```

# janitor

<details>

* Version: 2.0.1
* Source code: https://github.com/cran/janitor
* URL: https://github.com/sfirke/janitor
* BugReports: https://github.com/sfirke/janitor/issues
* Date/Publication: 2020-04-12 05:40:02 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"janitor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. tidygraph::play_erdos_renyi(10, 0.5)
        1. tidygraph::bind_nodes(., test_df)
        9. tidygraph::mutate_all(., tidyr::replace_na, 1)
       10. dplyr:::manip_all(...)
       14. dplyr::tbl_nongroup_vars(.tbl)
       16. dplyr::tbl_vars(x)
       19. dplyr::group_vars(x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 583 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: tbl_graph/tidygraph (@test-clean-names.R#417) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jpndistrict

<details>

* Version: 0.3.6
* Source code: https://github.com/cran/jpndistrict
* URL: https://uribo.github.io/jpndistrict
* BugReports: https://github.com/uribo/jpndistrict/issues
* Date/Publication: 2020-04-20 07:50:07 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"jpndistrict")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      downloaded 9427 bytes
      
      options:        ENCODING=cp932 
      Reading layer `P34-14_47' from data source `/tmp/RtmpvIMD1k/P34-14_47_GML/P34-14_47.shp' using driver `ESRI Shapefile'
      Simple feature collection with 65 features and 4 fields
      geometry type:  POINT
      dimension:      XY
      bbox:           xmin: 123.0045 ymin: 24.06092 xmax: 131.2989 ymax: 27.03917
      CRS:            EPSG:4612
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 93 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-export.R#3) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 188 marked UTF-8 strings
    ```

# jstor

<details>

* Version: 0.3.8
* Source code: https://github.com/cran/jstor
* URL: https://github.com/ropensci/jstor, https://docs.ropensci.org/jstor
* BugReports: https://github.com/ropensci/jstor/issues
* Date/Publication: 2020-04-03 14:10:23 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"jstor")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 239 | SKIPPED: 4 | WARNINGS: 5 | FAILED: 14 ]
      1. Failure: journal id is unified (@test-augment.R#75) 
      2. Failure: files with column names can be re-read (@test-re-import.R#212) 
      3. Failure: files with column names can be re-read (@test-re-import.R#216) 
      4. Failure: files with column names can be re-read (@test-re-import.R#220) 
      5. Failure: files with column names can be re-read (@test-re-import.R#224) 
      6. Failure: files with column names can be re-read (@test-re-import.R#228) 
      7. Failure: files without column names can be re-read (@test-re-import.R#244) 
      8. Failure: files without column names can be re-read (@test-re-import.R#248) 
      9. Failure: files without column names can be re-read (@test-re-import.R#252) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# mason

<details>

* Version: 0.2.6
* Source code: https://github.com/cran/mason
* URL: https://github.com/lwjohnst86/mason
* BugReports: https://github.com/lwjohnst86/mason/issues
* Date/Publication: 2018-07-05 12:20:02 UTC
* Number of recursive dependencies: 67

Run `revdep_details(,"mason")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Component "estimate": Mean relative difference: 1.999997
      Component "std.error": Mean relative difference: 0.2627753
      Component "statistic": Mean relative difference: 1.789258
      Component "p.value": Mean relative difference: 1.333262
      Component "conf.low": Mean relative difference: 1.751052
      Component "conf.high": Mean relative difference: 1.316709
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 76 | SKIPPED: 1 | WARNINGS: 7 | FAILED: 3 ]
      1. Failure: (for glm bi) results are equal to real results (no covar) (@test-glm-binomial.R#59) 
      2. Failure: (for glm bi) results are equal to real results (with covar) (@test-glm-binomial.R#73) 
      3. Failure: (for glm) results are equal to real results (with covar + int) (@test-glm-binomial.R#88) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ggplot2’, ‘pander’, ‘pixiedust’
    ```

# matman

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/matman
* Date/Publication: 2020-04-28 09:40:05 UTC
* Number of recursive dependencies: 116

Run `revdep_details(,"matman")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > data("Amount")
    > data1 = Amount[sample(1:nrow(Amount), 1000),]
    > data2 = Amount[sample(1:nrow(Amount), 1000),]
    > abcxyzData1 = computeABCXYZAnalysis(data1, value = "value", item = "item", timestamp = "date")
    > abcxyzData2 = computeABCXYZAnalysis(data2, value = "value", item = "item", timestamp = "date")
    > comparison = compare(abcxyzData1, abcxyzData2)
    Error: Join columns must be unique
    ✖ Problem at position 2
    Backtrace:
        █
     1. ├─matman::compare(abcxyzData1, abcxyzData2)
     2. └─matman::compare(abcxyzData1, abcxyzData2)
     3.   └─matman:::.local(object1, object2, ...)
     4.     ├─dplyr::full_join(...)
     5.     └─dplyr:::full_join.data.frame(...)
     6.       └─dplyr:::join_mutate(...)
     7.         └─dplyr:::join_cols(...)
     8.           └─dplyr:::standardise_join_by(by, x_names = x_names, y_names = y_names)
     9.             └─dplyr:::check_join_vars(by$x, x_names)
    Execution halted
    ```

# mcp

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/mcp
* URL: http://lindeloev.github.io/mcp/, https://github.com/lindeloev/mcp
* BugReports: https://github.com/lindeloev/mcp/issues
* Date/Publication: 2020-01-09 16:30:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"mcp")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1. Failure: Good variance:
          y ~ 1 + sigma(x + I(x^2)) (@test-runs.R#277) 
      2. Failure: Good variance:
          y ~ 1 + sigma(1 + sin(x)) (@test-runs.R#277) 
      3. Failure: Good variance:
          y ~ 1 + sigma(1 + sin(x)) (@test-runs.R#277) 
      4. Failure: Good variance:
          y ~ 1, ~0 + sigma(rel(1)), ~x + sigma(x), ~0 + sigma(rel(x)) (@test-runs.R#277) 
      5. Failure: Good variance:
          y ~ 1, 1 + (1 | id) ~ rel(1) + I(x^2) + sigma(rel(1) + x) (@test-runs.R#277) 
      6. Failure: Good Poisson:
          y ~ 1 + ar(1), ~1 + x + ar(2, 1 + x + I(x^3)) (@test-runs.R#277) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘bayesplot’ ‘methods’ ‘purrr’
      All declared Imports should be used.
    ```

# metagam

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/metagam
* URL: https://lifebrain.github.io/metagam/, https://github.com/Lifebrain/metagam
* BugReports: https://github.com/Lifebrain/metagam/issues
* Date/Publication: 2020-02-20 10:20:02 UTC
* Number of recursive dependencies: 138

Run `revdep_details(,"metagam")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. metagam::metagam(fits, grid_size = 10, type = "link")
       3. dplyr:::mutate.data.frame(...)
       4. dplyr:::mutate_cols(.data, ...)
       5. base::tryCatch(...)
       6. base:::tryCatchList(expr, classes, parentenv, handlers)
       7. base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
       8. value[[3L]](cond)
       9. dplyr:::stop_dplyr(i, dots, fn = "mutate", problem = conditionMessage(e))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 60 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: metagam works (@test-metagam.R#68) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# metamicrobiomeR

<details>

* Version: 1.1
* Source code: https://github.com/cran/metamicrobiomeR
* URL: https://github.com/nhanhocu/metamicrobiomeR
* BugReports: https://github.com/nhanhocu/metamicrobiomeR/issues
* Date/Publication: 2019-09-03 07:20:02 UTC
* Number of recursive dependencies: 131

Run `revdep_details(,"metamicrobiomeR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > tl<-colnames(taxtab6)[grep("k__bacteria.p__fusobacteria",colnames(taxtab6))]
    > taxacom.ex<-taxa.compare(taxtab=taxtab6[,c("personid","x.sampleid","bf","age.sample",tl)],
    + propmed.rel="gamlss",comvar="bf",adjustvar="age.sample",
    + longitudinal="yes",p.adjust.method="fdr")
    Error: Corrupt `grouped_df` using old (< 0.8.0) format
    ℹ Strip off old grouping with `ungroup()`
    Backtrace:
         █
      1. ├─metamicrobiomeR::taxa.compare(...)
      2. │ └─base::as.data.frame(taxtab)
      3. ├─taxtab6[, c("personid", "x.sampleid", "bf", "age.sample", tl)]
      4. └─dplyr:::`[.grouped_df`(...)
      5.   └─dplyr:::group_intersect(x, out)
      6.     ├─generics::intersect(group_vars(x), names(new))
      7.     ├─dplyr::group_vars(x)
      8.     └─dplyr:::group_vars.data.frame(x)
      9.       ├─generics::setdiff(names(group_data(x)), ".rows")
     10.       ├─dplyr::group_data(x)
     11.       └─dplyr:::group_data.grouped_df(x)
     12.         └─dplyr::validate_grouped_df(.data)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RCurl’ ‘foreign’ ‘gplots’ ‘httr’ ‘jsonlite’ ‘knitr’ ‘lmerTest’
      ‘magrittr’ ‘mgcv’ ‘repmis’ ‘reshape2’ ‘rmarkdown’
      All declared Imports should be used.
    ```

# mosaicData

<details>

* Version: 0.17.0
* Source code: https://github.com/cran/mosaicData
* Date/Publication: 2018-06-23 18:37:55 UTC
* Number of recursive dependencies: 90

Run `revdep_details(,"mosaicData")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Corrupt `grouped_df` using old (< 0.8.0) format
    ℹ Strip off old grouping with `ungroup()`
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           └─function_list[[i]](value)
      8.             ├─dplyr::group_by(., city, year)
      9.             └─dplyr:::group_by.data.frame(., city, year)
     10.               └─dplyr::group_by_prepare(.data, ..., .add = .add)
     11.                 ├─generics::setdiff(group_names, tbl_vars(out))
     12.                 ├─generics:::setdiff.default(group_names, tbl_vars(out))
     13.                 │ └─base::setdiff(x, y, ...)
     14.                 │   └─base::as.vector(y)
     15.                 └─dplyr::tbl_vars(out)
     16.                  
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
    ```

# MPTmultiverse

<details>

* Version: 0.4-0
* Source code: https://github.com/cran/MPTmultiverse
* URL: https://github.com/mpt-network/MPTmultiverse
* BugReports: https://github.com/mpt-network/MPTmultiverse/issues
* Date/Publication: 2020-03-28 01:20:02 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"MPTmultiverse")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [3] 0.912 - 0.701 ==  0.2109
      [4] 0.750 - 0.887 == -0.1370
      [5] 0.933 - 0.922 ==  0.0109
      [6] 0.903 - 0.972 == -0.0693
      [7] 0.701 - 0.912 == -0.2108
      [8] 0.887 - 0.750 ==  0.1375
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 38 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: No-pooling approaches work (@test-mptinr.R#35) 
      2. Failure: No-pooling approaches work (@test-mptinr.R#68) 
      3. Failure: No-pooling approaches work (@test-mptinr.R#112) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ncmeta

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/ncmeta
* URL: https://github.com/hypertidy/ncmeta
* BugReports: https://github.com/hypertidy/ncmeta/issues
* Date/Publication: 2019-10-22 17:10:02 UTC
* Number of recursive dependencies: 50

Run `revdep_details(,"ncmeta")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Component "class": 1 string mismatch >
      
      ── 3. Failure: nc_coord_var brings back expected content for one variable (@test
      nc_coord_var(f, "RAINNC_present") not equal to data.frame(...).
      Attributes: < Component "class": Lengths (3, 1) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 114 | SKIPPED: 9 | WARNINGS: 0 | FAILED: 3 ]
      1. Failure: nc_coord_var brings back expected content for one variable (@test-coord.R#8) 
      2. Failure: nc_coord_vars brings back expected content for sample (@test-coord.R#25) 
      3. Failure: nc_coord_var brings back expected content for one variable (@test-coord.R#38) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# neuropsychology

<details>

* Version: 0.5.0
* Source code: https://github.com/cran/neuropsychology
* URL: https://github.com/neuropsychology/neuropsychology.R
* BugReports: https://github.com/neuropsychology/neuropsychology.R/issues
* Date/Publication: 2017-03-22 19:17:18 UTC
* Number of recursive dependencies: 153

Run `revdep_details(,"neuropsychology")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    > ### Name: describe
    > ### Title: Description of dataframes.
    > ### Aliases: describe
    > 
    > ### ** Examples
    > 
    > require(neuropsychology)
    > 
    > df <- personality
    > 
    > describe(df)
    Warning: `transmute_()` is deprecated as of dplyr 0.7.0.
    Please use `transmute()` instead.
    See vignette('programming') for more help
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    Error in round(df[2:10], 2) : 
      non-numeric argument to mathematical function
    Calls: describe
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘htmlTable’ ‘lme4’ ‘stringi’
      All declared Imports should be used.
    ```

# omu

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/omu
* URL: https://github.com/connor-reid-tiffany/Omu, https://www.kegg.jp/kegg/rest/keggapi.html
* BugReports: https://github.com/connor-reid-tiffany/Omu/issues
* Date/Publication: 2018-08-02 12:40:03 UTC
* Number of recursive dependencies: 82

Run `revdep_details(,"omu")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Gather metadata from KEGG for metabolites
    > ### Aliases: KEGG_gather KEGG_gather.cpd KEGG_gather.rxn KEGG_gather.KO
    > 
    > ### ** Examples
    > 
    > count_data <- assign_hierarchy(count_data = c57_nos2KO_mouse_countDF,
    + keep_unknowns = TRUE, identifier = "KEGG")
    Error: Input must be a vector, not a `data.frame/cpd` object.
    Backtrace:
         █
      1. ├─omu::assign_hierarchy(...)
      2. │ ├─dplyr::distinct(count_data, Metabolite, .keep_all = TRUE)
      3. │ └─dplyr:::distinct.data.frame(count_data, Metabolite, .keep_all = TRUE)
      4. │   ├─dplyr::dplyr_row_slice(out[prep$keep], loc)
      5. │   └─dplyr:::dplyr_row_slice.data.frame(out[prep$keep], loc)
      6. │     ├─dplyr::dplyr_reconstruct(vec_slice(data, i), data)
      7. │     ├─dplyr:::dplyr_reconstruct.data.frame(vec_slice(data, i), data)
      8. │     └─vctrs::vec_slice(data, i)
      9. └─vctrs:::stop_scalar_type(...)
     10.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

# padr

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/padr
* URL: https://github.com/EdwinTh/padr
* BugReports: https://github.com/EdwinTh/padr/issues
* Date/Publication: 2020-04-03 09:50:02 UTC
* Number of recursive dependencies: 69

Run `revdep_details(,"padr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   count(period) %>%
    +   pad_cust(spanning)
    Error: No common size for `..1`, size 0, and `..2`, size 1248.
    Backtrace:
         █
      1. ├─`%>%`(...)
      2. │ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3. │ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─`_fseq`(`_lhs`)
      6. │       └─magrittr::freduce(value, `_function_list`)
      7. │         ├─base::withVisible(function_list[[k]](value))
      8. │         └─function_list[[k]](value)
      9. │           └─padr::pad_cust(., spanning)
     10. │             └─padr:::pad_cust_group_span(spanned, group_vars_un)
     11. │               └─dplyr::bind_cols(spanned_df, group_vars_un[ind, , drop = FALSE])
     12. │                 └─vctrs::vec_cbind(!!!dots)
     13. └─vctrs::stop_incompatible_size(...)
     14.   └─vctrs:::stop_incompatible(...)
     15.     └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 573 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 24 ]
      1. Failure: break_above prevents large output (@test_pad.R#56) 
      2. Failure: break_above prevents large output (@test_pad.R#58) 
      3. Failure: gives correct output when start or end with datetime range (@test_pad.R#100) 
      4. Failure: gives correct output when start or end with datetime range (@test_pad.R#102) 
      5. Failure: pad_multiple pads correctly with one group var (@test_pad.R#120) 
      6. Failure: pad_multiple pads correctly with one group var (@test_pad.R#121) 
      7. Failure: pad_multiple pads correctly with one group var (@test_pad.R#122) 
      8. Failure: pad pads correctly with two group vars (@test_pad.R#130) 
      9. Failure: pad pads correctly with two group vars (@test_pad.R#131) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pammtools

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/pammtools
* URL: https://github.com/adibender/pammtools
* BugReports: https://github.com/adibender/pammtools/issues
* Date/Publication: 2020-03-12 21:00:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"pammtools")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: `vars` must be a character vector
    Backtrace:
         █
      1. └─tumor %>% group_by(sex) %>% make_newdata()
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             ├─pammtools::make_newdata(.)
     10.             └─pammtools:::make_newdata.default(.)
     11.               ├─sample_info(rest) %>% ungroup()
     12.               │ └─base::eval(lhs, parent, parent)
     13.               │   └─base::eval(lhs, parent, parent)
     14.               ├─pammtools::sample_info(rest)
     15.               └─pammtools:::sample_info.data.frame(rest)
     16.                 ├─base::suppressMessages(...)
     17.                 
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 242 | SKIPPED: 0 | WARNINGS: 7 | FAILED: 13 ]
      1. Error: cumulative hazard functions work for PAM (@test-add-functions.R#101) 
      2. Failure: adding terms works for PAM (@test-add-functions.R#145) 
      3. Failure: adding terms works for PAM (@test-add-functions.R#150) 
      4. Failure: adding terms works for PAM (@test-add-functions.R#152) 
      5. Failure: adding terms works for PAM (@test-add-functions.R#155) 
      6. Failure: adding terms works for PAM (@test-add-functions.R#157) 
      7. Error: survival probabilities functions work for PAM (@test-add-functions.R#236) 
      8. Error: Cumulative effects are calculated correctly (@test-cumulative-effect.R#102) 
      9. Error: Sample info returned for data frame (@test-interval-functions.R#23) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# panelr

<details>

* Version: 0.7.2
* Source code: https://github.com/cran/panelr
* URL: https://panelr.jacob-long.com
* BugReports: https://github.com/jacob-long/panelr
* Date/Publication: 2020-03-08 22:10:02 UTC
* Number of recursive dependencies: 168

Run `revdep_details(,"panelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘panelr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: are_varying
    > ### Title: Check if variables are constant or variable over time.
    > ### Aliases: are_varying
    > 
    > ### ** Examples
    > 
    > 
    > wages <- panel_data(WageData, id = id, wave = t)
    Warning: The `add` argument of `group_by()` is deprecated as of dplyr 1.0.0.
    Please use the `.add` argument instead.
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    > wages %>% are_varying(occ, ind, fem, blk)
    Error in if (get_wave(data) %in% dots) NULL else get_wave(data) : 
      argument is of length zero
    Calls: %>% ... freduce -> withVisible -> <Anonymous> -> are_varying
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 22 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 17 ]
      1. Failure: dplyr functions return panel_data objects (@test-utils.R#29) 
      2. Error: widen_panel works (@test-utils.R#46) 
      3. Error: long_panel works (basic case) (@test-utils.R#72) 
      4. Error: long_panel works (unbalanced data) (@test-utils.R#96) 
      5. Error: long_panel works (unbalanced data, numeric waves not begin w/ 1) (@test-utils.R#120) 
      6. Error: long_panel works (character periods) (@test-utils.R#146) 
      7. Error: long_panel works (beginning label) (@test-utils.R#171) 
      8. Error: long_panel works (beginning label/character periods) (@test-utils.R#198) 
      9. Error: long_panel works (prefix and suffix/character periods) (@test-utils.R#225) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# parcats

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/parcats
* URL: https://erblast.github.io/parcats/
* Date/Publication: 2019-12-02 16:10:03 UTC
* Number of recursive dependencies: 111

Run `revdep_details(,"parcats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ Problem at position 2
    Backtrace:
         █
      1. └─easyalluvial::alluvial_model_response(pred, dspace, imp, degree = 3)
      2.   ├─base::do.call(...)
      3.   └─(function (from, target, ...) ...
      4.     ├─`%>%`(...)
      5.     │ └─base::eval(lhs, parent, parent)
      6.     │   └─base::eval(lhs, parent, parent)
      7.     ├─base::levels(...)
      8.     └─easyalluvial::manip_bin_numerics(...)
      9.       └─df_min %>% left_join(df_max, by = join_by)
     10.         ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     11.         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     12.           └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13.             └─easyalluvial:::`_fseq`(`_lhs`)
     14.               └─magrittr::freduce(value, `_function_list`)
     15.                 ├─base::withVisible(function_list[[k]](value))
     16.                 └─function_list[[k]](value)
     17.                   ├─
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. easyalluvial::alluvial_model_response(pred, dspace, imp, degree = 3)
        8. easyalluvial::manip_bin_numerics(...)
       11. dplyr::left_join(., df_max, by = join_by)
       19. dplyr:::join_mutate(...)
       20. dplyr:::join_cols(...)
       21. dplyr:::standardise_join_by(by, x_names = x_names, y_names = y_names)
       22. dplyr:::check_join_vars(by$x, x_names)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 1 | SKIPPED: 3 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: parcats_alluvial_model_response (@test_parcats.R#105) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘magrittr’ ‘tibble’
      All declared Imports should be used.
    ```

# photosynthesis

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/photosynthesis
* Date/Publication: 2019-05-09 15:10:03 UTC
* Number of recursive dependencies: 73

Run `revdep_details(,"photosynthesis")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
                          A            g_mc25              g_sc                g_uc
    1 27.48581 [umol/m^2/s] 4 [umol/Pa/m^2/s] 4 [umol/Pa/m^2/s] 0.1 [umol/Pa/m^2/s]
      gamma_star25          J_max25       K_C25        K_O25  k_mc  k_sc  k_uc
    1   3.743 [Pa] 200 [umol/m^2/s] 27.238 [Pa] 16.582 [kPa] 1 [1] 1 [1] 1 [1]
      leafsize     phi_J          R_d25     T_leaf   theta_J         V_cmax25
    1  0.1 [m] 0.331 [1] 2 [umol/m^2/s] 298.15 [K] 0.825 [1] 150 [umol/m^2/s]
               V_tpu25 g_mc gamma_star J_max    K_C    K_O R_d V_cmax V_tpu   C_air
    1 200 [umol/m^2/s]    4      3.743   200 27.238 16.582   2    150   200 41 [Pa]
                   O              P              PPFD      RH    wind
    1 21.27565 [kPa] 101.3246 [kPa] 1500 [umol/m^2/s] 0.5 [1] 2 [m/s]
    > 
    > # Multiple parameter sets with 'photosynthesis'
    > 
    > leaf_par <- make_leafpar(
    +   replace = list(
    +     T_leaf = set_units(c(293.14, 298.15), "K")
    +     ), use_tealeaves = FALSE
    +   )
    > photosynthesis(leaf_par, enviro_par, bake_par, constants,
    +                use_tealeaves = FALSE)
    Solving for photosynthetic rate from 2 parameter sets ...New names:
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# pixiedust

<details>

* Version: 0.8.6
* Source code: https://github.com/cran/pixiedust
* URL: https://github.com/nutterb/pixiedust
* BugReports: https://github.com/nutterb/pixiedust/issues
* Date/Publication: 2019-01-11 16:40:03 UTC
* Number of recursive dependencies: 65

Run `revdep_details(,"pixiedust")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 503 | SKIPPED: 120 | WARNINGS: 3 | FAILED: 10 ]
      1.  Failure: lowercase color (@test-colors.R#8) 
      2.  Failure: dust with glance_foot (@test-dust.R#79) 
      3.  Failure: dust with glance_foot and col_pairs a divisor of total_cols (@test-dust.R#85) 
      4.  Failure: glance_foot by column (@test-glance_foot.R#18) 
      5.  Failure: glance_foot by row (@test-glance_foot.R#23) 
      6.  Failure: glance_foot with subset of stats (@test-glance_foot.R#28) 
      7.  Failure: medley_model (@test-medley.R#17) 
      8.  Failure: print.dust for markdown output (@test-print.dust-explicit.R#12) 
      9.  Failure: print.dust for latex output with hhline = FALSE (@test-print.dust-explicit.R#26) 
      10. Failure: print.dust for latex output with hhline = TRUE (@test-print.dust-explicit.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Hmisc’
    ```

# pmdplyr

<details>

* Version: 0.3.1
* Source code: https://github.com/cran/pmdplyr
* URL: https://nickch-k.github.io/pmdplyr, https://github.com/NickCH-K/pmdplyr
* BugReports: https://github.com/NickCH-K/pmdplyr/issues
* Date/Publication: 2020-03-09 19:30:02 UTC
* Number of recursive dependencies: 101

Run `revdep_details(,"pmdplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `mutate()` input `changed`.
    ✖ Input `changed` can't be recycled to size 8.
    ℹ Input `changed` is `<lgl>`.
    ℹ Input `changed` must be size 8 or 1, not 48445.
    ℹ The error occured in group 1: unitid = 100654.
    Backtrace:
         █
      1. └─pmdplyr::fixed_force(...)
      2.   └─.df %>% dplyr::mutate(`:=`(!!.flag, !!newflag))
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─pmdplyr:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             ├─base::withVisible(function_list[[k]](value))
      9.             └─function_list[[k]](value)
     10.               ├─dplyr::mutate(., `:=`(!!.flag, !!newflag))
     11.               └─dplyr:::mutate.data.frame(., `:=`(!!.flag, !!newflag))
     12.                 └─dplyr:::mutate_cols(.data, ...)
     13.                 
    Execution halted
    ```

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'join.Rd':
      ‘[dplyr]{join.tbl_df}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 243 | SKIPPED: 0 | WARNINGS: 53 | FAILED: 17 ]
      1. Failure: Different inexact joins work (@test-inexact_join.R#177) 
      2. Failure: Different inexact joins work (@test-inexact_join.R#221) 
      3. Failure: panel_fill works (@test-panel_consistency.R#80) 
      4. Failure: panel_fill works (@test-panel_consistency.R#81) 
      5. Failure: panel_fill works (@test-panel_consistency.R#87) 
      6. Failure: panel_fill works (@test-panel_consistency.R#102) 
      7. Failure: panel_fill works (@test-panel_consistency.R#106) 
      8. Failure: panel_fill works (@test-panel_consistency.R#107) 
      9. Failure: panel_fill works (@test-panel_consistency.R#108) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ptstem

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/ptstem
* URL: https://github.com/dfalbel/ptstem
* Date/Publication: 2019-01-02 14:40:02 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"ptstem")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      y[4]: "gostou"
      
      x[5]: "gostaram"
      y[5]: "gostou"
      
      x[6]: "gostaram"
      y[6]: "gostou"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 17 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 2 ]
      1. Failure: Stemming Hunspell Works (@test-ptstem.R#15) 
      2. Failure: Stemming Hunspell Works (@test-ptstem.R#19) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        dict   5.1Mb
    ```

# PupillometryR

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/PupillometryR
* BugReports: https://github.com/samhforbes/PupillometryR/issues
* Date/Publication: 2020-02-02 16:00:05 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"PupillometryR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Calculating mean pupil size in each timebin 
    
    Error: Column name `Trial` must not be duplicated.
    Backtrace:
         █
      1. └─PupillometryR::downsample_time_data(...)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─PupillometryR:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               ├─dplyr::group_by(...)
     10.               └─dplyr:::group_by.data.frame(...)
     11.                 └─dplyr::grouped_df(groups$data, groups$group_names, .drop)
     12.                   └─dplyr:::compute_groups(data, vars, drop = drop)
     13.                     └─tibble::tibble(!!!old_keys, `:=`(".rows", old_rows))
     14.                       └─tibble:::tibble_quos(xs[!is_null], .rows, .name_repair)
     15.                         └─tibble:::set_repair
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘data.table’ ‘fractal’ ‘mgcv’
      All declared Imports should be used.
    ```

# rabhit

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/rabhit
* URL: https://yaarilab.bitbucket.io/RAbHIT/
* BugReports: https://bitbucket.org/yaarilab/haplotyper/issues
* Date/Publication: 2020-01-29 20:20:02 UTC
* Number of recursive dependencies: 109

Run `revdep_details(,"rabhit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    Using `n` as weighting variable
    Error: Column 'n' is already present in output
     * Use `name = "new_name"` to pick a new name
    Backtrace:
         █
      1. └─rabhit::deletionHeatmap(samplesHaplotype)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─rabhit:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             ├─base::withVisible(function_list[[k]](value))
      9.             └─function_list[[k]](value)
     10.               └─dplyr::count_(.)
     11.                 └─dplyr::count(x, !!!vars, wt = !!wt, sort = sort, .drop = .drop)
     12.                   └─dplyr::tally(out, wt = !!enquo(wt), sort = sort, name = name)
     13.                     └─dplyr:::check_name(x, name)
     14.                       └─dplyr:::glubort(...)
    Execution halted
    ```

# rainette

<details>

* Version: 0.1
* Source code: https://github.com/cran/rainette
* URL: https://juba.github.io/rainette/
* BugReports: https://github.com/juba/rainette/issues
* Date/Publication: 2020-03-25 15:30:05 UTC
* Number of recursive dependencies: 155

Run `revdep_details(,"rainette")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. testthat::expect_equivalent(...)
        2. stats[[2]][stats[[2]]$sign == "positive", ]
       10. dplyr::select(., -sign)
       14. rlang::set_names(.data[loc], names(loc))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 133 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: rainette_stats (@test_keyness.R#18) 
      
      Error: testthat unit tests failed
      In addition: Warning message:
      In for (i in seq_along(feat_cc)) { :
        closing unused connection 4 (doesnt/exist.txtt)
      Execution halted
    ```

# ratPASTA

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/ratPASTA
* URL: https://github.com/ikodvanj/ratPASTA
* BugReports: https://github.com/ikodvanj/ratPASTA/issues
* Date/Publication: 2020-04-28 11:40:02 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"ratPASTA")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Length mismatch: comparison on first 2 components >
      Attributes: < Component 2: Lengths: 1708, 33000 >
      Attributes: < Component 2: names for target but not for current >
      Attributes: < Component 2: Attributes: < Modes: list, NULL > >
      Attributes: < Component 2: Attributes: < Lengths: 1, 0 > >
      Attributes: < Component 2: Attributes: < names for target but not for current > >
      Attributes: < Component 2: Attributes: < current is not list-like > >
      Attributes: < Component 2: target is omit, current is numeric >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 22 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: Testing automated data loading (@test-loadstartledata.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘hms’
      All declared Imports should be used.
    ```

# RCT

<details>

* Version: 1.0.1
* Source code: https://github.com/cran/RCT
* Date/Publication: 2020-04-04 00:30:11 UTC
* Number of recursive dependencies: 80

Run `revdep_details(,"RCT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > balance_regression(data, "treatment")
    Error: Problem with `mutate()` input `estadistico`.
    ✖ Input `estadistico` can't be recycled to size 4.
    ℹ Input `estadistico` is `c("F-statistic", "k", "n-k-1", "F_critical", "p_value", "R cuadrada")`.
    ℹ Input `estadistico` must be size 4 or 1, not 6.
    Backtrace:
         █
      1. └─RCT::balance_regression(data, "treatment")
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─RCT:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               ├─dplyr::mutate(...)
     10.               └─dplyr:::mutate.data.frame(...)
     11.                 └─dplyr:::mutate_cols(.data, ...)
     12.                   └─base::tryCatch(...)
     13.                     └─base:::tryCatchList(expr, classes, parentenv, handlers)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ncol(b_reg$F_test) not equal to 4.
      1/1 mismatches
      [1] 7 - 4 == 3
      
      ── 2. Failure: Correct names balance_regression (@test_balance_regression.R#33) 
      names(b_reg$F_test) not equal to c("estadistico", "Msj1", "Msj2", "Msj3").
      Lengths differ: 7 is not 4
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 86 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: balance_regression returns list w/right dimension (@test_balance_regression.R#25) 
      2. Failure: Correct names balance_regression (@test_balance_regression.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rcv

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/rcv
* URL: https://github.com/ds-elections/rcv
* BugReports: https://github.com/ds-elections/rcv/issues
* Date/Publication: 2017-08-11 08:11:33 UTC
* Number of recursive dependencies: 46

Run `revdep_details(,"rcv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `summarise()` input `total`.
    ✖ could not find function "n"
    ℹ Input `total` is `n()`.
    ℹ The error occured in group 1: candidate = "BEN MATRANGA".
    Backtrace:
         █
      1. └─rcv::rcv_tally(image = sf_bos_clean, rcvcontest = "Board of Supervisors, District 7")
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─rcv:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               ├─dplyr::summarise(., total = n())
     10.               ├─dplyr:::summarise.grouped_df(., total = n())
     11.               ├─base::NextMethod()
     12.               └─dplyr:::summarise.data.frame(., total = n())
     13.                 └─dplyr:::summarise_cols(.data, ...)
     14.                   └─base:
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6543 marked UTF-8 strings
    ```

# rFIA

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/rFIA
* Date/Publication: 2020-04-27 14:00:02 UTC
* Number of recursive dependencies: 81

Run `revdep_details(,"rFIA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘rFIA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: diversity
    > ### Title: Estimate diversity from FIADB
    > ### Aliases: diversity
    > 
    > ### ** Examples
    > 
    > ## Load data from rFIA package
    > data(fiaRI)
    > data(countiesRI)
    > 
    > ## Make a most recent subset
    > fiaRI_mr <- clipFIA(fiaRI)
    > 
    > ## Most recent estimates for live stems on forest land
    > diversity(db = fiaRI_mr,
    +           landType = 'forest',
    +           treeType = 'live')
    Error: distinct() must use existing variables
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        R      2.1Mb
        data   1.9Mb
    ```

# RNeXML

<details>

* Version: 2.4.3
* Source code: https://github.com/cran/RNeXML
* URL: https://docs.ropensci.org/RNeXML, https://github.com/ropensci/RNeXML
* BugReports: https://github.com/ropensci/RNeXML/issues
* Date/Publication: 2020-03-01 05:50:02 UTC
* Number of recursive dependencies: 135

Run `revdep_details(,"RNeXML")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
       26. base::lapply(.x, .f, ...)
       27. dplyr:::FUN(X[[i]], ...)
       28. tibble::tibble(!!!.x)
       29. tibble:::tibble_quos(xs[!is_null], .rows, .name_repair)
       30. tibble:::vectbl_recycle_rows(res, first_size, j, given_col_names[[j]])
      
      Done simulation(s).
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 278 | SKIPPED: 45 | WARNINGS: 2 | FAILED: 3 ]
      1. Error: we can correctly parse nested ResourceMeta annotations (@test_meta_extract.R#128) 
      2. Error: metadata tables can be requested in simplified form (@test_meta_extract.R#155) 
      3. Error: ID assignments are correct and complete when meta are nested (@test_meta_extract.R#168) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rsample

<details>

* Version: 0.0.6
* Source code: https://github.com/cran/rsample
* URL: https://tidymodels.github.io/rsample, https://github.com/tidymodels/rsample
* BugReports: https://github.com/tidymodels/rsample/issues
* Date/Publication: 2020-03-31 19:50:02 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"rsample")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Attributes: < Component 2: Numeric: lengths (40, 1) differ >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 574 | SKIPPED: 2 | WARNINGS: 6 | FAILED: 8 ]
      1. Failure: rsplit labels (@test_boot.R#89) 
      2. Failure: rsplit labels (@test_group.R#104) 
      3. Failure: rsplit labels (@test_mc.R#86) 
      4. Failure: rsplit labels (@test_nesting.R#71) 
      5. Failure: rsplit labels (@test_rolling.R#102) 
      6. Failure: rsplit labels (@test_validation.R#90) 
      7. Failure: rsplit labels (@test_vfold.R#85) 
      8. Failure: rsplit labels (@test_vfold.R#90) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# RTL

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/RTL
* URL: https://github.com/risktoollib/RTL
* Date/Publication: 2020-02-23 18:50:02 UTC
* Number of recursive dependencies: 138

Run `revdep_details(,"RTL")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    Error: Column name `freq` must not be duplicated.
    Backtrace:
         █
      1. └─RTL::chart_zscore(...)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─RTL:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             └─function_list[[i]](value)
      9.               ├─dplyr::summarise(., value = mean(value))
     10.               ├─dplyr:::summarise.grouped_df(., value = mean(value))
     11.               ├─base::NextMethod()
     12.               └─tsibble:::summarise.tbl_ts(., value = mean(value))
     13.                 ├─tibble::as_tibble(index_by(.data, !!idx2))
     14.                 ├─tsibble::index_by(.data, !!idx2)
     15.                 └─tsibble:::index_by.tbl_ts(.data, !!idx2)
     16.                   ├─dplyr::group_by(idx2_data, !!!g
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘quantmod’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 15456 marked UTF-8 strings
    ```

# ruler

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/ruler
* URL: https://echasnovski.github.io/ruler/, https://github.com/echasnovski/ruler
* BugReports: https://github.com/echasnovski/ruler/issues
* Date/Publication: 2020-03-02 21:20:03 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"ruler")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 1. Failure: bind_exposures removes names from list-column `fun` (@test-expose
      output_1 %>% get_packs_info() %>% pull(fun) %>% names() not identical to NULL.
      Types not compatible: character is not NULL
      
      ── 2. Failure: bind_exposures removes names from list-column `fun` (@test-expose
      output_2 %>% get_packs_info() %>% pull(fun) %>% names() not identical to NULL.
      Types not compatible: character is not NULL
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 303 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 2 ]
      1. Failure: bind_exposures removes names from list-column `fun` (@test-expose-helpers.R#111) 
      2. Failure: bind_exposures removes names from list-column `fun` (@test-expose-helpers.R#117) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# saotd

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/saotd
* BugReports: https://github.com/evan-l-munson/saotd/issues
* Date/Publication: 2019-04-04 16:30:03 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"saotd")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(saotd)
      > 
      > test_check("saotd")
      ── 1. Failure: bigrams are computed properly (@test_bigram.R#19)  ──────────────
      saotd::bigram(DataFrame = test_bigram_df) not equal to `correct_bigram_df`.
      Attributes: < Component "class": Lengths (1, 3) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      Killed
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 826 marked UTF-8 strings
    ```

# SCORPIUS

<details>

* Version: 1.0.6
* Source code: https://github.com/cran/SCORPIUS
* URL: http://github.com/rcannood/SCORPIUS
* BugReports: https://github.com/rcannood/SCORPIUS/issues
* Date/Publication: 2020-03-16 16:20:02 UTC
* Number of recursive dependencies: 117

Run `revdep_details(,"SCORPIUS")` for more info

</details>

## Newly broken

*   checking whether package ‘SCORPIUS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/SCORPIUS/new/SCORPIUS.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SCORPIUS’ ...
** package ‘SCORPIUS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘as.tbl_cube’ is not exported by 'namespace:dplyr'
Execution halted
ERROR: lazy loading failed for package ‘SCORPIUS’
* removing ‘/tmp/workdir/SCORPIUS/new/SCORPIUS.Rcheck/SCORPIUS’

```
### CRAN

```
* installing *source* package ‘SCORPIUS’ ...
** package ‘SCORPIUS’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (SCORPIUS)

```
# simglm

<details>

* Version: 0.7.4
* Source code: https://github.com/cran/simglm
* Date/Publication: 2019-05-31 17:10:03 UTC
* Number of recursive dependencies: 90

Run `revdep_details(,"simglm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── 1. Failure: interupt TS (@test_knots.r#69)  ─────────────────────────────────
      table(temp_long$time_k) not equal to table(temp_long$time >= 3).
      Numeric: lengths (2, 0) differ
      
      ── 2. Failure: interupt TS (@test_knots.r#96)  ─────────────────────────────────
      table(temp_long$time_k) not equal to table(temp_long$time >= 3).
      Numeric: lengths (2, 0) differ
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 129 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 2 ]
      1. Failure: interupt TS (@test_knots.r#69) 
      2. Failure: interupt TS (@test_knots.r#96) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simITS

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/simITS
* Date/Publication: 2020-04-28 09:40:02 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"simITS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: adjust_data
    > 
    > ### ** Examples
    > 
    > data( "meck_subgroup" )
    > head( meck_subgroup )
    # A tibble: 6 x 5
    # Groups:   month [2]
      month n.cases n.bail pbail category
      <dbl>   <int>  <dbl> <dbl> <fct>   
    1   -29     550    349 0.635 felony  
    2   -29    1316    699 0.531 misdem  
    3   -29     305    174 0.570 traffic 
    4   -28     549    378 0.689 felony  
    5   -28    1338    708 0.529 misdem  
    6   -28     334    193 0.578 traffic 
    > pis = calculate_group_weights( "category", Nname="n.cases", 
    +                                meck_subgroup, t_min=0, t_max= max( meck_subgroup$month ) )
    > pis
    # A tibble: 3 x 3
      category     N pi_star
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
          is_false, is_null, is_true
      
      ── 1. Error: vague tests of post_stratified_ITS (@test-post_stratified_ITS.R#14)
      'by' must specify a uniquely valid column
      Backtrace:
       1. simITS::adjust_data(...)
       3. base::merge.data.frame(adj.dat, sdat, by = c("N", "month"), all = TRUE)
       4. base:::fix.by(by.y, y)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 81 | SKIPPED: 0 | WARNINGS: 100 | FAILED: 1 ]
      1. Error: vague tests of post_stratified_ITS (@test-post_stratified_ITS.R#14) 
      
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
      Component "simulation": Attributes: < Component 2: Modes: numeric, list >
      Component "simulation": Attributes: < Component 2: Lengths: 4, 2 >
      Component "simulation": Attributes: < Component 2: names for current but not for target >
      Component "simulation": Attributes: < Component 2: target is numeric, current is list >
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 95 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 5 ]
      1. Failure: Simplify the simulation results (@test_eval_tibbles.R#381) 
      2. Failure: Two groups for summary_fun. Results were created and stored in simulation (@test_eval_tibbles.R#824) 
      3. Failure: Create a tibble containing the results for every replication (@test_frame_simulation.R#33) 
      4. Failure: Create a tibble containing the results sumamrized by one summary function (@test_frame_simulation.R#73) 
      5. Failure: Simple unnesting (@test_unnest_simulation.R#20) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# strapgod

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/strapgod
* URL: https://github.com/DavisVaughan/strapgod
* BugReports: https://github.com/DavisVaughan/strapgod/issues
* Date/Publication: 2019-09-20 04:50:02 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"strapgod")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1/1 mismatches
      [1] 150 - 300 == -150
      
      ── 4. Failure: bind_cols() works (@test-dplyr-compat.R#374)  ───────────────────
      "tbl_df" %in% class(x_bc_2) isn't false.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 151 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 4 ]
      1. Failure: bind_rows() fails sadly (@test-dplyr-compat.R#341) 
      2. Failure: bind_cols() works (@test-dplyr-compat.R#354) 
      3. Failure: bind_cols() works (@test-dplyr-compat.R#366) 
      4. Failure: bind_cols() works (@test-dplyr-compat.R#374) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# survminer

<details>

* Version: 0.4.6
* Source code: https://github.com/cran/survminer
* URL: http://www.sthda.com/english/rpkgs/survminer/
* BugReports: https://github.com/kassambara/survminer/issues
* Date/Publication: 2019-09-03 23:00:02 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"survminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    Error: `x` must be a vector, not a `grouped_df/tbl_df/tbl/data.frame/surv_group_by` object.
    Backtrace:
         █
      1. └─survminer::ggsurvplot_facet(...)
      2.   └─grouped.d %>% tibble::add_column(fit = sf)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─survminer:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             ├─base::withVisible(function_list[[k]](value))
      9.             └─function_list[[k]](value)
     10.               └─tibble::add_column(., fit = sf)
     11.                 ├─base::`[<-`(...)
     12.                 └─dplyr:::`[<-.grouped_df`(...)
     13.                   └─dplyr::grouped_df(out, group_intersect(x, out), group_by_drop_default(x))
     14.                     └─dplyr:::compute_groups(data, vars, drop = drop)
     15.                    
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# survParamSim

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/survParamSim
* URL: https://github.com/yoshidk6/survParamSim
* BugReports: https://github.com/yoshidk6/survParamSim/issues
* Date/Publication: 2020-01-13 17:00:02 UTC
* Number of recursive dependencies: 161

Run `revdep_details(,"survParamSim")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(survParamSim)
      > 
      > test_check("survParamSim")
      ── 1. Failure: predicted KM and median time per group (@test-calc_km_pi.R#46)  ─
      `.` not equal to data.frame(pi_low = c(0.777, 0.841), pi_high = c(0.922, 0.951)).
      Component "pi_low": names for target but not for current
      Component "pi_high": names for target but not for current
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 26 | SKIPPED: 5 | WARNINGS: 1 | FAILED: 1 ]
      1. Failure: predicted KM and median time per group (@test-calc_km_pi.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# textreuse

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/textreuse
* URL: https://github.com/ropensci/textreuse
* BugReports: https://github.com/ropensci/textreuse/issues
* Date/Publication: 2016-11-28 16:54:10
* Number of recursive dependencies: 60

Run `revdep_details(,"textreuse")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.
    Error: Input must be a vector, not a `tbl_df/tbl/data.frame/lsh_buckets` object.
    Backtrace:
         █
      1. ├─textreuse::lsh_candidates(buckets)
      2. │ └─`%>%`(...)
      3. │   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6. │       └─textreuse:::`_fseq`(`_lhs`)
      7. │         └─magrittr::freduce(value, `_function_list`)
      8. │           └─function_list[[i]](value)
      9. │             ├─dplyr::filter_(., ~doc.x != doc.y)
     10. │             └─dplyr:::filter_.tbl_df(., ~doc.x != doc.y)
     11. │               ├─dplyr::filter(.data, !!!dots)
     12. │               └─dplyr:::filter.data.frame(.data, !!!dots)
     13. │                 ├─dplyr::dplyr_row_slice(.data, loc, preserve = .preserve)
     14. │                 └─dplyr:::dplyr_row_slice.data.frame(.data, loc, preserve = .preserve)
     15. │ 
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("textreuse")
      ── 1. Error: (unknown) (@test-lsh.R#10)  ───────────────────────────────────────
      Input must be a vector, not a `tbl_df/tbl/data.frame/lsh_buckets` object.
      Backtrace:
        1. textreuse::lsh_candidates(buckets)
       18. vctrs:::stop_scalar_type(...)
       19. vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 129 | SKIPPED: 2 | WARNINGS: 7 | FAILED: 1 ]
      1. Error: (unknown) (@test-lsh.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        extdata   2.9Mb
        libs      1.8Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘tm’
    ```

# tibbletime

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/tibbletime
* URL: https://github.com/business-science/tibbletime
* BugReports: https://github.com/business-science/tibbletime/issues
* Date/Publication: 2019-09-20 05:00:02 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"tibbletime")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +                            '1 minute', class = "hms")
    > 
    > dplyr::mutate(time_test, date2 = ceiling_index(date, "hour"))
    Error: Problem with `mutate()` input `date2`.
    ✖ C stack usage  7970420 is too close to the limit
    ℹ Input `date2` is `ceiling_index(date, "hour")`.
    Backtrace:
         █
      1. ├─dplyr::mutate(time_test, date2 = ceiling_index(date, "hour"))
      2. ├─tibbletime:::mutate.tbl_time(...)
      3. │ ├─tibbletime::reconstruct(NextMethod(), copy_.data)
      4. │ └─tibbletime:::reconstruct.tbl_time(NextMethod(), copy_.data)
      5. ├─base::NextMethod()
      6. └─dplyr:::mutate.data.frame(...)
      7.   └─dplyr:::mutate_cols(.data, ...)
      8.     └─base::tryCatch(...)
      9.       └─base:::tryCatchList(expr, classes, parentenv, handlers)
     10.         └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
     11.           └─value[[3L]](cond)
     12.             └─dplyr:::stop_dplyr(i, dots, fn = "mutate", problem = conditionMessage(e))
    Execution halted
    ```

# tidycells

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/tidycells
* URL: https://r-rudra.github.io/tidycells/, https://github.com/r-rudra/tidycells
* BugReports: https://github.com/r-rudra/tidycells/issues
* Date/Publication: 2020-01-09 19:10:09 UTC
* Number of recursive dependencies: 115

Run `revdep_details(,"tidycells")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > cd <- as_cell_df(d) %>% numeric_values_classifier()
    Error: `x` must be a vector, not a `tbl_df/tbl/data.frame/unpivotr` object.
    Backtrace:
         █
      1. ├─as_cell_df(d) %>% numeric_values_classifier()
      2. │ └─base::eval(lhs, parent, parent)
      3. │   └─base::eval(lhs, parent, parent)
      4. ├─tidycells::as_cell_df(d)
      5. └─tidycells:::as_cell_df.data.frame(d)
      6.   └─d %>% attach_intermediate_class() %>% as_cell_df_internal(...)
      7.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      8.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      9.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     10.         └─tidycells:::`_fseq`(`_lhs`)
     11.           └─magrittr::freduce(value, `_function_list`)
     12.             ├─base::withVisible(function_list[[k]](value))
     13.             └─function_list[[k]](value)
     14.               ├─tidycells:::as_cell_df_internal(., ...)
     15.               └─tidycells:::as_cell_df_internal.default(., ...)
     16.                 └─`%
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 34 | SKIPPED: 2 | WARNINGS: 8 | FAILED: 29 ]
      1. Error: numeric_values_classifier works (@test-VA_classifier.R#5) 
      2. Error: sample_based_classifier works (@test-VA_classifier.R#45) 
      3. Error: sample_based_classifier works (@test-VA_classifier.R#41) 
      4. Error: (unknown) (@test-VA_classifier.R#41) 
      5. Error: analyze_cell works: base 
      6. Error: analyze_cell works: tidyxl (@test-analyze_cells.R#28) 
      7. Error: analyze_cell works: tidyxl (@test-analyze_cells.R#25) 
      8. Error: (unknown) (@test-analyze_cells.R#25) 
      9. Error: as_cell_df() works on tidyxl::xlsx_cells on single sheet (@test-as_cell_df.R#6) 
      1. ...
      
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

*   checking examples ... ERROR
    ```
    ...
    > # Stack names
    > '{"first": "bob", "last": "jones"}' %>%
    +   gather_object %>%
    +   append_values_string
    # A tbl_json: 2 x 3 tibble with a "JSON" attribute
      `attr(., "JSON")` document.id name  string
      <chr>                   <int> <chr> <chr> 
    1 "\"bob\""                   1 first bob   
    2 "\"jones\""                 1 last  jones 
    > 
    > # This is most useful when data is stored in name-value pairs
    > # For example, tags in recipes:
    > recipes <- c('{"name": "pie", "tags": {"apple": 10, "pie": 2, "flour": 5}}',
    +              '{"name": "cookie", "tags": {"chocolate": 2, "cookie": 1}}')
    > recipes %>%
    +   spread_values(name = jstring(name)) %>%
    +   enter_object(tags) %>%
    +   gather_object("tag") %>%
    +   append_values_number("count")
    Error: nrow(df) not equal to length(json.list)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 182 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 39 ]
      1. Failure: has correct complete structure with simple input (@test-append_values.R#7) 
      2. Failure: recursive works as expected (@test-append_values.R#191) 
      3. Failure: recursive works as expected (@test-append_values.R#206) 
      4. Error: filter removes records with missing path (@test-enter_object.R#52) 
      5. Error: works if no paths exist (@test-enter_object.R#71) 
      6. Failure: works in a simple case (@test-gather_object.R#7) 
      7. Failure: works with compound values (@test-gather_object.R#31) 
      8. Failure: column.name works and doesn't clobber existing name (@test-gather_object.R#80) 
      9. Failure: preserves a NULL column (@test-gather_object.R#100) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidync

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/tidync
* URL: https://docs.ropensci.org/tidync/
* BugReports: https://github.com/ropensci/tidync/issues
* Date/Publication: 2019-11-07 00:00:02 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"tidync")` for more info

</details>

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'hyper_tbl_cube.Rd':
      ‘[dplyr:tbl_cube]{tbl_cube}’ ‘[dplyr:tbl_cube]{dplyr}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

# tidystats

<details>

* Version: 0.4
* Source code: https://github.com/cran/tidystats
* Date/Publication: 2019-09-12 07:20:02 UTC
* Number of recursive dependencies: 29

Run `revdep_details(,"tidystats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   group_by(source) %>%
    +   describe_data(response)
    Error: `x` must be a vector, not a `grouped_df/tbl_df/tbl/data.frame/tidystats_descriptives` object.
    Backtrace:
         █
      1. ├─(function (x, ...) ...
      2. └─tibble:::print.tbl(x)
      3.   ├─cli::cat_line(format(x, ..., n = n, width = width, n_extra = n_extra))
      4.   │ └─base::paste0(..., collapse = "\n")
      5.   ├─base::format(x, ..., n = n, width = width, n_extra = n_extra)
      6.   └─tibble:::format.tbl(x, ..., n = n, width = width, n_extra = n_extra)
      7.     └─tibble::trunc_mat(x, n = n, width = width, n_extra = n_extra)
      8.       ├─base::as.data.frame(head(x, n))
      9.       ├─utils::head(x, n)
     10.       └─utils:::head.data.frame(x, n)
     11.         ├─x[seq_len(n), , drop = FALSE]
     12.         └─dplyr:::`[.grouped_df`(x, seq_len(n), , drop = FALSE)
     13.           └─dplyr::grouped_df(out, groups, group_by_drop_default(x))
     14.             └─dplyr:::compute_groups(data, vars, drop = drop)
     15.               ├─tibble::as_tib
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 113 marked UTF-8 strings
    ```

# timetk

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/timetk
* URL: https://github.com/business-science/timetk
* BugReports: https://github.com/business-science/timetk/issues
* Date/Publication: 2020-04-19 17:50:02 UTC
* Number of recursive dependencies: 150

Run `revdep_details(,"timetk")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Problem with `mutate()` input `nested.col`.
    ✖ No common size for `..1`, size 169, and `..2`, size 0.
    ℹ Input `nested.col` is `purrr::map(...)`.
    ℹ The error occured in group 1: id = "H10".
    Backtrace:
         █
      1. └─`%>%`(...)
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             ├─timetk::plot_acf_diagnostics(...)
     10.             └─timetk:::plot_acf_diagnostics.grouped_df(...)
     11.               ├─timetk::tk_acf_diagnostics(...)
     12.               └─timetk:::tk_acf_diagnostics.grouped_df(...)
     13.                 └─`%>%`(...)
     14.                   ├─base::withVisible(eval(quote(`_fseq`(`_l
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2750 marked UTF-8 strings
    ```

# trelliscopejs

<details>

* Version: 0.2.4
* Source code: https://github.com/cran/trelliscopejs
* URL: https://github.com/hafen/trelliscopejs
* BugReports: https://github.com/hafen/trelliscopejs/issues
* Date/Publication: 2020-02-10 22:40:02 UTC
* Number of recursive dependencies: 100

Run `revdep_details(,"trelliscopejs")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    Warning in structure(x, class = unique(c("AsIs", oldClass(x)))) :
      Calling 'structure(NULL, *)' is deprecated, as NULL cannot have attributes.
      Consider 'structure(list(), *)' instead.
    > 
    > trelliscope(mpg_cog, name = "city_vs_highway_mpg", nrow = 1, ncol = 2)
    Error: Input must be a vector, not a `grouped_df/tbl_df/tbl/data.frame/cognostics` object.
    Backtrace:
        █
     1. ├─trelliscopejs::trelliscope(...)
     2. ├─trelliscopejs:::trelliscope.data.frame(...)
     3. │ └─trelliscopejs:::cog_df_info(...)
     4. │   └─dplyr::bind_cols(cogs)
     5. │     └─vctrs::vec_cbind(!!!dots)
     6. └─vctrs:::stop_scalar_type(...)
     7.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       47. testthat:::failure_summary(result, self$n_fail)
       50. testthat:::format.expectation(x)
       51. testthat:::format_with_trace(x)
       53. rlang:::format.rlang_trace(...)
       54. rlang:::trace_format_branch(x, max_frames, dir, srcrefs)
       55. rlang:::branch_uncollapse_pipe(trace)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 224 | FAILED: 3 ]
      1. Error: examples run without barfing (@test-trelliscope.R#22) 
      2. Error: examples run without barfing (@test-trelliscope.R#3) 
      3. Error: (unknown) (@test-trelliscope.R#3) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tsibble

<details>

* Version: 0.8.6
* Source code: https://github.com/cran/tsibble
* URL: https://tsibble.tidyverts.org
* BugReports: https://github.com/tidyverts/tsibble/issues
* Date/Publication: 2020-01-31 06:20:11 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"tsibble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   group_by_key() %>%
    +   fill_gaps(kilo = sum(kilo))
    Error: `vars` must be a character vector
    Backtrace:
         █
      1. └─harvest %>% group_by_key() %>% fill_gaps(kilo = sum(kilo))
      2.   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3.   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─`_fseq`(`_lhs`)
      6.         └─magrittr::freduce(value, `_function_list`)
      7.           ├─base::withVisible(function_list[[k]](value))
      8.           └─function_list[[k]](value)
      9.             ├─tsibble::fill_gaps(., kilo = sum(kilo))
     10.             └─tsibble:::fill_gaps.tbl_ts(., kilo = sum(kilo))
     11.               ├─dplyr::left_join(gap_data, replaced_df, by = by_name)
     12.               └─tsibble:::left_join.tbl_ts(gap_data, replaced_df, by = by_name)
     13.                 └─tsibble:::update_meta(...)
     14.                   └─tsibble:::retain_tsibble(new, key = key(old), index = index(old))
     15.                
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 524 | SKIPPED: 2 | WARNINGS: 16 | FAILED: 34 ]
      1. Failure: 4 day interval (@test-append.R#27) 
      2. Error: (unknown) (@test-append.R#31) 
      3. Error: (unknown) (@test-bind.R#11) 
      4. Error: (unknown) (@test-dplyr.R#5) 
      5. Error: (unknown) (@test-empty.R#32) 
      6. Error: (unknown) (@test-gaps.R#93) 
      7. Error: (unknown) (@test-groups.R#3) 
      8. Error: From seconds to higher date (@test-indexby.R#25) 
      9. Error: From Date to year-week, year-month, year-quarter and year (@test-indexby.R#56) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘dtplyr’, ‘dbplyr’
    ```

# TSstudio

<details>

* Version: 0.1.6
* Source code: https://github.com/cran/TSstudio
* URL: https://github.com/RamiKrispin/TSstudio
* BugReports: https://github.com/RamiKrispin/TSstudio/issues
* Date/Publication: 2020-01-21 05:30:02 UTC
* Number of recursive dependencies: 136

Run `revdep_details(,"TSstudio")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘TSstudio-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: EURO_Brent
    > ### Title: Crude Oil Prices: Brent - Europe
    > ### Aliases: EURO_Brent
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > ts_plot(EURO_Brent)
    > ts_decompose(EURO_Brent, type = "both")
    Error in attributes(.Data) <- c(attributes(.Data), attrib) : 
      invalid time series parameters specified
    Calls: ts_decompose ... plotly_build -> plotly_build.plotly -> lapply -> FUN -> structure
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘forecastHybrid’
      All declared Imports should be used.
    ```

# unpivotr

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/unpivotr
* URL: https://github.com/nacnudus/unpivotr
* BugReports: https://github.com/nacnudus/unpivotr/issues
* Date/Publication: 2019-03-30 19:10:03 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"unpivotr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 232 | SKIPPED: 0 | WARNINGS: 159 | FAILED: 22 ]
      1. Failure: the `drop_na` argument of behead() works (@test-behead.R#32) 
      2. Failure: the `drop_na` argument of behead() works (@test-behead.R#42) 
      3. Failure: behead() works with all common datatypes (@test-behead.R#71) 
      4. Failure: behead() handles headers of mixed data types including dates (@test-behead.R#107) 
      5. Failure: behead() handles headers of factor and ordered-factor data types (@test-behead.R#126) 
      6. Failure: behead() supports custom formatters (@test-behead.R#134) 
      7. Failure: behead() supports custom formatters (@test-behead.R#135) 
      8. Failure: behead() can use row, col and data_type as headers (@test-behead.R#141) 
      9. Failure: behead() can use row, col and data_type as headers (@test-behead.R#144) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# vcfR

<details>

* Version: 1.10.0
* Source code: https://github.com/cran/vcfR
* URL: https://github.com/knausb/vcfR, https://knausb.github.io/vcfR_documentation/
* Date/Publication: 2020-02-06 09:50:02 UTC
* Number of recursive dependencies: 111

Run `revdep_details(,"vcfR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # to integer or numeric types...
    > Z <- vcfR2tidy(vcf)
    Error: Can't combine `..1$tt` <logical> and `..2$tt` <character>.
    Backtrace:
         █
      1. ├─vcfR::vcfR2tidy(vcf)
      2. │ ├─base::do.call(what = extract_gt_tidy, args = format_dots)
      3. │ └─(function (x, format_fields = NULL, format_types = TRUE, dot_is_NA = TRUE, ...
      4. │   └─vcfR:::guess_types(format_df %>% dplyr::filter(ID %in% format_fields))
      5. │     └─`%>%`(...)
      6. │       ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      7. │       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      8. │         └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      9. │           └─vcfR:::`_fseq`(`_lhs`)
     10. │             └─magrittr::freduce(value, `_function_list`)
     11. │               ├─base::withVisible(function_list[[k]](value))
     12. │               └─function_list[[k]](value)
     13. │                 └─dplyr::bind_rows(., tmp)
     14. │                   └─vctrs::vec_rbind(!!!dots, .names_to = .id)
     15.
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       15. vctrs::vec_default_ptype2(...)
       16. vctrs::stop_incompatible_type(...)
       17. vctrs:::stop_incompatible_type_combine(...)
       18. vctrs:::stop_incompatible_type_impl(...)
       19. vctrs:::stop_incompatible(...)
       20. vctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 475 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: extract_gt_tidy works for GT element (@test_vcfRtidy.R#55) 
      2. Error: extract_gt_tidy works for all elements (@test_vcfRtidy.R#70) 
      3. Error: vcfR2tidy works (@test_vcfRtidy.R#81) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.3Mb
      sub-directories of 1Mb or more:
        libs   8.4Mb
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
      Error: C stack usage  7973508 is too close to the limit
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

# xpose

<details>

* Version: 0.4.8
* Source code: https://github.com/cran/xpose
* URL: https://github.com/UUPharmacometrics/xpose
* BugReports: https://github.com/UUPharmacometrics/xpose/issues
* Date/Publication: 2020-03-17 12:20:02 UTC
* Number of recursive dependencies: 97

Run `revdep_details(,"xpose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
        <int> <lgl>  <list>                 <lgl>   
    1       1 FALSE  <tibble [550 × 31]>    FALSE   
    2       2 TRUE   <tibble [11,000 × 12]> FALSE   
    > 
    > # List output files data
    > list_files(xpdb_ex_pk)
    Files:
      name       extension problem subprob method data               modified
      <chr>      <chr>       <dbl>   <dbl> <chr>  <list>             <lgl>   
    1 run001.cor cor             1       0 foce   <tibble [14 × 15]> FALSE   
    2 run001.cov cov             1       0 foce   <tibble [14 × 15]> FALSE   
    3 run001.ext ext             1       0 foce   <tibble [28 × 16]> FALSE   
    4 run001.grd grd             1       0 foce   <tibble [21 × 11]> FALSE   
    5 run001.phi phi             1       0 foce   <tibble [74 × 12]> FALSE   
    6 run001.shk shk             1       0 foce   <tibble [7 × 5]>   FALSE   
    > 
    > # List special data
    > xpdb_ex_pk %>% 
    + vpc_data(quiet = TRUE) %>% 
    + list_special()
    New names:
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 416 | SKIPPED: 6 | WARNINGS: 15 | FAILED: 10 ]
      1.  Error: (unknown) (@test-console_outputs.R#4) 
      2.  Error: (unknown) (@test-edits.R#17) 
      3.  Failure: fetch_data can get simple data (@test-fetch_data.R#39) 
      4.  Failure: fetch_data can tidy data (@test-fetch_data.R#49) 
      5.  Failure: fetch_data can get file data (@test-fetch_data.R#58) 
      6.  Failure: properly parses a model given via the file and dir arguments (@test-read_nm_model.R#21) 
      7.  Failure: properly parses a model given via the runno and dir arguments (@test-read_nm_model.R#25) 
      8.  Failure: properly handles missing code in output file (@test-read_nm_model.R#31) 
      9.  Error: (unknown) (@test-vpc.R#18) 
      10. Error: (unknown) (@test-xpdb_access.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

