# abjutils

Version: 0.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ActisoftR

Version: 0.0.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# afex

Version: 0.22-1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ez’, ‘ascii’
    ```

# ahpsurvey

Version: 0.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘tidyr’
      All declared Imports should be used.
    ```

# aire.zmvm

Version: 0.6.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 52 marked UTF-8 strings
    ```

# ALA4R

Version: 1.6.0

## In both

*   R CMD check timed out
    

# alphavantager

Version: 0.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# AMR

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘hms’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 67 marked UTF-8 strings
    ```

# amt

Version: 0.0.5.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    Package suggested but not available for checking: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# anomalize

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > library(ggplot2)
    > 
    > data(tidyverse_cran_downloads)
    > 
    > tidyverse_cran_downloads %>%
    +     filter(package == "tidyquant") %>%
    +     ungroup() %>%
    +     time_decompose(count, method = "stl") %>%
    +     anomalize(remainder, method = "iqr") %>%
    +     plot_anomaly_decomposition()
    frequency = 7 days
    trend = 91 days
    Error: Must supply a symbol or a string as argument
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             .Call(rlang_symbol_to_character, x)
         }, string = {
             attributes(x) <- NULL
             x
         }) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/vec-coerce.R:161
      25: type_of(.x) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/types.R:487
      26: ensym(key) at /private/tmp/RtmpozckMT/R.INSTALL8ca679350911/tidyr/R/gather.R:94
      27: rlang::abort(x) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/quotation.R:255
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 63 SKIPPED: 0 FAILED: 1
      1. Error: returns a ggplot (@test-plot_anomaly_decomposition.R#10) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 87-110 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    Must supply a symbol or a string as argument
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        help   4.7Mb
    ```

# anomalyDetection

Version: 0.2.5

## In both

*   checking whether package ‘anomalyDetection’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/anomalyDetection/new/anomalyDetection.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/anomalyDetection/new/anomalyDetection.Rcheck/anomalyDetection’

```
### CRAN

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/anomalyDetection/old/anomalyDetection.Rcheck/anomalyDetection’

```
# arena2r

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘purrr’ ‘shinyBS’ ‘shinydashboard’ ‘shinyjs’
      All declared Imports should be used.
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

Version: 0.3.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 552 marked UTF-8 strings
    ```

# banter

Version: 0.9.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ranger’
      All declared Imports should be used.
    ```

# basecallQC

Version: 1.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc       1.8Mb
        extdata   2.8Mb
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

# BgeeDB

Version: 2.6.2

## In both

*   R CMD check timed out
    

*   checking top-level files ... NOTE
    ```
    File
      LICENSE
    is not mentioned in the DESCRIPTION file.
    ```

# bib2df

Version: 1.0.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library("testthat")
      > library("bib2df")
      > test_check("bib2df")
      [31m──[39m [31m1. Failure: bib2df() throws error messages (@tests.R#70) [39m [31m─────────────────────────────────────────[39m
      `bib2df("https://www.example.com/data/x.bib")` threw an error with unexpected message.
      Expected match: "Invalid URL: File is not readable."
      Actual message: "Could not resolve host: www.example.com"
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 19 SKIPPED: 0 FAILED: 1
      1. Failure: bib2df() throws error messages (@tests.R#70) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# biobroom

Version: 1.12.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following object is masked from 'package:dplyr':
    
        count
    
    Loading required package: BiocParallel
    
    Attaching package: 'DelayedArray'
    
    The following objects are masked from 'package:matrixStats':
    
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following objects are masked from 'package:base':
    
        aperm, apply
    
    Quitting from lines 134-139 (biobroom_vignette.Rmd) 
    Error: processing vignette 'biobroom_vignette.Rmd' failed with diagnostics:
    there is no package called 'airway'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘airway’
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
    tidy.qvalue: no visible binding for global variable ‘smoothed’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/biobroom/new/biobroom.Rcheck/00_pkg_src/biobroom/R/qvalue_tidiers.R:65-66)
    tidy.qvalue: no visible binding for global variable ‘pi0’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/biobroom/new/biobroom.Rcheck/00_pkg_src/biobroom/R/qvalue_tidiers.R:65-66)
    tidy.qvalue: no visible binding for global variable ‘lambda’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/biobroom/new/biobroom.Rcheck/00_pkg_src/biobroom/R/qvalue_tidiers.R:65-66)
    tidy_matrix: no visible binding for global variable ‘value’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/biobroom/new/biobroom.Rcheck/00_pkg_src/biobroom/R/limma_tidiers.R:197-199)
    tidy_matrix: no visible binding for global variable ‘gene’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/biobroom/new/biobroom.Rcheck/00_pkg_src/biobroom/R/limma_tidiers.R:197-199)
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
    Missing or unexported object: ‘xgboost::predict’
    ```

# BloodCancerMultiOmics2017

Version: 1.0.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# blorr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘descriptr’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lmtest’
    ```

# bootnet

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘psych’
      All declared Imports should be used.
    ```

# bossMaps

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rgdal’ ‘tidyr’
      All declared Imports should be used.
    ```

# breathtestcore

Version: 0.4.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
    ```

# broom.mixed

Version: 0.2.3

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘glmmADMB’
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
    Package suggested but not available for checking: ‘sf’
    ```

# capm

Version: 0.13.5

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# CATALYST

Version: 1.4.2

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 10.5Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        data   3.1Mb
        doc    5.1Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    plotDiffHeatmap,matrix-SummarizedExperiment: no visible binding for
      global variable ‘cluster_id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CATALYST/new/CATALYST.Rcheck/00_pkg_src/CATALYST/R/plotDiffHeatmap.R:136)
    plotDiffHeatmap,matrix-SummarizedExperiment: no visible binding for
      global variable ‘sample_id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CATALYST/new/CATALYST.Rcheck/00_pkg_src/CATALYST/R/plotDiffHeatmap.R:136)
    Undefined global functions or variables:
      cluster_id sample_id
    ```

# ccfa

Version: 1.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘doParallel’ ‘foreach’
      All declared Imports should be used.
    ```

# CDECRetrieve

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lazyeval’ ‘purrr’ ‘roxygen2’
      All declared Imports should be used.
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

# chromswitch

Version: 1.2.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# circumplex

Version: 0.1.2

## In both

*   checking whether package ‘circumplex’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/circumplex/new/circumplex.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/circumplex/new/circumplex.Rcheck/circumplex’

```
### CRAN

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/circumplex/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/circumplex/old/circumplex.Rcheck/circumplex’

```
# clusterProfiler

Version: 3.8.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘topGO’
    ```

# CNPBayes

Version: 1.10.0

## In both

*   checking Rd \usage sections ... WARNING
    ```
    Undocumented arguments in documentation object 'marginal_lik'
      ‘value’
    
    Functions with \usage entries need to have the appropriate \alias
    entries, and all their arguments documented.
    The \usage entries must correspond to syntactically valid R code.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
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

*   checking installed package size ... NOTE
    ```
      installed size is  8.3Mb
      sub-directories of 1Mb or more:
        R      2.5Mb
        doc    3.4Mb
        libs   1.4Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    copyNumber,SingleBatchCopyNumber: no visible binding for global
      variable ‘theta.star’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/copynumber-models.R:148-149)
    copyNumber,SingleBatchCopyNumber: no visible binding for global
      variable ‘theta.star’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/CNPBayes/new/CNPBayes.Rcheck/00_pkg_src/CNPBayes/R/copynumber-models.R:150-151)
    Undefined global functions or variables:
      theta.star
    ```

# CNVScope

Version: 1.9.7

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘BSgenome.Hsapiens.UCSC.hg19’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# cocktailApp

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 14661 marked UTF-8 strings
    ```

# codebook

Version: 0.6.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘graphics’ ‘pander’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 65 marked UTF-8 strings
    ```

# codified

Version: 0.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘methods’ ‘readr’
      All declared Imports should be used.
    ```

# colorednoise

Version: 1.0.3

## In both

*   checking whether package ‘colorednoise’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/colorednoise/new/colorednoise.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘colorednoise’ ...
** package ‘colorednoise’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/colorednoise/new/colorednoise.Rcheck/colorednoise’

```
### CRAN

```
* installing *source* package ‘colorednoise’ ...
** package ‘colorednoise’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/colorednoise/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/colorednoise/old/colorednoise.Rcheck/colorednoise’

```
# compareDF

Version: 1.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘stringr’
      All declared Imports should be used.
    ```

# COMPASS

Version: 1.18.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘BiocStyle’ ‘rmarkdown’
      All declared Imports should be used.
    ':::' call which should be '::': ‘flowWorkspace:::.getNodeInd’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    COMPASSfitToCountsTable: no visible binding for global variable
      ‘population’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/COMPASS/new/COMPASS.Rcheck/00_pkg_src/COMPASS/R/utils.R:193)
    COMPASSfitToCountsTable: no visible binding for global variable ‘Count’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/COMPASS/new/COMPASS.Rcheck/00_pkg_src/COMPASS/R/utils.R:193)
    COMPASSfitToCountsTable: no visible binding for global variable
      ‘population’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/COMPASS/new/COMPASS.Rcheck/00_pkg_src/COMPASS/R/utils.R:194)
    COMPASSfitToCountsTable: no visible binding for global variable ‘Count’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/COMPASS/new/COMPASS.Rcheck/00_pkg_src/COMPASS/R/utils.R:194)
    COMPASSfitToCountsTable: no visible binding for global variable ‘id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/COMPASS/new/COMPASS.Rcheck/00_pkg_src/COMPASS/R/utils.R:200)
    COMPASSfitToCountsTable: no visible binding for global variable ‘id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/COMPASS/new/COMPASS.Rcheck/00_pkg_src/COMPASS/R/utils.R:206)
    Undefined global functions or variables:
      Count id population
    ```

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    'library' or 'require' calls not declared from:
      ‘ggplot2’ ‘readxl’
    ```

# congressbr

Version: 0.1.3

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘congressbr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sen_bills
    > ### Title: Downloads and tidies information on the legislation in the
    > ###   Federal Senate
    > ### Aliases: sen_bills
    > 
    > ### ** Examples
    > 
    > pls_5_2010 <- sen_bills(type = "PLS", number = 5, year = 2010)
    Error: Column `bill_indexing` must be a 1d atomic vector or a list
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 187 marked UTF-8 strings
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

# coxed

Version: 0.2.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘mediation’
    ```

# crawl

Version: 2.2.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# crypto

Version: 1.0.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘yaml’
      All declared Imports should be used.
    ```

# curatedMetagenomicData

Version: 1.10.2

## In both

*   checking examples ... ERROR
    ```
    ...
    > ###   HMP_2012.pathabundance_relab.nasalcavity
    > ###   HMP_2012.pathabundance_relab.oralcavity
    > ###   HMP_2012.pathabundance_relab.skin HMP_2012.pathabundance_relab.stool
    > ###   HMP_2012.pathabundance_relab.vagina HMP_2012.pathcoverage.nasalcavity
    > ###   HMP_2012.pathcoverage.oralcavity HMP_2012.pathcoverage.skin
    > ###   HMP_2012.pathcoverage.stool HMP_2012.pathcoverage.vagina
    > 
    > ### ** Examples
    > 
    > HMP_2012.metaphlan_bugs_list.nasalcavity()
    snapshotDate(): 2018-04-27
    see ?curatedMetagenomicData and browseVignettes('curatedMetagenomicData') for documentation
    downloading 1 resources
    retrieving 1 resource
    loading from cache 
        ‘/Users/hadley//.ExperimentHub/1230’
    Error: failed to load resource
      name: EH1230
      title: 20180425.HMP_2012.metaphlan_bugs_list.nasalcavity
      reason: ReadItem: unknown type 108, perhaps written by later version of R
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        doc    1.4Mb
        help   2.7Mb
    ```

# d3r

Version: 0.8.3

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# DAPAR

