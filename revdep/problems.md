# baguette

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/baguette
* URL: https://github.com/tidymodels/baguette
* BugReports: https://github.com/tidymodels/baguette/issues
* Date/Publication: 2020-04-14 14:20:04 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"baguette")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       26. vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ── 2. Error: check C5 parsnip interface (@test-C5.R#136)  ──────────────────────
      object 'class_cost_prob' not found
      Backtrace:
       1. testthat::expect_true(tibble::is_tibble(class_cost_prob))
       4. tibble::is_tibble(class_cost_prob)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 141 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 2 ]
      1. Failure: check C5 parsnip interface (@test-C5.R#132) 
      2. Error: check C5 parsnip interface (@test-C5.R#136) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# coalitions

<details>

* Version: 0.6.12
* Source code: https://github.com/cran/coalitions
* URL: http://adibender.github.io/coalitions/
* BugReports: https://github.com/adibender/coalitions/issues
* Date/Publication: 2020-02-06 10:10:06 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"coalitions")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ Existing data has 7 rows.
    ✖ Assigned data has 0 rows.
    ℹ Only vectors of size 1 are recycled.
    Backtrace:
         █
      1. ├─get_latest(surveys_sample) %>% tidyr::unnest("survey")
      2. │ └─base::eval(lhs, parent, parent)
      3. │   └─base::eval(lhs, parent, parent)
      4. └─coalitions::get_latest(surveys_sample)
      5.   └─`%>%`(...)
      6.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      7.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      8.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      9.         └─coalitions:::`_fseq`(`_lhs`)
     10.           └─magrittr::freduce(value, `_function_list`)
     11.             └─function_list[[i]](value)
     12.               ├─tidyr::unnest(., "surveys")
     13.               └─tidyr:::unnest.data.frame(., "surveys")
     14.                 ├─base::`[[<-`(`*tmp*`, col, value = list())
     
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       16. base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
       17. value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 34 | SKIPPED: 0 | WARNINGS: 12 | FAILED: 7 ]
      1. Error: Prettify function works correctly (@test-basic-functions.R#57) 
      2. Error: Pooling works as expected (@test-pooling.R#4) 
      3. Error: GMS tables correct (@test-scrapers.R#90) 
      4. Error: Austria scrapper works 
      5. Error: Obtaining meta information works (@test-survey-helpers.R#4) 
      6. Error: Obtaining latest survey works (@test-survey-helpers.R#11) 
      7. Error: workflow stable (@test-workflow.R#14) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# epikit

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/epikit
* URL: https://github.com/R4EPI/epikit, https://r4epis.netlify.com, https://r4epi.github.io/epikit
* BugReports: https://github.com/R4EPI/epikit/issues
* Date/Publication: 2020-04-13 06:50:02 UTC
* Number of recursive dependencies: 69

Run `revdep_details(,"epikit")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    ✖ Assigned data has 0 rows.
    ℹ Only vectors of size 1 are recycled.
    Backtrace:
         █
      1. ├─base::withAutoprint(...)
      2. │ └─base::source(...)
      3. │   ├─base::withVisible(eval(ei, envir))
      4. │   └─base::eval(ei, envir)
      5. │     └─base::eval(ei, envir)
      6. └─epikit::case_fatality_rate_df(...)
      7.   ├─tidyr::unnest(res, cols = "cfr")
      8.   └─tidyr:::unnest.data.frame(res, cols = "cfr")
      9.     ├─base::`[[<-`(`*tmp*`, col, value = list())
     10.     └─tibble:::`[[<-.tbl_df`(`*tmp*`, col, value = list())
     11.       └─tibble:::tbl_subassign(...)
     12.         └─tibble:::vectbl_recycle_rhs(...)
     13.           └─base::tryCatch(...)
     14.             └─base:::tryCatchList(expr, classes, parentenv, handlers)
     15.               └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
     16
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        9. base:::tryCatchList(expr, classes, parentenv, handlers)
       10. base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
       11. value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 99 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: case_fatality_rate_df is equivalent to the non-df version (@test-proportion.R#71) 
      2. Error: case_fatality_rate_df will do stratified analysis (@test-proportion.R#84) 
      3. Error: case_fatality_rate_df will do stratified analysis with missing (@test-proportion.R#98) 
      4. Error: case_fatality_rate_df will do stratified analysis with missing cases (@test-proportion.R#118) 
      5. Error: case_fatality_rate_df will add a total row to stratified analysis (@test-proportion.R#140) 
      6. Error: case_fatality_rate_df will add a total row to stratified analysis and merge CI (@test-proportion.R#160) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# epubr

<details>

* Version: 0.6.1
* Source code: https://github.com/cran/epubr
* URL: https://docs.ropensci.org/epubr (website) https://github.com/ropensci/epubr
* BugReports: https://github.com/ropensci/epubr/issues
* Date/Publication: 2019-11-28 11:40:02 UTC
* Number of recursive dependencies: 63

Run `revdep_details(,"epubr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ✖ The columns ``, ``, ``, and `` don't exist.
      Backtrace:
        1. epubr::epub(file)
       23. vctrs:::stop_subscript_oob(...)
       24. vctrs:::stop_subscript(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: epub and epub_meta read as expected (@test-epub.R#25) 
      2. Error: epub_head returns as expected (@test-epub.R#79) 
      3. Error: epub_cat returns as expected (@test-epub.R#87) 
      4. Error: (unknown) (@test-restructure.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ftExtra

<details>

* Version: 0.0.1
* Source code: https://github.com/cran/ftExtra
* URL: https://github.com/atusy/ftExtra
* BugReports: https://github.com/atusy/ftExtra/issues
* Date/Publication: 2020-03-20 09:50:02 UTC
* Number of recursive dependencies: 58

Run `revdep_details(,"ftExtra")` for more info

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
    > iris %>% as_flextable %>% span_header
    Warning: Values are not uniquely identified; output will contain list-cols.
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       13. ftExtra:::fill_header(., .fill)
        8. tidyr::pivot_longer(...)
        8. tidyr::fill(., "val")
       16. tidyr::pivot_wider(...)
       32. tidyr::pivot_wider_spec(...)
       33. tidyr:::vals_dedup(key = val_id, val = val, value = value, summarize = values_fn[[value]])
       34. vctrs::vec_split(val, key)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 35 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 2 ]
      1. Error: fill_header (@test-header-transform.R#13) 
      2. Error: span-header (@test-header-transform.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gtsummary

<details>

* Version: 1.3.0
* Source code: https://github.com/cran/gtsummary
* URL: https://github.com/ddsjoberg/gtsummary, http://www.danieldsjoberg.com/gtsummary/
* BugReports: https://github.com/ddsjoberg/gtsummary/issues
* Date/Publication: 2020-04-17 08:00:02 UTC
* Number of recursive dependencies: 150

Run `revdep_details(,"gtsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   add_n()
    Error: `x` must be a vector, not NULL.
    Backtrace:
         █
      1. ├─`%>%`(...)
      2. │ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      3. │ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─`_fseq`(`_lhs`)
      6. │       └─magrittr::freduce(value, `_function_list`)
      7. │         └─function_list[[i]](value)
      8. │           └─gtsummary::tbl_summary(., by = trt)
      9. │             └─`%>%`(...)
     10. │               ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
     11. │               └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     12. │                 └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
     13. │                   └─gtsummary:::`_fseq`(`_lhs`)
     14. │                     └─magrittr::freduce(value, `_function_list`)
     15. │                       └─function_list[[i]](value)
     16. │                         ├
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5.         ├─testthat::with_reporter(...)
        6.         │ ├─base::withRestarts(...)
        7.         │ │ └─base:::withOneRestart(expr, restarts[[1L]])
        8.         │ │   └─base:::doWithOneRestart(return(expr), restart)
        9.         │ └─base::force(code)
       10.         └─base::lapply(...)
       11.           └─testthat:::FUN(X[[i]], ...)
       12.             ├─testthat::with_reporter(...)
       13.             │ ├─base::withRestarts(...)
       14.             │ │ └─base:::withOneRestart(expr, restarts[[1L]])
       15.             │ │   └─base:::doWithOneRestart(return(expr), restart)
       16.             │ └─base::force(code)
       17.             └─testthat::source_file(...)
       18.               └─testthat:
      Execution halted
    ```

# ItemResponseTrees

<details>

* Version: 0.2.4
* Source code: https://github.com/cran/ItemResponseTrees
* URL: https://github.com/hplieninger/ItemResponseTrees
* BugReports: https://github.com/hplieninger/ItemResponseTrees/issues
* Date/Publication: 2020-04-24 15:20:02 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"ItemResponseTrees")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + Class:
    + Tree
    + "
    > 
    > model1 <- irtree_model(m1)
    Error: `x` must be a vector, not NULL.
    Backtrace:
         █
      1. ├─ItemResponseTrees::irtree_model(m1)
      2. │ ├─base::tryCatch(...)
      3. │ │ └─base:::tryCatchList(expr, classes, parentenv, handlers)
      4. │ │   └─base:::tryCatchOne(expr, names, parentenv, handlers[[1L]])
      5. │ │     └─base:::doTryCatch(return(expr), name, parentenv, handler)
      6. │ └─ItemResponseTrees::irtree_gen_data(...)
      7. │   └─ItemResponseTrees:::irtree_gen_tree(...)
      8. │     └─tidyr::pivot_wider(...)
      9. │       └─tidyr::pivot_wider_spec(...)
     10. │         └─vctrs::vec_init(val, nrow * ncol)
     11. └─vctrs:::stop_scalar_type(.Primitive("quote")(NULL), "x")
     12.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. ItemResponseTrees::irtree_model(models)
       11. vctrs:::stop_scalar_type(.Primitive("quote")(NULL), "x")
       12. vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 30 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: (unknown) (@test-fit-mirt.R#64) 
      2. Error: (unknown) (@test-fit-mplus.R#58) 
      3. Error: (unknown) (@test-fit-tam.R#57) 
      4. Error: (unknown) (@test-generate-data.R#28) 
      5. Error: (unknown) (@test-misspecified-models.R#242) 
      
      Error: testthat unit tests failed
      Execution halted
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
      > test_check("MPTmultiverse")
      Setting options for a quick test run.
      Do not interpret results!── 1. Error: No-pooling approaches work (@test-mptinr.R#23)  ───────────────────
      `x` must be a vector, not NULL.
      Backtrace:
        1. MPTmultiverse::fit_mpt(...)
       16. vctrs:::stop_scalar_type(.Primitive("quote")(NULL), "x")
       17. vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: No-pooling approaches work (@test-mptinr.R#23) 
      
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

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. panelr:::wb_prepare_data(...)
        5. panelr:::detrend(e$data, pf, dt_order, balance_correction, dt_random)
        7. tidyr:::nest.grouped_df(data)
        8. tidyr:::nest.tbl_df(.data, `:=`(!!.key, any_of(nest_vars)), .names_sep = .names_sep)
        9. purrr::map(...)
       10. tidyr:::.f(.x[[i]], ...)
       12. rlang::set_names(.data[.x], names(.x))
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 240 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: (unknown) (@test_wbgee.R#160) 
      2. Error: (unknown) (@test_wbm.R#236) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# SEERaBomb

<details>

* Version: 2019.2
* Source code: https://github.com/cran/SEERaBomb
* URL: http://epbi-radivot.cwru.edu/SEERaBomb/SEERaBomb.html
* Date/Publication: 2019-12-12 18:50:03 UTC
* Number of recursive dependencies: 146

Run `revdep_details(,"SEERaBomb")` for more info

</details>

## Newly broken

*   checking whether package ‘SEERaBomb’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: 'rgl.init' failed, running with 'rgl.useNULL = TRUE'.
    See ‘/tmp/workdir/SEERaBomb/new/SEERaBomb.Rcheck/00install.out’ for details.
    ```

# sigminer

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/sigminer
* URL: https://github.com/ShixiangWang/sigminer
* BugReports: https://github.com/ShixiangWang/sigminer/issues
* Date/Publication: 2020-04-30 22:30:03 UTC
* Number of recursive dependencies: 156

Run `revdep_details(,"sigminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Select Run 1, which K = 2 as best solution.
    Error: Assigned data `map(data[[col]], as_df, col = col)` must be compatible with existing data.
    ✖ Existing data has 1 row.
    ✖ Assigned data has 0 rows.
    ℹ Row updates require a list value. Do you need `list()` or `as.list()`?
    Backtrace:
         █
      1. └─sigminer::sig_auto_extract(...)
      2.   └─sigminer::get_bayesian_result(best_row)
      3.     └─sigminer:::helper_sort_signature(Signature.norm)
      4.       └─sigminer:::get_segsize_order(mat)
      5.         └─`%>%`(...)
      6.           ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      7.           └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      8.             └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      9.               └─sigminer:::`_fseq`(`_lhs`)
     10.                 └─magrittr::freduce(value, `_function_list`)
     11.                   └─function_list[[i]](value)
     12.                     ├─tidyr::unnest(., "data")
     13.                     └─tidyr:::unnest.data.frame(., "
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
    +                       outcomename="pbail", groupname="category", Nname="n.cases", 
    +                       is_count=FALSE,
    +                       rich = TRUE, covariates = NULL )
    Error: `x` must be a vector, not NULL.
    Backtrace:
         █
      1. ├─simITS::aggregate_data(...)
      2. │ └─`%>%`(...)
      3. │   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4. │   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5. │     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6. │       └─simITS:::`_fseq`(`_lhs`)
      7. │         └─magrittr::freduce(value, `_function_list`)
      8. │           ├─base::withVisible(function_list[[k]](value))
      9. │           └─function_list[[k]](value)
     10. │             └─tidyr::pivot_wider(...)
     11. │               └─tidyr::pivot_wider_spec(...)
     12. │                 └─vctrs::vec_init(val, nrow * ncol)
     13. └─vctrs:::stop_scalar_type(.Primitive("quote")(NULL), "x")
     14.   └─vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── 2. Error: aggregate_data (@test-post_stratified_ITS.R#45)  ──────────────────
      `x` must be a vector, not NULL.
      Backtrace:
        1. simITS::aggregate_data(meck, "pbail", "category", Nname = "N")
       13. vctrs:::stop_scalar_type(.Primitive("quote")(NULL), "x")
       14. vctrs:::stop_vctrs(msg, "vctrs_error_scalar_type", actual = x)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 78 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: vague tests of post_stratified_ITS (@test-post_stratified_ITS.R#14) 
      2. Error: aggregate_data (@test-post_stratified_ITS.R#45) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tbrf

<details>

* Version: 0.1.5
* Source code: https://github.com/cran/tbrf
* URL: https://mps9506.github.io/tbrf/
* BugReports: https://github.com/mps9506/tbrf/issues
* Date/Publication: 2020-04-09 04:40:02 UTC
* Number of recursive dependencies: 95

Run `revdep_details(,"tbrf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Error: Assigned data `map(data[[col]], as_df, col = col)` must be compatible with existing data.
    ✖ Existing data has 236 rows.
    ✖ Assigned data has 0 rows.
    ℹ Only vectors of size 1 are recycled.
    Backtrace:
         █
      1. └─tbrf::tbr_misc(...)
      2.   └─`%>%`(...)
      3.     ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
      4.     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      5.       └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
      6.         └─tbrf:::`_fseq`(`_lhs`)
      7.           └─magrittr::freduce(value, `_function_list`)
      8.             ├─base::withVisible(function_list[[k]](value))
      9.             └─function_list[[k]](value)
     10.               ├─tidyr::unnest(., !!col_name)
     11.               └─tidyr:::unnest.data.frame(., !!col_name)
     12.                 ├─base::`[[<-`(`*tmp*`, col, value = list())
     13.                 └─tibble:::`[[<-.tbl_df`(`*tmp*`, col, value = list())
     14.                   └─tibble:
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10. tbrf::tbr_misc(...)
        3. dplyr::arrange(., !!rlang::enquo(tcolumn))
        3. dplyr::mutate(...)
       11. tidyr::unnest(., !!col_name)
       24. base::`[[<-.data.frame`(`*tmp*`, col, value = list())
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 26 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Error: tbr_misc returns tbl_df in tidy chain (@test-expectedClass.R#63) 
      2. Error: tbr_mean provides same results as mean (@test-expectedValues.R#20) 
      3. Error: tbr_median provides same results as median (@test-expectedValues.R#38) 
      4. Error: core functions work with different time units (@test-expectedValues.R#88) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyfast

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/tidyfast
* Date/Publication: 2020-03-20 10:40:02 UTC
* Number of recursive dependencies: 51

Run `revdep_details(,"tidyfast")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
        1. dplyr::arrange(...)
       10. vctrs::stop_incompatible_size(...)
       11. vctrs:::stop_incompatible(...)
       12. vctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 88 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 4 ]
      1. Error: can pivot all cols (unspecified) to long (@test-dt_pivot_longer.R#7) 
      2. Error: can pivot all cols (specified) to long (@test-dt_pivot_longer.R#18) 
      3. Error: can drop missing values (@test-dt_pivot_longer.R#50) 
      4. Error: a single helper works outside of c() call (@test-dt_pivot_longer.R#86) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyquant

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/tidyquant
* URL: https://github.com/business-science/tidyquant
* BugReports: https://github.com/business-science/tidyquant/issues
* Date/Publication: 2020-03-04 12:50:04 UTC
* Number of recursive dependencies: 142

Run `revdep_details(,"tidyquant")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Get stock prices
    > stocks <- c("AAPL", "FB", "NFLX") %>%
    +     tq_get(from = "2013-01-01",
    +            to   = "2017-01-01")
    Warning in value[[3L]](cond) : Returning as nested data frame.
    > 
    > # Plot for stocks
    > g <- stocks %>%
    +     ggplot(aes(date, adjusted, color = symbol)) +
    +     geom_line() +
    +     labs(title = "Multi stock example",
    +          xlab = "Date",
    +          ylab = "Adjusted Close")
    > 
    > # Plot with tidyquant theme and colors
    > g +
    +     theme_tq() +
    +     scale_color_tq()
    Error in FUN(X[[i]], ...) : object 'adjusted' not found
    Calls: <Anonymous> ... <Anonymous> -> f -> scales_add_defaults -> lapply -> FUN
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1: In for (elt in name) { :
        closing unused connection 10 (https://query2.finance.yahoo.com/v7/finance/download/AAPL?period1=1262304000&period2=1420070400&interval=1d&events=history&crumb=0NM6KSWcKfq)
      2: In for (elt in name) { :
        closing unused connection 9 (https://query2.finance.yahoo.com/v7/finance/download/XYZ?period1=1262304000&period2=1588291200&interval=1d&events=history&crumb=0NM6KSWcKfq)
      3: In for (elt in name) { :
        closing unused connection 8 (https://query2.finance.yahoo.com/v7/finance/download/XYZ?period1=1262304000&period2=1588291200&interval=1d&events=history&crumb=P8M.zuwIOKL)
      4: In for (elt in name) { :
        closing unused connection 7 (https://query2.finance.yahoo.com/v7/finance/download/XYZ?period1=1262304000&period2=1588291200&interval=1d&events=history&crumb=P8M.zuwIOKL)
      5: In for (elt in name) { :
        closing unused connection 6 (https://query1.finance.yahoo.com/v7/finance/download/XYZ?period1=1262304000&period2=1588291200&interval=1d&events=history&crumb=bz13F3vm0IB)
      6: In for (elt in name) { :
        closing unused connection 5 (https://fred.stlouisfed.org/series/XYZ/downloaddata/XYZ.csv)
      7: In for (elt in name) { :
        closing unused connection 4 (https://fred.stlouisfed.org/series/XYZ/downloaddata/XYZ.csv)
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        doc   4.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

