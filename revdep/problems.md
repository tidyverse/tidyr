# bayesammi

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/bayesammi
* Date/Publication: 2018-04-12 09:03:23 UTC
* Number of recursive dependencies: 53

Run `revdep_details(,"bayesammi")` for more info

</details>

## Newly broken

*   R CMD check timed out
    

# bench

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/bench
* URL: https://github.com/r-lib/bench
* BugReports: https://github.com/r-lib/bench/issues
* Date/Publication: 2019-04-29 20:30:02 UTC
* Number of recursive dependencies: 61

Run `revdep_details(,"bench")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    + }
    Loading required package: ggplot2
    Loading required namespace: tidyr
    Warning: `cols` is now required.
    Please use `cols = c(result, memory, time, gc)`
    Error: Incompatible lengths: 4958, 42.
    Backtrace:
    [90m     [39m█
    [90m  1. [39m├─ggplot2::autoplot(res)
    [90m  2. [39m└─bench:::autoplot.bench_mark(res)
    [90m  3. [39m  └─tidyr::unnest(object) [90m00_pkg_src/bench/R/autoplot.R:58:2[39m
    [90m  4. [39m    ├─tidyr::unnest(...)
    [90m  5. [39m    ├─bench:::unnest.bench_mark(...)
    [90m  6. [39m    │ └─base::suppressWarnings(NextMethod(.Generic, data, time, gc, .drop = FALSE)) [90m00_pkg_src/bench/R/mark.R:296:2[39m
    [90m  7. [39m    │   └─base::withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
    [90m  8. [39m    ├─base::NextMethod(.Generic, data, time, gc, .drop = FALSE) [90m00_pkg_src/bench/R/mark.R:296:2[39m
    [90m  9. [39m    └─tidyr:::unnest.data.frame(...)
    [90m 10. [39m      └─tidyr::unchop(data, !!cols, keep_empty = keep_empty, ptype = ptype)
    [90m 11. [39m        └─purrr::pmap(as.list(data)[cols], vec_recycle_common)
    [90m 12. [39m     
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: unnest.bench_mark(data, cols = !!cols, names_sep = names_sep, keep_empty = keep_empty, ptype = ptype) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:233
      4: suppressWarnings(NextMethod(.Generic, data, time, gc, .drop = FALSE)) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bench/new/bench.Rcheck/00_pkg_src/bench/R/mark.R:296
      5: withCallingHandlers(expr, warning = function(w) invokeRestart("muffleWarning"))
      6: NextMethod(.Generic, data, time, gc, .drop = FALSE) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bench/new/bench.Rcheck/00_pkg_src/bench/R/mark.R:296
      7: unnest.data.frame(data, cols = !!cols, names_sep = names_sep, keep_empty = keep_empty, ptype = ptype, .drop = FALSE)
      8: map(data[[col]], as_df, col = col) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:252
      9: .f(.x[[i]], ...)
      10: stop("Input must be list of vectors", call. = FALSE) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:272
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 184 SKIPPED: 1 WARNINGS: 1 FAILED: 1
      1. Error: unnest.bench_mark: does not contain result or memory columns (@test-mark.R#185) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# cellbaseR

<details>

* Version: 1.6.1
* Source code: https://github.com/cran/cellbaseR
* URL: https://github.com/melsiddieg/cellbaseR
* Date/Publication: 2019-04-08
* Number of recursive dependencies: 131

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
    Error in names[j:(j + cols[[i]] - 1)] <- names(x[[i]]) : 
      replacement has length zero
    Calls: createGeneModel ... <Anonymous> -> unnest.data.frame -> unpack -> flatten_at
    Execution halted
    ```

# collector

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/collector
* URL: https://collector.tidyrisk.org
* BugReports: https://github.com/davidski/collector/issues
* Date/Publication: 2019-05-21 07:30:03 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"collector")` for more info

</details>

## Newly broken

*   checking whether package ‘collector’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/collector/new/collector.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘collector’ ...
** package ‘collector’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : object ‘vec_proxy_equal’ is not exported by 'namespace:vctrs'
ERROR: lazy loading failed for package ‘collector’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/collector/new/collector.Rcheck/collector’

```
### CRAN

```
* installing *source* package ‘collector’ ...
** package ‘collector’ successfully unpacked and MD5 sums checked
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
** testing if installed package can be loaded
* DONE (collector)

```
# cutpointr

<details>

* Version: 0.7.6
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2019-03-27 10:10:03 UTC
* Number of recursive dependencies: 69

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
      OK: 28 SKIPPED: 0 WARNINGS: 0 FAILED: 45
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

# d3r

<details>