Version: 1.12.11

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘DAPAR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: violinPlotD
    > ### Title: Builds a violinplot from a dataframe
    > ### Aliases: violinPlotD
    > 
    > ### ** Examples
    > 
    > require(DAPARdata)
    Loading required package: DAPARdata
    
    This is DAPARdata version 1.10.2.
    Use 'DAPARdata()' to list available data sets.
    > data(Exp1_R25_pept)
    > library(vioplot)
    Error: package ‘sm’ required by ‘vioplot’ could not be found
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    diffAnaVolcanoplot_rCharts: no visible binding for global variable ‘g’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/volcanoPlot.R:177-192)
    getTextForGOAnalysis: no visible binding for global variable
      ‘textGOParams’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:348-349)
    getTextForGOAnalysis: no visible binding for global variable ‘input’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:348-349)
    getTextForGOAnalysis: no visible binding for global variable ‘input’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:350-352)
    getTextForGOAnalysis: no visible binding for global variable
      ‘textGOParams’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:355-357)
    getTextForGOAnalysis: no visible binding for global variable ‘input’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:355-357)
    getTextForGOAnalysis: no visible binding for global variable
      ‘textGOParams’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:360-361)
    getTextForGOAnalysis: no visible binding for global variable ‘input’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DAPAR/new/DAPAR.Rcheck/00_pkg_src/DAPAR/R/logText.R:360-361)
    Undefined global functions or variables:
      g input textGOParams x y
    ```

# dartR

Version: 1.0.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘Demerelate’ ‘misc3d’ ‘plotly’ ‘quadprog’ ‘rgl’
      All declared Imports should be used.
    ```

# DChIPRep

Version: 1.10.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc       1.7Mb
        extdata   2.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

# DeepBlueR

Version: 1.6.0

## In both

*   R CMD check timed out
    

*   checking Rd files ... NOTE
    ```
    prepare_Rd: deepblue_enrich_regions_fast.Rd:35-38: Dropping empty section \examples
    ```

# DEGreport

Version: 1.16.0

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘knitr’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/methods.R:274-282)
    degMV: no visible binding for global variable ‘max_sd’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/methods.R:274-282)
    degPatterns: no visible global function definition for ‘rowMedians’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/clustering.R:785-787)
    degPatterns: no visible binding for global variable ‘genes’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/clustering.R:816-821)
    degPlotWide : <anonymous>: no visible binding for global variable
      ‘count’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/genePlots.R:155-158)
    significants,TopTags: no visible binding for global variable ‘FDR’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/AllMethods.R:147-151)
    significants,TopTags: no visible binding for global variable ‘logFC’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/AllMethods.R:147-151)
    significants,list : <anonymous>: no visible binding for global variable
      ‘gene’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DEGreport/new/DEGreport.Rcheck/00_pkg_src/DEGreport/R/AllMethods.R:225)
    Undefined global functions or variables:
      .x FDR base_mean comp compare count counts covar enrichGO gene genes
      keys log2FoldChange log2fc logFC max_sd min_median ratios rowMedians
      simplify
    ```

# DEP

Version: 1.2.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R      1.2Mb
        data   1.4Mb
        doc    3.1Mb
    ```

# destiny

Version: 2.10.2

## In both

*   checking running R code from vignettes ...
    ```
    ...
      When tangling ‘Diffusion-Map-recap.ipynbmeta’:
    Error: Either IPython 3+ or Jupyter has to be installed, but neither could be called.
    Execution halted
    when running code in ‘Diffusion-Maps.ipynbmeta’
      ...
    
      When tangling ‘Diffusion-Maps.ipynbmeta’:
    Error: Either IPython 3+ or Jupyter has to be installed, but neither could be called.
    Execution halted
    when running code in ‘Global-Sigma.ipynbmeta’
      ...
    
      When tangling ‘Global-Sigma.ipynbmeta’:
    Error: Either IPython 3+ or Jupyter has to be installed, but neither could be called.
    Execution halted
    when running code in ‘tidyverse.ipynbmeta’
      ...
    
      When tangling ‘tidyverse.ipynbmeta’:
    Error: Either IPython 3+ or Jupyter has to be installed, but neither could be called.
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘rgl’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        R     2.0Mb
        doc   4.3Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘SingleCellExperiment’
    A package should be listed in only one of these fields.
    'LinkingTo' for ‘grDevices’ is unused as it has no 'include' directory
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘rgl’
    ```

*   checking Rd \usage sections ... NOTE
    ```
    S3 methods shown with full name in documentation object 'plot.DPT':
      ‘plot.DPT’
    
    S3 methods shown with full name in documentation object 'plot.DiffusionMap':
      ‘plot.DiffusionMap’
    
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    '::' or ':::' imports not declared from:
      ‘gridExtra’ ‘viridis’
    'library' or 'require' calls not declared from:
      ‘IRdisplay’ ‘IRkernel’ ‘base64enc’ ‘forcats’ ‘readxl’ ‘repr’
      ‘tidyverse’
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'DPT.ipynbmeta' failed with diagnostics:
    Either IPython 3+ or Jupyter has to be installed, but neither could be called.
    Execution halted
    ```

# dextergui

Version: 0.1.4

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
    
    Loading required package: RSQLite
    no column `person_id` provided, automatically generating unique person id's
    File img/main_bar.PNG not found in resource path
    Error: processing vignette 'dextergui.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 99
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘dexter:::get_resp_data’ ‘dexter:::qcolors’
      See the note in ?`:::` about the use of this operator.
    ```

# DiagrammeR

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.8Mb
      sub-directories of 1Mb or more:
        R             3.0Mb
        htmlwidgets   3.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# diffcyt

Version: 1.0.10

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 127-144 (diffcyt_workflow.Rmd) 
    Error: processing vignette 'diffcyt_workflow.Rmd' failed with diagnostics:
    there is no package called 'HDCytoData'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘HDCytoData’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMedians.R:133-136)
    calcMediansByClusterMarker: no visible binding for global variable
      ‘cluster_id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMediansByClusterMarker.R:123-126)
    calcMediansByClusterMarker: no visible binding for global variable
      ‘marker’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMediansByClusterMarker.R:123-126)
    calcMediansByClusterMarker: no visible binding for global variable
      ‘value’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMediansByClusterMarker.R:123-126)
    calcMediansBySampleMarker: no visible binding for global variable
      ‘sample_id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMediansBySampleMarker.R:119-122)
    calcMediansBySampleMarker: no visible binding for global variable
      ‘marker’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMediansBySampleMarker.R:119-122)
    calcMediansBySampleMarker: no visible binding for global variable
      ‘value’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/diffcyt/new/diffcyt.Rcheck/00_pkg_src/diffcyt/R/calcMediansBySampleMarker.R:119-122)
    Undefined global functions or variables:
      cluster_id marker sample_id value
    ```

# disto

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘proxy’
      All declared Imports should be used.
    ```

# DLMtool

Version: 5.2.3

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# dlookr

Version: 0.3.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        doc   4.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘randomForest’
      All declared Imports should be used.
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

# DSAIDE

Version: 0.7.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        media       2.2Mb
        shinyapps   2.6Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘rmarkdown’ ‘utils’
      All declared Imports should be used.
    ```

# DSAIRM

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘rmarkdown’
      All declared Imports should be used.
    ```

# dynfrail

Version: 0.5.2

## In both

*   checking whether package ‘dynfrail’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dynfrail/new/dynfrail.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘dynfrail’ ...
** package ‘dynfrail’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dynfrail/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dynfrail’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dynfrail/new/dynfrail.Rcheck/dynfrail’

```
### CRAN

```
* installing *source* package ‘dynfrail’ ...
** package ‘dynfrail’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dynfrail/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dynfrail’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dynfrail/old/dynfrail.Rcheck/dynfrail’

```
# dynutils

Version: 1.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# echor

Version: 0.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

# edgarWebR

Version: 1.0.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# eechidna

Version: 1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        data   5.6Mb
        doc    1.2Mb
    ```

# EFDR

Version: 0.1.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/EFDR/new/EFDR.Rcheck/00_pkg_src/EFDR/R/EFDR_functions.R:686)
    .relist.dwt: no visible global function definition for ‘as’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/EFDR/new/EFDR.Rcheck/00_pkg_src/EFDR/R/EFDR_functions.R:686)
    .std.wav.coeff : <anonymous>: no visible global function definition for
      ‘mad’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/EFDR/new/EFDR.Rcheck/00_pkg_src/EFDR/R/EFDR_functions.R:698)
    regrid: no visible global function definition for ‘predict’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/EFDR/new/EFDR.Rcheck/00_pkg_src/EFDR/R/EFDR_functions.R:391-396)
    regrid: no visible global function definition for ‘var’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/EFDR/new/EFDR.Rcheck/00_pkg_src/EFDR/R/EFDR_functions.R:406)
    regrid: no visible global function definition for ‘medpolish’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/EFDR/new/EFDR.Rcheck/00_pkg_src/EFDR/R/EFDR_functions.R:427)
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

# ENCODExplorer

Version: 2.6.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 74.0Mb
      sub-directories of 1Mb or more:
        data     24.1Mb
        doc       1.5Mb
        extdata  48.0Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    step6_target: no visible binding for global variable ‘target’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ENCODExplorer/new/ENCODExplorer.Rcheck/00_pkg_src/ENCODExplorer/R/prepare_data.R:354-355)
    step7: no visible binding for global variable ‘organism’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ENCODExplorer/new/ENCODExplorer.Rcheck/00_pkg_src/ENCODExplorer/R/prepare_data.R:424-425)
    step8: no visible binding for global variable ‘investigated_as’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ENCODExplorer/new/ENCODExplorer.Rcheck/00_pkg_src/ENCODExplorer/R/prepare_data.R:436-437)
    step8: no visible binding for global variable ‘target’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ENCODExplorer/new/ENCODExplorer.Rcheck/00_pkg_src/ENCODExplorer/R/prepare_data.R:439-440)
    step9: no visible binding for global variable ‘organism’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ENCODExplorer/new/ENCODExplorer.Rcheck/00_pkg_src/ENCODExplorer/R/prepare_data.R:449-450)
    Undefined global functions or variables:
      . Experiment Value accession antibody_caption
      antibody_characterization antibody_target assay
      biological_replicate_number biosample_name biosample_type col_name
      controls data date_released download.file encode_df file_accession
      file_format href investigated_as lab nucleic_acid_term organism
      platform project replicate_antibody replicate_library server status
      submitted_by target technical_replicate_number treatment ui value
    Consider adding
      importFrom("utils", "data", "download.file")
    to your NAMESPACE file.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 771 marked UTF-8 strings
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

# epos

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘testthat’ ‘tidyr’
      All declared Imports should be used.
    ```

# eurostat

Version: 3.2.9

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ExPanDaR

Version: 0.3.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# eyetrackingR

