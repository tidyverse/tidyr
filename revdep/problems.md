# anomalize

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/anomalize
* URL: https://github.com/business-science/anomalize
* BugReports: https://github.com/business-science/anomalize/issues
* Date/Publication: 2018-04-17 11:51:22 UTC
* Number of recursive dependencies: 129

Run `revdep_details(,"anomalize")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > # Needed to pass CRAN check / This is loaded by default
    > set_time_scale_template(time_scale_template())
    > 
    > data(tidyverse_cran_downloads)
    > 
    > tidyverse_cran_downloads %>%
    +     time_decompose(count, method = "stl") %>%
    +     anomalize(remainder, method = "iqr")
    Warning: Detecting old grouped_df format, replacing `vars` attribute by `groups`
    Warning: `cols` is now required.
    Please use `cols = c(nested.col)`
    Error in !.key : invalid argument type
    Calls: %>% ... nest.tbl_time -> <Anonymous> -> nest.grouped_df -> check_key
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 33 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 14 ]
      1. Error: iqr_grouped_df works (@test-anomalize.R#32) 
      2. Error: gesd_grouped_df works (@test-anomalize.R#45) 
      3. Error: returns a ggplot (@test-plot_anomalies.R#8) 
      4. Error: grouped_tbl_time works (@test-time_apply.R#11) 
      5. Error: grouped tbl_df (@test-time_decompose.R#26) 
      6. Error: method = stl, auto freq/trend (@test-time_decompose.R#36) 
      7. Error: method = stl, character freq/trend (@test-time_decompose.R#46) 
      8. Error: method = stl, numeric freq/trend (@test-time_decompose.R#56) 
      9. Error: method = twitter, auto freq/trend (@test-time_decompose.R#66) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        help   4.7Mb
    ```

