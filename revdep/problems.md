# broom

<details>

* Version: 0.8.0
* GitHub: https://github.com/tidymodels/broom
* Source code: https://github.com/cran/broom
* Date/Publication: 2022-04-13 15:02:34 UTC
* Number of recursive dependencies: 294

Run `cloud_details(, "broom")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘broom-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: glance.lmodel2
    > ### Title: Glance at a(n) lmodel2 object
    > ### Aliases: glance.lmodel2
    > 
    > ### ** Examples
    > 
    > 
    ...
      4. ├─dplyr::select(., method = Method, term, conf.low, conf.high)
      5. ├─base::as.data.frame(.)
      6. ├─dplyr::arrange(., Method)
      7. └─tidyr::pivot_wider(., c(Method, term), names_from = level, values_from = value)
      8.   └─rlang `<fn>`()
      9.     └─rlang:::check_dots(env, error, action, call)
     10.       └─rlang:::action_dots(...)
     11.         ├─base try_dots(...)
     12.         └─rlang action(...)
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# dartR

<details>

* Version: 2.0.3
* GitHub: NA
* Source code: https://github.com/cran/dartR
* Date/Publication: 2022-03-28 14:50:02 UTC
* Number of recursive dependencies: 274

Run `cloud_details(, "dartR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dartR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gl.report.pa
    > ### Title: Reports private alleles (and fixed alleles) per pair of
    > ###   populations
    > ### Aliases: gl.report.pa
    > 
    > ### ** Examples
    > 
    ...
      6. │       ├─base::withCallingHandlers(...)
      7. │       └─vctrs::vec_recycle(value[[j]], nrow)
      8. ├─vctrs:::stop_recycle_incompatible_size(...)
      9. │ └─vctrs:::stop_vctrs(...)
     10. │   └─rlang::abort(message, class = c(class, "vctrs_error"), ..., call = vctrs_error_call(call))
     11. │     └─rlang:::signal_abort(cnd, .file)
     12. │       └─base::signalCondition(cnd)
     13. └─tibble `<fn>`(`<vctrs___>`)
     14.   └─rlang::cnd_signal(...)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘IntroTutorial_dartR.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(). If it fails to upgrade, you might be using a default random CTAN mirror that has not been fully synced to the main CTAN repository, and you need to wait for a few more days or use a CTAN mirror that is known to be up-to-date (see the "repository" argument on the help page ?tinytex::install_tinytex).
    
    tlmgr: Local TeX Live (2021) is older than remote repository (2022).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/tcolorbox.sty'' had status 1
    ...
    --- failed re-building ‘IntroTutorial_dartR.Rmd’
    
    --- re-building ‘dartRTutorials.Rmd’ using rmarkdown
    --- finished re-building ‘dartRTutorials.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘IntroTutorial_dartR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        data   1.5Mb
    ```

# egor

<details>

* Version: 1.22.1
* GitHub: https://github.com/tilltnet/egor
* Source code: https://github.com/cran/egor
* Date/Publication: 2022-01-14 20:52:41 UTC
* Number of recursive dependencies: 89

Run `cloud_details(, "egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: count_dyads
    > ### Title: Count attribute combinations of dyads in ego-centered networks
    > ### Aliases: count_dyads
    > 
    > ### ** Examples
    > 
    > data(egor32)
    ...
    Backtrace:
        ▆
     1. └─egor::count_dyads(object = egor32, alter_var_name = "country")
     2.   └─tidyr::pivot_wider(...)
     3.     └─rlang `<fn>`()
     4.       └─rlang:::check_dots(env, error, action, call)
     5.         └─rlang:::action_dots(...)
     6.           ├─base try_dots(...)
     7.           └─rlang action(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ✖ Problematic argument:
      • ..1 = .egoID
      Backtrace:
          ▆
       1. └─egor::count_dyads(object = x, "sex") at test-count_dyads.R:42:2
       2.   └─tidyr::pivot_wider(...)
       3.     └─rlang `<fn>`()
       4.       └─rlang:::check_dots(env, error, action, call)
       5.         └─rlang:::action_dots(...)
       6.           ├─base try_dots(...)
       7.           └─rlang action(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 228 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘egor_allbus.Rmd’ using rmarkdown
    Loading required package: dplyr
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Arguments in `...` must be used.
    ✖ Problematic argument:
    • ..1 = .egoID
    --- failed re-building ‘using_egor.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘using_egor.Rmd’
    
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

# ftExtra

<details>

* Version: 0.3.0
* GitHub: https://github.com/atusy/ftExtra
* Source code: https://github.com/cran/ftExtra
* Date/Publication: 2022-01-04 17:00:02 UTC
* Number of recursive dependencies: 66

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
      4. │   └─... %>% fill_header(.fill)
      5. ├─ftExtra:::fill_header(., .fill)
      6. │ └─... %>% ...
      7. └─tidyr::pivot_wider(...)
      8.   └─rlang `<fn>`()
      9.     └─rlang:::check_dots(env, error, action, call)
     10.       └─rlang:::action_dots(...)
     11.         ├─base try_dots(...)
     12.         └─rlang action(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. ├─ftExtra::span_header(.)
        6. │ └─ftExtra:::transform_header(...)
        7. │   └─... %>% fill_header(.fill)
        8. ├─ftExtra:::fill_header(., .fill)
        9. │ └─... %>% ...
       10. └─tidyr::pivot_wider(...)
       11.   └─rlang `<fn>`()
       12.     └─rlang:::check_dots(env, error, action, call)
       13.       └─rlang:::action_dots(...)
       14.         ├─base try_dots(...)
       15.         └─rlang action(...)
      
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
    ...
    Arguments in `...` must be used.
    ✖ Problematic argument:
    • ..1 = "original"
    --- failed re-building ‘transform-headers.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘transform-headers.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# hacksig

<details>

* Version: 0.1.2
* GitHub: https://github.com/Acare/hacksig
* Source code: https://github.com/cran/hacksig
* Date/Publication: 2022-02-17 14:22:02 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "hacksig")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘hacksig-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hack_immunophenoscore
    > ### Title: Hack the Immunophenoscore
    > ### Aliases: hack_immunophenoscore
    > 
    > ### ** Examples
    > 
    > hack_immunophenoscore(test_expr)
    ...
        ▆
     1. └─hacksig::hack_immunophenoscore(test_expr)
     2.   ├─dplyr::ungroup(...)
     3.   └─tidyr::pivot_wider(...)
     4.     └─rlang `<fn>`()
     5.       └─rlang:::check_dots(env, error, action, call)
     6.         └─rlang:::action_dots(...)
     7.           ├─base try_dots(...)
     8.           └─rlang action(...)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘hacksig.Rmd’ using rmarkdown
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    ...
    Arguments in `...` must be used.
    ✖ Problematic argument:
    • ..1 = c("sample_id", "raw", "ips")
    --- failed re-building ‘hacksig.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘hacksig.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# psfmi

<details>

* Version: 1.0.0
* GitHub: https://github.com/mwheymans/psfmi
* Source code: https://github.com/cran/psfmi
* Date/Publication: 2021-09-23 10:10:05 UTC
* Number of recursive dependencies: 152

Run `cloud_details(, "psfmi")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘MI_boot.Rmd’ using rmarkdown
    --- finished re-building ‘MI_boot.Rmd’
    
    --- re-building ‘MI_cv_naive.Rmd’ using rmarkdown
    --- finished re-building ‘MI_cv_naive.Rmd’
    
    --- re-building ‘Pool_Model_Performance.Rmd’ using rmarkdown
    --- finished re-building ‘Pool_Model_Performance.Rmd’
    
    ...
    --- failed re-building ‘psfmi_StabilityAnalysis.Rmd’
    
    --- re-building ‘psfmi_mice.Rmd’ using rmarkdown
    --- finished re-building ‘psfmi_mice.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘psfmi_StabilityAnalysis.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘miceadds’
      All declared Imports should be used.
    ```

# rmdcev

<details>

* Version: 1.2.4
* GitHub: https://github.com/plloydsmith/rmdcev
* Source code: https://github.com/cran/rmdcev
* Date/Publication: 2020-09-30 18:40:02 UTC
* Number of recursive dependencies: 84

Run `cloud_details(, "rmdcev")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   ├─base::t(GrabParms(est_sim, "scale"))
        4. │   └─rmdcev:::GrabParms(est_sim, "scale")
        5. │     └─... %>% as.matrix(.)
        6. ├─base::as.matrix(.)
        7. ├─dplyr::select(., -sim_id)
        8. └─tidyr::pivot_wider(., sim_id, names_from = "parms", values_from = "value")
        9.   └─rlang `<fn>`()
       10.     └─rlang:::check_dots(env, error, action, call)
       11.       └─rlang:::action_dots(...)
       12.         ├─base try_dots(...)
       13.         └─rlang action(...)
      
      [ FAIL 15 | WARN 0 | SKIP 1 | PASS 54 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 114.5Mb
      sub-directories of 1Mb or more:
        libs  113.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppParallel’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# simITS

<details>

* Version: 0.1.1
* GitHub: NA
* Source code: https://github.com/cran/simITS
* Date/Publication: 2020-05-20 13:50:02 UTC
* Number of recursive dependencies: 78

Run `cloud_details(, "simITS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘simITS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adjust_data
    > ### Title: Adjust an outcome time series based on the group weights.
    > ### Aliases: adjust_data
    > 
    > ### ** Examples
    > 
    > data( "meck_subgroup" )
    ...
        ▆
     1. ├─simITS::aggregate_data(...)
     2. │ └─... %>% ...
     3. └─tidyr::pivot_wider(...)
     4.   └─rlang `<fn>`()
     5.     └─rlang:::check_dots(env, error, action, call)
     6.       └─rlang:::action_dots(...)
     7.         ├─base try_dots(...)
     8.         └─rlang action(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • ..1 = month
      Backtrace:
          ▆
       1. ├─simITS::aggregate_data(meck, "pbail", "category", Nname = "N") at test-post_stratified_ITS.R:45:2
       2. │ └─... %>% ...
       3. └─tidyr::pivot_wider(...)
       4.   └─rlang `<fn>`()
       5.     └─rlang:::check_dots(env, error, action, call)
       6.       └─rlang:::action_dots(...)
       7.         ├─base try_dots(...)
       8.         └─rlang action(...)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 78 ]
      Error: Test failures
      Execution halted
    ```

# surveil

<details>

* Version: 0.2.0
* GitHub: https://github.com/ConnorDonegan/surveil
* Source code: https://github.com/cran/surveil
* Date/Publication: 2022-04-03 18:40:02 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "surveil")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─surveil::stan_rw(...) at test_rw.R:141:4
       2. │ └─... %>% dplyr::select(-c(.data$id))
       3. ├─dplyr::select(., -c(.data$id))
       4. └─tidyr::pivot_wider(...)
       5.   └─rlang `<fn>`()
       6.     └─rlang:::check_dots(env, error, action, call)
       7.       └─rlang:::action_dots(...)
       8.         ├─base try_dots(...)
       9.         └─rlang action(...)
      
      [ FAIL 8 | WARN 11 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘age-standardization.Rmd’ using rmarkdown
    Quitting from lines 115-122 (age-standardization.Rmd) 
    Error: processing vignette 'age-standardization.Rmd' failed with diagnostics:
    Arguments in `...` must be used.
    ✖ Problematic argument:
    • ..1 = id
    --- failed re-building ‘age-standardization.Rmd’
    
    --- re-building ‘demonstration.Rmd’ using rmarkdown
    ...
    Arguments in `...` must be used.
    ✖ Problematic argument:
    • ..1 = id
    --- failed re-building ‘demonstration.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘age-standardization.Rmd’ ‘demonstration.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 75.9Mb
      sub-directories of 1Mb or more:
        libs  74.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RcppParallel’ ‘rstantools’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# tsibble

<details>

* Version: 1.1.1
* GitHub: https://github.com/tidyverts/tsibble
* Source code: https://github.com/cran/tsibble
* Date/Publication: 2021-12-03 21:30:02 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "tsibble")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3. │   └─testthat:::quasi_capture(...)
        4. │     ├─testthat .capture(...)
        5. │     │ └─base::withCallingHandlers(...)
        6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        7. ├─tsbl %>% pivot_wider(qtr, names_from = qtr, values_from = value)
        8. ├─tidyr::pivot_wider(., qtr, names_from = qtr, values_from = value)
        9. └─rlang `<fn>`()
       10.   └─rlang:::check_dots(env, error, action, call)
       11.     └─rlang:::action_dots(...)
       12.       ├─base try_dots(...)
       13.       └─rlang action(...)
      
      [ FAIL 1 | WARN 1 | SKIP 5 | PASS 743 ]
      Error: Test failures
      Execution halted
    ```