Version: 0.1.7

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning: Removed 37 rows containing non-finite values (stat_summary).
    Warning in make_onset_data(response_window_clean, onset_time = 15500, fixation_window_length = 1,  :
      Very few trials have a legitimate first AOI! Possible incorrect onset time?
    Warning in max(SwitchAOI) :
      no non-missing arguments to max; returning -Inf
    Warning in min(SwitchAOI) :
      no non-missing arguments to min; returning Inf
    Warning in max(df_plot$.Time) :
      no non-missing arguments to max; returning -Inf
    Quitting from lines 91-93 (onset_contingent_analysis_vignette.Rmd) 
    Error: processing vignette 'onset_contingent_analysis_vignette.Rmd' failed with diagnostics:
    replacement has 1 row, data has 0
    Execution halted
    ```

# factoextra

Version: 1.0.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘NbClust’
    ```

# fastR2

Version: 1.2.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        snippet   3.7Mb
    ```

# fingertipscharts

Version: 0.0.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# fold

Version: 0.2.6

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘fold-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: boxplot.folded
    > ### Title: Boxplot Method for Folded
    > ### Aliases: boxplot.folded
    > 
    > ### ** Examples
    > 
    > data(eventsf)
    > boxplot(eventsf, SEX, WT, ref = 68)
    Error in get(fun, mode = "function", envir = parent.frame()) : 
      object 'boxplot_panel' of mode 'function' was not found
    Calls: boxplot ... <Anonymous> -> bwplot.formula -> %in% -> formals -> get
    Execution halted
    ```

# GA4GHshiny

Version: 1.2.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1: library(TxDb.Hsapiens.UCSC.hg19.knownGene) at testthat/test-tidyVariants.R:17
      2: stop(txt, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 4 SKIPPED: 0 FAILED: 7
      1. Error: app works (@test-app.R#5) 
      2. Error: getGene works (@test-getGene.R#5) 
      3. Error: initializeReferences works (@test-initializeReferences.R#6) 
      4. Error: initializeVariantSet works (@test-initializeVariantSet.R#6) 
      5. Error: (unknown) (@test-searchVariantsByGeneSymbol.R#4) 
      6. Error: tidyVariants works with searchVariants output (@test-tidyVariants.R#6) 
      7. Error: tidyVariants works with searchVariantsByGeneSymbol output (@test-tidyVariants.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘TxDb.Hsapiens.UCSC.hg19.knownGene’
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
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

# GEOquery

Version: 2.48.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.9Mb
      sub-directories of 1Mb or more:
        extdata  12.8Mb
    ```

*   checking whether the namespace can be loaded with stated dependencies ... NOTE
    ```
    Warning: no function found corresponding to methods exports from ‘GEOquery’ for: ‘show’
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘httr’
      All declared Imports should be used.
    Package in Depends field not imported from: ‘methods’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:531-539)
    parseGSEMatrix: no visible binding for global variable ‘accession’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:531-539)
    parseGSEMatrix: no visible binding for global variable ‘accession’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:541-542)
    parseGSEMatrix: no visible global function definition for ‘new’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:568)
    parseGSEMatrix: no visible global function definition for ‘new’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:590)
    parseGSEMatrix: no visible global function definition for ‘new’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:606-610)
    parseGSEMatrix: no visible global function definition for ‘as’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/GEOquery/new/GEOquery.Rcheck/00_pkg_src/GEOquery/R/parseGEO.R:606-610)
    Undefined global functions or variables:
      . MA accession as characteristics k kvpair new read.delim read.table
      v
    Consider adding
      importFrom("methods", "as", "new")
      importFrom("utils", "read.delim", "read.table")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# GerminaR

Version: 1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘shinydashboard’
      All declared Imports should be used.
    ```

# getTBinR

Version: 0.5.5

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(getTBinR)
      > 
      > test_check("getTBinR")
      [31m──[39m [31m1. Failure: map_tb_burden can have a custom legend specified. (@test-map_tb_burden.R#62) [39m [31m─────────[39m
      plot$labels$fill not equal to `test_label`.
      1/1 mismatches
      x[1]: "`test (test - test)`"
      y[1]: "test (test - test)"
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 75 SKIPPED: 29 FAILED: 1
      1. Failure: map_tb_burden can have a custom legend specified. (@test-map_tb_burden.R#62) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# gfer

Version: 0.1.10

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# ggCompNet

Version: 0.1.0

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
    
    Warning: Removed 8 rows containing missing values (geom_segment).
    Quitting from lines 610-612 (examples-from-paper.Rmd) 
    Error: processing vignette 'examples-from-paper.Rmd' failed with diagnostics:
    cannot open URL 'http://maps.googleapis.com/maps/api/staticmap?center=39.09984,-77.16764&zoom=13&size=640x640&scale=2&maptype=terrain&language=en-EN&sensor=false'
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        doc   6.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘ggmap’ ‘gridExtra’ ‘scales’ ‘tnet’
      All declared Imports should be used.
    ```

# ggedit

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# ggfan

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘colorspace’ ‘grid’ ‘rstan’
      All declared Imports should be used.
    ```

# ggformula

Version: 0.9.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        R     2.1Mb
        doc   2.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘quantreg’
    ```

# ggfortify

Version: 0.4.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      Initial stress        : 0.01705
      stress after  10 iters: 0.00951, magic = 0.500
      stress after  20 iters: 0.00941, magic = 0.500
      initial  value 7.505733 
      final  value 7.505688 
      converged
      Initial stress        : 0.01705
      stress after  10 iters: 0.00951, magic = 0.500
      stress after  20 iters: 0.00941, magic = 0.500
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 1448 SKIPPED: 9 FAILED: 1
      1. Error: fortify.MSwM works for sample data (@test-MSwM.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggiraphExtra

Version: 0.2.9

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggforce’ ‘webshot’ ‘ztable’
      All declared Imports should be used.
    ```

# ggpubr

Version: 0.1.8

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggquickeda

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘Formula’ ‘Hmisc’ ‘colourpicker’ ‘dplyr’ ‘ggpmisc’ ‘ggrepel’
      ‘grDevices’ ‘gridExtra’ ‘lazyeval’ ‘markdown’ ‘plotly’ ‘quantreg’
      ‘rlang’ ‘shinyjs’ ‘table1’ ‘tidyr’
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

# ggspatial

Version: 1.0.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# ggstatsplot

Version: 0.0.6

## In both

*   R CMD check timed out
    

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc    2.6Mb
        help   2.3Mb
    ```

# ggthemes

Version: 4.0.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 138 marked UTF-8 strings
    ```

# ggtree

Version: 1.12.7

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        rotate
    
    Average angle change [1] 0.205749672759501
    Average angle change [2] 0.0594793517814446
    Average angle change [3] 0.0265103772447353
    Warning in min(y) : no non-missing arguments to min; returning Inf
    Warning in max(y) : no non-missing arguments to max; returning -Inf
    Warning: Removed 1 rows containing missing values (geom_point_g_gtree).
    Warning: Removed 1 rows containing missing values (geom_point_g_gtree).
    Warning: Removed 13 rows containing missing values (geom_text).
    Warning: Removed 12 rows containing missing values (geom_text).
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Warning: The plyr::rename operation has created duplicates for the following name(s): (`size`)
    Loading required package: Biostrings
    Warning in library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
      there is no package called 'Biostrings'
    Quitting from lines 301-303 (treeAnnotation.Rmd) 
    Error: processing vignette 'treeAnnotation.Rmd' failed with diagnostics:
    object 'readBStringSet' not found
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.8Mb
      sub-directories of 1Mb or more:
        doc        4.9Mb
        examples   3.7Mb
    ```

# googlesheets

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tibble’
      All declared Imports should be used.
    ```

# graphTweets

Version: 0.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# GSODR

Version: 1.2.3

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

# gutenbergr

Version: 0.1.4

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13617 marked UTF-8 strings
    ```

# highcharter

Version: 0.5.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.9Mb
      sub-directories of 1Mb or more:
        doc          13.7Mb
        htmlwidgets   1.8Mb
    ```

# HTSSIP

Version: 1.4.0

## In both

*   R CMD check timed out
    

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘igraph’
      All declared Imports should be used.
    ```

# HURDAT

Version: 0.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# hurricaneexposure

Version: 0.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

# iCNV

Version: 1.0.0

## In both

*   checking whether package ‘iCNV’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/iCNV/new/iCNV.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘iCNV’ ...
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : package ‘BSgenome.Hsapiens.UCSC.hg19’ required by ‘CODEX’ could not be found
ERROR: lazy loading failed for package ‘iCNV’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/iCNV/new/iCNV.Rcheck/iCNV’

```
### CRAN

```
* installing *source* package ‘iCNV’ ...
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : package ‘BSgenome.Hsapiens.UCSC.hg19’ required by ‘CODEX’ could not be found
ERROR: lazy loading failed for package ‘iCNV’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/iCNV/old/iCNV.Rcheck/iCNV’

```
# idealstan

Version: 0.2.7

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.4Mb
      sub-directories of 1Mb or more:
        data   3.5Mb
        libs   3.6Mb
    ```

# IHWpaper

Version: 1.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [1] "LSL GBH"
      [1] "TST GBH"
      [1] "SBH"
      [1] "Clfdr"
      [1] "Greedy Indep. Filt."
      [1] "IHW"
      [1] "IHW-Bonferroni E3"
      [1] "Bonferroni"
      [1] "qvalue"
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 1 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_analyze_datasets.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 29-65 (BH-explanation.Rmd) 
    Error: processing vignette 'BH-explanation.Rmd' failed with diagnostics:
    Palette not found.
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘airway’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 24.0Mb
      sub-directories of 1Mb or more:
        doc      13.1Mb
        extdata   9.8Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    scott_fdrreg: no visible global function definition for ‘FDRreg’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/covariate_methods.R:88)
    scott_fdrreg: no visible global function definition for ‘getFDR’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/covariate_methods.R:97)
    sim_fun_eval: no visible binding for global variable ‘fdr_method’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/benchmarking.R:61-63)
    sim_fun_eval: no visible binding for global variable ‘fdr_pars’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/benchmarking.R:61-63)
    sim_fun_eval: no visible binding for global variable ‘FDP’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/benchmarking.R:61-63)
    sim_fun_eval: no visible binding for global variable ‘rj_ratio’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/benchmarking.R:61-63)
    sim_fun_eval: no visible binding for global variable ‘FPR’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/benchmarking.R:61-63)
    sim_fun_eval: no visible binding for global variable ‘FWER’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IHWpaper/new/IHWpaper.Rcheck/00_pkg_src/IHWpaper/R/benchmarking.R:61-63)
    Undefined global functions or variables:
      FDP FDRreg FPR FWER fdr_method fdr_pars getFDR rj_ratio
    ```

# INDperform

Version: 0.1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   3.0Mb
        help   1.1Mb
    ```

# InjurySeverityScore

Version: 0.0.0.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Calculate injury severity score from ICD-9
    > ### Aliases: injury_score
    > 
    > ### ** Examples
    > 
    > pat_id <- c(2,2,2,2,2,1,2,1,2,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1)
    > icd9 <- c('874.2', '874.8', '900.81', '900.82', '900.89', '805.06', 
    +           'E966', '805.07', 'V14.0', '807.02', 'V70.4', '821.01', '823.20', 
    +           '860.0', '861.01', '861.21', '861.22', '863.84', '864.04', '865.04', 
    +           '865.09', '866.02', '868.04', '958.4')
    > sample_data <- data.frame(subj = pat_id, code = icd9, stringsAsFactors = FALSE)
    > injury_score(sample_data, subj, code)
      subj br_1 br_2 br_3 br_4 br_5 br_6 max_1 max_2 max_3 iss
    1    2    3    0    0    0    0    1     3     1     0  10
    2    1    2    0    3    5    3    0     5     3     3  43
    > 
    > data2 <- data.frame(pid = c(1,2), diag1 = c('900.89', '805.06'),
    +                     diag2 = c('863.84', '865.04'))
    > injury_score(data2, pid, diag, tall = FALSE)
    Error: Must supply a symbol or a string as argument
    Execution halted
    ```

# IONiseR

Version: 2.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        doc       3.7Mb
        extdata   1.5Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘idx’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IONiseR/new/IONiseR.Rcheck/00_pkg_src/IONiseR/R/Methods-subsetting.R:19-21)
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘component’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IONiseR/new/IONiseR.Rcheck/00_pkg_src/IONiseR/R/Methods-subsetting.R:24-26)
    [,Fast5Summary-ANY-ANY-ANY: no visible binding for global variable
      ‘idx’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IONiseR/new/IONiseR.Rcheck/00_pkg_src/IONiseR/R/Methods-subsetting.R:24-26)
    show,Fast5Summary: no visible binding for global variable ‘full_2D’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IONiseR/new/IONiseR.Rcheck/00_pkg_src/IONiseR/R/classes.R:70-71)
    show,Fast5Summary: no visible binding for global variable ‘pass’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IONiseR/new/IONiseR.Rcheck/00_pkg_src/IONiseR/R/classes.R:75)
    show,Fast5Summary: no visible binding for global variable ‘pass’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/IONiseR/new/IONiseR.Rcheck/00_pkg_src/IONiseR/R/classes.R:77)
    Undefined global functions or variables:
      := AAAAA TTTTT accumulation baseCalledComplement baseCalledTemplate
      bases_called category channel circleFun component duration error freq
      full_2D group hour idx matrixCol matrixRow meanZValue mean_value
      median_signal minute mux name nbases new_reads num_events oddEven
      pass pentamer rbindlist readIDs seq_length start_time time_bin
      time_group x y zvalue
    ```

# iotables

Version: 0.3.4

## In both

*   checking whether package ‘iotables’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/iotables/new/iotables.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘iotables’ ...
** package ‘iotables’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘sf’
ERROR: lazy loading failed for package ‘iotables’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/iotables/new/iotables.Rcheck/iotables’

```
### CRAN

```
* installing *source* package ‘iotables’ ...
** package ‘iotables’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘sf’
ERROR: lazy loading failed for package ‘iotables’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/iotables/old/iotables.Rcheck/iotables’

```
# ipumsr

Version: 0.3.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# isomiRs

Version: 1.8.0

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.7Mb
      sub-directories of 1Mb or more:
        data   7.1Mb
        doc    1.2Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘tidyr’
    A package should be listed in only one of these fields.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    .run_enricher: no visible global function definition for ‘enrichGO’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:57)
    .run_enricher: no visible binding for global variable ‘sel_genes’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:57)
    .run_enricher: no visible global function definition for ‘enrichGO’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:59)
    .run_enricher: no visible binding for global variable ‘sel_genes’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:59)
    .run_enricher: no visible binding for global variable ‘Count’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:65)
    .viz_mirna_gene_enrichment: no visible binding for global variable ‘X1’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:350-351)
    isoNetwork: no visible binding for global variable ‘Description’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:289-291)
    isoNetwork: no visible binding for global variable ‘geneID’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:289-291)
    isoPlotNet: no visible binding for global variable ‘ngene’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00_pkg_src/isomiRs/R/targets.R:426-427)
    Undefined global functions or variables:
      Count Description X1 enrichGO geneID mirna_se mrna_de mrna_se ngene
      sel_genes
    ```