* Version: 0.8.5
* Source code: https://github.com/cran/d3r
* URL: https://github.com/timelyportfolio/d3r
* BugReports: https://github.com/timelyportfolio/d3r/issues
* Date/Publication: 2019-01-29 09:00:03 UTC
* Number of recursive dependencies: 44

Run `revdep_details(,"d3r")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +   select(Class,Age,Survived,Sex,Freq) %>%
    +   d3_nest(value_cols="Freq", root="titanic")
    Warning: .key is deprecated
    Error: No tidyselect variables were registered
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─`%>%`(...)
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─global::`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          ├─base::withVisible(function_list[[k]](value))
    [90m  8. [39m          └─function_list[[k]](value)
    [90m  9. [39m            └─d3r::d3_nest(., value_cols = "Freq", root = "titanic")
    [90m 10. [39m              ├─dplyr::bind_rows(...) [90m00_pkg_src/d3r/R/hierarchy.R:91:2[39m
    [90m 11. [39m              │ ├─dplyr:::flatten_bindable(dots_values(...))
    [90m 12. [39m              │ └─rlang::dots_values(...)
    [90m 13. [39m              ├─d3r:::promote_na(...)
    [90m 14. [39m         
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# easyalluvial

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/easyalluvial
* URL: https://github.com/erblast/easyalluvial
* Date/Publication: 2019-04-01 11:20:12 UTC
* Number of recursive dependencies: 126

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
      OK: 65 SKIPPED: 49 WARNINGS: 581 FAILED: 2
      1. Failure: n_feats == degree (@test_alluvial_model_response.R#260) 
      2. Error: palettes (@test_palette.R#15) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# echarts4r

<details>

* Version: 0.2.2
* Source code: https://github.com/cran/echarts4r
* URL: http://echarts4r.john-coene.com/
* BugReports: https://github.com/JohnCoene/echarts4r/issues
* Date/Publication: 2019-04-09 14:12:48 UTC
* Number of recursive dependencies: 116

Run `revdep_details(,"echarts4r")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > df %>% 
    +   e_charts() %>% 
    +   e_sunburst(parent, child, value) %>% 
    +   e_theme("westeros")
    Warning: .key is deprecated
    Error: No tidyselect variables were registered
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─df %>% e_charts() %>% e_sunburst(parent, child, value) %>% e_theme("westeros")
    [90m  2. [39m  ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  3. [39m  └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  4. [39m    └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  5. [39m      └─global::`_fseq`(`_lhs`)
    [90m  6. [39m        └─magrittr::freduce(value, `_function_list`)
    [90m  7. [39m          └─function_list[[i]](value)
    [90m  8. [39m            └─echarts4r::e_sunburst(., parent, child, value)
    [90m  9. [39m              └─echarts4r::e_sunburst_(...) [90m00_pkg_src/echarts4r/R/add.R:931:2[39m
    [90m 10. [39m                └─echarts4r:::.build_sun(e, parent, child, value, itemStyle) [90m00_pkg_src/echarts4r/R/add_.R:967:2[39m
    [90m 11. [39m                  └─d3r::d3_nest(data, value_cols = cols, json = FALSE, ro
    Execution halted
    ```

## Newly fixed

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        R             2.0Mb
        htmlwidgets   3.6Mb
    ```

# egor

<details>

* Version: 0.19.1
* Source code: https://github.com/cran/egor
* URL: https://github.com/tilltnet/egor, https://tilltnet.github.io/egor/
* BugReports: https://github.com/tilltnet/egor/issues
* Date/Publication: 2019-02-01 16:43:22 UTC
* Number of recursive dependencies: 57

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
      OK: 4 SKIPPED: 0 WARNINGS: 0 FAILED: 19
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

# evaluator

<details>

* Version: 0.4.0
* Source code: https://github.com/cran/evaluator
* URL: https://evaluator.tidyrisk.org
* BugReports: https://github.com/davidski/evaluator/issues
* Date/Publication: 2019-04-10 16:17:58 UTC
* Number of recursive dependencies: 134

Run `revdep_details(,"evaluator")` for more info

</details>

## Newly broken

*   checking whether package ‘evaluator’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/evaluator/new/evaluator.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘evaluator’ ...
** package ‘evaluator’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : object ‘vec_proxy_equal’ is not exported by 'namespace:vctrs'
ERROR: lazy loading failed for package ‘evaluator’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/evaluator/new/evaluator.Rcheck/evaluator’

```
### CRAN

```
* installing *source* package ‘evaluator’ ...
** package ‘evaluator’ successfully unpacked and MD5 sums checked
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
** testing if installed package can be loaded
* DONE (evaluator)

```
# fuzzyjoin

<details>

* Version: 0.1.4
* Source code: https://github.com/cran/fuzzyjoin
* Date/Publication: 2018-03-02 09:10:25 UTC
* Number of recursive dependencies: 77

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
      See help("Defunct")
      1: genome_inner_join(x1, x2, by = c("chromosome", "start", "end")) at testthat/test_genome_join.R:18
      2: genome_join(x, y, by, mode = "inner", ...) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/genome_join.R:90
      3: fuzzy_join(x, y, mode = mode, index_match_fun = f, multi_by = by) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/genome_join.R:83
      4: index_match_fun(d1, d2) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/fuzzy_join.R:231
      5: tidyr::nest_(x, "x_data", colnames(x)[-1]) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fuzzyjoin/new/fuzzyjoin.Rcheck/00_pkg_src/fuzzyjoin/R/genome_join.R:64
      6: .Defunct("nest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:186
      7: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 218 SKIPPED: 0 WARNINGS: 146 FAILED: 1
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
    ...
    > df_ <- simulate_pops(pop_n = 4, aims_n = 50)
    > df_db <- pops_to_DB(df_)
    Warning: .key is deprecated
    > profile <- random_AIMs_profile(df_db, keep_pop = TRUE)
    Warning: `cols` is now required.
    Please use `cols = c()`
    Error: `n` must evaluate to column positions or names, not a logical vector
    Backtrace:
    [90m     [39m█
    [90m  1. [39m└─genogeographer::random_AIMs_profile(df_db, keep_pop = TRUE)
    [90m  2. [39m  └─genogeographer:::rand_profile(...) [90m00_pkg_src/genogeographer/R/random_AIMs_profile.R:66:2[39m
    [90m  3. [39m    └─df %>% select(pop, n) %>% distinct() [90m00_pkg_src/genogeographer/R/random_AIMs_profile.R:28:4[39m
    [90m  4. [39m      ├─base::withVisible(eval(quote(`_fseq`(`_lhs`)), env, env))
    [90m  5. [39m      └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  6. [39m        └─base::eval(quote(`_fseq`(`_lhs`)), env, env)
    [90m  7. [39m          └─genogeographer:::`_fseq`(`_lhs`)
    [90m  8. [39m            └─magrittr::freduce(value, `_function_list`)
    [90m  9. [39m              └─function_list[[i]](value)
    [90m 10. [39m                ├─dplyr::select(., pop, n)
    [90m 11. [39m                └─dplyr:::select.data.frame(., po
    Execution halted
    ```

# ggasym

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/ggasym
* URL: https://github.com/jhrcook/ggasym https://jhrcook.github.io/ggasym/
* BugReports: https://github.com/jhrcook/ggasym/issues
* Date/Publication: 2019-03-23 16:50:03 UTC
* Number of recursive dependencies: 69

Run `revdep_details(,"ggasym")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    3 C B         3         group2
    > 
    > asymmetrise(df, a, b)
      a b untouched grouping_value
    1 A C         1         group1
    2 B A         2         group1
    3 C B         3         group2
    4 C A         1         group1
    5 A B         2         group1
    6 B C         3         group2
    7 A A        NA           <NA>
    8 B B        NA           <NA>
    9 C C        NA           <NA>
    > 
    > grouped_df <- dplyr::group_by(df, grouping_value)
    > asymmetrise(grouped_df, a, b)
    Warning: .key is deprecated
    Error in purrr::map(.grp_nest, function(df) { : 
      object '.grp_nest' not found
    Calls: asymmetrise ... <Anonymous> -> mutate.tbl_df -> mutate_impl -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: mutate.tbl_df(., .grp_nest = purrr::map(.grp_nest, function(df) {
             new_df <- bind_missing_combs(df, !!.x, !!.y)
         }))
      24: mutate_impl(.data, dots, caller_env())
      25: purrr::map(.grp_nest, function(df) {
             new_df <- bind_missing_combs(df, ~a, ~b)
         })
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 260 SKIPPED: 0 WARNINGS: 2 FAILED: 2
      1. Error: adding all combinations (@test-asymmetrise.R#89) 
      2. Error: data frame is asymmeterized (@test-asymmetrise.R#151) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggmap

<details>

* Version: 3.0.0
* Source code: https://github.com/cran/ggmap
* URL: https://github.com/dkahle/ggmap
* BugReports: https://github.com/dkahle/ggmap/issues
* Date/Publication: 2019-02-05 10:19:04
* Number of recursive dependencies: 57

Run `revdep_details(,"ggmap")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
    ```

# gratia

<details>

* Version: 0.2-8
* Source code: https://github.com/cran/gratia
* URL: https://gavinsimpson.github.io/gratia
* BugReports: https://github.com/gavinsimpson/gratia/issues
* Date/Publication: 2019-03-12 23:00:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"gratia")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      14: vec_sort(vec_unique(x)) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/expand.R:128
      15: vec_order(x, direction = direction, na_value = na_value) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:118
      16: order_proxy(vec_proxy_compare(x), direction = direction, na_value = na_value) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:107
      17: `$<-`(`*tmp*`, "decreasing", value = FALSE) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:131
      18: `$<-.data.frame`(`*tmp*`, "decreasing", value = FALSE) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:131
      19: stop(sprintf(ngettext(N, "replacement has %d row, data has %d", "replacement has %d rows, data has %d"), 
             N, nrows), domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 424 SKIPPED: 64 WARNINGS: 0 FAILED: 2
      1. Error: data_slice works for a GAM (@test-data-slice.R#15) 
      2. Error: data_slice works for a GAM with factor by (@test-data-slice.R#77) 
      
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
* Number of recursive dependencies: 124

Run `revdep_details(,"HTSSIP")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: eval(quote(`_fseq`(`_lhs`)), env, env)
      6: `_fseq`(`_lhs`)
      7: freduce(value, `_function_list`)
      8: function_list[[i]](value)
      9: tidyr::nest_(., key_col = "data")
      10: .Defunct("nest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:186
      11: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 107 SKIPPED: 18 WARNINGS: 0 FAILED: 2
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
* Number of recursive dependencies: 48

Run `revdep_details(,"ICD10gm")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(ICD10gm)
      > 
      > test_check("ICD10gm")
      [31m──[39m [31m1. Failure: Expands down the hierarchy (@test-icd_expand.R#52) [39m [31m───────────────────────────────────[39m
      `ICD10gm::icd_expand(...)` produced warnings.
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 43 SKIPPED: 0 WARNINGS: 10 FAILED: 1
      1. Failure: Expands down the hierarchy (@test-icd_expand.R#52) 
      
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
* Number of recursive dependencies: 58

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
      21: unnest.data.frame(., fun_names) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:233
      22: unchop(data, !!cols, keep_empty = keep_empty, ptype = ptype) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:255
      23: vec_slice(data, rep(vec_seq_along(data), n)) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/chop.R:88
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 246 SKIPPED: 4 WARNINGS: 18 FAILED: 2
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
* Number of recursive dependencies: 39

Run `revdep_details(,"kntnr")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: freduce(value, `_function_list`)
      7: withVisible(function_list[[k]](value))
      8: function_list[[k]](value)
      9: kntn_unnest(.)
      10: tidyr::unnest_(records, col, .drop = FALSE) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/kntnr/new/kntnr.Rcheck/00_pkg_src/kntnr/R/kntn_unnest.R:35
      11: .Defunct("unnest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:311
      12: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 67 SKIPPED: 0 WARNINGS: 0 FAILED: 2
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
* Number of recursive dependencies: 55

Run `revdep_details(,"modelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
         mpg
       [3m[90m<dbl>[39m[23m
    [90m 1[39m  10.4
    [90m 2[39m  13.0
    [90m 3[39m  15.6
    [90m 4[39m  18.2
    [90m 5[39m  20.8
    [90m 6[39m  23.5
    [90m 7[39m  26.1
    [90m 8[39m  28.7
    [90m 9[39m  31.3
    [90m10[39m  33.9
    > 
    > # If you optionally supply a model, missing predictors will
    > # be filled in with typical values
    > mod <- lm(mpg ~ wt + cyl + vs, data = mtcars)
    > data_grid(mtcars, .model = mod)
    Error in `$<-.data.frame`(`*tmp*`, "decreasing", value = FALSE) : 
      replacement has 1 row, data has 0
    Calls: data_grid ... vec_sort -> vec_order -> order_proxy -> $<- -> $<-.data.frame
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: vec_sort(vec_unique(x)) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/expand.R:128
      6: vec_order(x, direction = direction, na_value = na_value) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:118
      7: order_proxy(vec_proxy_compare(x), direction = direction, na_value = na_value) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:107
      8: `$<-`(`*tmp*`, "decreasing", value = FALSE) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:131
      9: `$<-.data.frame`(`*tmp*`, "decreasing", value = FALSE) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/compare.R:131
      10: stop(sprintf(ngettext(N, "replacement has %d row, data has %d", "replacement has %d rows, data has %d"), 
             N, nrows), domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 119 SKIPPED: 0 WARNINGS: 0 FAILED: 2
      1. Error: can generate typical values (@test-data-grid.R#10) 
      2. Error: data_grid() returns a tibble (@test-data-grid.R#18) 
      
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
* Number of recursive dependencies: 82

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
      OK: 453 SKIPPED: 0 WARNINGS: 26 FAILED: 23
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
* Number of recursive dependencies: 100

Run `revdep_details(,"pammtools")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: vec_fill_fun(.direction) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/fill.R:30
      7: match.arg(.direction) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/fill.R:35
      8: stop("'arg' must be of length 1")
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 262 SKIPPED: 0 WARNINGS: 8 FAILED: 6
      1. Error: Trafo works for list objects (with TDCs) (@test-as-ped.R#38) 
      2. Error: Formula special 'concurrent' works as expected (@test-specials.R#36) 
      3. Error: Covariate to matrix Transformation works (@test-specials.R#49) 
      4. Error: Concurrent TDC are transformed correctly (@test-tdc-transform.R#18) 
      5. Error: split_tdc works correctly (@test-tdc-transform.R#113) 
      6. Error: ped class is preserved after tidyr operations (@test-tidyverse-S3methods.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
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
    [90m  5. [39m      └─global::`_fseq`(`_lhs`)
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
      18: set_names_impl(x, x, nm, ...) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/attr.R:163
      19: is_function(nm) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/attr.R:170
      20: is_closure(x) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/fn.R:275
      21: repaired_names(names(x), .name_repair = .name_repair)
      22: check_unique(new_name)
      23: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 151 SKIPPED: 0 WARNINGS: 47 FAILED: 1
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
* Number of recursive dependencies: 53

Run `revdep_details(,"PHEindicatormethods")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: tidyselect::vars_select(names(data), !!enquo(cols)) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:250
      13: vars_select_eval(.vars, quos)
      14: map_if(ind_list, is_helper, eval_tidy)
      15: map(.x[sel], .f, ...)
      16: .f(.x[[i]], ...)
      17: model %>% purrr::map(broom::tidy) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/eval-tidy.R:153
      18: eval(lhs, parent, parent)
      19: eval(lhs, parent, parent)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 193 SKIPPED: 0 WARNINGS: 0 FAILED: 1
      1. Error: (unknown) (@testSII.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# plyranges

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/plyranges
* BugReports: https://github.com/sa-lee/plyranges
* Date/Publication: 2018-10-30
* Number of recursive dependencies: 110

Run `revdep_details(,"plyranges")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘plyranges-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: unnest.GenomicRanges
    > ### Title: Expand list-columns in a Ranges object
    > ### Aliases: unnest.GenomicRanges
    > 
    > ### ** Examples
    > 
    > grng <- as_granges(data.frame(seqnames = "chr1", start = 20:23, width = 1000))
    > grng <- mutate(grng, exon_id = IntegerList(a = 1, b = c(4,5), c = 3, d = c(2,5)))
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
      OK: 265 SKIPPED: 0 WARNINGS: 9 FAILED: 8
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
* Number of recursive dependencies: 52

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
      5: `_fseq`(`_lhs`)
      6: freduce(value, `_function_list`)
      7: withVisible(function_list[[k]](value))
      8: function_list[[k]](value)
      9: interrogate(.)
      10: tidyr::nest_(data = problem_rows, key_col = "data", nest_cols = names_problem_rows) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pointblank/new/pointblank.Rcheck/00_pkg_src/pointblank/R/interrogate.R:590
      11: .Defunct("nest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:186
      12: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 779 SKIPPED: 0 WARNINGS: 0 FAILED: 1
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

# recipes

<details>

* Version: 0.1.5
* Source code: https://github.com/cran/recipes
* URL: https://github.com/tidymodels/recipes
* BugReports: https://github.com/tidymodels/recipes/issues
* Date/Publication: 2019-03-21 08:50:03 UTC
* Number of recursive dependencies: 110

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
      OK: 1152 SKIPPED: 4 WARNINGS: 693 FAILED: 6
      1. Failure: basic usage (@test_downsample.R#44) 
      2. Failure: new levels (@test_dummies.R#189) 
      3. Failure: missing columns (@test_interact.R#185) 
      4. Failure: in recipe (@test_range_check.R#38) 
      5. Failure: works with all_predictors() selector (@test_relu.R#66) 
      6. Failure: basic usage (@test_upsample.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RcppRoll’
      All declared Imports should be used.
    ```

# rmapzen

<details>

* Version: 0.4.1
* Source code: https://github.com/cran/rmapzen
* URL: https://tarakc02.github.io/rmapzen/
* BugReports: https://github.com/tarakc02/rmapzen/issues
* Date/Publication: 2018-10-07 21:00:02 UTC
* Number of recursive dependencies: 71

Run `revdep_details(,"rmapzen")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      'unnest_' is defunct.
      Use 'unnest' instead.
      See help("Defunct")
      1: as.data.frame(marina_walks) at testthat/test-as-data-frame.R:10
      2: as.data.frame.mapzen_isochrone_list(marina_walks)
      3: tidyr::unnest_(res, "contours") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rmapzen/new/rmapzen.Rcheck/00_pkg_src/rmapzen/R/tidy.R:37
      4: .Defunct("unnest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:311
      5: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 202 SKIPPED: 2 WARNINGS: 0 FAILED: 1
      1. Error: as.data.frame converts isochrone results to sf (@test-as-data-frame.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# rnoaa

<details>

* Version: 0.8.4
* Source code: https://github.com/cran/rnoaa
* URL: https://github.com/ropensci/rnoaa
* BugReports: https://github.com/ropensci/rnoaa/issues
* Date/Publication: 2019-01-14 23:10:03 UTC
* Number of recursive dependencies: 136

Run `revdep_details(,"rnoaa")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        vign   1.2Mb
    ```

# seqCAT

<details>

* Version: 1.4.1
* Source code: https://github.com/cran/seqCAT
* Date/Publication: 2019-01-14
* Number of recursive dependencies: 103

Run `revdep_details(,"seqCAT")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: withCallingHandlers(expr, message = function(c) invokeRestart("muffleMessage"))
      3: create_profile(vcf_file = file1, sample = "sample1", output_file = "profile_1.txt", filter_depth = 10, 
             python = FALSE)
      4: create_profile_R(vcf_file, sample, output_file, filter_depth) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00_pkg_src/seqCAT/R/create_profile.R:51
      5: filter_annotations(data) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00_pkg_src/seqCAT/R/create_profile.R:221
      6: tidyr::unnest_(data, "ANN") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00_pkg_src/seqCAT/R/create_profile.R:283
      7: .Defunct("unnest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:311
      8: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 85 SKIPPED: 0 WARNINGS: 0 FAILED: 1
      1. Error: (unknown) (@test_01_create_profile.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking whether package ‘seqCAT’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘VariantAnnotation’ was built under R version 3.5.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/seqCAT/new/seqCAT.Rcheck/00install.out’ for details.
    ```

# simTool

<details>

* Version: 1.1.3
* Source code: https://github.com/cran/simTool
* URL: https://github.com/MarselScheer/simTool
* BugReports: https://github.com/MarselScheer/simTool/issues
* Date/Publication: 2019-03-22 14:00:02 UTC
* Number of recursive dependencies: 60

Run `revdep_details(,"simTool")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 108 SKIPPED: 0 WARNINGS: 19 FAILED: 12
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

* Version: 1.0.2
* Source code: https://github.com/cran/slinky
* Date/Publication: 2019-02-28
* Number of recursive dependencies: 95

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
      OK: 32 SKIPPED: 0 WARNINGS: 0 FAILED: 7
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
* Number of recursive dependencies: 65

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
      [31m──[39m [31m1. Error: (unknown) (@test_fixers.R#27) [39m [31m──────────────────────────────────────────────────────────[39m
      'unnest_' is defunct.
      Use 'unnest' instead.
      See help("Defunct")
      1: get_variables(metadata) at testthat/test_fixers.R:27
      2: tidyr::unnest_(metadata$variables, "values") at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/statsDK/new/statsDK.Rcheck/00_pkg_src/statsDK/R/fixer_functions.R:63
      3: .Defunct("unnest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:311
      4: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 14 SKIPPED: 0 WARNINGS: 0 FAILED: 1
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

* Version: 0.0.2
* Source code: https://github.com/cran/strapgod
* URL: https://github.com/DavisVaughan/strapgod
* BugReports: https://github.com/DavisVaughan/strapgod/issues
* Date/Publication: 2019-05-16 15:30:04 UTC
* Number of recursive dependencies: 54

Run `revdep_details(,"strapgod")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: set_names_impl(x, x, nm, ...) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/attr.R:163
      23: is_function(nm) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/attr.R:170
      24: is_closure(x) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/fn.R:275
      25: repaired_names(names(x), .name_repair = .name_repair)
      26: check_unique(new_name)
      27: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 147 SKIPPED: 0 WARNINGS: 62 FAILED: 3
      1. Error: can correctly double bootstrap (@test-bootstrapify.R#69) 
      2. Failure: nest() (@test-compat-tidyr.R#17) 
      3. Error: group_keys() can find the virtual groups (@test-dplyr-group-funs.R#133) 
      
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

# sunburstR

<details>

* Version: 2.1.1
* Source code: https://github.com/cran/sunburstR
* URL: https://github.com/timelyportfolio/sunburstR
* BugReports: https://github.com/timelyportfolio/sunburstR/issues
* Date/Publication: 2019-03-04 09:00:03 UTC
* Number of recursive dependencies: 43

Run `revdep_details(,"sunburstR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > sunburst(sequences)
    Warning: .key is deprecated
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
      18: dplyr::one_of(c(nonnest_cols[length(nonnest_cols)], value_cols)) at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/nest.R:107
      19: keep %in% .vars
      20: peek_vars()
      21: vars_env$selected %||% abort("No tidyselect variables were registered")
      22: abort("No tidyselect variables were registered")
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 9 SKIPPED: 0 WARNINGS: 0 FAILED: 1
      1. Error: sunburstR works with both csv and json data (@test-basic.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘treemap’
    ```

# tidygenomics

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/tidygenomics
* URL: https://github.com/const-ae/tidygenomics
* Date/Publication: 2019-05-27 09:30:03 UTC
* Number of recursive dependencies: 48

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
      5: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 9 SKIPPED: 1 WARNINGS: 0 FAILED: 8
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

# tidygraph

<details>

* Version: 1.1.2
* Source code: https://github.com/cran/tidygraph
* URL: https://github.com/thomasp85/tidygraph
* BugReports: https://github.com/thomasp85/tidygraph/issues
* Date/Publication: 2019-02-18 22:30:03 UTC
* Number of recursive dependencies: 95

Run `revdep_details(,"tidygraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: morph
    > ### Title: Create a temporary alternative representation of the graph to
    > ###   compute on
    > ### Aliases: morph unmorph crystallise crystallize convert
    > 
    > ### ** Examples
    > 
    > create_notable('meredith') %>%
    +   mutate(group = group_infomap()) %>%
    +   morph(to_contracted, group) %>%
    +   mutate(group_centrality = centrality_pagerank()) %>%
    +   unmorph()
    Warning: .key is deprecated
    Warning: Unknown or uninitialised column: '.orig_data'.
    Warning: Unknown or uninitialised column: '.orig_data'.
    Error in `$<-.data.frame`(`*tmp*`, ".orig_data", value = list()) : 
      replacement has 0 rows, data has 10
    Calls: %>% ... morph -> morph.tbl_graph -> .f -> $<- -> $<-.data.frame
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      7: function_list[[i]](value)
      8: morph(., to_contracted, group)
      9: morph.tbl_graph(., to_contracted, group) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/morph.R:71
      10: .f(.data, ...) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/morph.R:104
      11: `$<-`(`*tmp*`, ".orig_data", value = list()) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/morphers.R:248
      12: `$<-.data.frame`(`*tmp*`, ".orig_data", value = list()) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/morphers.R:248
      13: stop(sprintf(ngettext(N, "replacement has %d row, data has %d", "replacement has %d rows, data has %d"), 
             N, nrows), domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 273 SKIPPED: 0 WARNINGS: 3 FAILED: 1
      1. Error: to_contracted works (@test-morph.R#107) 
      
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
      OK: 75 SKIPPED: 5 WARNINGS: 25 FAILED: 2
      1. Failure: slicing works (@test-hyper-slice.R#8) 
      2. Failure: select_var is robust (@test-select_var.R#13) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# trelliscopejs

<details>

* Version: 0.1.18
* Source code: https://github.com/cran/trelliscopejs
* URL: https://github.com/hafen/trelliscopejs
* BugReports: https://github.com/hafen/trelliscopejs/issues
* Date/Publication: 2019-01-09 06:20:03 UTC
* Number of recursive dependencies: 119

Run `revdep_details(,"trelliscopejs")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      17: vec_type2_dispatch(x = x, y = y, x_arg = x_arg, y_arg = y_arg) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/type-tibble.R:12
      18: vec_type2.integer(x = x, y = y, x_arg = x_arg, y_arg = y_arg) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/type2.R:46
      19: vec_type2.integer.integer(x = x, y = y, x_arg = x_arg, y_arg = y_arg) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/type2.R:79
      20: shape_match(integer(), x, y) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/type2.R:101
      21: shape_common(x, y) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/shape.R:15
      22: dim2(shape(x), shape(y)) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/shape.R:20
      23: shape(x) at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/shape.R:20
      24: abort("Only bare vectors have shapes.") at /private/tmp/RtmpOo2RHI/R.INSTALL8d285a08eb82/vctrs/R/shape.R:70
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 WARNINGS: 694 FAILED: 1
      1. Error: examples run without barfing (@test-trelliscope.R#140) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tsibble

<details>

* Version: 0.8.0
* Source code: https://github.com/cran/tsibble
* URL: https://tsibble.tidyverts.org
* BugReports: https://github.com/tidyverts/tsibble/issues
* Date/Publication: 2019-04-28 11:20:03 UTC
* Number of recursive dependencies: 83

Run `revdep_details(,"tsibble")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      [3m[90m<chr>[39m[23m [3m[90m<list>[39m[23m             [3m[90m<chr>[39m[23m
    [90m1[39m X     [90m<tsibble [10 × 2]>[39m X    
    [90m2[39m Y     [90m<tsibble [10 × 2]>[39m Y    
    [90m3[39m Z     [90m<tsibble [10 × 2]>[39m Z    
    > stock_qtl <- stocksm %>% 
    +   group_by(stock) %>% 
    +   index_by(day3 = lubridate::floor_date(time, unit = "3 day")) %>% 
    +   summarise(
    +     value = list(quantile(price)), 
    +     qtl = list(c("0%", "25%", "50%", "75%", "100%"))
    +   )
    > unnest(stock_qtl, key = qtl)
    Warning: unnest() has a new interface. See ?unnest for details.
    Try `cols = c(key)`, with `mutate()` needed
    Warning: `.preserve` is deprecated. All list-columns are now preserved
    Warning: `.drop` is deprecated. All list-columns are now preserved.
    Warning: `.id` is deprecated. Manually create column of names instead.
    Error in x[[i]] <- value : 
      attempt to select less than one element in OneIndex
    Calls: unnest ... unnest -> unnest.tbl_ts -> unnest -> [[<- -> [[<-.data.frame
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      18: mutate.tbl_df(data, !!!dots)
      19: mutate_impl(.data, dots, caller_env())
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 780 SKIPPED: 0 WARNINGS: 17 FAILED: 7
      1. Failure: nest() (@test-tidyr.R#75) 
      2. Failure: unnest.lst_ts() (@test-tidyr.R#86) 
      3. Error: unnest.lst_ts() (@test-tidyr.R#87) 
      4. Failure: unnest.tbl_ts() (@test-tidyr.R#105) 
      5. Error: unnest.tbl_ts() (@test-tidyr.R#106) 
      6. Failure: dplyr verbs for lst_ts (@test-tidyr.R#111) 
      7. Error: dplyr verbs for lst_ts (@test-tidyr.R#115) 
      
      Error: testthat unit tests failed
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
      14: set_names_impl(x, x, nm, ...) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/attr.R:163
      15: is_function(nm) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/attr.R:170
      16: is_closure(x) at /private/tmp/RtmpY9b5QA/R.INSTALL8c9f1ab63242/rlang/R/fn.R:275
      17: repaired_names(names(x), .name_repair = .name_repair)
      18: check_unique(new_name)
      19: abort(error_column_names_must_be_unique(name[dups]))
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 251 SKIPPED: 0 WARNINGS: 155 FAILED: 1
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
* Number of recursive dependencies: 102

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
* Number of recursive dependencies: 97

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
      15: `_fseq`(`_lhs`)
      16: freduce(value, `_function_list`)
      17: function_list[[i]](value)
      18: tidyr::nest_(., "..data", nest_cols = c(row, column, value))
      19: .Defunct("nest") at /private/tmp/RtmpquPhal/R.INSTALL91f746b5a07/tidyr/R/dep-lazyeval.R:186
      20: stop(paste(msg, collapse = ""), call. = FALSE, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 54 SKIPPED: 0 WARNINGS: 0 FAILED: 3
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
* Number of recursive dependencies: 92

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
      OK: 405 SKIPPED: 3 WARNINGS: 46 FAILED: 41
      1. Error: (unknown) (@test-console_outputs.R#4) 
      2. Error: (unknown) (@test-edits.R#4) 
      3. Error: (unknown) (@test-manual_import.R#7) 
      4. Error: summary is properly created with the appropriate information (@test-model-summary.R#54) 
      5. Failure: no error occurs when xpdb is from a simulation only for not_sim_function dv_vs_idv (@test-plots.R#57) 
      6. Failure: no error occurs when xpdb is from a simulation only for not_sim_function res_vs_idv (@test-plots.R#57) 
      7. Failure: no error occurs when xpdb is from a simulation only for not_sim_function absval_res_vs_idv (@test-plots.R#57) 
      8. Failure: have proper error check for iteration_plot_function prm_vs_iteration (@test-plots.R#63) 
      9. Failure: have proper error check for iteration_plot_function grd_vs_iteration (@test-plots.R#63) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        R      1.0Mb
        doc    2.9Mb
        help   1.1Mb
    ```

