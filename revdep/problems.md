# faux

<details>

* Version: 1.1.0
* GitHub: https://github.com/debruine/faux
* Source code: https://github.com/cran/faux
* Date/Publication: 2021-09-13 21:40:02 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "faux")` for more info

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

Run `revdepcheck::cloud_details(, "ggpubr")` for more info

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

# gprofiler2

<details>

* Version: 0.2.1
* GitHub: NA
* Source code: https://github.com/cran/gprofiler2
* Date/Publication: 2021-08-23 14:00:02 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "gprofiler2")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘gprofiler2.Rmd’ using rmarkdown
    Quitting from lines 162-169 (gprofiler2.Rmd) 
    Error: processing vignette 'gprofiler2.Rmd' failed with diagnostics:
    Bad request, response code 502
    --- failed re-building ‘gprofiler2.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘gprofiler2.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
    ```

# wpa

<details>

* Version: 1.8.0
* GitHub: https://github.com/microsoft/wpa
* Source code: https://github.com/cran/wpa
* Date/Publication: 2022-07-05 15:40:02 UTC
* Number of recursive dependencies: 121

Run `revdepcheck::cloud_details(, "wpa")` for more info

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