# jpndistrict

Version: 0.3.2

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

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# Lahman

Version: 6.0-0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.6Mb
      sub-directories of 1Mb or more:
        data   7.4Mb
    ```

# linguisticsdown

Version: 1.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dplyr’ ‘tidyr’
      All declared Imports should be used.
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

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘grid’
      All declared Imports should be used.
    ```

# MANOVA.RM

Version: 0.3.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    2018-10-23 21:41:10.229 R[34747:24275457] *** WARNING: Method userSpaceScaleFactor in class NSView is deprecated on 10.7 and later. It should not be used in new applications. Use convertRectToBacking: instead. 
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘nparLD’
    ```

# mason

Version: 0.2.6

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pixiedust’
    ```

# mem

Version: 2.13

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sm’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# memapp

Version: 2.10

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘RColorBrewer’ ‘RODBC’ ‘dplyr’ ‘foreign’ ‘formattable’ ‘ggplot2’
      ‘haven’ ‘magrittr’ ‘mem’ ‘openxlsx’ ‘plotly’ ‘readxl’ ‘shinyBS’
      ‘shinydashboard’ ‘shinyjs’ ‘shinythemes’ ‘stringi’ ‘stringr’ ‘tidyr’
      All declared Imports should be used.
    ```

# MetaCyto

Version: 1.2.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    collectData: no visible binding for global variable ‘value’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/collectData.R:27)
    panelSummary: no visible binding for global variable ‘antibodies’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/panelSummary.R:34)
    panelSummary: no visible binding for global variable ‘value’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/panelSummary.R:34)
    plotGA: no visible binding for global variable ‘lower’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/plotGA.R:33-39)
    plotGA: no visible binding for global variable ‘upper’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/plotGA.R:33-39)
    searchCluster : <anonymous>: no visible binding for global variable
      ‘triS’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/searchCluster.R:102)
    searchCluster : <anonymous>: no visible binding for global variable
      ‘triS’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/searchCluster.R:103)
    searchCluster : <anonymous>: no visible binding for global variable
      ‘triS’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MetaCyto/new/MetaCyto.Rcheck/00_pkg_src/MetaCyto/R/searchCluster.R:104)
    Undefined global functions or variables:
      antibodies lower parameter_name triS upper value
    ```

# MetamapsDB

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Matrix’ ‘shiny’
      All declared Imports should be used.
    ```

# mixOmics

Version: 6.3.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.7Mb
      sub-directories of 1Mb or more:
        R      5.1Mb
        data   4.0Mb
    ```

# mlbgameday

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘doParallel’ ‘iterators’ ‘parallel’
      All declared Imports should be used.
    ```

# modelr

Version: 0.1.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘rstanarm’
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

Version: 3.1.1

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
** byte-compile and prepare package for lazy loading
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
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rjags', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/morse/rjags/libs/rjags.so
  Reason: image not found
ERROR: lazy loading failed for package ‘morse’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/morse/old/morse.Rcheck/morse’

```
# mosaic

Version: 1.4.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘manipulate’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        R     4.1Mb
        doc   1.9Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cubature’
    ```

# mosaicData

Version: 0.17.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
    ```

# mosaicModel

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘caret’ ‘ggformula’ ‘knitr’ ‘testthat’ ‘tidyverse’
      All declared Imports should be used.
    ```

# MSstats

Version: 3.12.3

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:194-197)
    plot_quantlim: no visible binding for global variable ‘ymax’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:194-197)
    plot_quantlim: no visible binding for global variable ‘x’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:218-221)
    plot_quantlim: no visible binding for global variable ‘y’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:218-221)
    plot_quantlim: no visible binding for global variable ‘shape’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:218-221)
    plot_quantlim: no visible binding for global variable ‘x’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:223-226)
    plot_quantlim: no visible binding for global variable ‘y’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:223-226)
    plot_quantlim: no visible binding for global variable ‘shape’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00_pkg_src/MSstats/R/plot_quantlim.R:223-226)
    Undefined global functions or variables:
      ABUNDANCE FEATURE FRACTION Intensity LABEL Mean Name PeptideSequence
      Protein ProteinName Protein_number RUN Selected_fragments
      Selected_peptides Train_size aggr_Fragment_Annotation aggr_Peak_Area
      analysis ciw datafeature fea label logFC missing.col ncount ount
      residual shape weight x y ymax ymin
    ```

# mudata2

Version: 1.0.3

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

# MultiAssayExperiment

Version: 1.6.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Unexported objects imported by ':::' calls:
      ‘BiocGenerics:::replaceSlots’ ‘S4Vectors:::selectSome’
      See the note in ?`:::` about the use of this operator.
    ```

# multicolor

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘cowsay’
      All declared Imports should be used.
    ```

# multistateutils

Version: 1.2.0

## In both

*   checking examples ... ERROR
    ```
    ...
    + })
    > 
    > # New individual to estimate transition probabilities for
    > newdata <- data.frame(age="20-40", dissub="AML")
    > 
    > # Estimate length of stay in each state after a year, given starting in state 1
    > length_of_stay(models, 
    +                newdata=newdata,
    +                tmat, times=365.25,
    +                start=1)
    
     *** caught illegal operation ***
    address 0x10dfafb00, cause 'illegal opcode'
    
    Traceback:
     1: desCpp(transitions, trans_mat, newdata_mat, start_times, start_states -     1, tcovs)
     2: data.table::as.data.table(desCpp(transitions, trans_mat, newdata_mat,     start_times, start_states - 1, tcovs))
     3: run_sim(transition_list, attr_mat, trans_mat, tcovs, start_times,     start_states)
     4: state_occupancy(models, trans_mat, newdata_ext, tcovs, initial_times,     start_states, ci, M, agelimit, agecol, agescale)
     5: length_of_stay(models, newdata = newdata, tmat, times = 365.25,     start = 1)
    An irrecoverable exception occurred. R is aborting now ...
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      26: tryCatchList(expr, classes, parentenv, handlers)
      27: tryCatch(withCallingHandlers({    eval(code, test_env)    if (!handled && !is.null(test)) {        skip_empty()    }}, expectation = handle_expectation, skip = handle_skip, warning = handle_warning,     message = handle_message, error = handle_error), error = handle_fatal,     skip = function(e) {    })
      28: test_code(NULL, exprs, env)
      29: source_file(path, new.env(parent = env), chdir = TRUE, wrap = wrap)
      30: force(code)
      31: with_reporter(reporter = reporter, start_end_reporter = start_end_reporter,     {        lister$start_file(basename(path))        source_file(path, new.env(parent = env), chdir = TRUE,             wrap = wrap)        end_context()    })
      32: FUN(X[[i]], ...)
      33: lapply(paths, test_file, env = env, reporter = current_reporter,     start_end_reporter = FALSE, load_helpers = FALSE, wrap = wrap)
      34: force(code)
      35: with_reporter(reporter = current_reporter, results <- lapply(paths,     test_file, env = env, reporter = current_reporter, start_end_reporter = FALSE,     load_helpers = FALSE, wrap = wrap))
      36: test_files(paths, reporter = reporter, env = env, stop_on_failure = stop_on_failure,     stop_on_warning = stop_on_warning, wrap = wrap)
      37: test_dir(path = test_path, reporter = reporter, env = env, filter = filter,     ..., stop_on_failure = stop_on_failure, stop_on_warning = stop_on_warning,     wrap = wrap)
      38: test_package_dir(package = package, test_path = test_path, filter = filter,     reporter = reporter, ..., stop_on_failure = stop_on_failure,     stop_on_warning = stop_on_warning, wrap = wrap)
      39: test_check("multistateutils")
      An irrecoverable exception occurred. R is aborting now ...
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    11: timing_fn(handle(ev <- withCallingHandlers(withVisible(eval(expr,     envir, enclos)), warning = wHandler, error = eHandler, message = mHandler)))
    12: evaluate_call(expr, parsed$src[[i]], envir = envir, enclos = enclos,     debug = debug, last = i == length(out), use_try = stop_on_error !=         2L, keep_warning = keep_warning, keep_message = keep_message,     output_handler = output_handler, include_timing = include_timing)
    13: evaluate::evaluate(...)
    14: evaluate(code, envir = env, new_device = FALSE, keep_warning = !isFALSE(options$warning),     keep_message = !isFALSE(options$message), stop_on_error = if (options$error &&         options$include) 0L else 2L, output_handler = knit_handlers(options$render,         options))
    15: in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,     keep_warning = !isFALSE(options$warning), keep_message = !isFALSE(options$message),     stop_on_error = if (options$error && options$include) 0L else 2L,     output_handler = knit_handlers(options$render, options)))
    16: block_exec(params)
    17: call_block(x)
    18: process_group.block(group)
    19: process_group(group)
    20: withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        setwd(wd)        cat(res, sep = "\n", file = output %n% "")        message("Quitting from lines ", paste(current_lines(i),             collapse = "-"), " (", knit_concord$get("infile"),             ") ")    })
    21: process_file(text, output)
    22: knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet,     encoding = encoding)
    23: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv())
    24: vweave_rmarkdown(...)
    25: engine$weave(file, quiet = quiet, encoding = enc)
    26: doTryCatch(return(expr), name, parentenv, handler)
    27: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    28: tryCatchList(expr, classes, parentenv, handlers)
    29: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    find_vignette_product(name, by = "weave", engine = engine)}, error = function(e) {    stop(gettextf("processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)), domain = NA, call. = FALSE)})
    30: buildVignettes(dir = "/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/multistateutils/new/multistateutils.Rcheck/vign_test/multistateutils")
    An irrecoverable exception occurred. R is aborting now ...
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘survival’
      All declared Imports should be used.
    ```

# naniar

