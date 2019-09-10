# anomalize

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/anomalize
* URL: https://github.com/business-science/anomalize
* BugReports: https://github.com/business-science/anomalize/issues
* Date/Publication: 2018-04-17 11:51:22 UTC
* Number of recursive dependencies: 139

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
    Calls: %>% ... <Anonymous> -> nest.grouped_df -> check_key -> is_missing
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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
      
      [31m──[39m [31m4. Failure: make_combiations works properly (@test-utils.R#148) [39m [31m──────────────────────────────────────────────[39m
      make_combinations(horse = data.frame(x, y), shoe = z) not equal to tibble::tibble(...).
      Cols in y but not x: `y`, `x`. 
      Cols in x but not y: `horse`. 
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 97 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 4 ]
      1. Failure: make_combiations works properly (@test-utils.R#121) 
      2. Failure: make_combiations works properly (@test-utils.R#130) 
      3. Failure: make_combiations works properly (@test-utils.R#139) 
      4. Failure: make_combiations works properly (@test-utils.R#148) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether package ‘CellBench’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘SummarizedExperiment’ was built under R version 3.6.1
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘BiocParallel’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CellBench/new/CellBench.Rcheck/00install.out’ for details.
    ```

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
    

*   checking whether package ‘CNPBayes’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00install.out’ for details.
    ```

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
        R     3.0Mb
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
* Number of recursive dependencies: 122

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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 19 | SKIPPED: 0 | WARNINGS: 9 | FAILED: 1 ]
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
    > library(dplyr)
    
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
    Error: `nest_()` is deprecated as of tidyr 1.0.0.
    Please use `nest()` instead.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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

# easyalluvial

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/easyalluvial
* URL: https://github.com/erblast/easyalluvial
* Date/Publication: 2019-04-01 11:20:12 UTC
* Number of recursive dependencies: 133

Run `revdep_details(,"easyalluvial")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1] "Number of flows: 17245"
      [1] "Original Dataframe reduced to 32 %"
      [1] "Maximum weight of a singfle flow 0.4 %"
      [31m──[39m [31m1. Failure: n_feats == degree (@test_alluvial_model_response.R#260) [39m [31m──────────────────────────────────────────[39m
      `... <- NULL` produced warnings.
      
      [1] "Number of flows: 17245"
      [1] "Original Dataframe reduced to 32 %"
      [1] "Maximum weight of a single flow 0.4 %"
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 65 | SKIPPED: 49 | WARNINGS: 544 | FAILED: 1 ]
      1. Failure: n_feats == degree (@test_alluvial_model_response.R#260) 
      
      Error: testthat unit tests failed
      Execution halted
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
    Error: `unnest_()` is deprecated as of tidyr 1.0.0.
    Please use `unnest()` instead.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Failure: add_woe ruturns no messages nor warnings nor errors (@test_woe.R#95) [39m [31m─────────────────────────────[39m
      `add_woe(df, y, x1)` produced warnings.
      
      [31m──[39m [31m2. Failure: add_woe ruturns no messages nor warnings nor errors (@test_woe.R#96) [39m [31m─────────────────────────────[39m
      `add_woe(df %>% mutate(x3 = rep(c(TRUE, FALSE), 10)), y, x3)` produced warnings.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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
      [31m──[39m [31m1. Failure: We can go all the way (@test-fedregs.R#148) [39m [31m──────────────────────────────────────────────────────[39m
      all(...) isn't true.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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
      10: lifecycle::deprecate_stop("1.0.0", "nest_()", "nest()") at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/dep-lazyeval.R:192
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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

# idmodelr

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/idmodelr
* URL: http://www.samabbott.co.uk/idmodelr, https://github.com/seabbs/idmodelr
* BugReports: https://github.com/seabbs/idmodelr/issues
* Date/Publication: 2019-08-01 09:20:05 UTC
* Number of recursive dependencies: 125

Run `revdep_details(,"idmodelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ## Run scenario analysis
    > scenario_analysis(parameter_df, variable_params = "variable", model = dummy_model,
    +                   sim_fn = dummy_sim_fn, cores = 1, summary_fn = dummy_sum_fn)
    Warning: `.key` is deprecated
    Error: The LHS of `:=` must be a string or a symbol
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─idmodelr::scenario_analysis(...)
    [90m  2. [39m  └─scenario_results %>% group_by(.dots = group_var_string) %>% nest(.key = parameters) [90m00_pkg_src/idmodelr/R/scenario_analysis.R:89:2[39m
    [90m  3. [39m    ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m        └─idmodelr:::`_fseq`(`_lhs`)
    [90m  7. [39m          └─magrittr::freduce(value, `_function_list`)
    [90m  8. [39m            ├─base::withVisible(function_list[[k]](value))
    [90m  9. [39m            └─function_list[[k]](value)
    [90m 10. [39m              ├─tidyr::nest(., .key = parameters)
    [90m 11. [39m              └─tidyr:::nest.grouped_df(., .key = parameters)
    [90m 12. [39m                └─tidyr:::nest.tbl_df(
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      16: lapply(.x, .f, ...)
      17: FUN(X[[i]], ...)
      18: splice(dot_call(capture_dots, frame_env = frame_env, named = named, ignore_empty = ignore_empty, unquote_names = unquote_names, 
             homonyms = homonyms, check_assign = check_assign))
      19: rlang::abort(x)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 46 | SKIPPED: 41 | WARNINGS: 2 | FAILED: 2 ]
      1. Error: scenaria_analysis works correctly on sample data
                with a dummy model and simulation function (@test-scenario_analysis.R#32) 
      2. Error: scenario_analysis works correctly on sample data
                with a dummy model and simulation function over multiple cores (@test-scenario_analysis.R#45) 
      
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
      12: tidyselect::vars_select(tbl_vars(data), !!enquo(cols)) at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/nest.R:311
      13: vars_select_eval(.vars, quos)
      14: map_if(ind_list, is_helper, eval_tidy)
      15: map(.x[sel], .f, ...)
      16: .f(.x[[i]], ...)
      17: model %>% purrr::map(broom::tidy)
      18: eval(lhs, parent, parent)
      19: eval(lhs, parent, parent)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 193 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: (unknown) (@testSII.R#22) 
      
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
      4: abort(message, x = x, expected = expected, actual = actual, what = what, arg = arg, ..., .subclass = c(.subclass, "purrr_error_bad_type"))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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

*   checking whether package ‘plyranges’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/plyranges/new/plyranges.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘BSgenome.Hsapiens.UCSC.hg19’
    ```

# PML

<details>

* Version: 1.0
* Source code: https://github.com/cran/PML
* URL: https://github.com/xinyue-L/PML
* BugReports: https://github.com/xinyue-L/PML/issues
* Date/Publication: 2019-08-23 15:10:05 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"PML")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PML-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: PML-package
    > ### Title: Penalized Multi-Band Learning for Circadian Rhythm Analysis
    > ###   Using Actigraphy
    > ### Aliases: PML-package PML
    > ### Keywords: PML
    > 
    > ### ** Examples
    > 
    > library(PML)
    > ##reformat data for further analysis
    > data(lis3)
    > pa3 <- form(lis3)
    Error: Column `activity` must be length 1 (the group size), not 13
    Execution halted
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
    +       sd = 2))
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
    Error: `nest_()` is deprecated as of tidyr 1.0.0.
    Please use `nest()` instead.
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
      11: lifecycle::deprecate_stop("1.0.0", "nest_()", "nest()") at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/dep-lazyeval.R:192
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 779 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Error: Interrogating for valid row values (@test-interrogate.R#230) 
      
      Error: testthat unit tests failed
      Execution halted
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

## In both

*   checking Rd files ... WARNING
    ```
    prepare_Rd: mzR has been built against a different Rcpp version (1.0.1)
    than is installed on your system (1.0.2). This might lead to errors
    when loading mzR. If you encounter such issues, please send a report,
    including the output of sessionInfo() to the Bioc support forum at 
    https://support.bioconductor.org/. For details see also
    https://github.com/sneumann/mzR/wiki/mzR-Rcpp-compiler-linker-issue.
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
        |===============================================                       |  67%
        |                                                                            
        |====================================================                  |  75%
        |                                                                            
        |==========================================================            |  83%
        |                                                                            
        |================================================================      |  92%
        |                                                                            
        |======================================================================| 100%
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 183 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 1 ]
      1. Error: no files are downloaded when the locations table indicates there is no data (@test-climate_data.R#290) 
      
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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

# RxODE

<details>

* Version: 0.9.1-4
* Source code: https://github.com/cran/RxODE
* URL: https://nlmixrdevelopment.github.io/RxODE/
* BugReports: https://github.com/nlmixrdevelopment/RxODE/issues
* Date/Publication: 2019-08-29 04:40:12 UTC
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
      8: rxCompile.rxModelVars(.mv, dir = mdir, extraC = extraC, debug = debug, modName = modName, package = NULL) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00_pkg_src/RxODE/R/RxODE.R:1355
      9: stop("Error building model on another thread.") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RxODE/new/RxODE.Rcheck/00_pkg_src/RxODE/R/RxODE.R:1417
      
      [====|====|====|====|====|====|====|====|====|====
      [====|====|====|====|====|====|====|====|====|====══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 2349 | SKIPPED: 0 | WARNINGS: 1 | FAILED: 1 ]
      1. Error: Issue #56 (@test-issue-56.R#10) 
      
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
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        doc    1.3Mb
        libs   2.4Mb
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
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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

# sociome

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/sociome
* BugReports: https://github.com/NikKrieger/sociome/issues
* Date/Publication: 2019-08-02 15:20:02 UTC
* Number of recursive dependencies: 95

Run `revdep_details(,"sociome")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      8: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, convert = convert)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 20 | SKIPPED: 0 | WARNINGS: 9 | FAILED: 8 ]
      1. Error: tibble for geoids (@test_arg_tibble_acs.R#112) 
      2. Error: tibble for one state and multiple counties (@test_arg_tibble_acs.R#346) 
      3. Error: tibble for geoids (@test_arg_tibble_decennial2000.R#101) 
      4. Error: tibble for state only (@test_arg_tibble_decennial2000.R#230) 
      5. Error: tibble for one state and multiple counties (@test_arg_tibble_decennial2000.R#353) 
      6. Error: tibble for geoids (@test_arg_tibble_decennial2010.R#101) 
      7. Error: tibble for state only (@test_arg_tibble_decennial2010.R#234) 
      8. Error: tibble for one state and multiple counties (@test_arg_tibble_decennial2010.R#358) 
      
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
      ..$ mail : chr "dla@dst.dk"
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
      .. ..$ :'data.frame':	1422 obs. of  2 variables:
    > 
    > # See the variables as a data frame
    > variables <- get_variables(metadata)
    Error: `unnest_()` is deprecated as of tidyr 1.0.0.
    Please use `unnest()` instead.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("statsDK")
      [31m──[39m [31m1. Error: (unknown) (@test_fixers.R#27) [39m [31m──────────────────────────────────────────────────────────────────────[39m
      `unnest_()` is deprecated as of tidyr 1.0.0.
      Please use `unnest()` instead.
      1: get_variables(metadata) at testthat/test_fixers.R:27
      2: tidyr::unnest_(metadata$variables, "values") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/statsDK/new/statsDK.Rcheck/00_pkg_src/statsDK/R/fixer_functions.R:63
      3: lifecycle::deprecate_stop("1.0.0", "unnest_()", "unnest()") at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/dep-lazyeval.R:316
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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
      Class:   rlang_error/error/condition
      
      [31m──[39m [31m2. Error: nest() (@test-compat-tidyr.R#12) [39m [31m───────────────────────────────────────────────────────────────────[39m
      object 'x_n' not found
      1: expect_equal(x_n$.bootstrap, 1:5) at testthat/test-compat-tidyr.R:12
      2: quasi_label(enquo(object), label, arg = "object")
      3: eval_bare(get_expr(quo), get_env(quo))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 150 | SKIPPED: 0 | WARNINGS: 58 | FAILED: 2 ]
      1. Failure: nest() (@test-compat-tidyr.R#7) 
      2. Error: nest() (@test-compat-tidyr.R#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# suddengains

<details>

* Version: 0.3.0
* Source code: https://github.com/cran/suddengains
* URL: https://github.com/milanwiedemann/suddengains
* BugReports: https://github.com/milanwiedemann/suddengains/issues
* Date/Publication: 2019-08-20 12:40:02 UTC
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
      3: gather(tidyRes, keys = valueCols) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/PerformanceMetrics.R:318
      4: ellipsis::check_dots_unnamed() at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/gather.R:95
      5: stop_dots(message = paste0(length(named), " components of `...` had unexpected names."), dot_names = named, .subclass = "rlib_error_dots_named")
      6: abort(message, .subclass = c(.subclass, "rlib_error_dots"), ...)
      
      
      Option rerun is set to `FALSE`:
      Rerunning performance metrics only for the following methods: BH2
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 221 | SKIPPED: 0 | WARNINGS: 6 | FAILED: 1 ]
      1. Error: test='estimatePerformanceMetrics' returns informative messages (@test_estimatePerformanceMetrics.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether package ‘SummarizedBenchmark’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘SummarizedExperiment’ was built under R version 3.6.1
      Warning: package ‘GenomicRanges’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
      Warning: package ‘BiocParallel’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00install.out’ for details.
    ```

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
    Calls: %>% ... <Anonymous> -> nest.grouped_df -> check_key -> is_missing
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      10: nest.tbl_time(.data, !!!cols) at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/nest.R:128
      11: tidyr::nest(as_tibble(data), ..., .key = !!.key) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tibbletime/new/tibbletime.Rcheck/00_pkg_src/tibbletime/R/compat-tidyr.R:12
      12: nest.tbl_df(as_tibble(data), ..., .key = !!.key) at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/nest.R:128
      13: check_key(.key) at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/nest.R:144
      14: is_missing(.key) at /private/tmp/Rtmpn4E0mo/R.INSTALL4d3f341731e7/tidyr/R/nest.R:180
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 123 | SKIPPED: 0 | WARNINGS: 2 | FAILED: 4 ]
      1. Error: nest() with index creates tbl_df (@test_compat-tidyr.R#22) 
      2. Error: nest() without index stays tbl_time (@test_compat-tidyr.R#31) 
      3. Error: unnest() with index goes back to tbl_time (@test_compat-tidyr.R#38) 
      4. Error: unnest() without index stays tbl_time (@test_compat-tidyr.R#46) 
      
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
* Number of recursive dependencies: 139

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
      [31m──[39m [31m1. Failure: Test 1.2 grouped data frames are same with mutate and tq_mutate (@test_tq_mutate.R#93) [39m [31m───────────[39m
      `test1.2a` not identical to `test1.2b`.
      Objects equal but not identical
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
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

* Version: 0.8.3
* Source code: https://github.com/cran/tsibble
* URL: https://tsibble.tidyverts.org
* BugReports: https://github.com/tidyverts/tsibble/issues
* Date/Publication: 2019-07-29 17:40:02 UTC
* Number of recursive dependencies: 83

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

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > set.seed(2018)
      > test_check("tsibble")
      [31m──[39m [31m1. Failure: nest() (@test-tidyr.R#99) [39m [31m────────────────────────────────────────────────────────────────────────[39m
      `nested_ped` inherits from `tbl_df/tbl/data.frame` not `lst_ts`.
      
      [31m──[39m [31m2. Failure: dplyr verbs for lst_ts (@test-tidyr.R#201) [39m [31m───────────────────────────────────────────────────────[39m
      nest_t %>% select(data2 = data) inherits from `tbl_df/tbl/data.frame` not `lst_ts`.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 813 | SKIPPED: 3 | WARNINGS: 2 | FAILED: 2 ]
      1. Failure: nest() (@test-tidyr.R#99) 
      2. Failure: dplyr verbs for lst_ts (@test-tidyr.R#201) 
      
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
* Number of recursive dependencies: 117

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
    Error: `unnest_()` is deprecated as of tidyr 1.0.0.
    Please use `unnest()` instead.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 389 | SKIPPED: 1 | WARNINGS: 25 | FAILED: 49 ]
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