# AzureKusto

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/AzureKusto
* URL: https://github.com/Azure/AzureKusto https://github.com/Azure/AzureR
* BugReports: https://github.com/Azure/AzureKusto/issues
* Date/Publication: 2019-07-05 11:50:07 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"AzureKusto")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: map_if(quos, !is_helper, eval_tidy, mask)
      14: map(.x[sel], .f, ...)
      15: .f(.x[[i]], ...)
      16: -Species
      17: is_character(x)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 100 | SKIPPED: 7 | WARNINGS: 4 | FAILED: 4 ]
      1. Error: unnest can handle multiple columns (@test_translate.r#584) 
      2. Error: unnest .id translates to with_itemindex (@test_translate.r#599) 
      3. Error: nest translates to summarize makelist() (@test_translate.r#611) 
      4. Error: nest nests all non-provided columns (@test_translate.r#631) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# bench

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/bench
* URL: https://github.com/r-lib/bench
* BugReports: https://github.com/r-lib/bench/issues
* Date/Publication: 2019-04-29 20:30:02 UTC
* Number of recursive dependencies: 62

Run `revdep_details(,"bench")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   }
    + }
    Loading required package: ggplot2
    Loading required namespace: tidyr
    Warning: `cols` is now required.
    Please use `cols = c(result, memory, time, gc)`
    Error: No common size for `result`, size 4958, and `memory`, size 32.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─ggplot2::autoplot(res)
    [90m  2. [39m├─bench:::autoplot.bench_mark(res)
    [90m  3. [39m│ └─tidyr::unnest(object) [90m00_pkg_src/bench/R/autoplot.R:58:2[39m
    [90m  4. [39m│   ├─tidyr::unnest(...)
    [90m  5. [39m│   ├─bench:::unnest.bench_mark(...)
    [90m  6. [39m│   │ └─base::suppressWarnings(NextMethod(.Generic, data, time, gc, .drop = FALSE)) [90m00_pkg_src/bench/R/mark.R:296:2[39m
    [90m  7. [39m│   │   └─base::withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
    [90m  8. [39m│   ├─base::NextMethod(.Generic, data, time, gc, .drop = FALSE) [90m00_pkg_src/bench/R/mark.R:296:2[39m
    [90m  9. [39m│   └─tidyr:::unnest.data.frame(...)
    [90m 10. [39m│     └─tidyr::unchop(data, !!cols, keep_empty = keep_empty, ptype = ptype)
    [90m 11. [39m│       └─purrr::pmap(as.list(data
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: unnest.bench_mark(data, cols = !!cols, names_sep = names_sep, keep_empty = keep_empty, ptype = ptype) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:251
      4: suppressWarnings(NextMethod(.Generic, data, time, gc, .drop = FALSE)) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bench/new/bench.Rcheck/00_pkg_src/bench/R/mark.R:296
      5: withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
      6: NextMethod(.Generic, data, time, gc, .drop = FALSE) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bench/new/bench.Rcheck/00_pkg_src/bench/R/mark.R:296
      7: unnest.data.frame(data, cols = !!cols, names_sep = names_sep, keep_empty = keep_empty, ptype = ptype, .drop = FALSE)
      8: map(data[[col]], as_df, col = col) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:276
      9: .f(.x[[i]], ...)
      10: stop("Input must be list of vectors", call. = FALSE) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:297
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 184 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: unnest.bench_mark: does not contain result or memory columns (@test-mark.R#185) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# broomExtra

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/broomExtra
* URL: https://indrajeetpatil.github.io/broomExtra/, https://github.com/IndrajeetPatil/broomExtra
* BugReports: https://github.com/IndrajeetPatil/broomExtra/issues
* Date/Publication: 2019-06-25 08:00:03 UTC
* Number of recursive dependencies: 77

Run `revdep_details(,"broomExtra")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1/2 mismatches
      [2] 7 - 6 == 1
      
      [31m──[39m [31m2. Failure: `boot_augment()` works (@test_boot_generics.R#119) [39m [31m───────────────────────────────────[39m
      dim(df_boot) not equal to c(320L, 11L).
      1/2 mismatches
      [2] 12 - 11 == 1
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 24 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: `boot_tidy()` works (@test_boot_generics.R#41) 
      2. Failure: `boot_augment()` works (@test_boot_generics.R#119) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cellbaseR

<details>

* Version: 1.8.0
* Source code: https://github.com/cran/cellbaseR
* URL: https://github.com/melsiddieg/cellbaseR
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 133

Run `revdep_details(,"cellbaseR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cellbaseR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: createGeneModel
    > ### Title: createGeneModel
    > ### Aliases: createGeneModel
    > 
    > ### ** Examples
    > 
    > cb <- CellBaseR()
    > test <- createGeneModel(object = cb, region = "17:1500000-1550000")
    Error in `[.tbl_df`(hope, , c("gene", "symbol", "transcript", "exons"),  : 
      unused argument (with = FALSE)
    Calls: createGeneModel -> [
    Execution halted
    ```

# CellBench

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/CellBench
* URL: https://github.com/shians/cellbench
* BugReports: https://github.com/Shians/CellBench/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 100

Run `revdep_details(,"CellBench")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m4. Failure: make_combiations works properly (@test-utils.R#148) [39m [31m──────────────────────────────────[39m
      make_combinations(horse = data.frame(x, y), shoe = z) not equal to tibble::tibble(...).
      Cols in y but not x: `y`, `x`. 
      Cols in x but not y: `horse`. 
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 97 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: make_combiations works properly (@test-utils.R#121) 
      2. Failure: make_combiations works properly (@test-utils.R#130) 
      3. Failure: make_combiations works properly (@test-utils.R#139) 
      4. Failure: make_combiations works properly (@test-utils.R#148) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    '::' or ':::' import not declared from: ‘DrImpute’
    ```

# CNPBayes

<details>

* Version: 1.13.5
* Source code: https://github.com/cran/CNPBayes
* URL: https://github.com/scristia/CNPBayes
* BugReports: https://github.com/scristia/CNPBayes/issues
* Date/Publication: 2019-01-05
* Number of recursive dependencies: 157

Run `revdep_details(,"CNPBayes")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘CNPBayes-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggChains
    > ### Title: Trace plots of MCMC chains and mixture model densities
    > ### Aliases: ggChains ggMixture ggMixture,MultiBatchCopyNumber-method
    > ###   ggMixture,MultiBatchCopyNumberPooled-method
    > ###   ggMixture,MultiBatchModel-method ggMixture,MultiBatch-method
    > ###   ggMixture,MultiBatchPooled-method ggChains,MultiBatchModel-method
    > ###   ggChains,MultiBatchPooled-method
    > 
    > ### ** Examples
    > 
    >   sb <- SingleBatchModelExample
    >   iter(sb) <- 1000
    >   burnin(sb) <- 100
    >   sb <- posteriorSimulation(sb)
    >   fig.chains <- ggChains(sb)
    Error: 1 components of `...` had unexpected names.
    
    We detected these problematic arguments:
    ```

## In both

*   R CMD check timed out
    

*   checking for missing documentation entries ... WARNING
    ```
    ...
      generic 'sigma' and siglist 'MultiBatchPooled'
      generic 'sigma<-' and siglist 'MixtureModel'
      generic 'sigma<-' and siglist 'MultiBatchPooled'
      generic 'tau2' and siglist 'MultiBatch'
      generic 'theta' and siglist 'MultiBatch'
      generic 'theta<-' and siglist 'McmcChains,ANY'
      generic 'theta<-' and siglist 'MixtureModel,ANY'
      generic 'theta<-' and siglist 'MultiBatch,matrix'
      generic 'theta<-' and siglist 'MultiBatchModel,ANY'
      generic 'thin' and siglist 'MultiBatch'
      generic 'thin' and siglist 'MultiBatchList'
      generic 'thin<-' and siglist 'McmcParams,numeric'
      generic 'thin<-' and siglist 'MultiBatch,numeric'
      generic 'thin<-' and siglist 'MultiBatchList,numeric'
      generic 'triodata_lrr' and siglist 'TrioBatchModel'
      generic 'z' and siglist 'MultiBatch'
      generic 'zFreq' and siglist 'MultiBatch'
    All user-level objects in a package (including S4 classes and methods)
    should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Slots for class 'MultiBatch'
      Code: chains current_values data down_sample flags parameters specs
            summaries
      Docs: chains current_values data down_sample flags parameters
            summaries
    
    S4 class codoc mismatches from documentation object 'MultiBatchModel-class':
    Slots for class 'MultiBatchModel'
      Code: .internal.constraint .internal.counter batch batchElements data
            data.mean data.prec hyperparams k label_switch loglik logprior
            marginal_lik mcmc.chains mcmc.params modes mu nu.0 pi
            predictive probz sigma2 sigma2.0 tau2 theta u z zfreq zstar
      Inherited: k hyperparams theta sigma2 nu.0 sigma2.0 pi mu tau2
            predictive zstar data data.mean data.prec z zfreq probz u
            logprior loglik mcmc.chains batch batchElements modes
            mcmc.params label_switch marginal_lik .internal.constraint
            .internal.counter
      Docs: .internal.constraint batch batchElements data data.mean
            data.prec hyperparams is_mendelian k label_switch loglik
            logprior mcmc.chains mcmc.params modes mu nu.0 pi probz sigma2
            sigma2.0 tau2 theta z zfreq
    ```

*   checking Rd \usage sections ... WARNING
    ```
    ...
    
    Documented arguments not in \usage in documentation object 'iter<-':
      ‘force’
    
    Documented arguments not in \usage in documentation object 'mcmcParams':
      ‘force’
    
    Undocumented arguments in documentation object 'sigma<-'
      ‘value’
    
    Undocumented arguments in documentation object 'singleBatchGuided,MultiBatchList,MultiBatch-method'
      ‘x’ ‘guide’
    
    Undocumented arguments in documentation object 'theta'
      ‘value’
    
    Functions with \usage entries need to have the appropriate \alias
    entries, and all their arguments documented.
    The \usage entries must correspond to syntactically valid R code.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.1Mb
      sub-directories of 1Mb or more:
        R     3.1Mb
        doc   3.0Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppArmadillo’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    findSurrogates,MultiBatch: no visible binding for global variable ‘id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:127-133)
    findSurrogates,MultiBatch: no visible binding for global variable
      ‘provisional_batch’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:127-133)
    findSurrogates,MultiBatch: no visible binding for global variable
      ‘batch_labels’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:127-133)
    findSurrogates,MultiBatch: no visible binding for global variable ‘id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-SummarizedExperiment.R:138-142)
    sigma,MultiBatchCopyNumberPooled: no visible binding for global
      variable ‘s2’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/methods-MultiBatchPooled.R:161)
    Undefined global functions or variables:
      . .gibbs_trios_mcmc2 .gibbs_trios_mcmc3 := batch_index batch_labels
      batches bk copy_number father id log_ratio maplabel medians model
      mother mprob nhom parents prec provisional_batch s s2 snpdat spec
      spec<- t.test value
    Consider adding
      importFrom("stats", "t.test")
    to your NAMESPACE file.
    ```

# collector

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/collector
* URL: https://collector.tidyrisk.org
* BugReports: https://github.com/davidski/collector/issues
* Date/Publication: 2019-05-21 07:30:03 UTC
* Number of recursive dependencies: 121

Run `revdep_details(,"collector")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > quantitative_scenarios <- prepare_data(scenario_parameters,
    +                                        capability_parameters,
    +                                        mc_threat_parameters_fitted,
    +                                        question_set)
    Error: Column `frequency_func` not found in `.data`
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─collector::prepare_data(...)
    [90m  2. [39m│ └─`%>%`(...) [90m00_pkg_src/collector/R/prepare_data.R:46:2[39m
    [90m  3. [39m│   ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m│       └─collector:::`_fseq`(`_lhs`)
    [90m  7. [39m│         └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m│           └─function_list[[i]](value)
    [90m  9. [39m│             ├─dplyr::select(...)
    [90m 10. [39m│             └─dplyr:::select.grouped_df(...)
    [90m 11. [39m│               └─dplyr:::.select_grouped_df(.data, !!!enquos(...), notify = TRUE)
    [90m 12. [39m│                 └─tidyselect::vars_select(tbl_vars(.data), !!!enquos(...))
    [90m 13. [39m│       
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: map_if(quos, !is_helper, eval_tidy, mask)
      15: map(.x[sel], .f, ...)
      16: .f(.x[[i]], ...)
      17: .data$frequency_func
      18: `$.rlang_data_pronoun`(.data, frequency_func)
      19: data_pronoun_get(x, nm)
      20: rlang:::abort_data_pronoun(x)
      21: abort(msg, "rlang_error_data_pronoun_not_found")
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 0 | WARNINGS: 16 | FAILED: 1 ]
      1. Error: Scenario objects are created (@test-prepare_data.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cutpointr

<details>

* Version: 0.7.6
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2019-03-27 10:10:03 UTC
* Number of recursive dependencies: 70

Run `revdep_details(,"cutpointr")` for more info

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
    
    > library(cutpointr)
    > cutpointr(suicide, dsi, suicide, gender) %>%
    +   add_metric(list(ppv, npv)) %>%
    +   select(optimal_cutpoint, subgroup, AUC, sum_sens_spec, ppv, npv)
    Assuming the positive class is yes
    Assuming the positive class has higher x values
    Error: 'nest_' is defunct.
    Use 'nest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 28 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 45 ]
      1. Error: Cutpointr returns a cutpointr without NAs and a certain Nr of rows (@test-cutpointr.R#3) 
      2. Error: Cutpointr works with different data types (@test-cutpointr.R#19) 
      3. Error: Bootstrap does not return duplicate colnames (@test-cutpointr.R#78) 
      4. Error: Plotting with bootstrapping is silent (@test-cutpointr.R#94) 
      5. Error: AUC calculation is correct and works with Inf and -Inf (@test-cutpointr.R#110) 
      6. Error: Correct midpoints are found (@test-cutpointr.R#125) 
      7. Error: find_metric_name finds metric (@test-cutpointr.R#136) 
      8. Error: no duplicate column names are returned (@test-cutpointr.R#150) 
      9. Error: Correct cutpoints with example data (@test-cutpointr.R#188) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cvms

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/cvms
* URL: https://github.com/ludvigolsen/cvms
* BugReports: https://github.com/ludvigolsen/cvms/issues
* Date/Publication: 2019-07-20 13:50:02 UTC
* Number of recursive dependencies: 102

Run `revdep_details(,"cvms")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `validate(...)` generated warnings:
      * All elements of `...` must be named.
      Did you want `data = c(`Fold Column`, Fold, Target, Prediction)`?
      * Vectorizing 'vctrs_list_of' elements may not preserve their attributes
      * Vectorizing 'vctrs_list_of' elements may not preserve their attributes
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 526 | SKIPPED: 5 | WARNINGS: 291 | FAILED: 4 ]
      1. Failure: model using dot in formula ( y ~ . ) works with cross_validate() (@test_cross_validate.R#343) 
      2. Failure: model using dot in formula ( y ~ . ) works with cross_validate() (@test_cross_validate.R#350) 
      3. Failure: model using dot in formula ( y ~ . ) works with validate() (@test_validate.R#346) 
      4. Failure: model using dot in formula ( y ~ . ) works with validate() (@test_validate.R#354) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# d3r

<details>

* Version: 0.8.6
* Source code: https://github.com/cran/d3r
* URL: https://github.com/timelyportfolio/d3r
* BugReports: https://github.com/timelyportfolio/d3r/issues
* Date/Publication: 2019-07-23 05:10:04 UTC
* Number of recursive dependencies: 46

Run `revdep_details(,"d3r")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > tit_tb <- titanic_df %>%
    +   select(Class,Age,Survived,Sex,Freq) %>%
    +   d3_nest(value_cols="Freq", root="titanic")
    Error: No tidyselect variables were registered
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─`%>%`(...)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m          └─function_list[[k]](value)
    [90m  9. [39m            └─d3r::d3_nest(., value_cols = "Freq", root = "titanic")
    [90m 10. [39m              ├─dplyr::bind_rows(...) [90m00_pkg_src/d3r/R/hierarchy.R:91:2[39m
    [90m 11. [39m              │ ├─dplyr:::flatten_bindable(dots_values(...))
    [90m 12. [39m              │ └─rlang::dots_values(...)
    [90m 13. [39m              ├─d3r:::promote_na(...)
    [90m 14. [39m              │
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      'igraph', 'partykit', 'treemap', 'V8'
    ```

# easyalluvial

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/easyalluvial
* URL: https://github.com/erblast/easyalluvial
* Date/Publication: 2019-04-01 11:20:12 UTC
* Number of recursive dependencies: 129

Run `revdep_details(,"easyalluvial")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘easyalluvial-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: palette_filter
    > ### Title: color filters for any vector of hex color values
    > ### Aliases: palette_filter
    > 
    > ### ** Examples
    > 
    > 
    > require(magrittr)
    Loading required package: magrittr
    > 
    > palette_qualitative() %>%
    +   palette_filter(thresh_similar = 0) %>%
    +   palette_plot_intensity()
    Error in ifelse(similar_index > index, similar_index, index) : 
      object 'similar_index' not found
    Calls: %>% ... <Anonymous> -> mutate -> mutate.tbl_df -> mutate_impl -> ifelse
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: `_fseq`(`_lhs`)
      14: freduce(value, `_function_list`)
      15: function_list[[i]](value)
      16: mutate(., larger_index = ifelse(similar_index > index, similar_index, index))
      17: mutate.tbl_df(., larger_index = ifelse(similar_index > index, similar_index, index))
      18: mutate_impl(.data, dots, caller_env())
      19: ifelse(similar_index > index, similar_index, index)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 65 | SKIPPED: 49 | WARNINGS: 581 | FAILED: 2 ]
      1. Failure: n_feats == degree (@test_alluvial_model_response.R#260) 
      2. Error: palettes (@test_palette.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# echarts4r

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/echarts4r
* URL: http://echarts4r.john-coene.com/
* BugReports: https://github.com/JohnCoene/echarts4r/issues
* Date/Publication: 2019-07-18 06:37:08 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"echarts4r")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + )
    > 
    > df %>% 
    +   e_charts() %>% 
    +   e_sunburst(parent, child, value) %>% 
    +   e_theme("westeros")
    Error: No tidyselect variables were registered
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─df %>% e_charts() %>% e_sunburst(parent, child, value) %>% e_theme("westeros")
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          └─function_list[[i]](value)
    [90m  8. [39m            └─echarts4r::e_sunburst(., parent, child, value)
    [90m  9. [39m              └─echarts4r::e_sunburst_(...) [90m00_pkg_src/echarts4r/R/add.R:931:2[39m
    [90m 10. [39m                └─echarts4r:::.build_sun(e, parent, child, value, itemStyle) [90m00_pkg_src/echarts4r/R/add_.R:967:2[39m
    [90m 11. [39m                  └─d3r::d3_nest(data, value_cols = cols, json = FALSE, root = NUL
    Execution halted
    ```

# eechidna

<details>

* Version: 1.3.0
* Source code: https://github.com/cran/eechidna
* URL: https://github.com/ropenscilabs/eechidna
* BugReports: https://github.com/ropenscilabs/eechidna/issues
* Date/Publication: 2019-03-18 00:00:03 UTC
* Number of recursive dependencies: 117

Run `revdep_details(,"eechidna")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   4.3Mb
    ```

# egor

<details>

* Version: 0.19.1
* Source code: https://github.com/cran/egor
* URL: https://github.com/tilltnet/egor, https://tilltnet.github.io/egor/
* BugReports: https://github.com/tilltnet/egor/issues
* Date/Publication: 2019-02-01 16:43:22 UTC
* Number of recursive dependencies: 58

Run `revdep_details(,"egor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘egor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_alts_df
    > ### Title: Create global alters and alter-alter relations dataframes from
    > ###   an 'egor' object
    > ### Aliases: as_alts_df as_aaties_df
    > 
    > ### ** Examples
    > 
    > # Load example data
    > data(egor32)
    > 
    > # Create global alters dataframes
    > as_alts_df(egor32)
    Error: 'unnest_' is defunct.
    Use 'unnest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 4 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 19 ]
      1. Error: Methods are working. (@test_clustered_graphs.R#8) 
      2. Error: Methods are working with partially missing data. (@test_clustered_graphs.R#27) 
      3. Error: Methods work (properly) with NAs in grouping variable. (@test_clustered_graphs.R#49) 
      4. Error: Methods work (properly) with grouping variable being completly NA. (@test_clustered_graphs.R#76) 
      5. Error: Composition commands work. (@test_composition.R#6) 
      6. Error: as_network works. (@test_conversions.R#6) 
      7. Error: as_igraph works. (@test_conversions.R#29) 
      8. Error: as_alts_df works. (@test_conversions.R#52) 
      9. Error: as_aaties_df works. (@test_conversions.R#63) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘haven’
    ```

# embed

<details>

* Version: 0.0.3
* Source code: https://github.com/cran/embed
* URL: https://tidymodels.github.io/embed
* BugReports: https://github.com/tidymodels/embed/issues
* Date/Publication: 2019-07-12 17:00:03 UTC
* Number of recursive dependencies: 140

Run `revdep_details(,"embed")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check(package = "embed")
      [31m──[39m [31m1. Failure: add_woe ruturns no messages nor warnings nor errors (@test_woe.R#95) [39m [31m─────────────────[39m
      `add_woe(df, y, x1)` produced warnings.
      
      [31m──[39m [31m2. Failure: add_woe ruturns no messages nor warnings nor errors (@test_woe.R#96) [39m [31m─────────────────[39m
      `add_woe(df %>% mutate(x3 = rep(c(TRUE, FALSE), 10)), y, x3)` produced warnings.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 153 | SKIPPED: 10 | WARNINGS: 76 | FAILED: 2 ]
      1. Failure: add_woe ruturns no messages nor warnings nor errors (@test_woe.R#95) 
      2. Failure: add_woe ruturns no messages nor warnings nor errors (@test_woe.R#96) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# fedregs

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/fedregs
* BugReports: https://github.com/slarge/fedregs/issues
* Date/Publication: 2019-02-04 15:13:30 UTC
* Number of recursive dependencies: 64

Run `revdep_details(,"fedregs")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(fedregs)
      > 
      > test_check("fedregs")
      [31m──[39m [31m1. Failure: We can go all the way (@test-fedregs.R#148) [39m [31m──────────────────────────────────────────[39m
      all(...) isn't true.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 27 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 1 ]
      1. Failure: We can go all the way (@test-fedregs.R#148) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rvest’ ‘stringi’
      All declared Imports should be used.
    ```

# fuzzyjoin

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/fuzzyjoin
* Date/Publication: 2018-03-02 09:10:25 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"fuzzyjoin")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > x2 <- data_frame(id2 = 1:4,
    +                  chromosome = c("chr1", "chr2", "chr2", "chr1"),
    +                  start = c(140, 210, 400, 300),
    +                  end = c(160, 240, 415, 320))
    > 
    > if (requireNamespace("IRanges", quietly = TRUE)) {
    +   # note that the the third and fourth items don't join (even though
    +   # 300-350 and 300-320 overlap) since the chromosomes are different:
    +   genome_inner_join(x1, x2, by = c("chromosome", "start", "end"))
    + 
    +   # other functions:
    +   genome_full_join(x1, x2, by = c("chromosome", "start", "end"))
    +   genome_left_join(x1, x2, by = c("chromosome", "start", "end"))
    +   genome_right_join(x1, x2, by = c("chromosome", "start", "end"))
    +   genome_semi_join(x1, x2, by = c("chromosome", "start", "end"))
    +   genome_anti_join(x1, x2, by = c("chromosome", "start", "end"))
    + }
    Error: 'nest_' is defunct.
    Use 'nest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Use 'nest' instead.
      See help("Defunct")
      1: genome_inner_join(x1, x2, by = c("chromosome", "start", "end")) at testthat/test_genome_join.R:18
      2: genome_join(x, y, by, mode = "inner", ...) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/genome_join.R:90
      3: fuzzy_join(x, y, mode = mode, index_match_fun = f, multi_by = by) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/genome_join.R:83
      4: index_match_fun(d1, d2) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/fuzzy_join.R:231
      5: tidyr::nest_(x, "x_data", colnames(x)[-1]) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/genome_join.R:64
      6: .Defunct("nest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:186
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 218 | SKIPPED: 0 | WARNINGS: 146 | FAILED: 1 ]
      1. Error: Can join genomes on chromosomes and intervals (@test_genome_join.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# genogeographer

<details>

* Version: 0.1.8
* Source code: https://github.com/cran/genogeographer
* Date/Publication: 2018-03-14 10:16:07 UTC
* Number of recursive dependencies: 109

Run `revdep_details(,"genogeographer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘genogeographer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: LR_table
    > ### Title: Compute pairwise likelihood ratios
    > ### Aliases: LR_table
    > 
    > ### ** Examples
    > 
    > df_ <- simulate_pops(pop_n = 4, aims_n = 50)
    > df_db <- pops_to_DB(df_)
    Warning: `.key` is deprecated
    > profile <- random_AIMs_profile(df_db, keep_pop = TRUE)
    Warning: `cols` is now required.
    Please use `cols = c(population_data)`
    Adding missing grouping variables: `population`
    Adding missing grouping variables: `population`
    Adding missing grouping variables: `population.x`
    Error: Column `x0` must be length 50 (the group size) or one, not 200
    Execution halted
    ```

# ggalluvial

<details>

* Version: 0.9.1
* Source code: https://github.com/cran/ggalluvial
* URL: http://corybrunson.github.io/ggalluvial/
* BugReports: https://github.com/corybrunson/ggalluvial/issues
* Date/Publication: 2018-10-21 21:10:03 UTC
* Number of recursive dependencies: 58

Run `revdep_details(,"ggalluvial")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             "Value", axes = 1:4, factor_key = TRUE)) at testthat/test-is-alluvial.r:36
      2: withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
      3: tidyr::gather(dplyr::mutate(titanic_alluvia, Index = 1:nrow(titanic_alluvia)), "Variable", "Value", axes = 1:4, 
             factor_key = TRUE)
      4: ellipsis::check_dots_unnamed() at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/gather.R:93
      5: stop_dots(message = paste0(length(named), " components of `...` had unexpected names."), dot_names = named, 
             .subclass = "rlib_error_dots_named")
      6: abort(message, .subclass = c(.subclass, "rlib_error_dots"), ...)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 12 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test-is-alluvial.r#36) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggpubr

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/ggpubr
* URL: https://rpkgs.datanovia.com/ggpubr/
* BugReports: https://github.com/kassambara/ggpubr/issues
* Date/Publication: 2019-06-23 06:00:06 UTC
* Number of recursive dependencies: 56

Run `revdep_details(,"ggpubr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # Two-samples unpaired test
    > #:::::::::::::::::::::::::::::::::::::::::
    > compare_means(len ~ supp, df)
    [90m# A tibble: 1 x 8[39m
      .y.   group1 group2      p p.adj p.format p.signif method  
      [3m[90m<chr>[39m[23m [3m[90m<chr>[39m[23m  [3m[90m<chr>[39m[23m   [3m[90m<dbl>[39m[23m [3m[90m<dbl>[39m[23m [3m[90m<chr>[39m[23m    [3m[90m<chr>[39m[23m    [3m[90m<chr>[39m[23m   
    [90m1[39m len   OJ     VC     0.064[4m5[24m 0.064 0.064    ns       Wilcoxon
    > 
    > # Two-samples paired test
    > #:::::::::::::::::::::::::::::::::::::::::
    > compare_means(len ~ supp, df, paired = TRUE)
    [90m# A tibble: 1 x 8[39m
      .y.   group1 group2       p  p.adj p.format p.signif method  
      [3m[90m<chr>[39m[23m [3m[90m<chr>[39m[23m  [3m[90m<chr>[39m[23m    [3m[90m<dbl>[39m[23m  [3m[90m<dbl>[39m[23m [3m[90m<chr>[39m[23m    [3m[90m<chr>[39m[23m    [3m[90m<chr>[39m[23m   
    [90m1[39m len   OJ     VC     0.004[4m3[24m[4m1[24m 0.004[4m3[24m 0.0043   **       Wilcoxon
    > 
    > # Compare supp levels after grouping the data by "dose"
    > #::::::::::::::::::::::::::::::::::::::::
    > compare_means(len ~ supp, df, group.by = "dose")
    Error: Column `p` must be length 1 (the group size), not 3
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggstatsplot

<details>

* Version: 0.0.12
* Source code: https://github.com/cran/ggstatsplot
* URL: https://indrajeetpatil.github.io/ggstatsplot/, https://github.com/IndrajeetPatil/ggstatsplot
* BugReports: https://github.com/IndrajeetPatil/ggstatsplot/issues
* Date/Publication: 2019-07-12 14:00:03 UTC
* Number of recursive dependencies: 243

Run `revdep_details(,"ggstatsplot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Bar (column) charts with statistical tests
    > ### Aliases: ggbarstats
    > 
    > ### ** Examples
    > 
    > 
    > # for reproducibility
    > set.seed(123)
    > 
    > # simple function call with the defaults (with condition)
    > ggstatsplot::ggbarstats(
    +   data = datasets::mtcars,
    +   main = vs,
    +   condition = cyl,
    +   nboot = 10,
    +   labels.legend = c("0 = V-shaped", "1 = straight"),
    +   legend.title = "Engine"
    + )
    Error in is_null(vars) : argument ".data" is missing, with no default
    Calls: <Anonymous> ... vars_select_eval -> scoped_vars -> poke_vars -> is_null
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      21: vars_select_eval(.vars, quos)
      22: scoped_vars(vars)
      23: poke_vars(vars)
      24: is_null(vars)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 144 | SKIPPED: 194 | WARNINGS: 0 | FAILED: 5 ]
      1. Error: checking labels with counts (@test_ggbarstats.R#19) 
      2. Error: checking labels and data from plot (@test_ggbetweenstats.R#136) 
      3. Error: checking labels with contingency tab (@test_ggpiestats.R#113) 
      4. Error: basic plotting works - two groups (@test_ggwithinstats.R#41) 
      5. Error: check comparison significant displays - adjusted (@test_pairwise_ggsignif.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# groupedstats

<details>

* Version: 0.0.7
* Source code: https://github.com/cran/groupedstats
* URL: https://indrajeetpatil.github.io/groupedstats/, https://github.com/IndrajeetPatil/groupedstats/
* BugReports: https://github.com/IndrajeetPatil/groupedstats/issues/
* Date/Publication: 2019-06-05 15:30:09 UTC
* Number of recursive dependencies: 134

Run `revdep_details(,"groupedstats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Name: grouped_aov
    > ### Title: Function to run analysis of variance (aov) across multiple
    > ###   grouping variables.
    > ### Aliases: grouped_aov
    > 
    > ### ** Examples
    > 
    > 
    > # uses dataset included in the groupedstats package
    > set.seed(123)
    > library(groupedstats)
    > 
    > groupedstats::grouped_aov(
    +   formula = rating ~ belief * outcome * question,
    +   data = intent_morality,
    +   grouping.vars = item,
    +   effsize = "eta"
    + )
    Error in is_null(vars) : argument ".data" is missing, with no default
    Calls: <Anonymous> ... vars_select_eval -> scoped_vars -> poke_vars -> is_null
    Execution halted
    ```

# gtsummary

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/gtsummary
* Date/Publication: 2019-05-10 15:10:10 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"gtsummary")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘gtsummary-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_comparison
    > ### Title: Adds p-values to the output comparing values across groups
    > ### Aliases: add_comparison
    > 
    > ### ** Examples
    > 
    > trial %>% fmt_table1(by = "trt") %>% add_comparison()
    Error: 'unnest_' is defunct.
    Use 'unnest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 0 | WARNINGS: 12 | FAILED: 40 ]
      1. Error: (unknown) (@test-add_global.R#3) 
      2. Error: (unknown) (@test-add_n.R#3) 
      3. Failure: no errors/warnings with standard use (@test-add_overall.R#5) 
      4. Error: no errors/warnings with standard use (@test-add_overall.R#6) 
      5. Failure: no errors/warnings with missing data (@test-add_overall.R#13) 
      6. Error: no errors/warnings with missing data (@test-add_overall.R#14) 
      7. Error: no errors/warnings with standard use after fmt_table1() and add_comparison() (@test-add_q.R#4) 
      8. Error: expect error if no p value in table 1 (@test-add_q.R#14) 
      9. Error: no errors/warnings with standard use after fmt_uni_regression() and add_global() (@test-add_q.R#26) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gutenbergr

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/gutenbergr
* URL: http://github.com/ropenscilabs/gutenbergr
* BugReports: http://github.com/ropenscilabs/gutenbergr/issues
* Date/Publication: 2018-01-26 12:31:18 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"gutenbergr")` for more info

</details>

## Newly broken

*   R CMD check timed out
    

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13617 marked UTF-8 strings
    ```

# HTSSIP

<details>

* Version: 1.4.0
* Source code: https://github.com/cran/HTSSIP
* Date/Publication: 2018-05-15 07:23:00 UTC
* Number of recursive dependencies: 125

Run `revdep_details(,"HTSSIP")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: eval(quote(`_fseq`(`_lhs`)), env, env)
      5: eval(quote(`_fseq`(`_lhs`)), env, env)
      6: `_fseq`(`_lhs`)
      7: freduce(value, `_function_list`)
      8: function_list[[i]](value)
      9: tidyr::nest_(., key_col = "data")
      10: .Defunct("nest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:186
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 107 | SKIPPED: 18 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: delta BD on rep3 dataset (@test-delta_BD.R#29) 
      2. Error: bootstrap iteration is working (@test-qSIP_atom_excess.R#41) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘igraph’
      All declared Imports should be used.
    ```

# ICD10gm

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/ICD10gm
* URL: https://github.com/edonnachie/ICD10gm, https://doi.org/10.5281/zenodo.2542833
* BugReports: https://github.com/edonnachie/ICD10gm/issues
* Date/Publication: 2019-02-12 17:30:07 UTC
* Number of recursive dependencies: 49

Run `revdep_details(,"ICD10gm")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `icd_k52_2010` not identical to ICD10gm::icd_history(icd_k52_2010, years = 2010).
      Objects equal but not identical
      
      [31m──[39m [31m3. Failure: Coding break: Check that K52.9 specified for 2009 is removed for 2010 (@test-icd_histor[39m
      icd_history(icd_k52_2009, years = 2009:2010) not identical to `icd_k52_2009`.
      Objects equal but not identical
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 41 | SKIPPED: 0 | WARNINGS: 10 | FAILED: 3 ]
      1. Failure: Expands down the hierarchy (@test-icd_expand.R#52) 
      2. Failure: icd_history returns input if years == year (@test-icd_history.R#24) 
      3. Failure: Coding break: Check that K52.9 specified for 2009 is removed for 2010 (@test-icd_history.R#30) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        data   7.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 252748 marked UTF-8 strings
    ```

# jstor

<details>

* Version: 0.3.6
* Source code: https://github.com/cran/jstor
* URL: https://github.com/ropensci/jstor, https://ropensci.github.io/jstor/
* BugReports: https://github.com/ropensci/jstor/issues
* Date/Publication: 2018-12-12 23:20:04 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"jstor")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jstor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: jst_subset_ngrams
    > ### Title: Define a subset of ngrams
    > ### Aliases: jst_subset_ngrams
    > 
    > ### ** Examples
    > 
    > # create sample output
    > tmp <- tempdir()
    > jst_import_zip(jst_example("pseudo_dfr.zip"),
    +                import_spec = jst_define_import(book = jst_get_book),
    +                out_file = "test", out_path = tmp)
    Processing files for [32mbook_chapter[39m with functions [34mjst_get_book[39m
    Error: Can't slice a scalar
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      17: `_fseq`(`_lhs`)
      18: freduce(value, `_function_list`)
      19: function_list[[i]](value)
      20: tidyr::unnest(., fun_names)
      21: unnest.data.frame(., fun_names) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:251
      22: unchop(data, !!cols, keep_empty = keep_empty, ptype = ptype) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:280
      23: vec_slice(data, rep(vec_seq_along(data), n)) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/chop.R:89
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 246 | SKIPPED: 4 | WARNINGS: 19 | FAILED: 2 ]
      1. Error: subsetting ngrams works (@test-ngram.R#32) 
      2. Error: importing from zip works (@test-zip.R#29) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# kntnr

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/kntnr
* URL: https://github.com/yutannihilation/kntnr
* BugReports: https://github.com/yutannihilation/kntnr/issues
* Date/Publication: 2017-08-23 07:09:38 UTC
* Number of recursive dependencies: 41

Run `revdep_details(,"kntnr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: `_fseq`(`_lhs`)
      6: freduce(value, `_function_list`)
      7: withVisible(function_list[[k]](value))
      8: function_list[[k]](value)
      9: kntn_unnest(.)
      10: tidyr::unnest_(records, col, .drop = FALSE) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/kntnr/new/kntnr.Rcheck/00_pkg_src/kntnr/R/kntn_unnest.R:35
      11: .Defunct("unnest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:311
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 67 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: unnesting records works (@test-parse-record.R#23) 
      2. Error: unnesting terriblly-nested records works (@test-parse-record.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# modelr

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/modelr
* URL: https://modelr.tidyverse.org, https://github.com/tidyverse/modelr
* BugReports: https://github.com/tidyverse/modelr/issues
* Date/Publication: 2019-02-18 22:00:03 UTC
* Number of recursive dependencies: 57

Run `revdep_details(,"modelr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: can generate typical values (@test-data-grid.R#12) [39m [31m───────────────────────────────────[39m
      out$x not equal to c("a", "a", "b", "b").
      Lengths differ: 0 is not 4
      
      [31m──[39m [31m2. Failure: can generate typical values (@test-data-grid.R#13) [39m [31m───────────────────────────────────[39m
      out$y not equal to c("a", "b", "a", "b").
      Lengths differ: 0 is not 4
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 120 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Failure: can generate typical values (@test-data-grid.R#12) 
      2. Failure: can generate typical values (@test-data-grid.R#13) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# mudata2

<details>

* Version: 1.0.6
* Source code: https://github.com/cran/mudata2
* URL: https://github.com/paleolimbot/mudata
* BugReports: https://github.com/paleolimbot/mudata/issues
* Date/Publication: 2019-03-16 17:30:09 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"mudata2")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # create mudata object using just the data table
    > mudata(kg_data)
    Guessing x columns: date
    Warning: `cols` is now required.
    Please use `cols = c(.data)`
    Error: `c(.data)` must evaluate to column positions or names, not a list
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─mudata2::mudata(kg_data)
    [90m  2. [39m  └─`%>%`(...) [90m00_pkg_src/mudata2/R/mudata.R:149:4[39m
    [90m  3. [39m    ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m        └─mudata2:::`_fseq`(`_lhs`)
    [90m  7. [39m          └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m            ├─base::withVisible(function_list[[k]](value))
    [90m  9. [39m            └─function_list[[k]](value)
    [90m 10. [39m              ├─mudata2:::generate_type_tbl(., default = "guess")
    [90m 11. [39m              └─mudata2:::generate_type_tbl.mudata(., default = "guess") [90m00_pkg_src/mudata2/R/types.R:14:21[39m
    [90m 12. [39m                └─tidyr::unnest(allcol
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 453 | SKIPPED: 0 | WARNINGS: 26 | FAILED: 23 ]
      1. Error: mudata constructor creates a mudata object (@test_mudata.R#10) 
      2. Error: default dataset/location actually changes the default dataset/location name (@test_mudata.R#15) 
      3. Error: x_columns are correctly assigned/identified (@test_mudata.R#30) 
      4. Error: passing invalid inputs throws an error (@test_mudata.R#79) 
      5. Failure: dataset/location/param types of incorrect type are detected (@test_mudata.R#123) 
      6. Failure: dataset/location/param types of incorrect type are detected (@test_mudata.R#127) 
      7. Failure: dataset/location/param types of incorrect type are detected (@test_mudata.R#131) 
      8. Error: duplicate data is detected (@test_mudata.R#143) 
      9. Error: printing of a mudata actually prints things (@test_mudata.R#178) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# pammtools

<details>

* Version: 0.1.11
* Source code: https://github.com/cran/pammtools
* URL: https://github.com/adibender/pammtools
* BugReports: https://github.com/adibender/pammtools/issues
* Date/Publication: 2019-04-18 08:30:03 UTC
* Number of recursive dependencies: 99

Run `revdep_details(,"pammtools")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: vec_fill_fun(.direction) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/fill.R:30
      7: match.arg(.direction) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/fill.R:35
      8: stop("'arg' must be of length 1")
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 262 | SKIPPED: 0 | WARNINGS: 4 | FAILED: 6 ]
      1. Error: Trafo works for list objects (with TDCs) (@test-as-ped.R#38) 
      2. Error: Formula special 'concurrent' works as expected (@test-specials.R#36) 
      3. Error: Covariate to matrix Transformation works (@test-specials.R#49) 
      4. Error: Concurrent TDC are transformed correctly (@test-tdc-transform.R#18) 
      5. Error: split_tdc works correctly (@test-tdc-transform.R#113) 
      6. Error: ped class is preserved after tidyr operations (@test-tidyverse-S3methods.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# panelr

<details>

* Version: 0.7.1
* Source code: https://github.com/cran/panelr
* URL: https://panelr.jacob-long.com
* BugReports: https://github.com/jacob-long/panelr
* Date/Publication: 2019-07-12 17:30:03 UTC
* Number of recursive dependencies: 163

Run `revdep_details(,"panelr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: set_names(x, repaired_names(names(x), .name_repair = .name_repair))
      15: set_names_impl(x, x, nm, ...)
      16: is_function(nm)
      17: is_closure(x)
      18: repaired_names(names(x), .name_repair = .name_repair)
      19: check_unique(new_name)
      20: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 239 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
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

# partition

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/partition
* URL: https://uscbiostats.github.io/partition/, https://github.com/USCbiostats/partition
* BugReports: https://github.com/USCbiostats/partition/issues
* Date/Publication: 2019-05-17 07:00:04 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"partition")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Please use `cols = c(mapping, indices)`
    Warning: `cols` is now required.
    Please use `cols = c(permutation)`
    Error: Column name `target_info` must not be duplicated.
    Use .name_repair to specify repair.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─`%>%`(...)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m          └─function_list[[k]](value)
    [90m  9. [39m            └─partition::plot_permutation(., "nclusters")
    [90m 10. [39m              └─`%>%`(...) [90m00_pkg_src/partition/R/plot.R:334:2[39m
    [90m 11. [39m                ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m 12. [39m                └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m 13. [39m                
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      16: set_repaired_names(x, .name_repair)
      17: set_names(x, repaired_names(names(x), .name_repair = .name_repair))
      18: set_names_impl(x, x, nm, ...)
      19: is_function(nm)
      20: is_closure(x)
      21: repaired_names(names(x), .name_repair = .name_repair)
      22: check_unique(new_name)
      23: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 151 | SKIPPED: 0 | WARNINGS: 47 | FAILED: 1 ]
      1. Error: plots are plotting (@test-plots-are-plotting.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# PHEindicatormethods

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/PHEindicatormethods
* BugReports: https://github.com/PublicHealthEngland/PHEindicatormethods/issues
* Date/Publication: 2019-05-15 13:30:03 UTC
* Number of recursive dependencies: 54

Run `revdep_details(,"PHEindicatormethods")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: tidyselect::vars_select(names(data), !!enquo(cols)) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:268
      13: vars_select_eval(.vars, quos)
      14: map_if(ind_list, is_helper, eval_tidy)
      15: map(.x[sel], .f, ...)
      16: .f(.x[[i]], ...)
      17: model %>% purrr::map(broom::tidy)
      18: eval(lhs, parent, parent)
      19: eval(lhs, parent, parent)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@testSII.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# photobiologyInOut

<details>

* Version: 0.4.20
* Source code: https://github.com/cran/photobiologyInOut
* URL: http://www.r4photobiology.info/
* BugReports: https://bitbucket.org/aphalo/photobiologyinout/issues/
* Date/Publication: 2019-06-15 09:30:03 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"photobiologyInOut")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      Did you misspecify an argument?
      1: read_tuv_usrout(file = file.name, ozone.du = 300, geocode = data.frame(lon = -15, lat = 60), tz = "UTC") at testthat/test-tuv.R:193
      2: tidyr::gather(wide.df, .dots = -c("w.length"), value = "s.e.irrad", key = "spct.idx") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/photobiologyInOut/new/photobiologyInOut.Rcheck/00_pkg_src/photobiologyInOut/R/read-tuv-file.r:86
      3: ellipsis::check_dots_unnamed() at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/gather.R:93
      4: stop_dots(message = paste0(length(named), " components of `...` had unexpected names."), dot_names = named, 
             .subclass = "rlib_error_dots_named")
      5: abort(message, .subclass = c(.subclass, "rlib_error_dots"), ...)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 434 | SKIPPED: 3 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: read TUV (@test-tuv.R#193) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# plyranges

<details>

* Version: 1.4.3
* Source code: https://github.com/cran/plyranges
* BugReports: https://github.com/sa-lee/plyranges
* Date/Publication: 2019-07-01
* Number of recursive dependencies: 112

Run `revdep_details(,"plyranges")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘plyranges-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: unnest.GenomicRanges
    > ### Title: Expand list-columns in a Ranges object
    > ### Aliases: unnest.GenomicRanges
    > 
    > ### ** Examples
    > 
    > grng <- as_granges(data.frame(seqnames = "chr1", start = 20:23, width = 1000))
    > grng <- mutate(grng, 
    +                exon_id = IntegerList(a = 1, b = c(4,5), c = 3, d = c(2,5))
    +                )
    > unnest(grng)
    Error: `.x` must be a vector, not a `GRanges` object
    Backtrace:
    [90m    [39m█
    [90m 1. [39m├─tidyr::unnest(grng)
    [90m 2. [39m│ └─purrr::map_lgl(data, is_list)
    [90m 3. [39m└─purrr:::stop_bad_type(...)
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             "purrr_error_bad_type"))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 275 | SKIPPED: 0 | WARNINGS: 10 | FAILED: 8 ]
      1. Error: read_bed returns correct GRanges (@test-io-bed.R#67) 
      2. Error: read_bed_graph returns correct GRanges (@test-io-bedGraph.R#39) 
      3. Error: reading/ writing bigwig files returns correct GRanges (@test-io-bw.R#19) 
      4. Error: reading GFF files returns correct GRanges (@test-io-gff.R#87) 
      5. Error: reading WIG files (@test-io-wig.R#24) 
      6. Failure: unnesting makes sense (@test-unnest.R#6) 
      7. Failure: unnesting makes sense (@test-unnest.R#11) 
      8. Error: unnesting makes sense (@test-unnest.R#26) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘BSgenome.Hsapiens.UCSC.hg19’
    ```

# pointblank

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/pointblank
* URL: https://github.com/rich-iannone/pointblank
* BugReports: https://github.com/rich-iannone/pointblank/issues
* Date/Publication: 2018-05-02 07:51:25 UTC
* Number of recursive dependencies: 53

Run `revdep_details(,"pointblank")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # Create 2 simple validation steps
    > # that test whether values within
    > # column `a`
    > agent <-
    +   create_agent() %>%
    +   focus_on(tbl_name = "df") %>%
    +   col_vals_between(
    +     column = a,
    +     left = 4,
    +     right = 6) %>%
    +   col_vals_lte(
    +     column = a,
    +     value = 10) %>%
    +   interrogate(
    +     get_problem_rows = TRUE,
    +     get_first_n = 10)
    Error: 'nest_' is defunct.
    Use 'nest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: eval(quote(`_fseq`(`_lhs`)), env, env)
      5: `_fseq`(`_lhs`)
      6: freduce(value, `_function_list`)
      7: withVisible(function_list[[k]](value))
      8: function_list[[k]](value)
      9: interrogate(.)
      10: tidyr::nest_(data = problem_rows, key_col = "data", nest_cols = names_problem_rows) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pointblank/new/pointblank.Rcheck/00_pkg_src/pointblank/R/interrogate.R:590
      11: .Defunct("nest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:186
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 779 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Interrogating for valid row values (@test-interrogate.R#230) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# predict3d

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/predict3d
* URL: https://github.com/cardiomoon/predict3d
* BugReports: https://github.com/cardiomoon/predict3d/issues
* Date/Publication: 2019-03-06 17:30:03 UTC
* Number of recursive dependencies: 104

Run `revdep_details(,"predict3d")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > fit=lm(mpg~hp*wt*cyl+carb+am,data=mtcars)
    > fit2newdata(fit,predictors=c("hp","wt","am"))
    Error: Column name `<dbl>` must not be duplicated.
    Use .name_repair to specify repair.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─predict3d::fit2newdata(fit, predictors = c("hp", "wt", "am"))
    [90m  2. [39m  └─newdf2 %>% reduce(crossing) [90m00_pkg_src/predict3d/R/ggPredict.R:194:8[39m
    [90m  3. [39m    ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m        └─predict3d:::`_fseq`(`_lhs`)
    [90m  7. [39m          └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m            ├─base::withVisible(function_list[[k]](value))
    [90m  9. [39m            └─function_list[[k]](value)
    [90m 10. [39m              └─purrr::reduce(., crossing)
    [90m 11. [39m                └─purrr:::reduce_impl(.x, .f, ..., .init = .init, .dir = .dir)
    [90m 12. [39m                  └─tidyr
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘TH.data’
      All declared Imports should be used.
    ```

# PrInCE

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/PrInCE
* BugReports: https://github.com/fosterlab/PrInCE/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 131

Run `revdep_details(,"PrInCE")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > subset <- scott[seq_len(500), ]
    > gauss <- scott_gaussians[names(scott_gaussians) %in% rownames(subset)]
    > ppi <- PrInCE(subset, gold_standard, gaussians = gauss, models = 1, 
    +               cv_folds = 3)
    Error: Column name `.` must not be duplicated.
    Use .name_repair to specify repair.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─PrInCE::PrInCE(...)
    [90m  2. [39m  └─PrInCE::adjacency_matrix_from_list(gold_standard) [90m00_pkg_src/PrInCE/R/PrInCE.R:247:4[39m
    [90m  3. [39m    └─purrr::map_dfr(complexes, ~crossing(., .)) [90m00_pkg_src/PrInCE/R/adjacency_matrix_from_list.R:27:2[39m
    [90m  4. [39m      └─purrr::map(.x, .f, ...)
    [90m  5. [39m        └─PrInCE:::.f(.x[[i]], ...)
    [90m  6. [39m          └─tidyr::crossing(., .)
    [90m  7. [39m            └─tidyr::expand_grid(!!!cols)
    [90m  8. [39m              ├─tibble::as_tibble(out)
    [90m  9. [39m              └─tibble:::as_tibble.list(out)
    [90m 10. [39m                └─tibble:::lst_to_tibble(x, .rows, .name_repair, col_lengths(x))
    [90m 11. [39m                  └─tibble:::set_repaired_names(x, .name_repair)
    [90m 12. [39m                    ├─rlang::set_names(x, repaired
    Execution halted
    ```

# rclimateca

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/rclimateca
* URL: https://github.com/paleolimbot/rclimateca
* BugReports: https://github.com/paleolimbot/rclimateca/issues
* Date/Publication: 2018-06-11 16:41:23 UTC
* Number of recursive dependencies: 72

Run `revdep_details(,"rclimateca")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      22: bad_calls(bad, "must evaluate to { singular(.vars) } positions or names, \\\n       not { first_type }")
      23: glubort(fmt_calls(calls), ..., .envir = .envir)
      24: .abort(text)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 164 | SKIPPED: 0 | WARNINGS: 8 | FAILED: 6 ]
      1. Error: no files are downloaded when the locations table indicates there is no data (@test-climate_data.R#277) 
      2. Error: no files are downloaded when the locations table indicates there was never data (@test-climate_data.R#310) 
      3. Error: get mudata function for climate data works (@test-climate_data.R#445) 
      4. Error: get_mudata function works on zero-row (empty) outputs (@test-climate_data.R#474) 
      5. Error: all timeframes and output types of data work for a random location (@test-deprecated_functions.R#88) 
      6. Error: deprecated functions all have a warning (@test-deprecated_functions.R#106) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# recipes

<details>

* Version: 0.1.6
* Source code: https://github.com/cran/recipes
* URL: https://github.com/tidymodels/recipes
* BugReports: https://github.com/tidymodels/recipes/issues
* Date/Publication: 2019-07-02 21:20:05 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"recipes")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `prep(rec1, training = iris2)` generated warnings:
      * All elements of `...` must be named.
      Did you want `data = c(type, role, source)`?
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 1203 | SKIPPED: 4 | WARNINGS: 719 | FAILED: 6 ]
      1. Failure: basic usage (@test_downsample.R#44) 
      2. Failure: new levels (@test_dummies.R#193) 
      3. Failure: missing columns (@test_interact.R#185) 
      4. Failure: in recipe (@test_range_check.R#38) 
      5. Failure: works with all_predictors() selector (@test_relu.R#66) 
      6. Failure: basic usage (@test_upsample.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rmapzen

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/rmapzen
* URL: https://tarakc02.github.io/rmapzen/
* BugReports: https://github.com/tarakc02/rmapzen/issues
* Date/Publication: 2018-10-07 21:00:02 UTC
* Number of recursive dependencies: 72

Run `revdep_details(,"rmapzen")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Error: as.data.frame converts isochrone results to sf (@test-as-data-frame.R#10) [39m [31m──────────────[39m
      'unnest_' is defunct.
      Use 'unnest' instead.
      See help("Defunct")
      1: as.data.frame(marina_walks) at testthat/test-as-data-frame.R:10
      2: as.data.frame.mapzen_isochrone_list(marina_walks)
      3: tidyr::unnest_(res, "contours") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rmapzen/new/rmapzen.Rcheck/00_pkg_src/rmapzen/R/tidy.R:37
      4: .Defunct("unnest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:311
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 202 | SKIPPED: 2 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: as.data.frame converts isochrone results to sf (@test-as-data-frame.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# rstatix

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/rstatix
* URL: https://rpkgs.datanovia.com/rstatix/
* BugReports: https://github.com/kassambara/rstatix/issues
* Date/Publication: 2019-06-20 15:50:03 UTC
* Number of recursive dependencies: 96

Run `revdep_details(,"rstatix")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > mtcars %>% cor_test(wt, mpg, disp)
    [90m# A tibble: 9 x 8[39m
      var1  var2    cor    statistic         p conf.low conf.high method 
    [90m*[39m [3m[90m<chr>[39m[23m [3m[90m<chr>[39m[23m [3m[90m<dbl>[39m[23m        [3m[90m<dbl>[39m[23m     [3m[90m<dbl>[39m[23m    [3m[90m<dbl>[39m[23m     [3m[90m<dbl>[39m[23m [3m[90m<chr>[39m[23m  
    [90m1[39m wt    wt     1    367[4m5[24m[4m7[24m[4m0[24m386.   2.27[90me[39m[31m-236[39m    1.000     1     Pearson
    [90m2[39m wt    mpg   -[31m0[39m[31m.[39m[31m87[39m        -[31m9[39m[31m.[39m[31m56[39m 1.29[90me[39m[31m- 10[39m   -[31m0[39m[31m.[39m[31m934[39m    -[31m0[39m[31m.[39m[31m744[39m Pearson
    [90m3[39m wt    disp   0.89        10.6  1.22[90me[39m[31m- 11[39m    0.781     0.944 Pearson
    [90m4[39m mpg   wt    -[31m0[39m[31m.[39m[31m87[39m        -[31m9[39m[31m.[39m[31m56[39m 1.29[90me[39m[31m- 10[39m   -[31m0[39m[31m.[39m[31m934[39m    -[31m0[39m[31m.[39m[31m744[39m Pearson
    [90m5[39m mpg   mpg    1          [31mInf[39m    0.  [90m [39m        1         1     Pearson
    [90m6[39m mpg   disp  -[31m0[39m[31m.[39m[31m85[39m        -[31m8[39m[31m.[39m[31m75[39m 9.38[90me[39m[31m- 10[39m   -[31m0[39m[31m.[39m[31m923[39m    -[31m0[39m[31m.[39m[31m708[39m Pearson
    [90m7[39m disp  wt     0.89        10.6  1.22[90me[39m[31m- 11[39m    0.781     0.944 Pearson
    [90m8[39m disp  mpg   -[31m0[39m[31m.[39m[31m85[39m        -[31m8[39m[31m.[39m[31m75[39m 9.38[90me[39m[31m- 10[39m   -[31m0[39m[31m.[39m[31m923[39m    -[31m0[39m[31m.[39m[31m708[39m Pearson
    [90m9[39m disp  disp   1          [31mInf[39m    0.  [90m [39m        1         1     Pearson
    > 
    > # Grouped data
    > #:::::::::::::::::::::::::::::::::::::::::
    > iris %>%
    +   group_by(Species) %>%
    +  cor_test(Sepal.Width, Sepal.Length)
    Error: Column `.results.` must be length 1 (the group size), not 3
    Execution halted
    ```

# RxODE

<details>

* Version: 0.9.1-0
* Source code: https://github.com/cran/RxODE
* URL: https://nlmixrdevelopment.github.io/RxODE/
* BugReports: https://github.com/nlmixrdevelopment/RxODE/issues
* Date/Publication: 2019-07-12 14:20:07 UTC
* Number of recursive dependencies: 118

Run `revdep_details(,"RxODE")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             assign(".mv", .rxDll$modVars, envir = <environment>)
         })
      5: eval(substitute(expr), data, enclos = parent.frame())
      6: eval(substitute(expr), data, enclos = parent.frame())
      7: RxODE::rxCompile(.mv, dir = mdir, extraC = extraC, debug = debug, modName = modName, package = NULL)
      8: rxCompile.rxModelVars(.mv, dir = mdir, extraC = extraC, debug = debug, modName = modName, package = NULL) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00_pkg_src/RxODE/R/RxODE.R:1317
      9: stop("Error building model on another thread.") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00_pkg_src/RxODE/R/RxODE.R:1379
      
      [====|====|====|====|====|====|====|====|====|====
      [====|====|====|====|====|====|====|====|====|====══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 2338 | SKIPPED: 1 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: Issue #56 (@test-issue-56.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘installr’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R      1.0Mb
        doc    1.3Mb
        libs   2.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘n1qn1’
      All declared Imports should be used.
    ```

# sampler

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/sampler
* URL: https://github.com/mbaldassaro/sampler
* BugReports: https://github.com/mbaldassaro/sampler/issues
* Date/Publication: 2019-01-27 06:20:02 UTC
* Number of recursive dependencies: 27

Run `revdep_details(,"sampler")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sampler-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: cpro
    > ### Title: Calculate proportion and margin of error (unequal-sized cluster
    > ###   sample)
    > ### Aliases: cpro
    > 
    > ### ** Examples
    > 
    > alresults <- ssamp(albania, 890, qarku)
    Error: Column `nh` must be length 1 (the group size), not 12
    Execution halted
    ```

# seqCAT

<details>

* Version: 1.6.0
* Source code: https://github.com/cran/seqCAT
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 105

Run `revdep_details(,"seqCAT")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             filter = TRUE, python = FALSE)) at testthat/test_01_create_profile.R:11
      2: withCallingHandlers(expr, message = function(c) invokeRestart("muffleMessage"))
      3: create_profile(vcf_file = file1, sample = "sample1", output_file = "profile_1.txt", min_depth = 10, filter = TRUE, 
             python = FALSE)
      4: create_profile_R(vcf_file, sample, output_file, min_depth, filter) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00_pkg_src/seqCAT/R/create_profile.R:53
      5: filter_annotations(data) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00_pkg_src/seqCAT/R/create_profile.R:264
      6: tidyr::unnest_(data, "ANN") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00_pkg_src/seqCAT/R/create_profile.R:326
      7: .Defunct("unnest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:311
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 85 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test_01_create_profile.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simTool

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/simTool
* URL: https://github.com/MarselScheer/simTool
* BugReports: https://github.com/MarselScheer/simTool/issues
* Date/Publication: 2019-03-22 14:00:02 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"simTool")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 108 | SKIPPED: 0 | WARNINGS: 19 | FAILED: 12 ]
      1. Error: Explicit defined .truth parameter of the data analyzing function can access the matrix for the data generating function (@test_eval_tibbles.R#28) 
      2. Error: Explicit defined .truth parameter of the data analyzing function can access the matrix for the data generating function (@test_eval_tibbles.R#51) 
      3. Error: Explicit defined .truth parameter of the post analyzing function can access the matrix for the data generating function (@test_eval_tibbles.R#74) 
      4. Error: Warning if proc_grid has a .truth-column (@test_eval_tibbles.R#140) 
      5. Failure: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#212) 
      6. Failure: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#212) 
      7. Failure: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#456) 
      8. Failure: Three analyzing functions and one summary function. Results were created and stored in simulation (@test_eval_tibbles.R#534) 
      9. Failure: Three analyzing functions and three summary function. Results were created and stored in simulation (@test_eval_tibbles.R#680) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# SingleCaseES

<details>

* Version: 0.4.2
* Source code: https://github.com/cran/SingleCaseES
* URL: https://github.com/jepusto/SingleCaseES
* BugReports: https://github.com/jepusto/SingleCaseES/issues
* Date/Publication: 2019-06-14 15:40:03 UTC
* Number of recursive dependencies: 85

Run `revdep_details(,"SingleCaseES")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    [90m1[39m Period 1       LRRd  -[31m0[39m[31m.[39m[31m807[39m 0.198  -[31m1[39m[31m.[39m[31m19[39m    -[31m0[39m[31m.[39m[31m419[39m 
    [90m2[39m Period 1       LRRi   0.807 0.198   0.419    1.19  
    [90m3[39m Period 2       LRRd  -[31m0[39m[31m.[39m[31m610[39m 0.349  -[31m1[39m[31m.[39m[31m29[39m     0.073[4m6[24m
    [90m4[39m Period 2       LRRi   0.610 0.349  -[31m0[39m[31m.[39m[31m0[39m[31m73[4m6[24m[39m   1.29  
    [90m5[39m Period 3       LRRd  -[31m0[39m[31m.[39m[31m748[39m 0.353  -[31m1[39m[31m.[39m[31m44[39m    -[31m0[39m[31m.[39m[31m0[39m[31m55[4m0[24m[39m
    [90m6[39m Period 3       LRRi   0.748 0.353   0.055[4m0[24m   1.44  
    >               
    > data(Schmidt2007)               
    > batch_calc_ES(dat = Schmidt2007,
    +               grouping = c(Behavior_type, Case_pseudonym, Phase_num),
    +               condition = Condition,
    +               outcome = Outcome,
    +               ES = c("LRRi","LRRd"),
    +               improvement = direction,
    +               scale = Metric,
    +               bias_correct = TRUE,
    +               confidence = NULL,
    +               format = "wide")
    Error: 1 components of `...` had unexpected names.
    
    We detected these problematic arguments:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 89 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 12 ]
      1. Error: (unknown) (@test-Pustejovsky-2015.R#19) 
      2. Error: (unknown) (@test-Pustejovsky-2018-LRR.R#107) 
      3. Error: Wide format works for ES = 'all' when confidence is specified (@test-format.R#28) 
      4. Error: Wide format works for ES = 'all', when confidence is NULL (@test-format.R#44) 
      5. Error: Wide format works for ES = 'parametric', when confidence is specified (@test-format.R#61) 
      6. Error: Wide format works for ES = 'parametric', when confidence is NULL (@test-format.R#79) 
      7. Error: Wide format works for ES = 'NOM', when confidence is specified (@test-format.R#99) 
      8. Error: Wide format works for ES = 'NOM', when confidence is NULL (@test-format.R#118) 
      9. Error: Wide format works for other NOMs. (@test-format.R#140) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# sjPlot

<details>

* Version: 2.6.3
* Source code: https://github.com/cran/sjPlot
* URL: https://strengejacke.github.io/sjPlot/
* BugReports: https://github.com/strengejacke/sjPlot/issues
* Date/Publication: 2019-04-27 15:30:03 UTC
* Number of recursive dependencies: 181

Run `revdep_details(,"sjPlot")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   dplyr::select(e17age, c160age) %>%
    +   plot_frq(type = "hist", show.mean = TRUE)
    [[1]]
    
    [[2]]
    
    > 
    > # bar plot(s)
    > plot_frq(efc, e42dep, c172code)
    [[1]]
    
    [[2]]
    
    > 
    > # grouped data frame, all panels in one plot
    > efc %>%
    +   group_by(e42dep) %>%
    +   plot_frq(c161sex) %>%
    +   plot_grid()
    Error: Result must have length 1, not 5
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘snakecase’
    ```

# sjstats

<details>

* Version: 0.17.5
* Source code: https://github.com/cran/sjstats
* URL: https://github.com/strengejacke/sjstats, https://strengejacke.github.io/sjstats
* BugReports: https://github.com/strengejacke/sjstats/issues
* Date/Publication: 2019-06-04 13:10:02 UTC
* Number of recursive dependencies: 192

Run `revdep_details(,"sjstats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    Anova: R2=0.401; adj.R2=0.393; F=49.160; p=0.000
    > 
    > # also works for grouped data frames
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > efc %>%
    +   group_by(c172code) %>%
    +   grpmean(c12hour, e42dep)
    Error: Result must have length 1, not 4
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: `_fseq`(`_lhs`)
      8: freduce(value, `_function_list`)
      9: withVisible(function_list[[k]](value))
      10: function_list[[k]](value)
      11: dplyr::filter(., !!cc)
      12: filter.tbl_df(., !!cc)
      13: filter_impl(.data, quo)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 12 | SKIPPED: 4 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: grpmean, grouping (@test-grpmean.R#20) 
      2. Error: grpmean, grouped weighting (@test-grpmean.R#25) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘arm’
    ```

# slinky

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/slinky
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 96

Run `revdep_details(,"slinky")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > 
    > # for build/demo only.  You MUST use your own key when using the slinky
    > # package.
    > user_key <- httr::content(httr::GET('https://api.clue.io/temp_api_key'),
    +                           as='parsed')$user_key
    > sl <- Slinky(user_key,
    +                  system.file('extdata', 'demo.gctx',
    +                       package='slinky'),
    +                  system.file('extdata', 'demo_inst_info.txt',
    +                      package = 'slinky'))
    > amox_gold <- clueInstances(sl, where_clause = list('pert_type' = 'trt_cp',
    +                  'pert_iname' = 'amoxicillin',
    +                  'cell_id' = 'MCF7',
    +                  'is_gold' = TRUE), poscon = 'omit')
    Error in vapply(ids[, 1], function(x) { : values must be length 1,
     but FUN(X[[1]]) result is length 5
    Calls: clueInstances -> clueInstances -> unlist -> vapply
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             strsplit(x, "\\|")
         }, list("a")) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/slinky/new/slinky.Rcheck/00_pkg_src/slinky/R/slinky_clue.R:365
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 32 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 7 ]
      1. Error: A list of instance ids can be retrieved (@test_clue.R#53) 
      2. Error: Instance ids can be retrieved (@test_clue.R#73) 
      3. Error: Robust z-scores can be calculated correctly (@test_score.R#28) 
      4. Error: Scoring on landmark genes only works. (@test_score.R#33) 
      5. Error: (unknown) (@test_score.R#39) 
      6. Error: SummarizedExperiment can be created by where clause (@test_sumexp.R#24) 
      7. Error: SummarizedExperiment can be created with controls id'd automatically (@test_sumexp.R#35) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# statsDK

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/statsDK
* URL: https://github.com/mikkelkrogsholm/statsDK
* BugReports: https://github.com/mikkelkrogsholm/statsDK/issues
* Date/Publication: 2017-09-30 08:30:06 UTC
* Number of recursive dependencies: 66

Run `revdep_details(,"statsDK")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     $ documentation      :List of 2
      ..$ id : chr "738a2ebc-263d-403d-a2d9-7bcd3292eede"
      ..$ url: chr "https://www.dst.dk/documentationofstatistics/738a2ebc-263d-403d-a2d9-7bcd3292eede"
     $ footnote           :List of 2
      ..$ text     : chr "The 21. February 2018 the number of livebirths is revised with 125 more born in 2017."
      ..$ mandatory: logi FALSE
     $ variables          :'data.frame':	2 obs. of  5 variables:
      ..$ id         : chr [1:2] "BEVÆGELSEV" "Tid"
      ..$ text       : chr [1:2] "movement" "time"
      ..$ elimination: logi [1:2] FALSE FALSE
      ..$ time       : logi [1:2] FALSE TRUE
      ..$ values     :List of 2
      .. ..$ :'data.frame':	2 obs. of  2 variables:
      .. ..$ :'data.frame':	1419 obs. of  2 variables:
    > 
    > # See the variables as a data frame
    > variables <- get_variables(metadata)
    Error: 'unnest_' is defunct.
    Use 'unnest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("statsDK")
      [31m──[39m [31m1. Error: (unknown) (@test_fixers.R#27) [39m [31m──────────────────────────────────────────────────────────[39m
      'unnest_' is defunct.
      Use 'unnest' instead.
      See help("Defunct")
      1: get_variables(metadata) at testthat/test_fixers.R:27
      2: tidyr::unnest_(metadata$variables, "values") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/statsDK/new/statsDK.Rcheck/00_pkg_src/statsDK/R/fixer_functions.R:63
      3: .Defunct("unnest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:311
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 14 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@test_fixers.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘ggplot2’ ‘stringr’
      All declared Imports should be used.
    ```

# strapgod

<details>

* Version: 0.0.3
* Source code: https://github.com/cran/strapgod
* URL: https://github.com/DavisVaughan/strapgod
* BugReports: https://github.com/DavisVaughan/strapgod/issues
* Date/Publication: 2019-07-18 06:36:28 UTC
* Number of recursive dependencies: 55

Run `revdep_details(,"strapgod")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: is_function(nm)
      24: is_closure(x)
      25: repaired_names(names(x), .name_repair = .name_repair)
      26: check_unique(new_name)
      27: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 145 | SKIPPED: 0 | WARNINGS: 58 | FAILED: 4 ]
      1. Error: can correctly double bootstrap (@test-bootstrapify.R#69) 
      2. Failure: nest() (@test-compat-tidyr.R#7) 
      3. Error: nest() (@test-compat-tidyr.R#12) 
      4. Error: group_keys() can find the virtual groups (@test-dplyr-group-funs.R#135) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# suddengains

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/suddengains
* URL: https://github.com/milanwiedemann/suddengains
* BugReports: https://github.com/milanwiedemann/suddengains/issues
* Date/Publication: 2019-05-21 13:50:03 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"suddengains")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +                                 "bdi_s4", "bdi_s5", "bdi_s6",
    +                                 "bdi_s7", "bdi_s8", "bdi_s9",
    +                                 "bdi_s10", "bdi_s11", "bdi_s12"),
    +                 sg_measure_name = "bdi",
    +                 multiple_sg_select = "largest")
    First, second, and third sudden gains criteria were applied.
    Error: `by` can't contain join column `id_var_name` which is missing from RHS
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─suddengains::create_byperson(...)
    [90m  2. [39m  └─suddengains::create_bysg(...) [90m00_pkg_src/suddengains/R/create_byperson.R:57:4[39m
    [90m  3. [39m    └─suddengains::extract_values(...) [90m00_pkg_src/suddengains/R/create_bysg.R:136:2[39m
    [90m  4. [39m      └─data_extract %>% tidyr::complete(id_var_name = id_list) [90m00_pkg_src/suddengains/R/extract_values.R:86:4[39m
    [90m  5. [39m        ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  6. [39m        └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  7. [39m          └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  8. [39m            └─suddengains:::`_fseq`(`_lhs`)
    [90m  9. [39m              └─magrittr::freduce(value, `_function_list`)
    [90m 10. [39m                ├─base::withVisible(function_list[[k]](value))
    [90m 11. [
    Execution halted
    ```

# sugarbag

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/sugarbag
* URL: https://srkobakian.github.io/sugarbag/, https://github.com/srkobakian/sugarbag
* Date/Publication: 2019-06-14 08:00:02 UTC
* Number of recursive dependencies: 112

Run `revdep_details(,"sugarbag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + )
    Warning: unnest() has a new interface. See ?unnest for details.
    Try `cols = c(data, closest)`, with `mutate()` needed
    Error: Column names `longitude`, `latitude` must not be duplicated.
    Use .name_repair to specify repair.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─sugarbag::allocate(...)
    [90m  2. [39m  └─`%>%`(...) [90m00_pkg_src/sugarbag/R/allocate.R:43:6[39m
    [90m  3. [39m    ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m        └─sugarbag:::`_fseq`(`_lhs`)
    [90m  7. [39m          └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m            └─function_list[[i]](value)
    [90m  9. [39m              └─tidyr::unnest(., data, closest)
    [90m 10. [39m                ├─tidyr::unnest(...)
    [90m 11. [39m                └─tidyr:::unnest.data.frame(...)
    [90m 12. [39m                  └─tidyr::unpack(data, !!cols, names_sep = names_sep, names_repair = names_repair)
    [90m 13. [39
    Execution halted
    ```

# SummarizedBenchmark

<details>

* Version: 2.2.2
* Source code: https://github.com/cran/SummarizedBenchmark
* Date/Publication: 2019-06-14
* Number of recursive dependencies: 173

Run `revdep_details(,"SummarizedBenchmark")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > 
    > data( sb )
    > sb <- addPerformanceMetric(
    +    object=sb,
    +    assay="qvalue",
    +    evalMetric="TPR",
    +    evalFunction = function( query, truth, alpha=0.1 ){
    +        goodHits <- sum( (query < alpha) & truth == 1 )
    +        goodHits / sum(truth == 1)
    +    }
    + )
    > 
    > qvalueMetrics <- estimateMetricsForAssay( sb, assay="qvalue" )
    > allMetrics <- estimatePerformanceMetrics( sb )
    > allMetricsTidy <- estimatePerformanceMetrics( sb, tidy=TRUE )
    Error: 1 components of `...` had unexpected names.
    
    We detected these problematic arguments:
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: ellipsis::check_dots_unnamed() at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/gather.R:93
      5: stop_dots(message = paste0(length(named), " components of `...` had unexpected names."), dot_names = named, 
             .subclass = "rlib_error_dots_named")
      6: abort(message, .subclass = c(.subclass, "rlib_error_dots"), ...)
      
      
      Option rerun is set to `FALSE`:
      Rerunning performance metrics only for the following methods: BH2
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 221 | SKIPPED: 0 | WARNINGS: 6 | FAILED: 1 ]
      1. Error: test='estimatePerformanceMetrics' returns informative messages (@test_estimatePerformanceMetrics.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      'tidyr', 'SummarizedExperiment', 'S4Vectors', 'BiocGenerics',
      'UpSetR', 'rlang', 'stringr', 'BiocParallel', 'ggplot2', 'mclust',
      'dplyr', 'digest', 'sessioninfo', 'crayon', 'tibble'
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.5Mb
      sub-directories of 1Mb or more:
        data  11.2Mb
        doc    3.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘BiocGenerics’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported object imported by a ':::' call: ‘BiocGenerics:::replaceSlots’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/BDData-show.R:11)
    show,BDMethodList: no visible global function definition for ‘head’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/BDMethodList-show.R:8)
    show,BDMethodList: no visible global function definition for ‘head’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/BDMethodList-show.R:10)
    show,BenchDesign: no visible global function definition for ‘head’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/BenchDesign-show.R:19)
    show,BenchDesign: no visible global function definition for ‘head’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/BenchDesign-show.R:21)
    show,BenchDesign: no visible global function definition for ‘head’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/BenchDesign-show.R:23-28)
    Undefined global functions or variables:
      . .id .method .val .valueClassTest FDR TPR colid comparison cor f
      head label meta metadata method overlap params post rerun sd slot
      value
    Consider adding
      importFrom("methods", ".valueClassTest", "slot")
      importFrom("stats", "cor", "sd")
      importFrom("utils", "head")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# sunburstR

<details>

* Version: 2.1.1
* Source code: https://github.com/cran/sunburstR
* URL: https://github.com/timelyportfolio/sunburstR
* BugReports: https://github.com/timelyportfolio/sunburstR/issues
* Date/Publication: 2019-03-04 09:00:03 UTC
* Number of recursive dependencies: 44

Run `revdep_details(,"sunburstR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > sunburst(sequences)
    Error: No tidyselect variables were registered
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─sunburstR::sunburst(sequences)
    [90m  2. [39m  └─sunburstR:::csv_to_hier(data) [90m00_pkg_src/sunburstR/R/sunburst.R:109:4[39m
    [90m  3. [39m    └─d3r::d3_nest(df, value_cols = "size") [90m00_pkg_src/sunburstR/R/converters.R:16:2[39m
    [90m  4. [39m      ├─dplyr::bind_rows(...)
    [90m  5. [39m      │ ├─dplyr:::flatten_bindable(dots_values(...))
    [90m  6. [39m      │ └─rlang::dots_values(...)
    [90m  7. [39m      ├─d3r:::promote_na(...)
    [90m  8. [39m      │ ├─base::lapply(...)
    [90m  9. [39m      │ └─base::nrow(x)
    [90m 10. [39m      ├─d3r:::change_to_name(...)
    [90m 11. [39m      │ └─base::lapply(...)
    [90m 12. [39m      ├─tidyr::nest(...)
    [90m 13. [39m      └─dplyr::one_of(c(nonnest_cols[length(nonnest_cols)], value_cols))
    [90m 14. [39m        ├─keep %in% .vars
    [90m 15. [39m        └─tidyselect::peek_var
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             dplyr::rename_(y, name = colnames(y)[column])
         })
      17: tidyr::nest(data = data, dplyr::one_of(c(nonnest_cols[length(nonnest_cols)], value_cols)), .key = "children")
      18: dplyr::one_of(c(nonnest_cols[length(nonnest_cols)], value_cols)) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:104
      19: keep %in% .vars
      20: peek_vars()
      21: vars_env$selected %||% abort("No tidyselect variables were registered")
      22: abort("No tidyselect variables were registered")
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 9 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: sunburstR works with both csv and json data (@test-basic.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘treemap’
    ```

# survminer

<details>

* Version: 0.4.4
* Source code: https://github.com/cran/survminer
* URL: http://www.sthda.com/english/rpkgs/survminer/
* BugReports: https://github.com/kassambara/survminer/issues
* Date/Publication: 2019-05-21 05:30:03 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"survminer")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘survminer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggsurvplot_facet
    > ### Title: Facet Survival Curves into Multiple Panels
    > ### Aliases: ggsurvplot_facet
    > 
    > ### ** Examples
    > 
    > library(survival)
    > 
    > # Facet by one grouping variables: rx
    > #::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    > fit <- survfit( Surv(time, status) ~ sex, data = colon )
    > ggsurvplot_facet(fit, colon, facet.by = "rx",
    +                 palette = "jco", pval = TRUE)
    Error in Surv(time, status) : object 'status' not found
    Calls: ggsurvplot_facet ... <Anonymous> -> model.frame.default -> eval -> eval -> Surv
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# tibbletime

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/tibbletime
* URL: https://github.com/business-science/tibbletime
* BugReports: https://github.com/business-science/tibbletime/issues
* Date/Publication: 2019-02-11 17:10:04 UTC
* Number of recursive dependencies: 55

Run `revdep_details(,"tibbletime")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   dplyr::group_by(date) %>%
    +   dplyr::summarise_if(is.numeric, mean)
    # A time tibble: 4 x 7
    [90m# Index: date[39m
      date        open  high   low close    volume adjusted
      [3m[90m<date>[39m[23m     [3m[90m<dbl>[39m[23m [3m[90m<dbl>[39m[23m [3m[90m<dbl>[39m[23m [3m[90m<dbl>[39m[23m     [3m[90m<dbl>[39m[23m    [3m[90m<dbl>[39m[23m
    [90m1[39m 2013-12-31  35.5  36.0  34.9  35.5 60[4m0[24m[4m9[24m[4m1[24m994.     35.5
    [90m2[39m 2014-12-31  68.8  69.6  67.8  68.8 47[4m5[24m[4m3[24m[4m0[24m552.     68.8
    [90m3[39m 2015-12-31  88.7  89.7  87.8  88.8 26[4m9[24m[4m5[24m[4m5[24m191.     88.8
    [90m4[39m 2016-12-30 117.  118.  116.  117.  25[4m4[24m[4m5[24m[4m3[24m798.    117. 
    > 
    > # You can also assign the result to a separate column and use that
    > # to nest on, allowing for 'period nests' that keep the
    > # original dates in the nested tibbles.
    > FB %>%
    +   dplyr::mutate(nest_date = collapse_index(date, "2 year")) %>%
    +   dplyr::group_by(nest_date) %>%
    +   tidyr::nest()
    Error in !.key : invalid argument type
    Calls: %>% ... nest.tbl_time -> <Anonymous> -> nest.grouped_df -> check_key
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: nest(.data, !!!cols) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:101
      10: nest.tbl_time(.data, !!!cols) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:104
      11: tidyr::nest(as_tibble(data), ..., .key = !!.key) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tibbletime/new/tibbletime.Rcheck/00_pkg_src/tibbletime/R/compat-tidyr.R:12
      12: nest.tbl_df(as_tibble(data), ..., .key = !!.key) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:104
      13: check_key(.key) at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/nest.R:120
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 123 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 4 ]
      1. Error: nest() with index creates tbl_df (@test_compat-tidyr.R#22) 
      2. Error: nest() without index stays tbl_time (@test_compat-tidyr.R#31) 
      3. Error: unnest() with index goes back to tbl_time (@test_compat-tidyr.R#38) 
      4. Error: unnest() without index stays tbl_time (@test_compat-tidyr.R#46) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidygenomics

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/tidygenomics
* URL: https://github.com/const-ae/tidygenomics
* Date/Publication: 2019-05-27 09:30:03 UTC
* Number of recursive dependencies: 49

Run `revdep_details(,"tidygenomics")` for more info

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
    > x1 <- data.frame(id = 1:4, bla=letters[1:4],
    +                  chromosome = c("chr1", "chr1", "chr2", "chr1"),
    +                  start = c(100, 200, 300, 400),
    +                  end = c(150, 250, 350, 450))
    > 
    > genome_complement(x1, by=c("chromosome", "start", "end"))
    Error: 'nest_' is defunct.
    Use 'nest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: .Defunct("nest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:186
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 9 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 8 ]
      1. Error: Calculating the complement of a sequence works (@test_complement.R#12) 
      2. Error: Intersection (both) of 2 data frames works as expected (@test_intersect.R#17) 
      3. Error: Intersection of 2 data frames works for multi-overlap ranges (@test_intersect.R#29) 
      4. Error: Intersection of 2 data frames works for multi-overlap ranges the other way around (@test_intersect.R#46) 
      5. Error: Joining with closest works as expected (@test_join_closest.R#17) 
      6. Error: Subtraction of 2 data frames works as expected (@test_subtract.R#18) 
      7. Error: Edge cases of subtraction of 2 data frames works as expected (@test_subtract.R#38) 
      8. Error: during subtraction the intervals are not unified (@test_subtract.R#57) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidync

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/tidync
* URL: https://github.com/ropensci/tidync
* BugReports: https://github.com/ropensci/tidync/issues
* Date/Publication: 2019-05-23 11:10:03 UTC
* Number of recursive dependencies: 68

Run `revdep_details(,"tidync")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("tidync")
      [31m──[39m [31m1. Failure: slicing works (@test-hyper-slice.R#8) [39m [31m────────────────────────────────────────────────[39m
      `tidync(l3file) %>% hyper_filter() %>% hyper_array()` produced warnings.
      
      [31m──[39m [31m2. Failure: select_var is robust (@test-select_var.R#13) [39m [31m─────────────────────────────────────────[39m
      ``%>%`(...)` produced warnings.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 75 | SKIPPED: 5 | WARNINGS: 25 | FAILED: 2 ]
      1. Failure: slicing works (@test-hyper-slice.R#8) 
      2. Failure: select_var is robust (@test-select_var.R#13) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyquant

<details>

* Version: 0.5.6
* Source code: https://github.com/cran/tidyquant
* URL: https://github.com/business-science/tidyquant
* BugReports: https://github.com/business-science/tidyquant/issues
* Date/Publication: 2019-04-22 19:30:03 UTC
* Number of recursive dependencies: 127

Run `revdep_details(,"tidyquant")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m✖[39m [34mdplyr[39m::[32mmatches()[39m         masks [34mtidyr[39m::matches(), [34mtestthat[39m::matches()
      [31m✖[39m [34mlubridate[39m::[32msetdiff()[39m     masks [34mbase[39m::setdiff()
      [31m✖[39m [34mlubridate[39m::[32munion()[39m       masks [34mbase[39m::union()
      > 
      > test_check("tidyquant")
      [31m──[39m [31m1. Failure: Test 1.2 grouped data frames are same with mutate and tq_mutate (@test_tq_mutate.R#93) [39m
      `test1.2a` not identical to `test1.2b`.
      Objects equal but not identical
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 125 | SKIPPED: 1 | WARNINGS: 26 | FAILED: 1 ]
      1. Failure: Test 1.2 grouped data frames are same with mutate and tq_mutate (@test_tq_mutate.R#93) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

# tsibble

<details>

* Version: 0.8.2
* Source code: https://github.com/cran/tsibble
* URL: https://tsibble.tidyverts.org
* BugReports: https://github.com/tidyverts/tsibble/issues
* Date/Publication: 2019-06-10 10:20:03 UTC
* Number of recursive dependencies: 84

Run `revdep_details(,"tsibble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   filter(Sensor == "Southern Cross Station") %>% 
    +   index_by(yrmth = yearmonth(Date_Time)) %>% 
    +   nest() %>% 
    +   mutate(ma = slide_dbl(data, ~ mean(.$Count), .size = 2, .bind = TRUE))
    Error: `abs(.size)` (2) must not be larger than the length (1) of the input.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─`%>%`(...)
    [90m  2. [39m│ ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m│ └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m│   └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m│     └─`_fseq`(`_lhs`)
    [90m  6. [39m│       └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m│         ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m│         └─function_list[[k]](value)
    [90m  9. [39m│           ├─dplyr::mutate(...)
    [90m 10. [39m│           └─dplyr:::mutate.tbl_df(...)
    [90m 11. [39m│             └─dplyr:::mutate_impl(.data, dots, caller_env())
    [90m 12. [39m└─tsibble::slide_dbl(data, ~mean(.$Count), .size = 2, .bind = TRUE)
    [90m 13. [39m  └─tsibble::slider(.x, .size = .size, .step = .step, .bind = .bind)
    Execution halted
    ```

# unpivotr

<details>

* Version: 0.5.1
* Source code: https://github.com/cran/unpivotr
* URL: https://github.com/nacnudus/unpivotr
* BugReports: https://github.com/nacnudus/unpivotr/issues
* Date/Publication: 2019-03-30 19:10:03 UTC
* Number of recursive dependencies: 87

Run `revdep_details(,"unpivotr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: set_repaired_names(x, .name_repair)
      13: set_names(x, repaired_names(names(x), .name_repair = .name_repair))
      14: set_names_impl(x, x, nm, ...)
      15: is_function(nm)
      16: is_closure(x)
      17: repaired_names(names(x), .name_repair = .name_repair)
      18: check_unique(new_name)
      19: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 251 | SKIPPED: 0 | WARNINGS: 155 | FAILED: 1 ]
      1. Error: partition() works (@test-partition.R#59) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# weathercan

<details>

* Version: 0.2.8
* Source code: https://github.com/cran/weathercan
* URL: https://github.com/ropensci/weathercan
* BugReports: https://github.com/ropensci/weathercan/issues
* Date/Publication: 2018-10-08 20:30:02 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"weathercan")` for more info

</details>

## Newly broken

*   R CMD check timed out
    

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 25 marked UTF-8 strings
    ```

# widyr

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/widyr
* URL: http://github.com/dgrtwo/widyr
* BugReports: http://github.com/dgrtwo/widyr/issues
* Date/Publication: 2018-03-11 04:51:37 UTC
* Number of recursive dependencies: 98

Run `revdep_details(,"widyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > library(gapminder)
    > 
    > closest_continent <- gapminder %>%
    +   group_by(continent) %>%
    +   squarely(dist)(country, year, lifeExp)
    Error: 'nest_' is defunct.
    Use 'nest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: eval(quote(`_fseq`(`_lhs`)), env, env)
      15: `_fseq`(`_lhs`)
      16: freduce(value, `_function_list`)
      17: function_list[[i]](value)
      18: tidyr::nest_(., "..data", nest_cols = c(row, column, value))
      19: .Defunct("nest") at /private/tmp/RtmpVXzfzo/R.INSTALLdeda54618d76/tidyr/R/dep-lazyeval.R:186
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 54 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: Can count within groups (@test-pairwise-count.R#104) 
      2. Error: Can perform 'squarely' within groups (@test-squarely.R#20) 
      3. Error: widely works within groups (@test-widely.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# xpose

<details>

* Version: 0.4.4
* Source code: https://github.com/cran/xpose
* URL: https://github.com/UUPharmacometrics/xpose
* BugReports: https://github.com/UUPharmacometrics/xpose/issues
* Date/Publication: 2019-03-21 17:10:03 UTC
* Number of recursive dependencies: 93

Run `revdep_details(,"xpose")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xpose-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_data
    > ### Title: Access model output table data
    > ### Aliases: get_data
    > 
    > ### ** Examples
    > 
    > # By table name
    > sdtab <- get_data(xpdb_ex_pk, 'sdtab001')
    Error: 'unnest_' is defunct.
    Use 'unnest' instead.
    See help("Defunct")
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      [ OK: 389 | SKIPPED: 1 | WARNINGS: 24 | FAILED: 49 ]
      1. Error: Check summary.xpose_data returns a proper message (@test-console_outputs.R#32) 
      2. Error: Check list_vars returns a proper message (@test-console_outputs.R#36) 
      3. Error: (unknown) (@test-edits.R#4) 
      4. Error: works with simulation problems (@test-list_nm_tables.R#50) 
      5. Error: works with estimation problems (@test-list_nm_tables.R#59) 
      6. Error: (unknown) (@test-manual_import.R#7) 
      7. Error: summary is properly created with the appropriate information (@test-model-summary.R#42) 
      8. Failure: no error occurs when xpdb is from a simulation only for not_sim_function dv_vs_idv (@test-plots.R#57) 
      9. Failure: no error occurs when xpdb is from a simulation only for not_sim_function res_vs_idv (@test-plots.R#57) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc    2.9Mb
        help   1.1Mb
    ```