Version: 0.4.0.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      8: withVisible(function_list[[k]](value))
      9: function_list[[k]](value)
      10: dplyr::mutate(., any_missing = label_shadow(., !!!quo_vars, missing = missing, complete = complete))
      11: mutate.tbl_df(., any_missing = label_shadow(., !!!quo_vars, missing = missing, complete = complete))
      12: mutate_impl(.data, dots)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 456 SKIPPED: 23 FAILED: 4
      1. Error: add_label_shadow returns a tibble (@test-add-label-shadow.R#7) 
      2. Error: add_label_shadow adds the right number of columns (@test-add-label-shadow.R#13) 
      3. Error: add_label_shadow adds a column with suffix 'any_missing' (@test-add-label-shadow.R#20) 
      4. Error: (unknown) (@test-add-label-shadow.R#45) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ncappc

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘bookdown’
      All declared Imports should be used.
    ```

# ndexr

Version: 1.2.0

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Deprecated license: BSD
    ```

*   checking dependencies in R code ... NOTE
    ```
    Package in Depends field not imported from: ‘igraph’
      These packages need to be imported from (in the NAMESPACE file)
      for when this namespace is loaded but not attached.
    Unexported object imported by a ':::' call: ‘httr:::default_ua’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    rcx_toRCXgraph: no visible global function definition for ‘E’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:117)
    rcx_toRCXgraph: no visible global function definition for ‘E<-’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:117)
    rcxgraph_fromRCX: no visible global function definition for ‘V’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:116)
    rcxgraph_fromRCX: no visible global function definition for ‘V<-’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:116)
    rcxgraph_fromRCX: no visible global function definition for ‘E’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:117)
    rcxgraph_fromRCX: no visible global function definition for ‘E<-’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:117)
    rcxgraph_toRCX: no visible binding for global variable ‘po’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:268)
    rcxgraph_toRCX: no visible binding for global variable ‘po’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ndexr/new/ndexr.Rcheck/00_pkg_src/ndexr/R/ndex_RCXgraph.r:294)
    Undefined global functions or variables:
      E E<- V V<- packageVersion po tail
    Consider adding
      importFrom("utils", "packageVersion", "tail")
    to your NAMESPACE file.
    ```

# NetworkChange

Version: 0.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘plyr’
      All declared Imports should be used.
    ```

# neuropsychology

Version: 0.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘htmlTable’ ‘lme4’ ‘stringi’
      All declared Imports should be used.
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
      installed size is  8.6Mb
      sub-directories of 1Mb or more:
        data   8.0Mb
    ```

# nlmixr

Version: 1.0.0-7

## In both

*   checking whether package ‘nlmixr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

## Installation

### Devel

```
* installing *source* package ‘nlmixr’ ...
** package ‘nlmixr’ successfully unpacked and MD5 sums checked
** libs
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c jj.c -o jj.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c jj.g.d_parser.c -o jj.g.d_parser.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c init.c -o init.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c rprintf.c -o rprintf.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c chkSolved.c -o chkSolved.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c merge3.c -o merge3.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c neldermead.cpp -o neldermead.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c slice.cpp -o slice.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c RcppExportMod.cpp -o RcppExportMod.o
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c ode_cmt1.cpp -o ode_cmt1.o
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core.hpp:44:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:14:13: warning: unused function 'set_zero_all_adjoints' [-Wunused-function]
static void set_zero_all_adjoints() {
            ^
In file included from ode_cmt1.cpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat.hpp:70:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/fun/autocorrelation.hpp:18:8: warning: function 'fft_next_good_size' is not needed and will not be emitted [-Wunneeded-internal-declaration]
size_t fft_next_good_size(size_t N) {
       ^
19 warnings generated.
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c resid.cpp -o resid.o
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o nlmixr.so jj.o jj.g.d_parser.o init.o rprintf.o chkSolved.o merge3.o neldermead.o slice.o RcppExportMod.o ode_cmt1.o RcppExports.o resid.o -L/Library/Frameworks/R.framework/Resources/lib -lRlapack -L/Library/Frameworks/R.framework/Resources/lib -lRblas -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: warning: directory not found for option '-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0'
ld: warning: directory not found for option '-L/usr/local/gfortran/lib'
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
Error: package or namespace load failed for ‘nlmixr’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr/libs/nlmixr.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr/libs/nlmixr.so, 6): Symbol not found: _wrapper_ddot_
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr/libs/nlmixr.so
  Expected in: flat namespace
 in /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr/libs/nlmixr.so
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr’

```
### CRAN

```
* installing *source* package ‘nlmixr’ ...
** package ‘nlmixr’ successfully unpacked and MD5 sums checked
** libs
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c jj.c -o jj.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c jj.g.d_parser.c -o jj.g.d_parser.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c init.c -o init.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c rprintf.c -o rprintf.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c chkSolved.c -o chkSolved.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c merge3.c -o merge3.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c neldermead.cpp -o neldermead.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c slice.cpp -o slice.o
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c RcppExportMod.cpp -o RcppExportMod.o
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c ode_cmt1.cpp -o ode_cmt1.o
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from ode_cmt1.cpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core.hpp:44:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:14:13: warning: unused function 'set_zero_all_adjoints' [-Wunused-function]
static void set_zero_all_adjoints() {
            ^
In file included from ode_cmt1.cpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat.hpp:70:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/fun/autocorrelation.hpp:18:8: warning: function 'fft_next_good_size' is not needed and will not be emitted [-Wunneeded-internal-declaration]
size_t fft_next_good_size(size_t N) {
       ^
19 warnings generated.
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I/usr/local/include  -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2 -c resid.cpp -o resid.o
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/CholmodSupport:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:35:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/KroneckerProduct:34:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:39:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/Polynomials:135:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from resid.cpp:5:
In file included from ../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:40:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/SparseExtra:51:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/unsupported/Eigen/../../Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
17 warnings generated.
clang++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o nlmixr.so jj.o jj.g.d_parser.o init.o rprintf.o chkSolved.o merge3.o neldermead.o slice.o RcppExportMod.o ode_cmt1.o RcppExports.o resid.o -L/Library/Frameworks/R.framework/Resources/lib -lRlapack -L/Library/Frameworks/R.framework/Resources/lib -lRblas -L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0 -L/usr/local/gfortran/lib -lgfortran -lquadmath -lm -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: warning: directory not found for option '-L/usr/local/gfortran/lib/gcc/x86_64-apple-darwin15/6.1.0'
ld: warning: directory not found for option '-L/usr/local/gfortran/lib'
installing to /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr/libs
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
Error: package or namespace load failed for ‘nlmixr’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr/libs/nlmixr.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr/libs/nlmixr.so, 6): Symbol not found: _wrapper_ddot_
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr/libs/nlmixr.so
  Expected in: flat namespace
 in /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr/libs/nlmixr.so
Error: loading failed
Execution halted
ERROR: loading failed
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr’

```
# noaastormevents

Version: 0.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RColorBrewer’ ‘XML’ ‘choroplethr’ ‘choroplethrMaps’ ‘data.table’
      ‘forcats’ ‘hurricaneexposure’ ‘plyr’
      All declared Imports should be used.
    ```

# NOAAWeather

Version: 0.1.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
    ```

# nullabor

Version: 0.3.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘forecast’ ‘rlang’ ‘tidyverse’ ‘tsibble’
      All declared Imports should be used.
    ```

# nzelect

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        data   5.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6409 marked UTF-8 strings
    ```

# openair

Version: 2.5-0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        R   3.0Mb
    ```

# parsemsf

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# PathoStat

Version: 1.6.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pcaExplorer

Version: 2.6.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘pcaExplorer-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_annotation
    > ### Title: Get an annotation data frame from biomaRt
    > ### Aliases: get_annotation
    > 
    > ### ** Examples
    > 
    > library(airway)
    Error in library(airway) : there is no package called ‘airway’
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(pcaExplorer)
      
      > 
      > test_check("pcaExplorer")
      [31m──[39m [31m1. Error: (unknown) (@test_pca2go.R#6) [39m [31m───────────────────────────────────────────────────────────[39m
      there is no package called 'airway'
      1: library(airway) at testthat/test_pca2go.R:6
      2: stop(txt, domain = NA)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 13 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_pca2go.R#6) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Quitting from lines 375-384 (pcaExplorer.Rmd) 
    Error: processing vignette 'pcaExplorer.Rmd' failed with diagnostics:
    there is no package called 'airway'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘airway’
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.4Mb
      sub-directories of 1Mb or more:
        doc   6.6Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    pcaExplorer: no visible binding for '<<-' assignment to
      ‘pcaexplorer_env’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/00_pkg_src/pcaExplorer/R/pcaExplorer.R:67)
    pcaExplorer : <anonymous>: no visible binding for global variable
      ‘airway’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/00_pkg_src/pcaExplorer/R/pcaExplorer.R:1034)
    pcaExplorer : <anonymous>: no visible binding for global variable
      ‘airway’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/00_pkg_src/pcaExplorer/R/pcaExplorer.R:1035)
    pcaExplorer : <anonymous>: no visible binding for global variable
      ‘pcaexplorer_env’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/00_pkg_src/pcaExplorer/R/pcaExplorer.R:2423)
    pcaExplorer : <anonymous>: no visible binding for global variable
      ‘pcaexplorer_env’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/pcaExplorer/new/pcaExplorer.Rcheck/00_pkg_src/pcaExplorer/R/pcaExplorer.R:2424)
    Undefined global functions or variables:
      airway pcaexplorer_env
    ```

# pcr

Version: 1.1.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# performanceEstimation

Version: 1.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# perturbatr

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   3.1Mb
    ```

# philr

Version: 1.6.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    name.balance: no visible global function definition for ‘as’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/philr/new/philr.Rcheck/00_pkg_src/philr/R/name_balances.R:57)
    vote.annotation: no visible global function definition for ‘is’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/philr/new/philr.Rcheck/00_pkg_src/philr/R/name_balances.R:127-131)
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

# Pi

Version: 1.8.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘XGR’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# pivot

Version: 18.4.17

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             .Call(rlang_symbol_to_character, x)
         }, string = {
             attributes(x) <- NULL
             x
         }) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/vec-coerce.R:161
      7: type_of(.x) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/types.R:487
      8: ensym(key) at /private/tmp/RtmpozckMT/R.INSTALL8ca679350911/tidyr/R/gather.R:94
      9: rlang::abort(x) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/quotation.R:255
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 86 SKIPPED: 1 FAILED: 1
      1. Error: unpivot.data.frame (@test-unpivot.R#57) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

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

Version: 0.8.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Hmisc’
    ```

# plotly

Version: 4.8.0

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘devtools’ ‘sf’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.0Mb
      sub-directories of 1Mb or more:
        R             2.3Mb
        htmlwidgets   3.1Mb
    ```

# plyranges

Version: 1.0.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             e$handled <- TRUE
             test_error <<- e
         }, "could not find function \"WIGFile\"", quote(WIGFile(test_wig))) at testthat/test-io-wig.R:24
      2: eval(code, test_env)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 271 SKIPPED: 0 FAILED: 5
      1. Error: read_bed returns correct GRanges (@test-io-bed.R#67) 
      2. Error: read_bed_graph returns correct GRanges (@test-io-bedGraph.R#39) 
      3. Error: reading/ writing bigwig files returns correct GRanges (@test-io-bw.R#19) 
      4. Error: reading GFF files returns correct GRanges (@test-io-gff.R#87) 
      5. Error: reading WIG files (@test-io-wig.R#24) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘BSgenome.Hsapiens.UCSC.hg19’
    ```

# pmc

Version: 1.0.3

## In both

*   R CMD check timed out
    

# PopED

Version: 0.4.0

## Newly fixed

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        R     3.0Mb
        doc   1.2Mb
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# postal

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      10: purrr::map_dfr(., fetch_and_sleep)
      11: map(.x, .f, ...)
      12: .f(.x[[i]], ...)
      13: readr::write_csv(this, write_to, append = TRUE, col_names = FALSE) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/postal/new/postal.Rcheck/00_pkg_src/postal/R/fetch_zones_all.R:57
      14: write_delim(x, path, delim = ",", na = na, append = append, col_names = col_names)
      15: stream_delim(x_out, path, delim, col_names = col_names, append = append, na = na)
      16: open(path, "ab")
      17: open.connection(path, "ab")
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 108 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_fetch_zones.R#120) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ppcSpatial

Version: 0.2.0

## In both

*   checking whether package ‘ppcSpatial’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ppcSpatial/new/ppcSpatial.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ppcSpatial’ ...
** package ‘ppcSpatial’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘sf’
ERROR: lazy loading failed for package ‘ppcSpatial’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ppcSpatial/new/ppcSpatial.Rcheck/ppcSpatial’

```
### CRAN

```
* installing *source* package ‘ppcSpatial’ ...
** package ‘ppcSpatial’ successfully unpacked and MD5 sums checked
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘sf’
ERROR: lazy loading failed for package ‘ppcSpatial’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ppcSpatial/old/ppcSpatial.Rcheck/ppcSpatial’

```
# prisonbrief

Version: 0.1.0

## In both

*   checking whether package ‘prisonbrief’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/prisonbrief/new/prisonbrief.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘prisonbrief’ ...
** package ‘prisonbrief’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘sf’
ERROR: lazy loading failed for package ‘prisonbrief’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/prisonbrief/new/prisonbrief.Rcheck/prisonbrief’

```
### CRAN

```
* installing *source* package ‘prisonbrief’ ...
** package ‘prisonbrief’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘sf’
ERROR: lazy loading failed for package ‘prisonbrief’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/prisonbrief/old/prisonbrief.Rcheck/prisonbrief’

```
# proteoQC

Version: 1.16.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'proteoQC.Rmd' failed with diagnostics:
    there is no package called ‘prettydoc’
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘RforProteomics’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.7Mb
      sub-directories of 1Mb or more:
        doc       2.5Mb
        extdata   3.9Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    qcHist: no visible binding for global variable ‘techRep’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:406-416)
    qcHist: no visible binding for global variable ‘bioRep’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:406-416)
    qcHist2: no visible binding for global variable ‘error’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:357-365)
    qcHist2: no visible binding for global variable ‘fractile’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:357-365)
    qcHist2: no visible binding for global variable ‘fractile’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:367-369)
    qcHist2: no visible binding for global variable ‘error’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:377-385)
    qcHist2: no visible binding for global variable ‘fractile’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:377-385)
    qcHist2: no visible binding for global variable ‘fractile’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00_pkg_src/proteoQC/R/visualization.R:389-391)
    Undefined global functions or variables:
      ..count.. Intensity MS1QC MS2QC TMT10 TMT6 Tag V1 V2 V3 V4 V5 bioRep
      curenv delta error exprs fractile fraction grid.draw iTRAQ4 iTRAQ8
      label peplength peptide_summary precursorCharge quantify ratio
      readMgfData se techRep val x y
    ```

# proustr

Version: 0.2.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20105 marked UTF-8 strings
    ```

