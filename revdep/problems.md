# cmcR

<details>

* Version: 0.1.9
* GitHub: NA
* Source code: https://github.com/cran/cmcR
* Date/Publication: 2022-02-22 14:00:02 UTC
* Number of recursive dependencies: 117

Run `cloud_details(, "cmcR")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ℹ Please use `"highCMCClassif"` instead of `.data$highCMCClassif`
      
      ══ Failed ══════════════════════════════════════════════════════════════════════
      ── 1. Error ('test-diagnosticTools.R:55'): (code run outside of `test_that()`) ─
      Error in `stringr::str_extract_all(., string = ..2$cmcR.info$cellRange, 
          pattern = "[0-9]{1,}")`: `simplify` must be `TRUE` or `FALSE`, not the string "rows: 1 - 69, cols: 1 - 69".
      Backtrace:
       1. cmcR::cmcPlot(...)
            at test-diagnosticTools.R:55:0
       8. stringr::str_extract_all(simplify = .)
      
      ══ DONE ════════════════════════════════════════════════════════════════════════
      Don't worry, you'll get it.
      Error: Test failures
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
    
    ************
    Welcome to faux. For support and examples visit:
    https://debruine.github.io/faux/
    - Get and set global package options with: faux_options()
    ************
    --- finished re-building ‘codebook.Rmd’
    
    ...
    https://debruine.github.io/faux/
    - Get and set global package options with: faux_options()
    ************
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

# mpwR

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/mpwR
* Date/Publication: 2022-06-22 07:30:02 UTC
* Number of recursive dependencies: 96

Run `cloud_details(, "mpwR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mpwR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_Upset_list
    > ### Title: Generate Upset list
    > ### Aliases: get_Upset_list
    > 
    > ### ** Examples
    > 
    > # Load libraries
    ...
    ! `pattern` can't be the empty string (`""`).
    Backtrace:
        ▆
     1. └─mpwR::get_Upset_list(input_list = data, level = "Precursor.IDs")
     2.   ├─base::which(...)
     3.   └─stringr::str_detect(string = names(output_list), pattern = "")
     4.     └─stringr:::no_empty()
     5.       └─cli::cli_abort(...)
     6.         └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_Upset.R:72'): get_Upset_list works ─────────────────────────────
      Error in `stringr::str_detect(string = names(output_list), pattern = "")`: `pattern` can't be the empty string (`""`).
      Backtrace:
          ▆
       1. └─mpwR::get_Upset_list(input_list = data, level = "Precursor.IDs") at test_Upset.R:72:3
       2.   ├─base::which(...)
       3.   └─stringr::str_detect(string = names(output_list), pattern = "")
       4.     └─stringr:::no_empty()
       5.       └─cli::cli_abort(...)
       6.         └─rlang::abort(...)
      
      [ FAIL 1 | WARN 553 | SKIP 0 | PASS 598 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Import.Rmd’ using rmarkdown
    --- finished re-building ‘Import.Rmd’
    
    --- re-building ‘Requirements.Rmd’ using rmarkdown
    --- finished re-building ‘Requirements.Rmd’
    
    --- re-building ‘Workflow.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    ...
    Quitting from lines 225-226 (Workflow.Rmd) 
    Error: processing vignette 'Workflow.Rmd' failed with diagnostics:
    `pattern` can't be the empty string (`""`).
    --- failed re-building ‘Workflow.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Workflow.Rmd’
    
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
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Quitting from lines 207-213 (A_Brief_Introduction_to_openalexR.Rmd) 
    Error: processing vignette 'A_Brief_Introduction_to_openalexR.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    --- failed re-building ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘A_Brief_Introduction_to_openalexR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# recipes

<details>

* Version: 1.0.3
* GitHub: https://github.com/tidymodels/recipes
* Source code: https://github.com/cran/recipes
* Date/Publication: 2022-11-09 16:50:02 UTC
* Number of recursive dependencies: 134

Run `cloud_details(, "recipes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘recipes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: step_naomit
    > ### Title: Remove observations with missing values
    > ### Aliases: step_naomit
    > 
    > ### ** Examples
    > 
    > 
    ...
     10.       └─tidyselect::eval_select(expr(c(!!!dots)), data, allow_rename = FALSE)
     11.         └─tidyselect:::eval_select_impl(...)
     12.           ├─tidyselect:::with_subscript_errors(...)
     13.           │ └─rlang::try_fetch(...)
     14.           │   └─base::withCallingHandlers(...)
     15.           └─tidyselect:::vars_select_eval(...)
     16.             └─tidyselect:::ensure_named(...)
     17.               └─cli::cli_abort(...)
     18.                 └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9.     ├─tidyr::drop_na(new_data, object$columns)
       10.     └─tidyr:::drop_na.data.frame(new_data, object$columns)
       11.       └─tidyselect::eval_select(expr(c(!!!dots)), data, allow_rename = FALSE)
       12.         └─tidyselect:::eval_select_impl(...)
       13.           ├─tidyselect:::with_subscript_errors(...)
       14.           │ └─rlang::try_fetch(...)
       15.           │   └─base::withCallingHandlers(...)
       16.           └─tidyselect:::vars_select_eval(...)
       17.             └─tidyselect:::ensure_named(...)
       18.               └─cli::cli_abort(...)
       19.                 └─rlang::abort(...)
      
      [ FAIL 2 | WARN 2 | SKIP 401 | PASS 1889 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fastICA’, ‘dimRed’
    ```

# tidyfst

<details>

* Version: 1.7.5
* GitHub: https://github.com/hope-data-science/tidyfst
* Source code: https://github.com/cran/tidyfst
* Date/Publication: 2022-10-27 07:00:02 UTC
* Number of recursive dependencies: 80

Run `cloud_details(, "tidyfst")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidyfst-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: unite_dt
    > ### Title: Unite multiple columns into one by pasting strings together
    > ### Aliases: unite_dt
    > 
    > ### ** Examples
    > 
    > df <- expand.grid(x = c("a", NA), y = c("b", NA))
    ...
      2. ├─tidyfst::unite_dt(., "merged_name", "")
      3. │ └─dt %>% select_dt(...)
      4. ├─tidyfst::select_dt(., ...)
      5. │ └─... %>% str_c(collapse = ",")
      6. ├─stringr::str_c(., collapse = ",")
      7. └─stringr::str_subset(names(dt), ., negate = negate)
      8.   └─stringr:::no_empty()
      9.     └─cli::cli_abort(...)
     10.       └─rlang::abort(...)
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘fastDummies’, ‘widyr’, ‘pacman’, ‘sjmisc’
    ```

