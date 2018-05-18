# abjutils

Version: 0.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘httr’ ‘progress’
      All declared Imports should be used.
    ```

# afex

Version: 0.20-2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘emmeans’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# aire.zmvm

Version: 0.6.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52 marked UTF-8 strings
    ```

# alphavantager

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      		</style>
      	  </head>
      	  <body>
      		<iframe src="//www.herokucdn.com/error-pages/application-error.html"></iframe>
      	  </body>
      	</html>
      1: av_get(symbol, av_fun, interval = interval) at testthat/test_av_get.R:13
      2: stop(httr::content(response, as = "text"), call. = FALSE)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 11 SKIPPED: 0 FAILED: 1
      1. Error: call TIMES_SERIES_INTRADAY (@test_av_get.R#13) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# amt

Version: 0.0.4.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘amt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: coercion
    > ### Title: Coerce a track to other formats.
    > ### Aliases: coercion as_sp as_sp.steps as_move as_move.track_xy
    > ###   as_move.track_xyt as_ltraj as_ltraj.track_xy as_ltraj.track_xyt
    > ###   as_bcpa as_bcpa.track_xyt as_moveHMM as_moveHMM.track_xy
    > 
    > ### ** Examples
    > 
    > data(deer)
    > as_move(deer)
    Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
      there is no package called ‘rgdal’
    Calls: as_move ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'amt'
    
    The following object is masked from 'package:stats':
    
        filter
    
    .t missing, creating `track_xy`.
    Quitting from lines 164-165 (p1_getting_started.Rmd) 
    Error: processing vignette 'p1_getting_started.Rmd' failed with diagnostics:
    package rgdal is required for spTransform methods
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘magrittr’
      All declared Imports should be used.
    ```

# anomalize

Version: 0.1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        help   4.7Mb
    ```

# anomalyDetection

Version: 0.2.5

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ARTool

Version: 0.10.4

## In both

*   checking whether package ‘ARTool’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ARTool/new/ARTool.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ARTool’ ...
** package ‘ARTool’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ARTool’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ARTool/new/ARTool.Rcheck/ARTool’

```
### CRAN

```
* installing *source* package ‘ARTool’ ...
** package ‘ARTool’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ARTool’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ARTool/old/ARTool.Rcheck/ARTool’

```
# auctestr

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# auk

Version: 0.2.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m2. Error: read_ebd data frames identical for different read functions (@test_read.r#62) [39m [31m────────────────────[39m
      Install the data.table package to use reader = fread.
      1: read_ebd(f, reader = "fread") at testthat/test_read.r:62
      2: read_ebd.character(f, reader = "fread")
      3: choose_reader(reader)
      4: stop("Install the data.table package to use reader = fread.")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 323 SKIPPED: 19 FAILED: 2
      1. Error: read_ebd using different reader functions (@test_read.r#39) 
      2. Error: read_ebd data frames identical for different read functions (@test_read.r#62) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘data.table’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘data.table’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 552 marked UTF-8 strings
    ```

# basecallQC

Version: 1.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# BatchGetSymbols

Version: 2.0

## In both

*   checking whether package ‘BatchGetSymbols’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘xml2’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BatchGetSymbols/new/BatchGetSymbols.Rcheck/00install.out’ for details.
    ```

# BAwiR

Version: 1.0

## In both

*   checking whether package ‘BAwiR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BAwiR/new/BAwiR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘BAwiR’ ...
** package ‘BAwiR’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘BAwiR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BAwiR/new/BAwiR.Rcheck/BAwiR’

```
### CRAN

```
* installing *source* package ‘BAwiR’ ...
** package ‘BAwiR’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘BAwiR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BAwiR/old/BAwiR.Rcheck/BAwiR’

```
# baystability

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggfortify’ ‘ggplot2’ ‘matrixStats’ ‘reshape2’ ‘scales’
      All declared Imports should be used.
    ```

# beadplexr

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘beadplexr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: calculate_concentration
    > ### Title: Calculate concentration.
    > ### Aliases: calculate_concentration
    > 
    > ### ** Examples
    > 
    > 
    > library(beadplexr)
    > library(drc)
    Loading required package: MASS
    Error: package or namespace load failed for ‘drc’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called ‘data.table’
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'gridExtra'
    
    The following object is masked from 'package:dplyr':
    
        combine
    
    Quitting from lines 459-468 (legendplex-analysis.Rmd) 
    Error: processing vignette 'legendplex-analysis.Rmd' failed with diagnostics:
    Evaluation error: there is no package called 'data.table'.
    Execution halted
    ```

# BgeeDB

Version: 2.2.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# bib2df

Version: 1.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library("testthat")
      Warning message:
      package 'testthat' was built under R version 3.4.3 
      > library("bib2df")
      > test_check("bib2df")
      [31m──[39m [31m1. Failure: bib2df() throws error messages (@tests.R#53) [39m [31m───────────────────────────────────────────────────[39m
      `bib2df("https://www.ottlngr.de/data/x.bib")` did not throw an error.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 16 SKIPPED: 0 FAILED: 1
      1. Failure: bib2df() throws error messages (@tests.R#53) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# biobroom

Version: 1.8.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      Attaching package: 'DelayedArray'
      
      The following objects are masked from 'package:matrixStats':
      
          colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
      
      The following object is masked from 'package:base':
      
          apply
      
      Error: package or namespace load failed for 'DESeq2' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
       there is no package called 'data.table'
      Execution halted
    ```

*   checking whether package ‘biobroom’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘broom’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/biobroom/new/biobroom.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following object is masked from 'package:dplyr':
    
        count
    
    
    Attaching package: 'DelayedArray'
    
    The following objects are masked from 'package:matrixStats':
    
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following object is masked from 'package:base':
    
        apply
    
    Quitting from lines 134-139 (biobroom_vignette.Rmd) 
    Error: processing vignette 'biobroom_vignette.Rmd' failed with diagnostics:
    package or namespace load failed for 'DESeq2' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘data.table’
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' call to ‘DESeq2’ in package code.
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    Missing or unexported object: ‘dplyr::tbl_dt’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      for ‘colData’
    tidy.deSet: no visible global function definition for ‘exprs<-’
    tidy.deSet: no visible binding for global variable ‘value’
    tidy.deSet: no visible binding for global variable ‘gene’
    tidy.deSet: no visible global function definition for ‘pData’
    tidy.qvalue: no visible binding for global variable ‘smoothed’
    tidy.qvalue: no visible binding for global variable ‘pi0’
    tidy.qvalue: no visible binding for global variable ‘lambda’
    tidy_matrix: no visible binding for global variable ‘value’
    tidy_matrix: no visible binding for global variable ‘gene’
    Undefined global functions or variables:
      . DGEList calcNormFactors colData counts design end estimate
      estimateSizeFactors exprs<- fData<- gene gr is lambda model.matrix
      p.adjust pData pData<- pi0 protein rowRanges sample.id seqnames
      setNames smoothed start tbl_dt term value voom voomWithQualityWeights
    Consider adding
      importFrom("methods", "is")
      importFrom("stats", "end", "model.matrix", "p.adjust", "setNames",
                 "start")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# bioCancer

Version: 1.4.0

## In both

*   checking whether package ‘bioCancer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bioCancer/new/bioCancer.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘magrittr’ ‘ggplot2’ ‘lubridate’ ‘tidyr’ ‘cgdsr’ ‘RCurl’ ‘XML’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

## Installation

### Devel

```
* installing *source* package ‘bioCancer’ ...
** R
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Warning: package ‘cgdsr’ was built under R version 3.4.3
Warning: package ‘XML’ was built under R version 3.4.4
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘bioCancer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bioCancer/new/bioCancer.Rcheck/bioCancer’

```
### CRAN

```
* installing *source* package ‘bioCancer’ ...
** R
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Warning: package ‘cgdsr’ was built under R version 3.4.3
Warning: package ‘XML’ was built under R version 3.4.4
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘bioCancer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bioCancer/old/bioCancer.Rcheck/bioCancer’

```
# BIS

Version: 0.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Warning: package 'zoo' was built under R version 3.4.3
    
    Attaching package: 'zoo'
    
    The following objects are masked from 'package:base':
    
        as.Date, as.Date.numeric
    
    Quitting from lines 61-79 (BIS.Rmd) 
    Error: processing vignette 'BIS.Rmd' failed with diagnostics:
    Evaluation error: yearmon variable can only have one format.
    Execution halted
    ```

# blastula

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘rlang’ ‘tibble’
      All declared Imports should be used.
    ```

# blkbox

Version: 1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘bigrf’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘glmnet’ ‘gtools’ ‘knitr’ ‘nnet’ ‘parallel’ ‘rJava’ ‘reshape’
      ‘rmarkdown’ ‘shinyjs’
      All declared Imports should be used.
    ```

# bomrang

Version: 0.1.4

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘data.table’ ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# bootnet

Version: 1.0.1

## In both

*   checking whether package ‘bootnet’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bootnet/new/bootnet.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bootnet’ ...
** package ‘bootnet’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘bootnet’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bootnet/new/bootnet.Rcheck/bootnet’

```
### CRAN

```
* installing *source* package ‘bootnet’ ...
** package ‘bootnet’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘bootnet’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bootnet/old/bootnet.Rcheck/bootnet’

```
# bossMaps

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# breathtestcore

Version: 0.4.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# breathteststan

Version: 0.4.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > # Only one test per file to avoid hanging 32-bit compile
      > #test_check("breathteststan", filter = "stan_fit")
      > Sys.unsetenv("R_TESTS") # https://github.com/r-lib/testthat/issues/603
      > test_check("breathteststan")
      [1] "liquid_normal" "solid_normal"  "solid_patient"
      [1] "liquid_normal" "solid_normal"  "solid_patient"
      [31m──[39m [31m1. Failure: Data that cannot be fitted with nls_list/nlme work with stan_fit (@test_stan_fit_2.R#28) [39m [31m───────[39m
      sigma(fit) is not strictly more than 0.9. Difference: -0.00781
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 28 SKIPPED: 7 FAILED: 1
      1. Failure: Data that cannot be fitted with nls_list/nlme work with stan_fit (@test_stan_fit_2.R#28) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# broom

Version: 0.4.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Error: tidy.coeftest works (@test-lmtest.R#7) [39m [31m───────────────────────────────────────────────────────────[39m
      object 'Mandible' not found
      1: lm(length ~ age, data = Mandible, subset = (age <= 28)) at testthat/test-lmtest.R:7
      2: eval(mf, parent.frame())
      3: eval(mf, parent.frame())
      4: stats::model.frame(formula = length ~ age, data = Mandible, subset = (age <= 28), drop.unused.levels = TRUE)
      5: model.frame.default(formula = length ~ age, data = Mandible, subset = (age <= 28), drop.unused.levels = TRUE)
      6: is.data.frame(data)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 1438 SKIPPED: 0 FAILED: 1
      1. Error: tidy.coeftest works (@test-lmtest.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bupaR

Version: 0.4.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# caffsim

Version: 0.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘markdown’
      All declared Imports should be used.
    ```

# cancensus

Version: 0.1.7

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘rgdal’ ‘sf’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘sf’
    ```

# CDECRetrieve

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lazyeval’ ‘purrr’ ‘roxygen2’
      All declared Imports should be used.
    ```

# cellbaseR

Version: 1.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# childsds

Version: 0.6.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20 marked UTF-8 strings
    ```

# clusterProfiler

Version: 3.4.4

## In both

*   checking whether package ‘clusterProfiler’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/clusterProfiler/new/clusterProfiler.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘clusterProfiler’ ...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘DOSE’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘data.table’
Error : package ‘DOSE’ could not be loaded
ERROR: lazy loading failed for package ‘clusterProfiler’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/clusterProfiler/new/clusterProfiler.Rcheck/clusterProfiler’

```
### CRAN

```
* installing *source* package ‘clusterProfiler’ ...
** R
** data
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘DOSE’ in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
 there is no package called ‘data.table’
Error : package ‘DOSE’ could not be loaded
ERROR: lazy loading failed for package ‘clusterProfiler’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/clusterProfiler/old/clusterProfiler.Rcheck/clusterProfiler’

```
# CNPBayes

Version: 1.6.1

## In both

*   checking for code/documentation mismatches ... WARNING
    ```
    Codoc mismatches from documentation object 'labelSwitching':
    labelSwitching
      Code: function(object, ...)
      Docs: function(object, merge = TRUE)
      Argument names in code not in docs:
        ...
      Argument names in docs not in code:
        merge
      Mismatches in argument names:
        Position: 2 Code: ... Docs: merge
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 51-61 (FindCNPs.Rmd) 
    Error: processing vignette 'FindCNPs.Rmd' failed with diagnostics:
    unable to find required package 'VanillaICE'
    Execution halted
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘GenomicRanges’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    consensusRegion: no visible global function definition for
      ‘elementLengths’
    Undefined global functions or variables:
      elementLengths
    ```

# codebook

Version: 0.5.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘pander’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘labelled’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# congressbr

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# countyfloods

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘maps’
      All declared Imports should be used.
    ```

# countyweather

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# cpr

Version: 0.2.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# crawl

Version: 2.1.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    Packages suggested but not available for checking: ‘rgdal’ ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# cRegulome

Version: 0.1.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following object is masked from 'package:base':
    
        expand.grid
    
    
    Attaching package: 'IRanges'
    
    The following object is masked from 'package:R.oo':
    
        trim
    
    
    Loading required package: DOSE
    
    Error: package or namespace load failed for 'DOSE' in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]):
     there is no package called 'data.table'
    Quitting from lines 32-41 (case_study.Rmd) 
    Error: processing vignette 'case_study.Rmd' failed with diagnostics:
    package 'DOSE' could not be loaded
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘AnnotationDbi’ ‘clusterProfiler’ ‘org.Hs.eg.db’
      All declared Imports should be used.
    ```

# curatedMetagenomicData

Version: 1.2.2

## In both

*   checking whether package ‘curatedMetagenomicData’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/curatedMetagenomicData/new/curatedMetagenomicData.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘dplyr’ ‘phyloseq’ ‘Biobase’ ‘ExperimentHub’ ‘AnnotationHub’
      ‘magrittr’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

## Installation

### Devel

```
* installing *source* package ‘curatedMetagenomicData’ ...
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘phyloseq’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘phyloseq’ could not be loaded
ERROR: lazy loading failed for package ‘curatedMetagenomicData’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/curatedMetagenomicData/new/curatedMetagenomicData.Rcheck/curatedMetagenomicData’

```
### CRAN

```
* installing *source* package ‘curatedMetagenomicData’ ...
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘phyloseq’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘phyloseq’ could not be loaded
ERROR: lazy loading failed for package ‘curatedMetagenomicData’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/curatedMetagenomicData/old/curatedMetagenomicData.Rcheck/curatedMetagenomicData’

```
# cutpointr

Version: 0.7.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      Warning message:
      package 'testthat' was built under R version 3.4.3 
      > library(cutpointr)
      > 
      > test_check("cutpointr")
      [31m──[39m [31m1. Failure: Cutpointr returns a cutpointr without NAs and a certain Nr of rows (@test-cutpointr.R#11) [39m [31m──────[39m
      `plot_precision_recall(opt_cut)` produced warnings.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 358 SKIPPED: 0 FAILED: 1
      1. Failure: Cutpointr returns a cutpointr without NAs and a certain Nr of rows (@test-cutpointr.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# d3r

Version: 0.8.1

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# dartR

Version: 1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘data.table’ ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# DChIPRep

Version: 1.6.2

## In both

*   checking whether package ‘DChIPRep’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DChIPRep/new/DChIPRep.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘DChIPRep’ ...
** R
** data
*** moving datasets to lazyload DB

Warning: namespace 'DChIPRep' is not available and has been replaced
by .GlobalEnv when processing object 'testData'
Warning: namespace 'DChIPRep' is not available and has been replaced
by .GlobalEnv when processing object 'testData'
** exec
** inst
** preparing package for lazy loading
Error: package or namespace load failed for 'DESeq2' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called 'data.table'
Error : package 'DESeq2' could not be loaded
ERROR: lazy loading failed for package 'DChIPRep'
* removing '/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DChIPRep/new/DChIPRep.Rcheck/DChIPRep'

```
### CRAN

```
* installing *source* package ‘DChIPRep’ ...
** R
** data
*** moving datasets to lazyload DB

Warning: namespace 'DChIPRep' is not available and has been replaced
by .GlobalEnv when processing object 'testData'
Warning: namespace 'DChIPRep' is not available and has been replaced
by .GlobalEnv when processing object 'testData'
** exec
** inst
** preparing package for lazy loading
Error: package or namespace load failed for 'DESeq2' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called 'data.table'
Error : package 'DESeq2' could not be loaded
ERROR: lazy loading failed for package 'DChIPRep'
* removing '/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DChIPRep/old/DChIPRep.Rcheck/DChIPRep'

```
# DeepBlueR

Version: 1.2.10

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# DEGreport

Version: 1.12.0

## In both

*   checking examples ... ERROR
    ```
    ...
    
    Attaching package: ‘matrixStats’
    
    The following objects are masked from ‘package:Biobase’:
    
        anyMissing, rowMedians
    
    
    Attaching package: ‘DelayedArray’
    
    The following objects are masked from ‘package:matrixStats’:
    
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following object is masked from ‘package:base’:
    
        apply
    
    Error: package or namespace load failed for ‘DESeq2’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called ‘data.table’
    Execution halted
    ```

*   checking whether package ‘DEGreport’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘quantreg’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following objects are masked from 'package:Biobase':
    
        anyMissing, rowMedians
    
    
    Attaching package: 'DelayedArray'
    
    The following objects are masked from 'package:matrixStats':
    
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following object is masked from 'package:base':
    
        apply
    
    Quitting from lines 133-143 (DEGreport.Rnw) 
    Error: processing vignette 'DEGreport.Rnw' failed with diagnostics:
    package or namespace load failed for 'DESeq2' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Execution halted
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘plotCounts’
    degPlotWide: no visible binding for global variable ‘gene’
    degPlotWide: no visible binding for global variable ‘count’
    degPlotWide: no visible binding for global variable ‘treatment’
    degResults: no visible global function definition for ‘assay’
    degResults: no visible global function definition for ‘rlog’
    degResults: no visible global function definition for ‘results’
    degResults: no visible global function definition for ‘colData’
    degResults: no visible global function definition for ‘rowMax’
    degVolcano: no visible binding for global variable ‘logFC’
    degVolcano: no visible binding for global variable ‘V1’
    degVolcano: no visible binding for global variable ‘V2’
    degVolcano: no visible binding for global variable ‘adj.P.Val’
    degVolcano: no visible binding for global variable ‘x’
    degVolcano: no visible binding for global variable ‘y’
    degVolcano: no visible binding for global variable ‘name’
    Undefined global functions or variables:
      MulticoreParam V1 V2 adj.P.Val assay bplapply coda.samples colData
      comp count enrichGO gene group jags.model keys label log2FoldChange
      logFC name one plotCounts results rlog rowMax simplify treatment two
      value variable x y
    ```

# dexter

Version: 0.6.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 109 marked UTF-8 strings
    ```

# diceR

Version: 0.5.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘diceR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CSPA
    > ### Title: Cluster-based Similarity Partitioning Algorithm (CSPA)
    > ### Aliases: CSPA
    > 
    > ### ** Examples
    > 
    > data(hgsc)
    > dat <- hgsc[1:100, 1:50]
    > x <- consensus_cluster(dat, nk = 4, reps = 4, algorithms = c("hc", "diana"),
    + progress = FALSE)
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘data.table’
    Calls: consensus_cluster ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 53 SKIPPED: 0 FAILED: 19
      1. Error: No algorithms means all algorithms, output is an array (@test-consensus_cluster.R#7) 
      2. Error: Output can be saved with or without time in file name (@test-consensus_cluster.R#13) 
      3. Error: Progress bar increments across entire function call (@test-consensus_cluster.R#24) 
      4. Error: Able to call only spearman distance (@test-consensus_cluster.R#32) 
      5. Error: Data preparation on bootstrap samples works (@test-consensus_cluster.R#38) 
      6. Error: no scaling means only choose complete cases and high signal vars (@test-consensus_cluster.R#45) 
      7. Error: t-SNE dimension reduction works (@test-consensus_cluster.R#51) 
      8. Error: (unknown) (@test-consensus_combine.R#9) 
      9. Error: (unknown) (@test-consensus_funs.R#6) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 122-124 (overview.Rmd) 
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    there is no package called 'data.table'
    Execution halted
    ```

# dimRed

Version: 0.1.0

## In both

*   checking whether package ‘dimRed’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Matrix’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dimRed/new/dimRed.Rcheck/00install.out’ for details.
    ```

# dlookr

Version: 0.3.0

## In both

*   checking whether package ‘dlookr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dlookr/new/dlookr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘dlookr’ ...
** package ‘dlookr’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘dlookr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dlookr/new/dlookr.Rcheck/dlookr’

```
### CRAN

```
* installing *source* package ‘dlookr’ ...
** package ‘dlookr’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘dlookr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dlookr/old/dlookr.Rcheck/dlookr’

```
# dplyrAssist

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘tidyr’ ‘tidyverse’
      All declared Imports should be used.
    ```

# dynfrail

Version: 0.5.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# easyformatr

Version: 0.1.2

## In both

*   checking whether package ‘easyformatr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘bindrcpp’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/easyformatr/new/easyformatr.Rcheck/00install.out’ for details.
    ```

# echor

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# edeaR

Version: 0.8.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# eechidna

Version: 1.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# eemR

Version: 0.1.5

## In both

*   checking whether package ‘eemR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/eemR/new/eemR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘eemR’ ...
** package ‘eemR’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘eemR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/eemR/new/eemR.Rcheck/eemR’

```
### CRAN

```
* installing *source* package ‘eemR’ ...
** package ‘eemR’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘eemR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/eemR/old/eemR.Rcheck/eemR’

```
# EFDR

Version: 0.1.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    .gdf : find_loss: no visible global function definition for ‘rnorm’
    .p.values : <anonymous>: no visible global function definition for
      ‘pnorm’
    .relist.dwt: no visible global function definition for ‘relist’
    .relist.dwt: no visible global function definition for ‘as’
    .std.wav.coeff : <anonymous>: no visible global function definition for
      ‘mad’
    regrid: no visible global function definition for ‘predict’
    regrid: no visible global function definition for ‘var’
    regrid: no visible global function definition for ‘medpolish’
    Undefined global functions or variables:
      as mad medpolish pnorm predict relist rnorm var
    Consider adding
      importFrom("methods", "as")
      importFrom("stats", "mad", "medpolish", "pnorm", "predict", "rnorm",
                 "var")
      importFrom("utils", "relist")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# eiCompare

Version: 2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# emil

Version: 2.2.8

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ENCODExplorer

Version: 2.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# epitable

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘magrittr’ ‘readr’
      All declared Imports should be used.
    ```

# ERSA

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘ERSA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotSum
    > ### Title: Plots of model summaries
    > ### Aliases: plotSum plotAnovaStats plottStats plotCIStats
    > 
    > ### ** Examples
    > 
    > plotAnovaStats(lm(mpg ~ wt+hp+disp, data=mtcars))
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘data.table’
    Calls: plotAnovaStats ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RColorBrewer’ ‘modelr’
      All declared Imports should be used.
    ```

# eurostat

Version: 3.1.5

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      trying URL 'http://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing?sort=1&file=data%2Ftsdtr210.tsv.gz'
      downloaded 17 KB
      
      [31m──[39m [31m1. Error: (unknown) (@test-all.R#112) [39m [31m──────────────────────────────────────────────────────────────────────[39m
      tsdtr210 does not exist or is not readable
      1: get_eurostat("tsdtr210", type = "label", keepFlags = T, cache = FALSE) at testthat/test-all.R:112
      2: get_eurostat_raw(id)
      3: stop(id, " does not exist or is not readable")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 14 FAILED: 1
      1. Error: (unknown) (@test-all.R#112) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    trying URL 'http://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing?sort=1&file=data%2Ften00081.tsv.gz'
    Content type 'application/octet-stream;charset=UTF-8' length 13491 bytes (13 KB)
    ==================================================
    downloaded 13 KB
    
    Table ten00081 cached at /tmp/Rtmplr6xCo/eurostat/ten00081_date_code_TF.rds
    Quitting from lines 291-309 (eurostat_tutorial.Rmd) 
    Error: processing vignette 'eurostat_tutorial.Rmd' failed with diagnostics:
    package or namespace load failed for 'tmap' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'rgdal'
    Execution halted
    ```

# extdplyr

Version: 0.1.4

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘data.table’
    ```

# factoextra

Version: 1.0.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘NbClust’
    ```

# fastR2

Version: 0.2.0

## In both

*   checking whether package ‘fastR2’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘ggformula’ was built under R version 3.4.3
      Warning: package ‘mosaic’ was built under R version 3.4.3
      Warning: package ‘Matrix’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fastR2/new/fastR2.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# fourierin

Version: 0.2.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# futureheatwaves

Version: 1.0.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# fuzzyjoin

Version: 0.1.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m──[39m [31m1. Failure: Can do inner joins on intervals with findOverlaps arguments (@test_interval_join.R#56) [39m [31m─────────[39m
      j_maxgap$id1 not equal to c(1, 1, 2, 2, 3, 3).
      Lengths differ: 5 is not 6
      
      [31m──[39m [31m2. Failure: Can do inner joins on intervals with findOverlaps arguments (@test_interval_join.R#57) [39m [31m─────────[39m
      j_maxgap$id2 not equal to c(1, 2, 1, 2, 2, 3).
      Lengths differ: 5 is not 6
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 225 SKIPPED: 0 FAILED: 2
      1. Failure: Can do inner joins on intervals with findOverlaps arguments (@test_interval_join.R#56) 
      2. Failure: Can do inner joins on intervals with findOverlaps arguments (@test_interval_join.R#57) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# gaiah

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggplot2’ ‘maptools’ ‘rgeos’ ‘stringr’ ‘tidyr’
      All declared Imports should be used.
    ```

# genogeographer

Version: 0.1.8

## In both

*   checking whether package ‘genogeographer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/genogeographer/new/genogeographer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘genogeographer’ ...
** package ‘genogeographer’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘genogeographer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/genogeographer/new/genogeographer.Rcheck/genogeographer’

```
### CRAN

```
* installing *source* package ‘genogeographer’ ...
** package ‘genogeographer’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘genogeographer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/genogeographer/old/genogeographer.Rcheck/genogeographer’

```
# geomnet

Version: 0.2.0

## In both

*   checking whether package ‘geomnet’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/geomnet/new/geomnet.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘geomnet’ ...
** package ‘geomnet’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘geomnet’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/geomnet/new/geomnet.Rcheck/geomnet’

```
### CRAN

```
* installing *source* package ‘geomnet’ ...
** package ‘geomnet’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘geomnet’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/geomnet/old/geomnet.Rcheck/geomnet’

```
# getCRUCLdata

Version: 0.2.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# gfer

Version: 0.1.10

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ggCompNet

Version: 0.1.0

## In both

*   checking whether package ‘ggCompNet’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggCompNet/new/ggCompNet.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggCompNet’ ...
** package ‘ggCompNet’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘geomnet’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘geomnet’ could not be loaded
ERROR: lazy loading failed for package ‘ggCompNet’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggCompNet/new/ggCompNet.Rcheck/ggCompNet’

```
### CRAN

```
* installing *source* package ‘ggCompNet’ ...
** package ‘ggCompNet’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘geomnet’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘geomnet’ could not be loaded
ERROR: lazy loading failed for package ‘ggCompNet’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggCompNet/old/ggCompNet.Rcheck/ggCompNet’

```
# ggeffects

Version: 0.3.3

## In both

*   checking whether package ‘ggeffects’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggeffects/new/ggeffects.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggeffects’ ...
** package ‘ggeffects’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ggeffects’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggeffects/new/ggeffects.Rcheck/ggeffects’

```
### CRAN

```
* installing *source* package ‘ggeffects’ ...
** package ‘ggeffects’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ggeffects’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggeffects/old/ggeffects.Rcheck/ggeffects’

```
# ggfan

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘colorspace’ ‘grid’ ‘rstan’
      All declared Imports should be used.
    ```

# ggmosaic

Version: 0.1.2

## In both

*   checking whether package ‘ggmosaic’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggmosaic/new/ggmosaic.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggmosaic’ ...
** package ‘ggmosaic’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ggmosaic’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggmosaic/new/ggmosaic.Rcheck/ggmosaic’

```
### CRAN

```
* installing *source* package ‘ggmosaic’ ...
** package ‘ggmosaic’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ggmosaic’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggmosaic/old/ggmosaic.Rcheck/ggmosaic’

```
# ggpubr

Version: 0.1.6

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggquickeda

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘Hmisc’ ‘colourpicker’ ‘dplyr’ ‘ggrepel’ ‘grDevices’ ‘gridExtra’
      ‘lazyeval’ ‘markdown’ ‘plotly’ ‘quantreg’ ‘rlang’ ‘shinyjs’ ‘tidyr’
      All declared Imports should be used.
    ```

# ggRandomForests

Version: 2.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘randomForest’
      All declared Imports should be used.
    ```

# ggstatsplot

Version: 0.0.2

## In both

*   checking whether package ‘ggstatsplot’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggstatsplot/new/ggstatsplot.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ggstatsplot’ ...
** package ‘ggstatsplot’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Warning in checkMatrixPackageVersion() :
  Package version inconsistency detected.
TMB was built with Matrix version 1.2.12
Current Matrix version is 1.2.14
Please re-install 'TMB' from source using install.packages('TMB', type = 'source') or ask CRAN for a binary version of 'TMB' matching CRAN's 'Matrix' package
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ggstatsplot’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggstatsplot/new/ggstatsplot.Rcheck/ggstatsplot’

```
### CRAN

```
* installing *source* package ‘ggstatsplot’ ...
** package ‘ggstatsplot’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Warning in checkMatrixPackageVersion() :
  Package version inconsistency detected.
TMB was built with Matrix version 1.2.12
Current Matrix version is 1.2.14
Please re-install 'TMB' from source using install.packages('TMB', type = 'source') or ask CRAN for a binary version of 'TMB' matching CRAN's 'Matrix' package
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘ggstatsplot’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ggstatsplot/old/ggstatsplot.Rcheck/ggstatsplot’

```
# ggthemes

Version: 3.5.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘latticeExtra’
    ```

# ggtree

Version: 1.8.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        doc        6.8Mb
        examples   3.7Mb
    ```

# GSODR

Version: 1.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘rgdal’ ‘sf’
    ```

# gutenbergr

Version: 0.1.4

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13617 marked UTF-8 strings
    ```

# gwdegree

Version: 0.1.1

## In both

*   checking whether package ‘gwdegree’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘network’ was built under R version 3.4.4
      Warning: package ‘shinydashboard’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/gwdegree/new/gwdegree.Rcheck/00install.out’ for details.
    ```

# happybiRthday

Version: 0.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# hdme

Version: 0.1.1

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘Rglpk’ ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# healthcareai

Version: 2.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# highcharter

Version: 0.5.0

## In both

*   checking whether package ‘highcharter’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/highcharter/new/highcharter.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘highcharter’ ...
** package ‘highcharter’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** demo
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘highcharter’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/highcharter/new/highcharter.Rcheck/highcharter’

```
### CRAN

```
* installing *source* package ‘highcharter’ ...
** package ‘highcharter’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** demo
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘highcharter’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/highcharter/old/highcharter.Rcheck/highcharter’

```
# htmlTable

Version: 1.11.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 101-141 (tables.Rmd) 
    Error: processing vignette 'tables.Rmd' failed with diagnostics:
    there is no package called 'data.table'
    Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pxweb’
    ```

# HTSSIP

Version: 1.3.2

## In both

*   checking for missing documentation entries ... ERROR
    ```
    Error in .requirePackage(package) : 
      unable to find required package ‘phyloseq’
    Calls: <Anonymous> ... withCallingHandlers -> is -> getClassDef -> .requirePackage
    Execution halted
    ```

*   checking examples ... ERROR
    ```
    Running examples in ‘HTSSIP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: OTU_qPCR_trans
    > ### Title: Transform OTU counts based on qPCR data
    > ### Aliases: OTU_qPCR_trans
    > 
    > ### ** Examples
    > 
    > # qPCR data simulation
    > data(physeq_rep3)
    > data(physeq_rep3_qPCR)
    > physeq_rep3_t = OTU_qPCR_trans(physeq_rep3, physeq_rep3_qPCR)
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘data.table’
    Calls: OTU_qPCR_trans ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 28 SKIPPED: 16 FAILED: 25
      1. Error: Beta diversity from a list of phyloseq objects (@test-BD_ordinations.R#2) 
      2. Error: Beta diversity from a list of phyloseq objects (parallel) (@test-BD_ordinations.R#9) 
      3. Error: DESeq2_l2fc runs with default params (@test-DESeq2_l2fc.R#2) 
      4. Error: DESeq2_l2fc runs with sparsity_apply=heavy (@test-DESeq2_l2fc.R#15) 
      5. Error: HRSIP runs with default (@test-HRSIP.R#3) 
      6. Error: phyloseq sim (@test-HTSSIP_sim.R#57) 
      7. Error: phyloseq sim w/ metadata (@test-HTSSIP_sim.R#73) 
      8. Error: phyloseq sample_data can be converted to dataframe (@test-Util.R#9) 
      9. Error: phyloseq tax_table can be converted to dataframe (@test-Util.R#17) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Loading required package: phyloseq
    Error: package or namespace load failed for 'phyloseq' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Quitting from lines 85-86 (BD_shifts.Rmd) 
    Error: processing vignette 'BD_shifts.Rmd' failed with diagnostics:
    unable to find required package 'phyloseq'
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        data   4.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘igraph’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Error in .requirePackage(package) : 
        unable to find required package 'phyloseq'
      Calls: <Anonymous> ... .extendsForS3 -> extends -> getClassDef -> .requirePackage
      Execution halted
    ```

# HURDAT

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: datasource(file, skip = skip)
      7: datasource_connection(file, skip, comment)
      8: datasource_raw(read_connection(path), skip, comment = comment)
      9: new_datasource("raw", text, skip = skip, comment = comment)
      10: structure(list(x, skip = skip, comment = comment, ...), class = c(paste0("source_", type), "source"))
      11: read_connection(path)
      12: open(con, "rb")
      13: open.connection(con, "rb")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test-hurdat.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# hurricaneexposure

Version: 0.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# IDE

Version: 0.1.0

## In both

*   checking whether package ‘IDE’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IDE/new/IDE.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘IDE’ ...
** package ‘IDE’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘IDE’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IDE/new/IDE.Rcheck/IDE’

```
### CRAN

```
* installing *source* package ‘IDE’ ...
** package ‘IDE’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘IDE’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IDE/old/IDE.Rcheck/IDE’

```
# idealstan

Version: 0.2.7

## In both

*   checking whether package ‘idealstan’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/idealstan/new/idealstan.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        data   3.5Mb
        libs   3.6Mb
    ```

# IHWpaper

Version: 1.4.0

## In both

*   checking whether package ‘IHWpaper’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘IHWpaper’ ...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c ddhf.cpp -o ddhf.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o IHWpaper.so RcppExports.o ddhf.o -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/IHWpaper/libs
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘IHWpaper’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/IHWpaper’

```
### CRAN

```
* installing *source* package ‘IHWpaper’ ...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c ddhf.cpp -o ddhf.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o IHWpaper.so RcppExports.o ddhf.o -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/old/IHWpaper.Rcheck/IHWpaper/libs
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘IHWpaper’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/old/IHWpaper.Rcheck/IHWpaper’

```
# IncucyteDRC

Version: 0.5.4

## In both

*   checking examples ... ERROR
    ```
    ...
    Getting pc data for plate example_data.txt from:
    /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IncucyteDRC/new/IncucyteDRC.Rcheck/IncucyteDRC/extdata/example_data.txt
    > 
    > test_list <- splitIncucyteDRCPlateData(test_pm, test_data, group_columns='growthcondition')
    > 
    > print(test_list)
    ## This is an IncucyteDRCSetList S3 object containing 4 IncucyteDRCSet objects
    ## Access using standard list notation ie my_list[[1]]
    ## Try lapply(my_list, print) to see more information on each object> 
    > test_idrc_set <- fitGrowthCurvesGrouped(test_list[[2]])
    > test_idrc_set <- fitGrowthCurvesIndividual(test_idrc_set)
    > test_idrc_set <- calculateDRCData(test_idrc_set, cut_time=100)
    Using cut time provided to function
    > test_idrc_set <- fitDoseResponseCurve(test_idrc_set)
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘data.table’
    > test_idrc_set <- calculateEC50(test_idrc_set)
    Error in mutate_impl(.data, dots) : 
      Evaluation error: there is no package called ‘data.table’.
    Calls: calculateEC50 ... <Anonymous> -> mutate.tbl_df -> mutate_impl -> .Call
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Importing platemap xml from /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IncucyteDRC/new/IncucyteDRC.Rcheck/IncucyteDRC/extdata/example2.PlateMap
    Plate map import successful!
    Getting pc data for plate example_data2.txt from:
    /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IncucyteDRC/new/IncucyteDRC.Rcheck/IncucyteDRC/extdata/example_data2.txt
    Using cut time provided to function
    Warning in bind_rows_(x, .id) :
      binding character and factor vector, coercing into character vector
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called 'data.table'
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called 'data.table'
    Quitting from lines 119-126 (Overview.Rmd) 
    Error: processing vignette 'Overview.Rmd' failed with diagnostics:
    Evaluation error: there is no package called 'data.table'.
    Execution halted
    ```

# IONiseR

Version: 2.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc       3.6Mb
        extdata   1.5Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘start_time’
    readFast5Summary.mc: no visible binding for global variable ‘duration’
    readFast5Summary.mc: no visible binding for global variable
      ‘num_events’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘baseCalledTemplate’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘baseCalledComplement’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘component’
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘idx’
    show,Fast5Summary: no visible binding for global variable ‘full_2D’
    show,Fast5Summary: no visible binding for global variable ‘pass’
    Undefined global functions or variables:
      := AAAAA TTTTT accumulation baseCalledComplement baseCalledTemplate
      bases_called category channel circleFun component duration error freq
      full_2D group hour idx matrixCol matrixRow meanZValue mean_value
      median_signal minute mux name nbases new_reads num_events oddEven
      pass pentamer rbindlist readIDs seq_length start_time time_bin
      time_group x y zvalue
    ```

# ipumsr

Version: 0.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘rgdal’ ‘sf’
    ```

# isomiRs

Version: 1.4.0

## In both

*   checking whether package ‘isomiRs’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘isomiRs’ ...
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘isomiRs’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/isomiRs’

```
### CRAN

```
* installing *source* package ‘isomiRs’ ...
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘isomiRs’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/old/isomiRs.Rcheck/isomiRs’

```
# janitor

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# jpmesh

Version: 1.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# jpndistrict

Version: 0.3.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# konfound

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    ...
    Dependent variable is mpg 
             term estimate std.error statistic p.value  itcv impact
    1 (Intercept)   37.227     1.599    23.285   0.000    NA     NA
    2          wt   -3.878     0.633    -6.129   0.000 0.243     NA
    3          hp   -0.032     0.009    -3.519   0.001    NA  0.511
    > 
    > # using glm() for non-linear models
    > if (requireNamespace("forcats")) {
    + d <- forcats::gss_cat
    + 
    + d$married <- ifelse(d$marital == "Married", 1, 0)
    + 
    + m2 <- glm(married ~ age, data = d, family = binomial(link = "logit"))
    + konfound(m2, age)
    + }
    Loading required namespace: forcats
    Note that for a non-linear model, impact threshold should not be interpreted.
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘data.table’
    Calls: konfound -> konfound_glm
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 42-43 (Introduction_to_konfound.Rmd) 
    Error: processing vignette 'Introduction_to_konfound.Rmd' failed with diagnostics:
    Dependency package margins not available.
    Execution halted
    ```

# Lahman

Version: 6.0-0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘data.table’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.6Mb
      sub-directories of 1Mb or more:
        data   7.4Mb
    ```

# mafs

Version: 0.0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘cmprsk’ ‘colorspace’ ‘etm’ ‘fracdiff’ ‘gtable’ ‘munsell’
      ‘numDeriv’ ‘plyr’ ‘quadprog’ ‘scales’ ‘timeDate’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# malariaAtlas

Version: 0.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# MANOVA.RM

Version: 0.2.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘RGtk2’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘nparLD’
    ```

# mapfuser

Version: 0.1.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘LPmerge’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# mason

Version: 0.2.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ggplot2’, ‘pander’, ‘pixiedust’
    ```

# meltt

Version: 0.4.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# memapp

Version: 2.9

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘RColorBrewer’ ‘RODBC’ ‘dplyr’ ‘formattable’ ‘ggplot2’
      ‘ggthemes’ ‘magrittr’ ‘mem’ ‘openxlsx’ ‘plotly’ ‘readxl’ ‘shinyBS’
      ‘shinydashboard’ ‘shinyjs’ ‘shinythemes’ ‘stringi’ ‘stringr’ ‘tidyr’
      All declared Imports should be used.
    ```

# MetamapsDB

Version: 0.0.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# mlbgameday

Version: 0.1.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: call dbDisconnect() when finished working with a connection
    Warning in .Internal(vector("character", length)) :
      closing unused connection 5 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_20/gid_2018_03_20_tbamlb_balmlb_1/inning/inning_all.xml)
    Warning: closing unused connection 5 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_24/gid_2018_03_24_sfnmlb_srcaaa_1/inning/inning_all.xml)
    Warning in .Internal(inherits(x, what, which)) :
      closing unused connection 6 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_26/gid_2018_03_26_chamlb_chraaa_1/inning/inning_all.xml)
    Warning in .Internal(inherits(x, what, which)) :
      closing unused connection 5 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_26/gid_2018_03_26_balmlb_noraaa_1/inning/inning_all.xml)
    Warning: closing unused connection 5 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_26/gid_2018_03_26_kcamlb_omaaaa_1/inning/inning_all.xml)
    Warning in doTryCatch(return(expr), name, parentenv, handler) :
      closing unused connection 5 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_26/gid_2018_03_26_sdnmlb_elpaaa_1/inning/inning_all.xml)
    Warning: closing unused connection 5 (http://gd2.mlb.com/components/game/mlb/year_2018/month_03/day_27/gid_2018_03_27_cinmlb_texmlb_1/inning/inning_all.xml)
    Quitting from lines 87-98 (pitch_plotting.Rmd) 
    Error: processing vignette 'pitch_plotting.Rmd' failed with diagnostics:
    package or namespace load failed for 'plotly' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘doParallel’ ‘iterators’ ‘parallel’
      All declared Imports should be used.
    ```

# modelr

Version: 0.1.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# monkeylearn

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ratelimitr’
      All declared Imports should be used.
    ```

# morse

Version: 3.0.0

## In both

*   checking whether package ‘morse’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/morse/new/morse.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘morse’ ...
** package ‘morse’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so
  Reason: image not found
ERROR: lazy loading failed for package ‘morse’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/morse/new/morse.Rcheck/morse’

```
### CRAN

```
* installing *source* package ‘morse’ ...
** package ‘morse’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so
  Reason: image not found
ERROR: lazy loading failed for package ‘morse’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/morse/old/morse.Rcheck/morse’

```
# mosaicModel

Version: 0.3.0

## In both

*   checking whether package ‘mosaicModel’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘mosaicCore’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/mosaicModel/new/mosaicModel.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘caret’ ‘ggformula’ ‘knitr’ ‘testthat’ ‘tidyverse’
      All declared Imports should be used.
    ```

# mpoly

Version: 1.0.5

## In both

*   checking whether package ‘mpoly’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘stringr’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/mpoly/new/mpoly.Rcheck/00install.out’ for details.
    ```

# mtconnectR

Version: 1.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# mudata2

Version: 1.0.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 931 SKIPPED: 0 FAILED: 12
      1. Error: mudata_prepare_column and mudata_parse_column are opposites (@test_mudata.io.R#244) 
      2. Error: mudata_prepare_tbl works as intended (@test_mudata.io.R#288) 
      3. Error: mudata_prepare_tbl and mudata_parse_tbl are opposites (@test_mudata.io.R#322) 
      4. Failure: as_* functions produce the expected output type (@test_types.R#210) 
      5. Failure: wkt parsing returns an sf::sfc (@test_types.R#252) 
      6. Failure: wkt parsing works when there are parsing errors/NA values (@test_types.R#259) 
      7. Error: wkt parsing works when there are parsing errors/NA values (@test_types.R#261) 
      8. Failure: wkt parsing works with zero-length input (@test_types.R#285) 
      9. Failure: objects generate the correct type strings (@test_types.R#306) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

# MultiAssayExperiment

Version: 1.2.1

## In both

*   checking examples ... WARNING
    ```
    ...
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
      Warning: 'RangedRaggedAssay' is deprecated.
    Deprecated functions may be defunct as soon as of the next release of
    R.
    See ?Deprecated.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘BiocGenerics:::replaceSlots’
      See the note in ?`:::` about the use of this operator.
    ```

# naniar

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrrlyr’
      All declared Imports should be used.
    ```

# neuropsychology

Version: 0.5.0

## In both

*   checking whether package ‘neuropsychology’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/neuropsychology/new/neuropsychology.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘neuropsychology’ ...
** package ‘neuropsychology’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘tibble’ was built under R version 3.4.3
Warning: package ‘stringr’ was built under R version 3.4.3
Warning: package ‘forcats’ was built under R version 3.4.3
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘neuropsychology’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/neuropsychology/new/neuropsychology.Rcheck/neuropsychology’

```
### CRAN

```
* installing *source* package ‘neuropsychology’ ...
** package ‘neuropsychology’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘tibble’ was built under R version 3.4.3
Warning: package ‘stringr’ was built under R version 3.4.3
Warning: package ‘forcats’ was built under R version 3.4.3
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘neuropsychology’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/neuropsychology/old/neuropsychology.Rcheck/neuropsychology’

```
# NFP

Version: 0.99.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘NFPdata’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.5Mb
      sub-directories of 1Mb or more:
        data   8.1Mb
    ```

# noaastormevents

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# NOAAWeather

Version: 0.1.0

## In both

*   checking whether package ‘NOAAWeather’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/NOAAWeather/new/NOAAWeather.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘NOAAWeather’ ...
** package ‘NOAAWeather’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘NOAAWeather’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/NOAAWeather/new/NOAAWeather.Rcheck/NOAAWeather’

```
### CRAN

```
* installing *source* package ‘NOAAWeather’ ...
** package ‘NOAAWeather’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘NOAAWeather’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/NOAAWeather/old/NOAAWeather.Rcheck/NOAAWeather’

```
# nzelect

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        data   5.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6409 marked UTF-8 strings
    ```

# olsrr

Version: 0.5.1

## In both

*   checking whether package ‘olsrr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/olsrr/new/olsrr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘olsrr’ ...
** package ‘olsrr’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c init.c -o init.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c tvar.cpp -o tvar.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o olsrr.so RcppExports.o init.o tvar.o -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/olsrr/new/olsrr.Rcheck/olsrr/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘olsrr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/olsrr/new/olsrr.Rcheck/olsrr’

```
### CRAN

```
* installing *source* package ‘olsrr’ ...
** package ‘olsrr’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c init.c -o init.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c tvar.cpp -o tvar.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o olsrr.so RcppExports.o init.o tvar.o -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/olsrr/old/olsrr.Rcheck/olsrr/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘olsrr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/olsrr/old/olsrr.Rcheck/olsrr’

```
# openEBGM

Version: 0.5.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# OutliersO3

Version: 0.5.4

## In both

*   checking whether package ‘OutliersO3’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/OutliersO3/new/OutliersO3.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘OutliersO3’ ...
** package ‘OutliersO3’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘OutliersO3’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/OutliersO3/new/OutliersO3.Rcheck/OutliersO3’

```
### CRAN

```
* installing *source* package ‘OutliersO3’ ...
** package ‘OutliersO3’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘OutliersO3’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/OutliersO3/old/OutliersO3.Rcheck/OutliersO3’

```
# outreg

Version: 0.2.2

## In both

*   checking examples ... ERROR
    ```
    ...
    2               Std Err  [2.060] [16.079]
    6          age Estimate            -0.129
    7               Std Err           [0.219]
    11       quant Estimate            -0.046
    12              Std Err           [0.058]
    16  Log(scale) Estimate 1.783*** 1.718***
    17              Std Err  [0.309]  [0.310]
    21                    N       20       20
    22                  AIC   62.984   65.880
    > 
    > 
    > # instrumental variable regression
    > library(AER)
    Loading required package: car
    Warning: package ‘car’ was built under R version 3.4.4
    Loading required package: carData
    Warning: package ‘carData’ was built under R version 3.4.4
    Error: package or namespace load failed for ‘car’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called ‘data.table’
    Error: package ‘car’ could not be loaded
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(outreg)
      > 
      > test_check("outreg")
      [31m──[39m [31m1. Error: supported objects (@test_validfits.R#48) [39m [31m─────────────────────────────────────────────────────────[39m
      package 'car' could not be loaded
      1: library(AER) at testthat/test_validfits.R:48
      2: .getRequiredPackages2(pkgInfo, quietly = quietly)
      3: stop(gettextf("package %s could not be loaded", sQuote(pkg)), call. = FALSE, domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 30 SKIPPED: 0 FAILED: 1
      1. Error: supported objects (@test_validfits.R#48) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# padr

Version: 0.4.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: getNamespace(ns)
      13: tryCatch(loadNamespace(name), error = function(e) stop(e))
      14: tryCatchList(expr, classes, parentenv, handlers)
      15: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      16: value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 582 SKIPPED: 0 FAILED: 4
      1. Error: Pad works properly on data.table and tbl (@test_pad.R#37) 
      2. Error: pad_int works on both tbl and data.table (@test_pad_int.R#43) 
      3. Failure: thicken gives correct ouput when x is a df (@test_thicken.R#110) 
      4. Error: set_to_original_type returns tbl or data.table (@test_thicken.R#126) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘data.table’
    ```

# parsemsf

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# patentsview

Version: 0.2.1

## In both

*   R CMD check timed out
    

# PathoStat

Version: 1.2.1

## In both

*   checking whether package ‘PathoStat’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/PathoStat/new/PathoStat.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘PathoStat’ ...
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘PathoStat’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/PathoStat/new/PathoStat.Rcheck/PathoStat’

```
### CRAN

```
* installing *source* package ‘PathoStat’ ...
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘PathoStat’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/PathoStat/old/PathoStat.Rcheck/PathoStat’

```
# pcaExplorer

Version: 2.2.1

## In both

*   checking whether package ‘pcaExplorer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘pcaExplorer’ ...
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘pcaExplorer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/pcaExplorer’

```
### CRAN

```
* installing *source* package ‘pcaExplorer’ ...
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘pcaExplorer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/old/pcaExplorer.Rcheck/pcaExplorer’

```
# philr

Version: 1.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 27-33 (philr-intro.Rmd) 
    Error: processing vignette 'philr-intro.Rmd' failed with diagnostics:
    package or namespace load failed for 'phyloseq' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    name.balance: no visible global function definition for ‘as’
    vote.annotation: no visible global function definition for ‘is’
    Undefined global functions or variables:
      as is
    Consider adding
      importFrom("methods", "as", "is")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘compositions’
    ```

# pivot

Version: 18.4.17

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘odbc’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘colorspace’ ‘lubridate’
      All declared Imports should be used.
    ```

# pixiedust

Version: 0.8.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Hmisc’
    ```

# plotly

Version: 4.7.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    Packages suggested but not available for checking: ‘sf’ ‘RSelenium’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pmc

Version: 1.0.2

## In both

*   R CMD check timed out
    

# ppcSpatial

Version: 0.2.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# PPforest

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# prisonbrief

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# processanimateR

Version: 0.1.1

## In both

*   checking whether package ‘processanimateR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/processanimateR/new/processanimateR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘processanimateR’ ...
** package ‘processanimateR’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘processanimateR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/processanimateR/new/processanimateR.Rcheck/processanimateR’

```
### CRAN

```
* installing *source* package ‘processanimateR’ ...
** package ‘processanimateR’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘processanimateR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/processanimateR/old/processanimateR.Rcheck/processanimateR’

```
# prophet

Version: 0.2.1

## In both

*   checking whether package ‘prophet’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/prophet/new/prophet.Rcheck/00install.out’ for details.
    ```

# proteoQC

Version: 1.12.3

## In both

*   checking whether package ‘proteoQC’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘proteoQC’ ...
** R
** inst
** preparing package for lazy loading
Warning: package ‘XML’ was built under R version 3.4.4
Warning: package ‘VennDiagram’ was built under R version 3.4.4
Warning: package ‘Rcpp’ was built under R version 3.4.4
Warning in fun(libname, pkgname) :
  mzR has been built against a different Rcpp version (0.12.10)
than is installed on your system (0.12.16). This might lead to errors
when loading mzR. If you encounter such issues, please send a report,
including the output of sessionInfo() to the Bioc support forum at 
https://support.bioconductor.org/. For details see also
https://github.com/sneumann/mzR/wiki/mzR-Rcpp-compiler-linker-issue.
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘proteoQC’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/proteoQC’

```
### CRAN

```
* installing *source* package ‘proteoQC’ ...
** R
** inst
** preparing package for lazy loading
Warning: package ‘XML’ was built under R version 3.4.4
Warning: package ‘VennDiagram’ was built under R version 3.4.4
Warning: package ‘Rcpp’ was built under R version 3.4.4
Warning in fun(libname, pkgname) :
  mzR has been built against a different Rcpp version (0.12.10)
than is installed on your system (0.12.16). This might lead to errors
when loading mzR. If you encounter such issues, please send a report,
including the output of sessionInfo() to the Bioc support forum at 
https://support.bioconductor.org/. For details see also
https://github.com/sneumann/mzR/wiki/mzR-Rcpp-compiler-linker-issue.
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘proteoQC’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/old/proteoQC.Rcheck/proteoQC’

```
# proustr

Version: 0.2.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20105 marked UTF-8 strings
    ```

# psycho

Version: 0.2.0

## In both

*   checking whether package ‘psycho’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/psycho/new/psycho.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘psycho’ ...
** package ‘psycho’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘psycho’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/psycho/new/psycho.Rcheck/psycho’

```
### CRAN

```
* installing *source* package ‘psycho’ ...
** package ‘psycho’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘psycho’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/psycho/old/psycho.Rcheck/psycho’

```
# ptstem

Version: 0.0.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        dict   5.1Mb
    ```

# qdap

Version: 2.2.9

## In both

*   checking whether package ‘qdap’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/qdap/new/qdap.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘qdap’ ...
** package ‘qdap’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘qdapDictionaries’ was built under R version 3.4.4
Error: package or namespace load failed for ‘qdapTools’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘qdapTools’ could not be loaded
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/qdap/new/qdap.Rcheck/qdap’

```
### CRAN

```
* installing *source* package ‘qdap’ ...
** package ‘qdap’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘qdapDictionaries’ was built under R version 3.4.4
Error: package or namespace load failed for ‘qdapTools’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘qdapTools’ could not be loaded
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/qdap/old/qdap.Rcheck/qdap’

```
# queuecomputer

Version: 0.8.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# quokar

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MCMCpack’ ‘gridExtra’ ‘knitr’
      All declared Imports should be used.
    ```

# qwraps2

Version: 0.3.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# radiant.basics

Version: 0.8.0

## In both

*   checking whether package ‘radiant.basics’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.basics/new/radiant.basics.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘radiant.basics’ ...
** package ‘radiant.basics’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Error: package or namespace load failed for ‘radiant.data’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘radiant.data’ could not be loaded
ERROR: lazy loading failed for package ‘radiant.basics’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.basics/new/radiant.basics.Rcheck/radiant.basics’

```
### CRAN

```
* installing *source* package ‘radiant.basics’ ...
** package ‘radiant.basics’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Error: package or namespace load failed for ‘radiant.data’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘radiant.data’ could not be loaded
ERROR: lazy loading failed for package ‘radiant.basics’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.basics/old/radiant.basics.Rcheck/radiant.basics’

```
# radiant.data

Version: 0.8.1

## In both

*   checking whether package ‘radiant.data’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.data/new/radiant.data.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘radiant.data’ ...
** package ‘radiant.data’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘radiant.data’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.data/new/radiant.data.Rcheck/radiant.data’

```
### CRAN

```
* installing *source* package ‘radiant.data’ ...
** package ‘radiant.data’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘radiant.data’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.data/old/radiant.data.Rcheck/radiant.data’

```
# radiant.model

Version: 0.8.0

## In both

*   checking whether package ‘radiant.model’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.model/new/radiant.model.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘radiant.model’ ...
** package ‘radiant.model’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Error: package or namespace load failed for ‘radiant.data’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘radiant.data’ could not be loaded
ERROR: lazy loading failed for package ‘radiant.model’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.model/new/radiant.model.Rcheck/radiant.model’

```
### CRAN

```
* installing *source* package ‘radiant.model’ ...
** package ‘radiant.model’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘lubridate’ was built under R version 3.4.4
Error: package or namespace load failed for ‘radiant.data’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘radiant.data’ could not be loaded
ERROR: lazy loading failed for package ‘radiant.model’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/radiant.model/old/radiant.model.Rcheck/radiant.model’

```
# railtrails

Version: 0.0.3

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1583 marked UTF-8 strings
    ```

# rattle

Version: 5.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘RGtk2’ ‘cairoDevice’
    
    Packages suggested but not available for checking:
      ‘gWidgetsRGtk2’ ‘odfWeave’ ‘playwith’ ‘rggobi’ ‘RGtk2Extras’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rclimateca

Version: 1.0.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      4: restquery(.endpoint = "https://httpbin.org/get", arg1 = "value1", arg2 = "value2", .encoding = "UTF-8", .parser = jsonlite::fromJSON)
      5: .parser(lines)
      6: fromJSON_string(txt = txt, simplifyVector = simplifyVector, simplifyDataFrame = simplifyDataFrame, simplifyMatrix = simplifyMatrix, 
             flatten = flatten, ...)
      7: parseJSON(txt, bigint_as_char)
      8: parse_string(txt, bigint_as_char)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 191 SKIPPED: 0 FAILED: 3
      1. Failure: column types for ec_climate_data() are correct (@test-climate_data.R#123) 
      2. Failure: get mudata function for climate data works (@test-climate_data.R#463) 
      3. Error: the parser is used when present (@test-restquery.R#35) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# rcongresso

Version: 0.3.2

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘rcongresso-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fetch_votacoes
    > ### Title: Fetches all the votings which a proposition went through
    > ### Aliases: fetch_votacoes
    > 
    > ### ** Examples
    > 
    > votacoes_pec241 <- fetch_votacoes(2088351)
    Error in .congresso_api(.$path) : Not Found (HTTP 404).
    Calls: fetch_votacoes ... overscope_eval_next -> .congresso_api -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: function_list[[i]](value)
      12: dplyr::do(., .congresso_api(.$path)[[1]])
      13: do.rowwise_df(., .congresso_api(.$path)[[1]])
      14: overscope_eval_next(overscope, args[[j]])
      15: .congresso_api(.$path)
      16: httr::stop_for_status(resp)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 20 SKIPPED: 0 FAILED: 3
      1. Failure: GET deputado inexistente (@test_deputados.R#3) 
      2. Error: (unknown) (@test_proposicoes.R#10) 
      3. Error: (unknown) (@test_votacoes.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: package 'DT' was built under R version 3.4.3
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Warning: package 'knitr' was built under R version 3.4.3
    Quitting from lines 45-50 (introducao-rcongresso.Rmd) 
    Error: processing vignette 'introducao-rcongresso.Rmd' failed with diagnostics:
    Column `id` must be a 1d atomic vector or a list
    Execution halted
    ```

# rcv

Version: 0.2.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   5.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6543 marked UTF-8 strings
    ```

# readability

Version: 0.1.1

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘data.table’ ‘syllable’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# readat

Version: 1.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# redcapAPI

Version: 2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DBI’
      All declared Imports should be used.
    ```

# REDCapR

Version: 0.9.8

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# refund.shiny

Version: 0.3.0

## In both

*   checking whether package ‘refund.shiny’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/refund.shiny/new/refund.shiny.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘refund.shiny’ ...
** package ‘refund.shiny’ successfully unpacked and MD5 sums checked
** R
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘refund.shiny’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/refund.shiny/new/refund.shiny.Rcheck/refund.shiny’

```
### CRAN

```
* installing *source* package ‘refund.shiny’ ...
** package ‘refund.shiny’ successfully unpacked and MD5 sums checked
** R
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘refund.shiny’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/refund.shiny/old/refund.shiny.Rcheck/refund.shiny’

```
# rfishbase

Version: 2.1.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 44 marked UTF-8 strings
    ```

# rhmmer

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# Rilostat

Version: 0.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rmapzen

Version: 0.3.5

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘rgdal’ ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# RNeXML

Version: 2.1.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Done simulation(s).
      [31m──[39m [31m1. Error: (unknown) (@test_taxonomy.R#7) [39m [31m───────────────────────────────────────────────────────────────────[39m
      taxize package required to convert look up taxonomic ids
      1: taxize_nexml(birds, "NCBI") at testthat/test_taxonomy.R:7
      2: stop("taxize package required to convert look up taxonomic ids", call. = FALSE)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 166 SKIPPED: 3 FAILED: 1
      1. Error: (unknown) (@test_taxonomy.R#7) 
      
      Error: testthat unit tests failed
      In addition: Warning messages:
      1: package 'ape' was built under R version 3.4.4 
      2: package 'XML' was built under R version 3.4.4 
      Execution halted
    ```

*   checking whether package ‘RNeXML’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘ape’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RNeXML/new/RNeXML.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Loading required package: ape
    Warning: package 'ape' was built under R version 3.4.4
    Quitting from lines 85-86 (metadata.Rmd) 
    Error: processing vignette 'metadata.Rmd' failed with diagnostics:
    taxize package required to convert look up taxonomic ids
    Execution halted
    ```

# rnoaa

Version: 0.7.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rgdal’
    ```

# rODE

Version: 0.99.6

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rollply

Version: 0.5.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 21-27 (rollply.Rmd) 
    Error: processing vignette 'rollply.Rmd' failed with diagnostics:
    there is no package called 'rgdal'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rgdal’
    ```

# rprev

Version: 0.2.4

## In both

*   checking whether package ‘rprev’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rprev/new/rprev.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rprev’ ...
** package ‘rprev’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Warning: package ‘survival’ was built under R version 3.4.4
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘rprev’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rprev/new/rprev.Rcheck/rprev’

```
### CRAN

```
* installing *source* package ‘rprev’ ...
** package ‘rprev’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Warning: package ‘survival’ was built under R version 3.4.4
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘rprev’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rprev/old/rprev.Rcheck/rprev’

```
# rsample

Version: 0.0.2

## In both

*   checking whether package ‘rsample’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘broom’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rsample/new/rsample.Rcheck/00install.out’ for details.
    ```

# rscopus

Version: 0.5.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# RSSL

Version: 0.6.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rtable

Version: 0.1.5

## In both

*   checking whether package ‘rtable’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘ReporteRsjars’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rtable/new/rtable.Rcheck/00install.out’ for details.
    ```

# RTCGA

Version: 1.6.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    Packages suggested but not available for checking:
      ‘RTCGA.rnaseq’ ‘RTCGA.clinical’ ‘RTCGA.mutations’ ‘RTCGA.RPPA’
      ‘RTCGA.mRNA’ ‘RTCGA.miRNASeq’ ‘RTCGA.methylation’ ‘RTCGA.CNV’
      ‘RTCGA.PANCAN12’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rtimicropem

Version: 1.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# rtrends

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# RtutoR

Version: 1.1

## In both

*   checking whether package ‘RtutoR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RtutoR/new/RtutoR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘RtutoR’ ...
** package ‘RtutoR’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
Error : unable to load R code in package ‘RtutoR’
ERROR: lazy loading failed for package ‘RtutoR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RtutoR/new/RtutoR.Rcheck/RtutoR’

```
### CRAN

```
* installing *source* package ‘RtutoR’ ...
** package ‘RtutoR’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
Error : unable to load R code in package ‘RtutoR’
ERROR: lazy loading failed for package ‘RtutoR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RtutoR/old/RtutoR.Rcheck/RtutoR’

```
# rubias

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# RxODE

Version: 0.6-1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# sabre

Version: 0.2.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# SanzCircos

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘tidyr’
      All declared Imports should be used.
    ```

# scanstatistics

Version: 1.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# SCORPIUS

Version: 1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘testthat’
      All declared Imports should be used.
    ```

# sejmRP

Version: 1.3.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘cluster’ ‘factoextra’ ‘tidyr’
      All declared Imports should be used.
    ```

# Seurat

Version: 2.3.1

## In both

*   checking whether package ‘Seurat’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/new/Seurat.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘loomR’ ‘SingleCellExperiment’
    ```

## Installation

### Devel

```
* installing *source* package ‘Seurat’ ...
** package ‘Seurat’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppProgress/include" -I/usr/local/include  -I../inst/include -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppProgress/include" -I/usr/local/include  -I../inst/include -fPIC  -Wall -g -O2 -c data_manipulation.cpp -o data_manipulation.o
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppProgress/include" -I/usr/local/include  -I../inst/include -fPIC  -Wall -g -O2 -c snn.cpp -o snn.o
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o Seurat.so RcppExports.o data_manipulation.o snn.o -L/Library/Frameworks/R.framework/Resources/lib -lRlapack -L/Library/Frameworks/R.framework/Resources/lib -lRblas -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: warning: directory not found for option '-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0'
ld: warning: directory not found for option '-L/usr/local/gfortran/lib'
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/new/Seurat.Rcheck/Seurat/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘cowplot’ was built under R version 3.4.3
Warning: package ‘Matrix’ was built under R version 3.4.4
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘Seurat’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/new/Seurat.Rcheck/Seurat’

```
### CRAN

```
* installing *source* package ‘Seurat’ ...
** package ‘Seurat’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppProgress/include" -I/usr/local/include  -I../inst/include -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppProgress/include" -I/usr/local/include  -I../inst/include -fPIC  -Wall -g -O2 -c data_manipulation.cpp -o data_manipulation.o
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from data_manipulation.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppProgress/include" -I/usr/local/include  -I../inst/include -fPIC  -Wall -g -O2 -c snn.cpp -o snn.o
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from snn.cpp:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/Seurat/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o Seurat.so RcppExports.o data_manipulation.o snn.o -L/Library/Frameworks/R.framework/Resources/lib -lRlapack -L/Library/Frameworks/R.framework/Resources/lib -lRblas -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: warning: directory not found for option '-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0'
ld: warning: directory not found for option '-L/usr/local/gfortran/lib'
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/old/Seurat.Rcheck/Seurat/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Warning: package ‘cowplot’ was built under R version 3.4.3
Warning: package ‘Matrix’ was built under R version 3.4.4
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘Seurat’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/old/Seurat.Rcheck/Seurat’

```
# sf

Version: 0.6-2

## In both

*   checking whether package ‘sf’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/new/sf.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘rgdal’ ‘mapview’
    ```

## Installation

### Devel

```
* installing *source* package ‘sf’ ...
** package ‘sf’ successfully unpacked and MD5 sums checked
configure: CC: ccache clang -Qunused-arguments
configure: CXX: ccache clang++ -Qunused-arguments
checking for gdal-config... /usr/local/bin/gdal-config
checking gdal-config usability... yes
configure: GDAL: 2.1.2
checking GDAL version >= 2.0.0... yes
checking for gcc... ccache clang -Qunused-arguments
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether ccache clang -Qunused-arguments accepts -g... yes
checking for ccache clang -Qunused-arguments option to accept ISO C89... none needed
checking how to run the C preprocessor... ccache clang -Qunused-arguments -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... rm: conftest.dSYM: is a directory
rm: conftest.dSYM: is a directory
yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking gdal.h usability... yes
checking gdal.h presence... yes
checking for gdal.h... yes
checking GDAL: linking with --libs only... yes
checking GDAL: /usr/local/Cellar/gdal2/2.1.2/share/gdal/pcs.csv readable... yes
checking GDAL: checking whether PROJ.4 is available for linking:... yes
checking GDAL: checking whether PROJ.4 is available fur running:... dyld: Library not loaded: /usr/local/opt/webp/lib/libwebp.6.dylib
  Referenced from: /usr/local/opt/gdal2/lib/libgdal.20.dylib
  Reason: image not found
./configure: line 3584: 33279 Abort trap: 6           ./gdal_proj
no
configure: error: OGRCoordinateTransformation() does not return a coord.trans: PROJ.4 not available?
ERROR: configuration failed for package ‘sf’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/new/sf.Rcheck/sf’

```
### CRAN

```
* installing *source* package ‘sf’ ...
** package ‘sf’ successfully unpacked and MD5 sums checked
configure: CC: ccache clang -Qunused-arguments
configure: CXX: ccache clang++ -Qunused-arguments
checking for gdal-config... /usr/local/bin/gdal-config
checking gdal-config usability... yes
configure: GDAL: 2.1.2
checking GDAL version >= 2.0.0... yes
checking for gcc... ccache clang -Qunused-arguments
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether ccache clang -Qunused-arguments accepts -g... yes
checking for ccache clang -Qunused-arguments option to accept ISO C89... none needed
checking how to run the C preprocessor... ccache clang -Qunused-arguments -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... rm: conftest.dSYM: is a directory
rm: conftest.dSYM: is a directory
yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking gdal.h usability... yes
checking gdal.h presence... yes
checking for gdal.h... yes
checking GDAL: linking with --libs only... yes
checking GDAL: /usr/local/Cellar/gdal2/2.1.2/share/gdal/pcs.csv readable... yes
checking GDAL: checking whether PROJ.4 is available for linking:... yes
checking GDAL: checking whether PROJ.4 is available fur running:... dyld: Library not loaded: /usr/local/opt/webp/lib/libwebp.6.dylib
  Referenced from: /usr/local/opt/gdal2/lib/libgdal.20.dylib
  Reason: image not found
./configure: line 3584: 33205 Abort trap: 6           ./gdal_proj
no
configure: error: OGRCoordinateTransformation() does not return a coord.trans: PROJ.4 not available?
ERROR: configuration failed for package ‘sf’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/old/sf.Rcheck/sf’

```
# shazam

Version: 0.1.9

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# SIBER

Version: 2.1.3

## In both

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > x <- stats::rnorm(50)
    > y <- stats::rnorm(50)
    > parms <- list()
    > parms$n.iter <- 2 * 10^3
    > parms$n.burnin <- 500
    > parms$n.thin <- 2     
    > parms$n.chains <- 2    
    > priors <- list()
    > priors$R <- 1 * diag(2)
    > priors$k <- 2
    > priors$tau.mu <- 1.0E-3
    > fitEllipse(x, y, parms, priors)
    Error: .onLoad failed in loadNamespace() for 'rjags', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/SIBER/rjags/libs/rjags.so':
      dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/SIBER/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/SIBER/rjags/libs/rjags.so
      Reason: image not found
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Quitting from lines 74-93 (Centroid-Vectors.Rmd) 
    Error: processing vignette 'Centroid-Vectors.Rmd' failed with diagnostics:
    .onLoad failed in loadNamespace() for 'rjags', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/SIBER/rjags/libs/rjags.so':
      dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/SIBER/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/SIBER/rjags/libs/rjags.so
      Reason: image not found
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘ggplot2’ ‘viridis’
      All declared Imports should be used.
    ```

# sidrar

Version: 0.2.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# simglm

Version: 0.6.0

## In both

*   checking whether package ‘simglm’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Matrix’ was built under R version 3.4.4
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/simglm/new/simglm.Rcheck/00install.out’ for details.
    ```

# simmer.plot

Version: 0.1.13

## In both

*   checking whether package ‘simmer.plot’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/simmer.plot/new/simmer.plot.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘simmer.plot’ ...
** package ‘simmer.plot’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: S3 methods ‘[.trajectory’, ‘[<-.trajectory’, ‘[[.trajectory’, ‘[[<-.trajectory’, ‘activate.trajectory’, ‘add_dataframe.simmer’, ‘add_generator.simmer’, ‘add_resource.simmer’, ‘batch.trajectory’, ‘branch.trajectory’, ‘clone.trajectory’, ‘deactivate.trajectory’, ‘get_attribute.simmer’, ‘get_capacity.simmer’, ‘get_capacity.wrap’, ‘get_capacity_selected.simmer’, ‘get_mon_arrivals.simmer’, ‘get_mon_arrivals.wrap’, ‘get_mon_attributes.simmer’, ‘get_mon_attributes.wrap’, ‘get_mon_resources.simmer’, ‘get_mon_resources.wrap’, ‘get_n_activities.trajectory’, ‘get_n_generated.simmer’, ‘get_n_generated.wrap’, ‘get_name.simmer’, ‘get_prioritization.simmer’, ‘get_queue_count.simmer’, ‘get_queue_count.wrap’, ‘get_queue_count_selected.simmer’, ‘get_queue_size.simmer’, ‘get_queue_size.wrap’, ‘get_queue_size_selected.simmer’, ‘get_server_count.simmer’, ‘get_server_coun [... truncated]
Error: package or namespace load failed for ‘simmer’ in library.dynam(lib, package, package.lib):
 shared object ‘simmer.so’ not found
Error : package ‘simmer’ could not be loaded
ERROR: lazy loading failed for package ‘simmer.plot’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/simmer.plot/new/simmer.plot.Rcheck/simmer.plot’

```
### CRAN

```
* installing *source* package ‘simmer.plot’ ...
** package ‘simmer.plot’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Warning: S3 methods ‘[.trajectory’, ‘[<-.trajectory’, ‘[[.trajectory’, ‘[[<-.trajectory’, ‘activate.trajectory’, ‘add_dataframe.simmer’, ‘add_generator.simmer’, ‘add_resource.simmer’, ‘batch.trajectory’, ‘branch.trajectory’, ‘clone.trajectory’, ‘deactivate.trajectory’, ‘get_attribute.simmer’, ‘get_capacity.simmer’, ‘get_capacity.wrap’, ‘get_capacity_selected.simmer’, ‘get_mon_arrivals.simmer’, ‘get_mon_arrivals.wrap’, ‘get_mon_attributes.simmer’, ‘get_mon_attributes.wrap’, ‘get_mon_resources.simmer’, ‘get_mon_resources.wrap’, ‘get_n_activities.trajectory’, ‘get_n_generated.simmer’, ‘get_n_generated.wrap’, ‘get_name.simmer’, ‘get_prioritization.simmer’, ‘get_queue_count.simmer’, ‘get_queue_count.wrap’, ‘get_queue_count_selected.simmer’, ‘get_queue_size.simmer’, ‘get_queue_size.wrap’, ‘get_queue_size_selected.simmer’, ‘get_server_count.simmer’, ‘get_server_coun [... truncated]
Error: package or namespace load failed for ‘simmer’ in library.dynam(lib, package, package.lib):
 shared object ‘simmer.so’ not found
Error : package ‘simmer’ could not be loaded
ERROR: lazy loading failed for package ‘simmer.plot’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/simmer.plot/old/simmer.plot.Rcheck/simmer.plot’

```
# sjmisc

Version: 2.7.2

## In both

*   checking whether package ‘sjmisc’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjmisc/new/sjmisc.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘sjmisc’ ...
** package ‘sjmisc’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Warning: S3 methods ‘all.equal.data.table’, ‘groupingsets.data.table’, ‘cube.data.table’, ‘rollup.data.table’, ‘[.data.table’, ‘[<-.data.table’, ‘$<-.data.table’, ‘print.data.table’, ‘as.data.table.data.table’, ‘as.data.table.data.frame’, ‘as.data.table.array’, ‘as.data.table.matrix’, ‘as.data.table.list’, ‘as.data.table.integer’, ‘as.data.table.numeric’, ‘as.data.table.character’, ‘as.data.table.logical’, ‘as.data.table.factor’, ‘as.data.table.ordered’, ‘as.data.table.Date’, ‘as.data.table.ITime’, ‘as.data.table.table’, ‘as.data.table.xts’, ‘as.data.table.default’, ‘as.data.frame.data.table’, ‘as.list.data.table’, ‘as.matrix.data.table’, ‘split.data.table’, ‘dim.data.table’, ‘dimnames.data.table’, ‘dimnames<-.data.table’, ‘names<-.data.table’, ‘duplicated.data.table’, ‘unique.data.table’, ‘merge.data.table’, ‘subset.data.table’, ‘transform.data.table [... truncated]
Error in library.dynam(lib, package, package.lib) : 
  shared object ‘datatable.so’ not found
ERROR: lazy loading failed for package ‘sjmisc’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjmisc/new/sjmisc.Rcheck/sjmisc’

```
### CRAN

```
* installing *source* package ‘sjmisc’ ...
** package ‘sjmisc’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Warning: S3 methods ‘all.equal.data.table’, ‘groupingsets.data.table’, ‘cube.data.table’, ‘rollup.data.table’, ‘[.data.table’, ‘[<-.data.table’, ‘$<-.data.table’, ‘print.data.table’, ‘as.data.table.data.table’, ‘as.data.table.data.frame’, ‘as.data.table.array’, ‘as.data.table.matrix’, ‘as.data.table.list’, ‘as.data.table.integer’, ‘as.data.table.numeric’, ‘as.data.table.character’, ‘as.data.table.logical’, ‘as.data.table.factor’, ‘as.data.table.ordered’, ‘as.data.table.Date’, ‘as.data.table.ITime’, ‘as.data.table.table’, ‘as.data.table.xts’, ‘as.data.table.default’, ‘as.data.frame.data.table’, ‘as.list.data.table’, ‘as.matrix.data.table’, ‘split.data.table’, ‘dim.data.table’, ‘dimnames.data.table’, ‘dimnames<-.data.table’, ‘names<-.data.table’, ‘duplicated.data.table’, ‘unique.data.table’, ‘merge.data.table’, ‘subset.data.table’, ‘transform.data.table [... truncated]
Error in library.dynam(lib, package, package.lib) : 
  shared object ‘datatable.so’ not found
ERROR: lazy loading failed for package ‘sjmisc’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjmisc/old/sjmisc.Rcheck/sjmisc’

```
# sjPlot

Version: 2.4.1

## In both

*   checking whether package ‘sjPlot’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjPlot/new/sjPlot.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘sjPlot’ ...
** package ‘sjPlot’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘sjPlot’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjPlot/new/sjPlot.Rcheck/sjPlot’

```
### CRAN

```
* installing *source* package ‘sjPlot’ ...
** package ‘sjPlot’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘sjPlot’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjPlot/old/sjPlot.Rcheck/sjPlot’

```
# sjstats

Version: 0.14.3

## In both

*   checking whether package ‘sjstats’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjstats/new/sjstats.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘sjstats’ ...
** package ‘sjstats’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Warning in checkMatrixPackageVersion() :
  Package version inconsistency detected.
TMB was built with Matrix version 1.2.12
Current Matrix version is 1.2.14
Please re-install 'TMB' from source using install.packages('TMB', type = 'source') or ask CRAN for a binary version of 'TMB' matching CRAN's 'Matrix' package
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘sjstats’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjstats/new/sjstats.Rcheck/sjstats’

```
### CRAN

```
* installing *source* package ‘sjstats’ ...
** package ‘sjstats’ successfully unpacked and MD5 sums checked
** R
** data
** inst
** preparing package for lazy loading
Warning in checkMatrixPackageVersion() :
  Package version inconsistency detected.
TMB was built with Matrix version 1.2.12
Current Matrix version is 1.2.14
Please re-install 'TMB' from source using install.packages('TMB', type = 'source') or ask CRAN for a binary version of 'TMB' matching CRAN's 'Matrix' package
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘sjstats’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sjstats/old/sjstats.Rcheck/sjstats’

```
# SpaCCr

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# spanish

Version: 0.3.2

## In both

*   checking whether package ‘spanish’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘xml2’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/spanish/new/spanish.Rcheck/00install.out’ for details.
    ```

# spatialwarnings

Version: 1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# staRdom

Version: 1.0.5

## In both

*   checking whether package ‘staRdom’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/staRdom/new/staRdom.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘staRdom’ ...
** package ‘staRdom’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘eemR’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘eemR’ could not be loaded
ERROR: lazy loading failed for package ‘staRdom’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/staRdom/new/staRdom.Rcheck/staRdom’

```
### CRAN

```
* installing *source* package ‘staRdom’ ...
** package ‘staRdom’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘eemR’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘data.table’
Error : package ‘eemR’ could not be loaded
ERROR: lazy loading failed for package ‘staRdom’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/staRdom/old/staRdom.Rcheck/staRdom’

```
# starmie

Version: 0.1.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# statar

Version: 0.6.5

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# statsDK

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘ggplot2’ ‘stringr’
      All declared Imports should be used.
    ```

# statsr

Version: 0.1-0

## In both

*   checking whether package ‘statsr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Matrix’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/statsr/new/statsr.Rcheck/00install.out’ for details.
    ```

# stormwindmodel

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'gridExtra'
    
    The following object is masked from 'package:dplyr':
    
        combine
    
    Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=georgia&zoom=5&size=640x640&scale=2&maptype=terrain&language=en-EN&sensor=false
    Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=georgia&sensor=false
    Warning: geocode failed with status OVER_QUERY_LIMIT, location = "georgia"
    Quitting from lines 220-233 (Details.Rmd) 
    Error: processing vignette 'Details.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 0, 1
    Execution halted
    ```

# stranger

Version: 0.3.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# subSeq

Version: 1.6.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# sunburstR

Version: 2.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      Warning message:
      package 'testthat' was built under R version 3.4.3 
      > library(sunburstR)
      > 
      > test_check("sunburstR")
      [31m──[39m [31m1. Failure: sunburstR works with both csv and json data (@test-basic.R#32) [39m [31m─────────────────────────────────[39m
      `sunburst(sequences_csv)` produced warnings.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 12 SKIPPED: 0 FAILED: 1
      1. Failure: sunburstR works with both csv and json data (@test-basic.R#32) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘treemap’
    ```

# survminer

Version: 0.4.2

## In both

*   checking whether package ‘survminer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/survminer/new/survminer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘survminer’ ...
** package ‘survminer’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘survminer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/survminer/new/survminer.Rcheck/survminer’

```
### CRAN

```
* installing *source* package ‘survminer’ ...
** package ‘survminer’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘survminer’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/survminer/old/survminer.Rcheck/survminer’

```
# sweep

Version: 0.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# switchde

Version: 1.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
        Filter, Find, Map, Position, Reduce, anyDuplicated, append,
        as.data.frame, cbind, colMeans, colSums, colnames, do.call,
        duplicated, eval, evalq, get, grep, grepl, intersect,
        is.unsorted, lapply, lengths, mapply, match, mget, order,
        paste, pmax, pmax.int, pmin, pmin.int, rank, rbind, rowMeans,
        rowSums, rownames, sapply, setdiff, sort, table, tapply,
        union, unique, unsplit, which, which.max, which.min
    
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    Loading required package: ggplot2
    Quitting from lines 15-21 (switchde_vignette.Rmd) 
    Error: processing vignette 'switchde_vignette.Rmd' failed with diagnostics:
    package or namespace load failed for 'scater' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Execution halted
    ```

# swmmr

Version: 0.8.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 26-31 (How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd) 
    Error: processing vignette 'How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd' failed with diagnostics:
    there is no package called 'sf'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘sf’
    ```

# SWMPr

Version: 2.3.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# SWMPrExtension

Version: 0.3.12

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘rgdal’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# syuzhet

Version: 1.0.4

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘syuzhet-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_dct_transform
    > ### Title: Discrete Cosine Transformation with Reverse Transform.
    > ### Aliases: get_dct_transform
    > 
    > ### ** Examples
    > 
    > s_v <- get_sentences("I begin this story with a neutral statement.
    + Now I add a statement about how much I despise cats.  
    + I am allergic to them. I hate them. Basically this is a very silly test. But I do love dogs!")
    Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
      there is no package called ‘data.table’
    Calls: get_sentences ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: textshape::split_sentence
      3: getExportedValue(pkg, name)
      4: asNamespace(ns)
      5: getNamespace(ns)
      6: tryCatch(loadNamespace(name), error = function(e) stop(e))
      7: tryCatchList(expr, classes, parentenv, handlers)
      8: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      9: value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 2 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test-syuzhet.R#13) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Quitting from lines 22-36 (syuzhet-vignette.Rmd) 
    Error: processing vignette 'syuzhet-vignette.Rmd' failed with diagnostics:
    there is no package called 'data.table'
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        R         2.1Mb
        extdata   3.1Mb
    ```

# tauturri

Version: 0.1.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘stringr’
    ```

# taxa

Version: 0.2.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [31m──[39m [31m2. Error: Taxmap can be intialized from raw strings (@test--taxmap_parsers.R#246) [39m [31m──────────────────────────[39m
      Please install taxize
      1: extract_tax_data(raw_data, key = c(var_1 = "info", var_2 = "taxon_id", tax = "info"), regex = "^>var_1:(.+)--var_2:(.+)--non_target--tax:(.+)$") at testthat/test--taxmap_parsers.R:246
      2: lookup_tax_data(tax_data = parsed_input, type = my_type, column = names(my_type), database = database, include_tax_data = include_tax_data)
      3: check_for_pkg("taxize")
      4: stop("Please install ", package, call. = FALSE)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 573 SKIPPED: 0 FAILED: 2
      1. Error: Taxmap can be intialized from queried data (@test--taxmap_parsers.R#154) 
      2. Error: Taxmap can be intialized from raw strings (@test--taxmap_parsers.R#246) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘lazyeval’ ‘rlang’ ‘tidyr’
      All declared Imports should be used.
    ```

# teachingApps

Version: 1.0.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# temperatureresponse

Version: 0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘nlme’ ‘tidyr’
      All declared Imports should be used.
    ```

# textreuse

Version: 0.1.4

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘tm’
    ```

# theseus

Version: 0.1.0

## In both

*   checking whether package ‘theseus’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/theseus/new/theseus.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘theseus’ ...
** package ‘theseus’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘theseus’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/theseus/new/theseus.Rcheck/theseus’

```
### CRAN

```
* installing *source* package ‘theseus’ ...
** package ‘theseus’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘data.table’
ERROR: lazy loading failed for package ‘theseus’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/theseus/old/theseus.Rcheck/theseus’

```
# tidycensus

Version: 0.4.6

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# tidygraph

Version: 1.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: mutate_as_tbl(.data, !(!(!dot)))
      15: mutate(d_tmp, ...)
      16: mutate.tbl_df(d_tmp, ...)
      17: mutate_impl(.data, dots)
      18: group_optimal()
      19: membership(cluster_optimal(graph = .G(), weights = weights))
      20: cluster_optimal(graph = .G(), weights = weights)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 269 SKIPPED: 0 FAILED: 2
      1. Error: grouping returns integer vector (@test-group.R#14) 
      2. Error: grouping returns integer of correct length (@test-group.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyposterior

Version: 0.0.1

## In both

*   checking whether package ‘tidyposterior’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘broom’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidyposterior/new/tidyposterior.Rcheck/00install.out’ for details.
    ```

# tidyquant

Version: 0.5.5

## In both

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lubridate’ was built under R version 3.4.4
      Warning: package ‘PerformanceAnalytics’ was built under R version 3.4.3
      Warning: package ‘xts’ was built under R version 3.4.4
      Warning: package ‘zoo’ was built under R version 3.4.3
      Warning: package ‘quantmod’ was built under R version 3.4.4
      Warning: package ‘TTR’ was built under R version 3.4.3
      Warning: package ‘tibble’ was built under R version 3.4.3
      Warning: package ‘stringr’ was built under R version 3.4.3
      Warning: package ‘forcats’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidyquant/new/tidyquant.Rcheck/00install.out’ for details.
    ```

# tidyverse

Version: 1.2.1

## In both

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tibble’ was built under R version 3.4.3
      Warning: package ‘stringr’ was built under R version 3.4.3
      Warning: package ‘forcats’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# tidyxl

Version: 1.0.1

## In both

*   checking compiled code ... WARNING
    ```
    File ‘tidyxl/libs/tidyxl.so’:
      Found ‘_abort’, possibly from ‘abort’ (C)
        Object: ‘xlex.o’
    
    Compiled code should not call entry points which might terminate R nor
    write to stdout/stderr instead of to the console, nor the system RNG.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

# tilegramsR

Version: 0.2.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# timetk

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘timetk-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tk_augment_timeseries
    > ### Title: Augment the time series signature to the data
    > ### Aliases: tk_augment_timeseries tk_augment_timeseries_signature
    > 
    > ### ** Examples
    > 
    > library(tidyquant)
    Error in library(tidyquant) : there is no package called ‘tidyquant’
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════════
      OK: 1 SKIPPED: 0 FAILED: 9
      1. Error: (unknown) (@test_tk_augment_timeseries.R#2) 
      2. Error: (unknown) (@test_tk_get_timeseries.R#2) 
      3. Error: (unknown) (@test_tk_index.R#3) 
      4. Error: (unknown) (@test_tk_make_future_timeseries.R#2) 
      5. Error: (unknown) (@test_tk_tbl.R#6) 
      6. Error: (unknown) (@test_tk_ts.R#4) 
      7. Error: (unknown) (@test_tk_xts.R#4) 
      8. Error: (unknown) (@test_tk_zoo.R#4) 
      9. Error: (unknown) (@test_tk_zooreg.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 16-29 (TK00_Time_Series_Coercion.Rmd) 
    Error: processing vignette 'TK00_Time_Series_Coercion.Rmd' failed with diagnostics:
    there is no package called 'tidyquant'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘tidyquant’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# tmap

Version: 1.11-2

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘rgdal’ ‘mapview’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# toxplot

Version: 0.1.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘toxplot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fit_curve_tcpl
    > ### Title: fit dose-resopnse curve using tcpl hill model
    > ### Aliases: fit_curve_tcpl
    > 
    > ### ** Examples
    > 
    > ## fit curve with default significant threshold 20
    > 
    > demo_md <- fit_curve_tcpl(demo_mc_norm, assay_info =
    + list(prim_assay = "Primary", toxi_assay = "Cytotox"))
    Warning: package ‘bindrcpp’ was built under R version 3.4.4
    Processing 9 samples(spid)....
    TP0001501G09 ||Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
      there is no package called ‘data.table’
    Calls: fit_curve_tcpl ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# TPP

Version: 3.4.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# translateSPSS2R

Version: 1.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ukbtools

Version: 0.10.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘plyr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5 marked UTF-8 strings
    ```

# unpivotr

Version: 0.3.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# unvotes

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4494 marked UTF-8 strings
    ```

# visdat

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 157-163 (using_visdat.Rmd) 
    Error: processing vignette 'using_visdat.Rmd' failed with diagnostics:
    package or namespace load failed for 'plotly' in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
     there is no package called 'data.table'
    Execution halted
    ```

# vlad

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘RcppArmadillo’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# vqtl

Version: 2.0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘iterators’ ‘knitr’ ‘purrr’ ‘testthat’
      All declared Imports should be used.
    ```

# wand

Version: 0.2.0

## In both

*   checking whether package ‘wand’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/wand/new/wand.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/wand/new/wand.Rcheck/wand’

```
### CRAN

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/wand/old/wand.Rcheck/wand’

```
# wbstats

Version: 0.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1528 marked UTF-8 strings
    ```

# wordbankr

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# xesreadR

Version: 0.2.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# XGR

Version: 1.1.3

## In both

*   checking whether package ‘XGR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘igraph’ was built under R version 3.4.4
      Warning: package ‘dnet’ was built under R version 3.4.4
      Warning: package ‘hexbin’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/XGR/new/XGR.Rcheck/00install.out’ for details.
    ```

# yardstick

Version: 0.0.1

## In both

*   checking whether package ‘yardstick’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘broom’ was built under R version 3.4.4
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/yardstick/new/yardstick.Rcheck/00install.out’ for details.
    ```

# zFactor

Version: 0.1.7

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘data.table’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