# psychmeta

Version: 2.2.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.8Mb
      sub-directories of 1Mb or more:
        R   7.1Mb
    ```

# psycho

Version: 0.3.7

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        doc   4.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
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

Version: 2.3.0

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
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/qdap/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/qdap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/qdap/rJava/libs/rJava.so
  Reason: image not found
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
** byte-compile and prepare package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/qdap/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/qdap/rJava/libs/rJava.so, 6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/qdap/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/qdap/old/qdap.Rcheck/qdap’

```
# quantities

Version: 0.1.1

## In both

*   checking whether the package can be loaded ... ERROR
    ```
    Loading this package had a fatal error status code 1
    Loading log:
    Error: package ‘units’ 0.6.0 was found, but >= 0.6.1 is required by ‘quantities’
    In addition: Warning message:
    version 0.6.1 of ‘units’ masked by 0.6.0 in /Users/hadley/R 
    Execution halted
    ```

# questionr

Version: 0.6.3

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Hmisc’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4145 marked UTF-8 strings
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
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# radiant.data

Version: 0.9.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘shinyFiles’
      All declared Imports should be used.
    ```

# railtrails

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1557 marked UTF-8 strings
    ```

# rattle

Version: 5.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘gWidgetsRGtk2’ ‘playwith’ ‘RGtk2Extras’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        R      4.2Mb
        data   3.1Mb
        etc    1.9Mb
        po     1.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    2018-10-23 23:41:58.434 R[37335:24746490] *** WARNING: Method userSpaceScaleFactor in class NSView is deprecated on 10.7 and later. It should not be used in new applications. Use convertRectToBacking: instead. 
    ```

# rclimateca

Version: 1.0.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
    ```

# rcongresso

Version: 0.4.6

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 150-156 (utilizando-fetch-proposicao.Rmd) 
    Error: processing vignette 'utilizando-fetch-proposicao.Rmd' failed with diagnostics:
    API did not return json
    Execution halted
    ```

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      18: dplyr::do(., .congresso_api(API_path, .))
      19: do.rowwise_df(., .congresso_api(API_path, .))
      20: overscope_eval_next(overscope, args[[j]])
      21: .congresso_api(API_path, .) at /private/tmp/RtmpZRLWD8/R.INSTALL6ec2159f9257/rlang/R/lifecycle-retired.R:794
      22: .get_from_api(path, query) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rcongresso/new/rcongresso.Rcheck/00_pkg_src/rcongresso/R/utils.R:55
      23: .use_backoff_exponencial(path, query, timeout, tentativa + 1) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rcongresso/new/rcongresso.Rcheck/00_pkg_src/rcongresso/R/utils.R:33
      24: .get_from_api(path, query, final_timeout, tentativa) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rcongresso/new/rcongresso.Rcheck/00_pkg_src/rcongresso/R/utils.R:17
      25: stop(.ERRO_RETORNO_JSON, call. = FALSE) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rcongresso/new/rcongresso.Rcheck/00_pkg_src/rcongresso/R/utils.R:38
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 72 SKIPPED: 0 FAILED: 1
      1. Error: Quantidade de itens por requisição (@test_proposicoes.R#82) 
      
      Error: testthat unit tests failed
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
    Package required but not available: ‘syllable’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# readabs

Version: 0.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘sjmisc’ ‘stringr’
      All declared Imports should be used.
    ```

# readat

Version: 1.6.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    sfread: no visible binding for global variable ‘header’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/readat/new/readat.Rcheck/00_pkg_src/readat/R/sfread.R:54)
    sfread: no visible binding for global variable ‘nrows’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/readat/new/readat.Rcheck/00_pkg_src/readat/R/sfread.R:54)
    Undefined global functions or variables:
      header nrows
    ```

# redcapAPI

Version: 2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘readr’
      All declared Imports should be used.
    ```

# REDCapR

Version: 0.9.8

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# rfbCNPJ

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 27 marked UTF-8 strings
    ```

# rfishbase

Version: 2.1.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

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

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# rmapzen

Version: 0.4.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rnoaa

Version: 0.7.0

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available:
      ‘httr’ ‘crul’ ‘lubridate’ ‘ggplot2’ ‘scales’ ‘XML’ ‘xml2’ ‘jsonlite’
      ‘rappdirs’ ‘gridExtra’ ‘isdparser’ ‘geonames’ ‘hoardr’
    
    Packages suggested but not available for checking:
      ‘roxygen2’ ‘testthat’ ‘knitr’ ‘taxize’ ‘ncdf4’ ‘leaflet’ ‘rgdal’
      ‘rmarkdown’ ‘ggmap’ ‘ropenaq’
    
    VignetteBuilder package required for checking but not installed: ‘knitr’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rODE

Version: 0.99.6

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘data.table’
      All declared Imports should be used.
    ```

# ropenaq

Version: 0.2.6

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# rprev

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘doParallel’ ‘foreach’
      All declared Imports should be used.
    ```

# RSDA

Version: 2.0.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘randomcoloR’
      All declared Imports should be used.
    ```

# rsinaica

Version: 0.5.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘rsinaica-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sinaica_station_dates
    > ### Title: Dates supported by a station
    > ### Aliases: sinaica_station_dates
    > 
    > ### ** Examples
    > 
    > ## id 271 is Xalostoc. See `stations_sinaica`
    > df <- sinaica_station_dates(271, "Manual")
    Error: parse error: premature EOF
                                           
                         (right here) ------^
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 467 marked UTF-8 strings
    ```

# rtable

Version: 0.1.5

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘ReporteRs’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# RTCGA

Version: 1.10.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘RTCGA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: boxplotTCGA
    > ### Title: Create Boxplots for TCGA Datasets
    > ### Aliases: boxplotTCGA
    > 
    > ### ** Examples
    > 
    > library(RTCGA.rnaseq)
    Error in library(RTCGA.rnaseq) : 
      there is no package called ‘RTCGA.rnaseq’
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(RTCGA)
      Welcome to the RTCGA (version: 1.10.0).
      > library(RTCGA.rnaseq)
      Error in library(RTCGA.rnaseq) : 
        there is no package called 'RTCGA.rnaseq'
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘devtools’ ‘RTCGA.rnaseq’ ‘RTCGA.clinical’ ‘RTCGA.mutations’
      ‘RTCGA.RPPA’ ‘RTCGA.mRNA’ ‘RTCGA.miRNASeq’ ‘RTCGA.methylation’
      ‘RTCGA.CNV’ ‘RTCGA.PANCAN12’
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘xvar’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘yvar’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘angle’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    ggbiplot: no visible binding for global variable ‘hjust’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/ggbiplot.R:157-161)
    read.mutations: no visible binding for global variable ‘.’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/readTCGA.R:383)
    read.mutations: no visible binding for global variable ‘.’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/readTCGA.R:386)
    read.rnaseq: no visible binding for global variable ‘.’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/readTCGA.R:372-375)
    survivalTCGA: no visible binding for global variable ‘times’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/survivalTCGA.R:101-137)
    whichDateToUse: no visible binding for global variable ‘.’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/RTCGA/new/RTCGA.Rcheck/00_pkg_src/RTCGA/R/downloadTCGA.R:167-168)
    Undefined global functions or variables:
      . angle hjust muted times varname xvar yvar
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘RTCGA.rnaseq’, ‘RTCGA.clinical’, ‘RTCGA.mutations’, ‘RTCGA.CNV’, ‘RTCGA.RPPA’, ‘RTCGA.mRNA’, ‘RTCGA.miRNASeq’, ‘RTCGA.methylation’
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

Version: 1.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
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

Version: 0.8.0-8

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.7Mb
      sub-directories of 1Mb or more:
        R      1.6Mb
        doc    1.6Mb
        libs   2.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘n1qn1’
      All declared Imports should be used.
    ```

# sabre

Version: 0.2.1

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

# SCORPIUS

Version: 1.0.2

## In both

*   checking whether package ‘SCORPIUS’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SCORPIUS/new/SCORPIUS.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘SCORPIUS’ ...
** package ‘SCORPIUS’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘SCORPIUS’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SCORPIUS/new/SCORPIUS.Rcheck/SCORPIUS’

```
### CRAN

```
* installing *source* package ‘SCORPIUS’ ...
** package ‘SCORPIUS’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘devtools’
ERROR: lazy loading failed for package ‘SCORPIUS’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SCORPIUS/old/SCORPIUS.Rcheck/SCORPIUS’

```
# sdStaf

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rgdal’ ‘rgeos’ ‘tidyr’
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

Version: 2.3.4

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘loomR’
    ```

# sf

Version: 0.7-0

## In both

*   checking whether package ‘sf’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/new/sf.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘sf’ ...
** package ‘sf’ successfully unpacked and MD5 sums checked
configure: CC: ccache clang -Qunused-arguments
configure: CXX: clang++ -std=gnu++11
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
checking GDAL: checking whether PROJ is available for linking:... yes
checking GDAL: checking whether PROJ is available fur running:... dyld: Library not loaded: /usr/local/opt/webp/lib/libwebp.6.dylib
  Referenced from: /usr/local/opt/gdal2/lib/libgdal.20.dylib
  Reason: image not found
./configure: line 3601: 49203 Abort trap: 6           ./gdal_proj
no
configure: error: OGRCoordinateTransformation() does not return a coord.trans: PROJ not available?
ERROR: configuration failed for package ‘sf’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/new/sf.Rcheck/sf’

```
### CRAN

```
* installing *source* package ‘sf’ ...
** package ‘sf’ successfully unpacked and MD5 sums checked
configure: CC: ccache clang -Qunused-arguments
configure: CXX: clang++ -std=gnu++11
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
checking GDAL: checking whether PROJ is available for linking:... yes
checking GDAL: checking whether PROJ is available fur running:... dyld: Library not loaded: /usr/local/opt/webp/lib/libwebp.6.dylib
  Referenced from: /usr/local/opt/gdal2/lib/libgdal.20.dylib
  Reason: image not found
./configure: line 3601: 48180 Abort trap: 6           ./gdal_proj
no
configure: error: OGRCoordinateTransformation() does not return a coord.trans: PROJ not available?
ERROR: configuration failed for package ‘sf’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/old/sf.Rcheck/sf’

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

# singscore

Version: 1.0.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘singscore-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: projectScoreLandscape
    > ### Title: Project data on the landscape plot obtained from
    > ###   'plotScoreLandscape()'
    > ### Aliases: projectScoreLandscape
    > 
    > ### ** Examples
    > 
    > ranked <- rankGenes(toy_expr_se)
    > scoredf1 <- simpleScore(ranked, upSet = toy_gs_up, downSet = toy_gs_dn)
    > scoredf2 <- simpleScore(ranked, upSet = toy_gs_up)
    > psl <- plotScoreLandscape(scoredf1, scoredf2)
    > projectScoreLandscape(psl,scoredf1, scoredf2)
    Warning: Ignoring unknown aesthetics: text
    Error in FUN(X[[i]], ...) : object 'Signature 1' not found
    Calls: <Anonymous> ... ggplot_build.ggplot -> by_layer -> f -> <Anonymous> -> f -> lapply -> FUN
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Loading required package: XML
    
    Attaching package: 'XML'
    
    The following object is masked from 'package:tools':
    
        toHTML
    
    Loading required package: graph
    
    Attaching package: 'graph'
    
    The following object is masked from 'package:XML':
    
        addNode
    
    Quitting from lines 174-182 (singscore.Rmd) 
    Error: processing vignette 'singscore.Rmd' failed with diagnostics:
    object 'tcga-EPI' not found
    Execution halted
    ```

# sjstats

Version: 0.17.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘arm’
    ```

# sparklyr

Version: 0.9.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.1Mb
      sub-directories of 1Mb or more:
        R      4.1Mb
        java   1.9Mb
    ```

# staRdom

Version: 1.0.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘readr’ ‘tools’
      All declared Imports should be used.
    ```

# starmie

Version: 0.1.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.2Mb
      sub-directories of 1Mb or more:
        doc       1.1Mb
        extdata   4.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘MCMCpack’
      All declared Imports should be used.
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

# stormwindmodel

Version: 0.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

# STRMPS

