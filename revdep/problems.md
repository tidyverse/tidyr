# cubble

<details>

* Version: 0.2.0
* GitHub: https://github.com/huizezhang-sherry/cubble
* Source code: https://github.com/cran/cubble
* Date/Publication: 2022-11-17 12:30:02 UTC
* Number of recursive dependencies: 132

Run `cloud_details(, "cubble")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘aggregation.Rmd’ using rmarkdown
    --- finished re-building ‘aggregation.Rmd’
    
    --- re-building ‘cubble-design.Rmd’ using rmarkdown
    Quitting from lines 65-68 (cubble-design.Rmd) 
    Error: processing vignette 'cubble-design.Rmd' failed with diagnostics:
    Supplying `...` without names was deprecated in tidyr 1.0.0 and is now
    defunct.
    ℹ Please specify a name for each selection.
    ...
    
    --- re-building ‘matching.Rmd’ using rmarkdown
    Warning: ggrepel: 1 unlabeled data points (too many overlaps). Consider increasing max.overlaps
    --- finished re-building ‘matching.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘cubble-design.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

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

# highcharter

<details>

* Version: 0.9.4
* GitHub: https://github.com/jbkunst/highcharter
* Source code: https://github.com/cran/highcharter
* Date/Publication: 2022-01-03 16:40:05 UTC
* Number of recursive dependencies: 153

Run `cloud_details(, "highcharter")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘highcharter-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tooltip_chart
    > ### Title: Helper to create charts in tooltips.
    > ### Aliases: tooltip_chart
    > 
    > ### ** Examples
    > 
    > 
    ...
    Backtrace:
        ▆
     1. ├─... %>% rename(ttdata = data)
     2. ├─dplyr::rename(., ttdata = data)
     3. ├─dplyr::mutate(...)
     4. └─tidyr::nest(., -country)
     5.   └─lifecycle::deprecate_stop(...)
     6.     └─lifecycle:::deprecate_stop0(msg)
     7.       └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 11 marked UTF-8 strings
    ```

# HTSSIP

<details>

* Version: 1.4.1
* GitHub: NA
* Source code: https://github.com/cran/HTSSIP
* Date/Publication: 2019-09-13 22:30:02 UTC
* Number of recursive dependencies: 139

Run `cloud_details(, "HTSSIP")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. ├─tidyr::spread(., "IS_CONTROL", "center_of_mass")
        6. ├─dplyr::mutate_(., IS_CONTROL = "ifelse(IS_CONTROL==TRUE, 'CM_control', 'CM_treatment')")
        7. ├─dplyr::group_by_(., "OTU")
        8. ├─dplyr::summarize_(., center_of_mass = "stats::weighted.mean(x=Buoyant_density,\n                                                             w=Count_interp)")
        9. ├─dplyr::group_by_(., "IS_CONTROL", "OTU")
       10. ├─tidyr::unnest(.)
       11. ├─dplyr::mutate_(., .dots = dots)
       12. └─tidyr::nest(., nest_cols)
       13.   └─lifecycle::deprecate_stop(...)
       14.     └─lifecycle:::deprecate_stop0(msg)
       15.       └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 8 | SKIP 18 | PASS 111 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘BD_shifts.Rmd’ using rmarkdown
    --- finished re-building ‘BD_shifts.Rmd’
    
    --- re-building ‘HTSSIP_intro.Rmd’ using rmarkdown
    --- finished re-building ‘HTSSIP_intro.Rmd’
    
    --- re-building ‘HTSSIP_sim.Rmd’ using rmarkdown
    --- finished re-building ‘HTSSIP_sim.Rmd’
    
    ...
    defunct.
    ℹ Please specify a name for each selection.
    ℹ Did you want `data = nest_cols`?
    --- failed re-building ‘quant_incorp.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘quant_incorp.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘igraph’
      All declared Imports should be used.
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

# openalexR

<details>

* Version: 1.0.0
* GitHub: https://github.com/massimoaria/openalexR
* Source code: https://github.com/cran/openalexR
* Date/Publication: 2022-10-06 10:40:02 UTC
* Number of recursive dependencies: 78

Run `cloud_details(, "openalexR")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘A_Brief_Introduction_to_openalexR.Rmd’ using rmarkdown
    Quitting from lines 260-269 (A_Brief_Introduction_to_openalexR.Rmd) 
    Error: processing vignette 'A_Brief_Introduction_to_openalexR.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    --- failed re-building ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘A_Brief_Introduction_to_openalexR.Rmd’
    
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

# T2Qv

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/T2Qv
* Date/Publication: 2022-05-18 17:00:04 UTC
* Number of recursive dependencies: 91

Run `cloud_details(, "T2Qv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘T2Qv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ChiSq_variable
    > ### Title: Chi squared variable from point table.
    > ### Aliases: ChiSq_variable
    > 
    > ### ** Examples
    > 
    > data(Datak10Contaminated)
    ...
        ▆
     1. ├─T2Qv::ChiSq_variable(...)
     2. │ └─... %>% rename(ttdata = data)
     3. ├─dplyr::rename(., ttdata = data)
     4. ├─dplyr::mutate(...)
     5. └─tidyr::nest(., -Nombres)
     6.   └─lifecycle::deprecate_stop(...)
     7.     └─lifecycle:::deprecate_stop0(msg)
     8.       └─rlang::cnd_signal(...)
    Execution halted
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

# unpivotr

<details>

* Version: 0.6.2
* GitHub: https://github.com/nacnudus/unpivotr
* Source code: https://github.com/cran/unpivotr
* Date/Publication: 2021-08-22 04:10:02 UTC
* Number of recursive dependencies: 88

Run `cloud_details(, "unpivotr")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘html.Rmd’ using rmarkdown
    --- finished re-building ‘html.Rmd’
    
    --- re-building ‘introduction.Rmd’ using rmarkdown
    --- finished re-building ‘introduction.Rmd’
    
    --- re-building ‘small-multiples.Rmd’ using rmarkdown
    Quitting from lines 128-144 (small-multiples.Rmd) 
    ...
    defunct.
    ℹ Please specify a name for each selection.
    ℹ Did you want `data = -row`?
    --- failed re-building ‘small-multiples.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘small-multiples.Rmd’
    
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

