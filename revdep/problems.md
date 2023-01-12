# faux

<details>

* Version: 1.1.0
* GitHub: https://github.com/debruine/faux
* Source code: https://github.com/cran/faux
* Date/Publication: 2021-09-13 21:40:02 UTC
* Number of recursive dependencies: 133

Run `cloud_details(, "faux")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘codebook.Rmd’ using rmarkdown
    --- finished re-building ‘codebook.Rmd’
    
    --- re-building ‘continuous.Rmd’ using rmarkdown
    Quitting from lines 95-99 (continuous.Rmd) 
    Error: processing vignette 'continuous.Rmd' failed with diagnostics:
    Arguments in `...` must be used.
    ✖ Problematic arguments:
    • ..1 = "var"
    ...
    --- finished re-building ‘sim_design.Rmd’
    
    --- re-building ‘sim_df.Rmd’ using rmarkdown
    --- finished re-building ‘sim_df.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘continuous.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggpubr

<details>

* Version: 0.5.0
* GitHub: https://github.com/kassambara/ggpubr
* Source code: https://github.com/cran/ggpubr
* Date/Publication: 2022-11-16 12:10:54 UTC
* Number of recursive dependencies: 84

Run `cloud_details(, "ggpubr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggpubr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggsummarytable
    > ### Title: GGPLOT with Summary Stats Table Under the Plot
    > ### Aliases: ggsummarytable ggsummarystats print.ggsummarystats
    > ###   print.ggsummarystats_list
    > 
    > ### ** Examples
    > 
    ...
      6.   └─tidyselect::eval_select(expr(c(...)), data, allow_rename = FALSE)
      7.     └─tidyselect:::eval_select_impl(...)
      8.       ├─tidyselect:::with_subscript_errors(...)
      9.       │ └─rlang::try_fetch(...)
     10.       │   └─base::withCallingHandlers(...)
     11.       └─tidyselect:::vars_select_eval(...)
     12.         └─tidyselect:::ensure_named(...)
     13.           └─cli::cli_abort(...)
     14.             └─rlang::abort(...)
    Execution halted
    ```

# gutenbergr

<details>

* Version: 0.2.3
* GitHub: https://github.com/ropensci/gutenbergr
* Source code: https://github.com/cran/gutenbergr
* Date/Publication: 2022-12-14 10:00:06 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "gutenbergr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gutenbergr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gutenberg_get_mirror
    > ### Title: Get the recommended mirror for Gutenberg files
    > ### Aliases: gutenberg_get_mirror
    > 
    > ### ** Examples
    > 
    > gutenberg_get_mirror()
    Determining mirror for Project Gutenberg from https://www.gutenberg.org/robot/harvest
    Error in open.connection(3L, "rb") : 
      Timeout was reached: [www.gutenberg.org] Connection timed out after 10001 milliseconds
    Calls: gutenberg_get_mirror ... <Anonymous> -> vroom_ -> <Anonymous> -> open.connection
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        data   4.6Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 18981 marked UTF-8 strings
    ```

# mapme.biodiversity

<details>

* Version: 0.2.1
* GitHub: https://github.com/mapme-initiative/mapme.biodiversity
* Source code: https://github.com/cran/mapme.biodiversity
* Date/Publication: 2022-09-09 10:12:54 UTC
* Number of recursive dependencies: 118

Run `cloud_details(, "mapme.biodiversity")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       13. │           └─tidyselect:::eval_c(expr, data_mask, context_mask)
       14. │             └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       15. │               └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
       16. │                 └─tidyselect:::as_indices_sel_impl(...)
       17. │                   └─tidyselect:::as_indices_impl(...)
       18. │                     └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
       19. │                       └─vctrs::vec_as_location(...)
       20. └─vctrs (local) `<fn>`()
       21.   └─vctrs:::stop_subscript_oob(...)
       22.     └─vctrs:::stop_subscript(...)
       23.       └─rlang::abort(...)
      
      [ FAIL 1 | WARN 0 | SKIP 26 | PASS 113 ]
      Error: Test failures
      Execution halted
    ```

# metaconfoundr

<details>

* Version: 0.1.1
* GitHub: https://github.com/malcolmbarrett/metaconfoundr
* Source code: https://github.com/cran/metaconfoundr
* Date/Publication: 2022-08-06 14:00:10 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "metaconfoundr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘metaconfoundr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: metaconfoundr()
    > ### Title: Prepare a meta-analysis data set for metaconfoundr
    > ### Aliases: metaconfoundr() metaconfoundr
    > 
    > ### ** Examples
    > 
    > 
    ...
      7.           └─tidyselect::eval_select(...)
      8.             └─tidyselect:::eval_select_impl(...)
      9.               ├─tidyselect:::with_subscript_errors(...)
     10.               │ └─rlang::try_fetch(...)
     11.               │   └─base::withCallingHandlers(...)
     12.               └─tidyselect:::vars_select_eval(...)
     13.                 └─tidyselect:::ensure_named(...)
     14.                   └─cli::cli_abort(...)
     15.                     └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [ FAIL 2 | WARN 6 | SKIP 4 | PASS 32 ]
      Deleting unused snapshots:
      • non-confounders/non-confounder-count-point.svg
      • plots/cochrane-heatmap.svg
      • plots/cochrane-traffic-light-plot.svg
      • plots/heatmap-with-robins-labels-cochrane-colors.svg
      • plots/sorted-heatmap-by-domain.svg
      • plots/sorted-heatmap.svg
      • plots/sorted-traffic-light-plot-by-domain.svg
      • plots/sorted-traffic-light-plot.svg
      • plots/themed-heatmap.svg
      • plots/themed-traffic-light-plot.svg
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘intro-to-metaconfoundr.Rmd’ using rmarkdown
    Quitting from lines 39-42 (intro-to-metaconfoundr.Rmd) 
    Error: processing vignette 'intro-to-metaconfoundr.Rmd' failed with diagnostics:
    Can't rename variables in this context.
    --- failed re-building ‘intro-to-metaconfoundr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘intro-to-metaconfoundr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# panelr

<details>

* Version: 0.7.6
* GitHub: https://github.com/jacob-long/panelr
* Source code: https://github.com/cran/panelr
* Date/Publication: 2021-12-17 07:40:02 UTC
* Number of recursive dependencies: 169

Run `cloud_details(, "panelr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5.     └─panelr:::detrend(e$data, pf, dt_order, balance_correction, dt_random)
        6.       ├─tidyr::nest(data)
        7.       └─tidyr:::nest.grouped_df(data)
        8.         └─tidyr:::nest.tbl_df(.data, `:=`(!!.key, all_of(cols)), .names_sep = .names_sep)
        9.           └─vctrs::vec_cbind(out, inner, .name_repair = "check_unique", .error_call = error_call)
       10.             └─vctrs (local) `<fn>`()
       11.               └─vctrs:::validate_unique(names = names, arg = arg, call = call)
       12.                 └─vctrs:::stop_names_must_be_unique(names, arg, call = call)
       13.                   └─vctrs:::stop_names(...)
       14.                     └─vctrs:::stop_vctrs(...)
       15.                       └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
      
      [ FAIL 2 | WARN 1 | SKIP 0 | PASS 240 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# tidypaleo

<details>

* Version: 0.1.2
* GitHub: https://github.com/paleolimbot/tidypaleo
* Source code: https://github.com/cran/tidypaleo
* Date/Publication: 2022-02-24 11:50:02 UTC
* Number of recursive dependencies: 86

Run `cloud_details(, "tidypaleo")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidypaleo-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: layer_dendrogram
    > ### Title: Add a dendrogram as a layer or facet
    > ### Aliases: layer_dendrogram plot_layer_dendrogram layer_zone_boundaries
    > 
    > ### ** Examples
    > 
    > library(ggplot2)
    ...
     11.           └─tidyselect::eval_select(...)
     12.             └─tidyselect:::eval_select_impl(...)
     13.               ├─tidyselect:::with_subscript_errors(...)
     14.               │ └─rlang::try_fetch(...)
     15.               │   └─base::withCallingHandlers(...)
     16.               └─tidyselect:::vars_select_eval(...)
     17.                 └─tidyselect:::ensure_named(...)
     18.                   └─cli::cli_abort(...)
     19.                     └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5.       └─base::lapply(...)
        6.         └─tidyr (local) FUN(X[[i]], ...)
        7.           └─tidyselect::eval_select(...)
        8.             └─tidyselect:::eval_select_impl(...)
        9.               ├─tidyselect:::with_subscript_errors(...)
       10.               │ └─rlang::try_fetch(...)
       11.               │   └─base::withCallingHandlers(...)
       12.               └─tidyselect:::vars_select_eval(...)
       13.                 └─tidyselect:::ensure_named(...)
       14.                   └─cli::cli_abort(...)
       15.                     └─rlang::abort(...)
      
      [ FAIL 18 | WARN 1 | SKIP 12 | PASS 134 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘age_depth.Rmd’ using rmarkdown
    --- finished re-building ‘age_depth.Rmd’
    
    --- re-building ‘nested_analysis.Rmd’ using rmarkdown
    Quitting from lines 44-53 (nested_analysis.Rmd) 
    Error: processing vignette 'nested_analysis.Rmd' failed with diagnostics:
    Can't rename variables in this context.
    --- failed re-building ‘nested_analysis.Rmd’
    ...
    Quitting from lines 250-257 (strat_diagrams.Rmd) 
    Error: processing vignette 'strat_diagrams.Rmd' failed with diagnostics:
    Can't rename variables in this context.
    --- failed re-building ‘strat_diagrams.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘nested_analysis.Rmd’ ‘strat_diagrams.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# wpa

<details>

* Version: 1.8.0
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2022-07-05 15:40:02 UTC
* Number of recursive dependencies: 121

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
    > # Returns a plot by default
    > em_data %>% workpatterns_classify(method = "bw")
    Error in `:=`(Personas, "Unclassified") : 
      Check that is.data.table(DT) == TRUE. Otherwise, := and `:=`(...) are defined for use in j, once only and in particular ways. See help(":=").
    Calls: %>% ... workpatterns_classify_bw -> [ -> [.data.frame -> :=
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       4.     ├─base::`[.data.frame`(ptn_data_personas, , `:=`(Personas, "Unclassified"))
       5.     └─`:=`(Personas, "Unclassified")
      ── Error ('test-workpatterns_classify.R:25'): workpatterns plots returns ggplot object ──
      Error in ``:=`(Personas, "Unclassified")`: Check that is.data.table(DT) == TRUE. Otherwise, := and `:=`(...) are defined for use in j, once only and in particular ways. See help(":=").
      Backtrace:
          ▆
       1. └─wpa::workpatterns_classify(em_data, signals = "meetings", return = "plot") at test-workpatterns_classify.R:25:2
       2.   └─wpa:::workpatterns_classify_bw(...)
       3.     ├─ptn_data_personas[, `:=`(Personas, "Unclassified")]
       4.     ├─base::`[.data.frame`(ptn_data_personas, , `:=`(Personas, "Unclassified"))
       5.     └─`:=`(Personas, "Unclassified")
      
      [ FAIL 2 | WARN 195 | SKIP 0 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