Version: 0.5.8

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘STRaitRazoR’
    ```

# subSeq

Version: 1.10.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/subSeq/new/subSeq.Rcheck/00_pkg_src/subSeq/R/summary.subsamples.R:127-129)
    summary.subsamples: no visible binding for global variable ‘percent’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/subSeq/new/subSeq.Rcheck/00_pkg_src/subSeq/R/summary.subsamples.R:127-129)
    summary.subsamples: no visible binding for global variable ‘proportion’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/subSeq/new/subSeq.Rcheck/00_pkg_src/subSeq/R/summary.subsamples.R:127-129)
    summary.subsamples: no visible binding for global variable ‘method’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/subSeq/new/subSeq.Rcheck/00_pkg_src/subSeq/R/summary.subsamples.R:127-129)
    voomLimma: no visible global function definition for ‘model.matrix’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/subSeq/new/subSeq.Rcheck/00_pkg_src/subSeq/R/handlers.R:41)
    Undefined global functions or variables:
      . ID average.depth average.value coefficient cor count cov depth
      estFDP method metric model.matrix o.coefficient o.lfdr o.padj
      p.adjust padj percent plot proportion pvalue rFDP rbinom replication
      selectMethod significant valid value var
    Consider adding
      importFrom("graphics", "plot")
      importFrom("methods", "selectMethod")
      importFrom("stats", "cor", "cov", "model.matrix", "p.adjust", "rbinom",
                 "var")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

# SummarizedBenchmark

Version: 1.0.4

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following object is masked from 'package:SummarizedBenchmark':
    
        plotROC
    
    
    Attaching package: 'magrittr'
    
    The following object is masked from 'package:rlang':
    
        set_names
    
    The following object is masked from 'package:tidyr':
    
        extract
    
    Loading required package: SingleCellExperiment
    Quitting from lines 47-54 (SingleCellBenchmark.Rmd) 
    Error: processing vignette 'SingleCellBenchmark.Rmd' failed with diagnostics:
    there is no package called 'scRNAseq'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘scRNAseq’
    
    Depends: includes the non-default packages:
      ‘tidyr’ ‘SummarizedExperiment’ ‘S4Vectors’ ‘BiocGenerics’ ‘UpSetR’
      ‘rlang’ ‘stringr’ ‘BiocParallel’ ‘ggplot2’ ‘mclust’ ‘dplyr’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 12.8Mb
      sub-directories of 1Mb or more:
        data   9.0Mb
        doc    3.3Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘BiocGenerics:::replaceSlots’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    .list2mat : <anonymous>: no visible binding for global variable
      ‘.method’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/buildBench.R:275)
    .list2mat : <anonymous>: no visible binding for global variable ‘.val’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/buildBench.R:275)
    .list2mat : <anonymous>: no visible binding for global variable ‘.id’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/buildBench.R:276-277)
    plotROC: no visible binding for global variable ‘FDR’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/PlottingFunctions.R:81-82)
    plotROC: no visible binding for global variable ‘TPR’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/PlottingFunctions.R:81-82)
    plotROC: no visible binding for global variable ‘method’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SummarizedBenchmark/new/SummarizedBenchmark.Rcheck/00_pkg_src/SummarizedBenchmark/R/PlottingFunctions.R:81-82)
    Undefined global functions or variables:
      .id .method .val FDR TPR method
    ```

# sunburstR

Version: 2.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘treemap’
    ```

# survminer

Version: 0.4.3

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        doc   5.1Mb
    ```

# sweep

Version: 0.2.1.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# switchde

Version: 1.6.0

## In both

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    ```

# swmmr

Version: 0.8.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sf’
    ```

# SWMPrExtension

Version: 0.3.16

## Newly fixed

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   4.0Mb
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rgeos’
      All declared Imports should be used.
    ```

# syuzhet

Version: 1.0.4

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        R         2.1Mb
        extdata   3.1Mb
    ```

# taxa

Version: 0.3.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        data   1.1Mb
        doc    1.7Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘knitr’ ‘lazyeval’ ‘rlang’ ‘tidyr’
      All declared Imports should be used.
    ```

# teachingApps

Version: 1.0.4

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
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

# TFEA.ChIP

Version: 1.0.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘TxDb.Hsapiens.UCSC.hg19.knownGene’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# tfestimators

Version: 1.9.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Instructions for updating:
      Please switch to tf.train.get_global_step
      WARNING:tensorflow:Casting <dtype: 'float32'> labels to bool.
      WARNING:tensorflow:Casting <dtype: 'float32'> labels to bool.
      WARNING:tensorflow:Casting <dtype: 'float32'> labels to bool.
      WARNING:tensorflow:Casting <dtype: 'float32'> labels to bool.
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 102 SKIPPED: 3 FAILED: 4
      1. Failure: input_fn can be constructed through formula interface (@helper-utils.R#21) 
      2. Failure: input_fn can be constructed correctly from data.frame objects (@helper-utils.R#21) 
      3. Failure: input_fn can be constructed correctly from matrix objects (@helper-utils.R#21) 
      4. Failure: R factors are coerced appropriately (@helper-utils.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# theseus

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘gridExtra’ ‘splancs’ ‘tidyverse’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘DESeq2’, ‘dada2’
    ```

# thinkr

Version: 0.13

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# tidybayes

Version: 1.0.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             monitor = c("a", "b"), adapt = 100, sample = 100, silent.jags = TRUE, summarise = FALSE)
      9: setup.jagsfile(model = model, n.chains = n.chains, data = data, inits = inits, monitor = monitor, modules = modules, 
             factories = factories, jags = jags, call.setup = TRUE, method = method, mutate = mutate)
      10: setup.jags(model = outmodel, monitor = outmonitor, data = outdata, n.chains = n.chains, inits = outinits, 
             modules = modules, factories = factories, response = response, fitted = fitted, residual = residual, 
             jags = jags, method = method, mutate = mutate)
      11: loadandcheckrjags()
      12: stop("Loading the rjags package failed (diagnostics are given above this error message)", call. = FALSE)
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 268 SKIPPED: 2 FAILED: 1
      1. Error: tidy_draws works with runjags (@test.tidy_draws.R#87) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidycensus

Version: 0.8.1

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
      14: mutate_as_tbl(.data, !!!dot) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/mutate.R:7
      15: mutate(d_tmp, ...) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/mutate.R:43
      16: mutate.tbl_df(d_tmp, ...)
      17: mutate_impl(.data, dots)
      18: group_optimal()
      19: membership(cluster_optimal(graph = .G(), weights = weights)) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/group.R:124
      20: cluster_optimal(graph = .G(), weights = weights) at /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidygraph/new/tidygraph.Rcheck/00_pkg_src/tidygraph/R/group.R:124
      
      ══ testthat results  ═════════════════════════════════════════════════════════════════════════════════
      OK: 268 SKIPPED: 0 FAILED: 2
      1. Error: grouping returns integer vector (@test-group.R#14) 
      2. Error: grouping returns integer of correct length (@test-group.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidyLPA

Version: 0.2.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# tidyquant

Version: 0.5.5

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc   4.1Mb
    ```

# tidytransit

Version: 0.3.4

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# tidyverse

Version: 1.2.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# tidyxl

Version: 1.0.3

## In both

*   checking compiled code ... WARNING
    ```
    File ‘tidyxl/libs/tidyxl.so’:
      Found ‘_abort’, possibly from ‘abort’ (C)
        Object: ‘xlex.o’
    
    Compiled code should not call entry points which might terminate R nor
    write to stdout/stderr instead of to the console, nor use Fortran I/O
    nor system RNGs.
    
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

Version: 0.1.1.1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# tmap

Version: 2.1-1

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# toxplot

Version: 0.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# TPP

Version: 3.8.5

## In both

*   R CMD check timed out
    

*   checking installed package size ... NOTE
    ```
      installed size is 15.1Mb
      sub-directories of 1Mb or more:
        R              2.0Mb
        data           1.9Mb
        example_data   8.0Mb
        test_data      1.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘broom’
      All declared Imports should be used.
    Unexported objects imported by ':::' calls:
      ‘doParallel:::.options’ ‘mefa:::rep.data.frame’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking R code for possible problems ... NOTE
    ```
    File ‘TPP/R/TPP.R’:
      .onLoad calls:
        packageStartupMessage(msgText, "\n")
    
    See section ‘Good practice’ in '?.onAttach'.
    
    plot_fSta_distribution: no visible binding for global variable
      ‘..density..’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/TPP/new/TPP.Rcheck/00_pkg_src/TPP/R/plot_fSta_distribution.R:19-28)
    plot_pVal_distribution: no visible binding for global variable
      ‘..density..’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/TPP/new/TPP.Rcheck/00_pkg_src/TPP/R/plot_pVal_distribution.R:22-31)
    Undefined global functions or variables:
      ..density..
    ```

# translateSPSS2R

Version: 1.0.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    xpssTtest: no visible global function definition for ‘t.test’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/translateSPSS2R/new/translateSPSS2R.Rcheck/00_pkg_src/translateSPSS2R/R/xpssTtest.R:617)
    xpssTtest: no visible global function definition for ‘na.omit’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/translateSPSS2R/new/translateSPSS2R.Rcheck/00_pkg_src/translateSPSS2R/R/xpssTtest.R:627)
    xpssTtest: no visible global function definition for ‘sd’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/translateSPSS2R/new/translateSPSS2R.Rcheck/00_pkg_src/translateSPSS2R/R/xpssTtest.R:628)
    xpssTtest: no visible global function definition for ‘na.omit’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/translateSPSS2R/new/translateSPSS2R.Rcheck/00_pkg_src/translateSPSS2R/R/xpssTtest.R:628)
    xpssTtest: no visible global function definition for ‘cor.test’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/translateSPSS2R/new/translateSPSS2R.Rcheck/00_pkg_src/translateSPSS2R/R/xpssTtest.R:631)
    Undefined global functions or variables:
      anova as.formula complete.cases cor.test density frequency
      globalVariables head lines lm median na.omit quantile sd summary.lm
      t.test tail title var
    Consider adding
      importFrom("graphics", "lines", "title")
      importFrom("stats", "anova", "as.formula", "complete.cases",
                 "cor.test", "density", "frequency", "lm", "median",
                 "na.omit", "quantile", "sd", "summary.lm", "t.test", "var")
      importFrom("utils", "globalVariables", "head", "tail")
    to your NAMESPACE file.
    ```

# trialr

Version: 0.0.3

## In both

*   checking whether package ‘trialr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/trialr/new/trialr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘trialr’ ...
** package ‘trialr’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c Modules.cpp -o Modules.o
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:20:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_args.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/lexical_cast.hpp:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/lexical_cast/try_lexical_convert.hpp:42:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/lexical_cast/detail/converter_lexical.hpp:52:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/container/container_fwd.hpp:61:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/container/detail/std_fwd.hpp:27:1: warning: inline namespaces are a C++11 feature [-Wc++11-inline-namespace]
BOOST_MOVE_STD_NS_BEG
^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/move/detail/std_ns_begin.hpp:18:34: note: expanded from macro 'BOOST_MOVE_STD_NS_BEG'
   #define BOOST_MOVE_STD_NS_BEG _LIBCPP_BEGIN_NAMESPACE_STD
                                 ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/__config:445:52: note: expanded from macro '_LIBCPP_BEGIN_NAMESPACE_STD'
#define _LIBCPP_BEGIN_NAMESPACE_STD namespace std {inline namespace _LIBCPP_NAMESPACE {
                                                   ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:4:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/memory/stack_alloc.hpp:145:10: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
    for (auto& block : blocks_)
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/memory/stack_alloc.hpp:145:22: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
    for (auto& block : blocks_)
                     ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:4:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:47:69: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
    AutodiffStackStorage &operator=(const AutodiffStackStorage &) = delete;
                                                                    ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:60:30: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
  AutodiffStackSingleton() = delete;
                             ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:61:71: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
  explicit AutodiffStackSingleton(AutodiffStackSingleton_t const &) = delete;
                                                                      ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:62:73: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
  AutodiffStackSingleton &operator=(const AutodiffStackSingleton_t &) = delete;
                                                                        ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:42:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/recover_memory.hpp:25:8: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_alloc_stack_) {
       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/recover_memory.hpp:25:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_alloc_stack_) {
               ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:44:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:15:8: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_stack_)
       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:15:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_stack_)
               ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:17:8: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_nochain_stack_)
       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:17:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_nochain_stack_)
               ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:22:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:19:59: error: expected expression
class ops_partials_edge<ViewElt, Eigen::Matrix<Op, R, C>> {
                                                          ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:35:2: error: expected a type
};
 ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:38:70: error: expected expression
class ops_partials_edge<ViewElt, std::vector<Eigen::Matrix<Op, R, C>>> {
                                                                     ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:38:72: error: expected a type
class ops_partials_edge<ViewElt, std::vector<Eigen::Matrix<Op, R, C>>> {
                                                                       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:53:2: error: expected a type
};
 ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:56:60: error: a space is required between consecutive right angle brackets (use '> >')
class ops_partials_edge<ViewElt, std::vector<std::vector<Op>>> {
                                                           ^~
                                                           > > 
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:58:68: error: a space is required between consecutive right angle brackets (use '> >')
  typedef empty_broadcast_array<ViewElt, std::vector<std::vector<Op>>>
                                                                   ^~
                                                                   > > 
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:61:63: error: a space is required between consecutive right angle brackets (use '> >')
  empty_broadcast_array<partials_t, std::vector<std::vector<Op>>> partials_vec_;
                                                              ^~
                                                              > > 
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:63:62: error: a space is required between consecutive right angle brackets (use '> >')
  explicit ops_partials_edge(const std::vector<std::vector<Op>> ops) {}
                                                             ^~
                                                             > >
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:99:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_matrix_times_vector.hpp:91:14: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (int i : v)
             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:100:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_to_dense_matrix.hpp:48:14: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (int i : v)
             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:156:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/log_mix.hpp:178:26: error: expected expression
              .unaryExpr([](T_partials_return x) { return exp(x); });
                         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/log_mix.hpp:262:24: error: expected expression
            .unaryExpr([](T_partials_return x) { return exp(x); });
                       ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:161:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp.hpp:5:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_2x2.hpp:21:13: warning: alias declarations are a C++11 extension [-Wc++11-extensions]
  using T = typename Mtype::Scalar;
            ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:162:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_multiply.hpp:5:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:20:10: error: unknown type name 'constexpr'
  static constexpr int p_max = 8;
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:20:20: error: expected member name or ';' after declaration specifiers
  static constexpr int p_max = 8;
  ~~~~~~~~~~~~~~~~ ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:21:10: error: unknown type name 'constexpr'
  static constexpr int m_max = 55;
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:21:20: error: expected member name or ';' after declaration specifiers
  static constexpr int m_max = 55;
  ~~~~~~~~~~~~~~~~ ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:22:10: error: unknown type name 'constexpr'
  static constexpr double tol = 1.1e-16;
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:22:20: error: expected member name or ';' after declaration specifiers
  static constexpr double tol = 1.1e-16;
  ~~~~~~~~~~~~~~~~ ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:25:29: error: function definition does not declare parameters
  const std::vector<double> theta_m_single_precision{
                            ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:28:29: error: function definition does not declare parameters
  const std::vector<double> theta_m_double_precision{
                            ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
29 warnings and 20 errors generated.
make: *** [Modules.o] Error 1
ERROR: compilation failed for package ‘trialr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/trialr/new/trialr.Rcheck/trialr’

```
### CRAN

```
* installing *source* package ‘trialr’ ...
** package ‘trialr’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c Modules.cpp -o Modules.o
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:20:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_args.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/lexical_cast.hpp:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/lexical_cast/try_lexical_convert.hpp:42:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/lexical_cast/detail/converter_lexical.hpp:52:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/container/container_fwd.hpp:61:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/container/detail/std_fwd.hpp:27:1: warning: inline namespaces are a C++11 feature [-Wc++11-inline-namespace]
BOOST_MOVE_STD_NS_BEG
^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/move/detail/std_ns_begin.hpp:18:34: note: expanded from macro 'BOOST_MOVE_STD_NS_BEG'
   #define BOOST_MOVE_STD_NS_BEG _LIBCPP_BEGIN_NAMESPACE_STD
                                 ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/__config:445:52: note: expanded from macro '_LIBCPP_BEGIN_NAMESPACE_STD'
#define _LIBCPP_BEGIN_NAMESPACE_STD namespace std {inline namespace _LIBCPP_NAMESPACE {
                                                   ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:4:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/memory/stack_alloc.hpp:145:10: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
    for (auto& block : blocks_)
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/memory/stack_alloc.hpp:145:22: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
    for (auto& block : blocks_)
                     ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:4:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:47:69: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
    AutodiffStackStorage &operator=(const AutodiffStackStorage &) = delete;
                                                                    ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:60:30: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
  AutodiffStackSingleton() = delete;
                             ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:61:71: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
  explicit AutodiffStackSingleton(AutodiffStackSingleton_t const &) = delete;
                                                                      ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/autodiffstackstorage.hpp:62:73: warning: deleted function definitions are a C++11 extension [-Wc++11-extensions]
  AutodiffStackSingleton &operator=(const AutodiffStackSingleton_t &) = delete;
                                                                        ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Core:531:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:2:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/LU:47:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Cholesky:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Jacobi:29:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Cholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/QR:17:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Householder:27:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SVD:48:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Geometry:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:14:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/matrix_vari.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat/fun/Eigen_NumTraits.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/Eigen.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Dense:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Eigenvalues:58:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:42:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/recover_memory.hpp:25:8: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_alloc_stack_) {
       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/recover_memory.hpp:25:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_alloc_stack_) {
               ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core.hpp:44:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:15:8: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_stack_)
       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:15:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_stack_)
               ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:17:8: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_nochain_stack_)
       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:17:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (auto &x : ChainableStack::instance().var_nochain_stack_)
               ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:22:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:19:59: error: expected expression
class ops_partials_edge<ViewElt, Eigen::Matrix<Op, R, C>> {
                                                          ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:35:2: error: expected a type
};
 ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:38:70: error: expected expression
class ops_partials_edge<ViewElt, std::vector<Eigen::Matrix<Op, R, C>>> {
                                                                     ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:38:72: error: expected a type
class ops_partials_edge<ViewElt, std::vector<Eigen::Matrix<Op, R, C>>> {
                                                                       ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:53:2: error: expected a type
};
 ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:56:60: error: a space is required between consecutive right angle brackets (use '> >')
class ops_partials_edge<ViewElt, std::vector<std::vector<Op>>> {
                                                           ^~
                                                           > > 
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:58:68: error: a space is required between consecutive right angle brackets (use '> >')
  typedef empty_broadcast_array<ViewElt, std::vector<std::vector<Op>>>
                                                                   ^~
                                                                   > > 
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:61:63: error: a space is required between consecutive right angle brackets (use '> >')
  empty_broadcast_array<partials_t, std::vector<std::vector<Op>>> partials_vec_;
                                                              ^~
                                                              > > 
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/meta/operands_and_partials.hpp:63:62: error: a space is required between consecutive right angle brackets (use '> >')
  explicit ops_partials_edge(const std::vector<std::vector<Op>> ops) {}
                                                             ^~
                                                             > >
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SparseCore:66:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/OrderingMethods:71:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:29:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SparseCholesky:43:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:32:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/SparseQR:35:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:96:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_extract_u.hpp:6:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/Sparse:33:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/IterativeLinearSolvers:46:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/RcppEigen/include/Eigen/src/Core/util/ReenableStupidWarnings.h:10:30: warning: pragma diagnostic pop could not pop, no matching push [-Wunknown-pragmas]
    #pragma clang diagnostic pop
                             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:99:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_matrix_times_vector.hpp:91:14: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (int i : v)
             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:100:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/csr_to_dense_matrix.hpp:48:14: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]
  for (int i : v)
             ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:156:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/log_mix.hpp:178:26: error: expected expression
              .unaryExpr([](T_partials_return x) { return exp(x); });
                         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/log_mix.hpp:262:24: error: expected expression
            .unaryExpr([](T_partials_return x) { return exp(x); });
                       ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:161:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp.hpp:5:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_2x2.hpp:21:13: warning: alias declarations are a C++11 extension [-Wc++11-extensions]
  using T = typename Mtype::Scalar;
            ^
In file included from Modules.cpp:3:
In file included from ./include/models.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/rstaninc.hpp:3:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/rstan/include/rstan/stan_fit.hpp:34:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/test_gradients.hpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat.hpp:162:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_multiply.hpp:5:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:20:10: error: unknown type name 'constexpr'
  static constexpr int p_max = 8;
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:20:20: error: expected member name or ';' after declaration specifiers
  static constexpr int p_max = 8;
  ~~~~~~~~~~~~~~~~ ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:21:10: error: unknown type name 'constexpr'
  static constexpr int m_max = 55;
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:21:20: error: expected member name or ';' after declaration specifiers
  static constexpr int m_max = 55;
  ~~~~~~~~~~~~~~~~ ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:22:10: error: unknown type name 'constexpr'
  static constexpr double tol = 1.1e-16;
         ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:22:20: error: expected member name or ';' after declaration specifiers
  static constexpr double tol = 1.1e-16;
  ~~~~~~~~~~~~~~~~ ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:25:29: error: function definition does not declare parameters
  const std::vector<double> theta_m_single_precision{
                            ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/trialr/StanHeaders/include/stan/math/prim/mat/fun/matrix_exp_action_handler.hpp:28:29: error: function definition does not declare parameters
  const std::vector<double> theta_m_double_precision{
                            ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
29 warnings and 20 errors generated.
make: *** [Modules.o] Error 1
ERROR: compilation failed for package ‘trialr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/trialr/old/trialr.Rcheck/trialr’

```
# ukbtools

Version: 0.11.0

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

# understandBPMN

Version: 1.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘devtools’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# unvotes

Version: 0.2.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4494 marked UTF-8 strings
    ```

# valr

Version: 0.4.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘devtools’
    ```

# vidger

Version: 1.0.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        data   4.0Mb
        doc    1.7Mb
    ```

# visdat

Version: 0.5.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘plotly’ ‘rlang’
      All declared Imports should be used.
    ```

# vlad

Version: 0.1.0

## In both

*   checking whether package ‘vlad’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/vlad/new/vlad.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘vlad’ ...
** package ‘vlad’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/vlad/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘vlad’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/vlad/new/vlad.Rcheck/vlad’

```
### CRAN

```
* installing *source* package ‘vlad’ ...
** package ‘vlad’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/vlad/RcppArmadillo/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘vlad’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/vlad/old/vlad.Rcheck/vlad’

```
# vqtl

Version: 2.0.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘iterators’ ‘knitr’ ‘purrr’ ‘testthat’
      All declared Imports should be used.
    ```

# VWPre

Version: 1.1.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        data   3.1Mb
        doc    1.3Mb
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
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
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
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
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

# weathercan

Version: 0.2.8

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘devtools’ ‘sf’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘xml2’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 25 marked UTF-8 strings
    ```

# wordbankr

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# XGR

Version: 1.1.4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
      sub-directories of 1Mb or more:
        R      4.1Mb
        data   1.1Mb
    ```

# zFactor

Version: 0.1.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rootSolve’
      All declared Imports should be used.
    ```

# zFPKM

Version: 1.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following object is masked from 'package:S4Vectors':
    
        expand
    
    trying URL 'ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE94nnn/GSE94802/suppl/GSE94802_Minkina_etal_normalized_FPKM.csv.gz'
    Content type 'unknown' length 800733 bytes (781 KB)
    ==================================================
    trying URL 'ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE94nnn/GSE94802/suppl/GSE94802_Minkina_etal_raw_counts.csv.gz'
    Content type 'unknown' length 574041 bytes (560 KB)
    ==================================================
    
    Attaching package: 'limma'
    
    The following object is masked from 'package:BiocGenerics':
    
        plotMA
    
    Quitting from lines 108-122 (zFPKM.Rmd) 
    Error: processing vignette 'zFPKM.Rmd' failed with diagnostics:
    statmod package required but is not installed
    Execution halted
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    PlotGaussianFitDF: no visible binding for global variable ‘density’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:223)
    PlotGaussianFitDF: no visible binding for global variable ‘log2fpkm’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:223)
    PlotGaussianFitDF: no visible binding for global variable ‘sample_name’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:223)
    PlotGaussianFitDF: no visible binding for global variable ‘log2fpkm’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:227-233)
    PlotGaussianFitDF: no visible binding for global variable ‘density’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:227-233)
    zFPKMCalc: no visible global function definition for ‘density’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:162)
    zFPKMTransform: no visible global function definition for ‘is’
      (/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/zFPKM/new/zFPKM.Rcheck/00_pkg_src/zFPKM/R/zfpkm.R:125-127)
    Undefined global functions or variables:
      density dnorm is log2fpkm sample_name
    Consider adding
      importFrom("methods", "is")
      importFrom("stats", "density", "dnorm")
    to your NAMESPACE file (and ensure that your DESCRIPTION Imports field
    contains 'methods').
    ```

