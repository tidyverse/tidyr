# afex

Version: 0.18-0

## In both

*   checking whether package ‘afex’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lme4’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/afex/new/afex.Rcheck/00install.out’ for details.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ez’, ‘ascii’
    ```

# alphavantager

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘devtools’
      All declared Imports should be used.
    ```

# anomalyDetection

Version: 0.2.4

## In both

*   checking whether package ‘anomalyDetection’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/anomalyDetection/new/anomalyDetection.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/anomalyDetection/new/anomalyDetection.Rcheck/anomalyDetection’

```
### CRAN

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/anomalyDetection/old/anomalyDetection.Rcheck/anomalyDetection’

```
# biobroom

Version: 1.8.0

## In both

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

# bomrang

Version: 0.0.7

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: eval(quote(`_fseq`(`_lhs`)), env, env)
      6: `_fseq`(`_lhs`)
      7: freduce(value, `_function_list`)
      8: withVisible(function_list[[k]](value))
      9: function_list[[k]](value)
      10: dplyr::mutate(., url = dplyr::if_else(httr::http_error(url), NA_character_, url))
      11: mutate.tbl_df(., url = dplyr::if_else(httr::http_error(url), NA_character_, url))
      12: mutate_impl(.data, dots)
      
      testthat results ================================================================
      OK: 100 SKIPPED: 0 FAILED: 1
      1. Error: update_station_locations() downloads and imports the proper file (@test-update_station_locations.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bootnet

Version: 1.0.1

## In both

*   checking whether package ‘bootnet’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/bootnet/new/bootnet.Rcheck/00install.out’ for details.
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

# breathteststan

Version: 0.3.0

## In both

*   checking whether package ‘breathteststan’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/breathteststan/new/breathteststan.Rcheck/00install.out’ for details.
    ```

# broom

Version: 0.4.2

## In both

*   checking examples ... ERROR
    ```
    ...
    +   f2 <- Finance[1:300, "hml"] - rf
    +   f3 <- Finance[1:300, "smb"] - rf
    +   h <- cbind(f1, f2, f3)
    +   res2 <- gmm(z ~ f1 + f2 + f3, x = h)
    +   
    +   td2 <- tidy(res2, conf.int = TRUE)
    +   td2
    +   
    +   # coefficient plot
    +   td2 %>%
    +     mutate(variable = reorder(variable, estimate)) %>%
    +     ggplot(aes(estimate, variable)) +
    +     geom_point() +
    +     geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) +
    +     facet_wrap(~ term) +
    +     geom_vline(xintercept = 0, color = "red", lty = 2)
    + }
    Error in `colnames<-`(`*tmp*`, value = c("conf.low", "conf.high")) : 
      attempt to set 'colnames' on an object with less than two dimensions
    Calls: tidy -> tidy.gmm -> process_lm -> colnames<-
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > test_check("broom")
      Loading required package: broom
      Error in lahman_df() : could not find function "lahman_df"
      Calls: test_check ... with_reporter -> force -> source_file -> eval -> eval -> tbl
      In addition: Warning message:
      package 'lme4' was built under R version 3.4.2 
      testthat results ================================================================
      OK: 621 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# caffsim

Version: 0.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘markdown’
      All declared Imports should be used.
    ```

# cellbaseR

Version: 1.0.0

## In both

*   checking examples ... ERROR
    ```
    ...
    > fl <- system.file("extdata", "hapmap_exome_chr22_500.vcf.gz",
    +                   package = "cellbaseR" )
    > res <- AnnotateVcf(object=cb, file=fl, BPPARAM = bpparam(workers=2))
    
     *** caught illegal operation ***
    address 0x7fffe072dae4, cause 'illegal opcode'
    
    Traceback:
     1: mcfork(detached)
     2: parallel::mcparallel({    con <- NULL    suppressWarnings({        while (is.null(con)) {            con <- tryCatch({                socketConnection(host, port, FALSE, TRUE, "a+b",                   timeout = timeout)            }, error = function(e) {            })        }    })    node <- structure(list(con = con), class = "SOCK0node")    bploop(node)}, detached = TRUE)
     3: .bpforkChild(host, port, rank, timeout)
     4: .bpfork(nnodes, bptimeout(x), .hostname(x), .port(x))
     5: .local(x, ...)
     6: bpstart(BPPARAM, length(X))
     7: bpstart(BPPARAM, length(X))
     8: bplapply(content, function(x) fromJSON(x), BPPARAM = p)
     9: bplapply(content, function(x) fromJSON(x), BPPARAM = p)
    10: Annovcf(object = object, file = file, batch_size, num_threads,     BPPARAM = bpparam())
    11: AnnotateVcf(object = cb, file = fl, BPPARAM = bpparam(workers = 2))
    12: AnnotateVcf(object = cb, file = fl, BPPARAM = bpparam(workers = 2))
    An irrecoverable exception occurred. R is aborting now ...
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    17: handle(ev <- withCallingHandlers(withVisible(eval(expr, envir,     enclos)), warning = wHandler, error = eHandler, message = mHandler))
    18: timing_fn(handle(ev <- withCallingHandlers(withVisible(eval(expr,     envir, enclos)), warning = wHandler, error = eHandler, message = mHandler)))
    19: evaluate_call(expr, parsed$src[[i]], envir = envir, enclos = enclos,     debug = debug, last = i == length(out), use_try = stop_on_error !=         2L, keep_warning = keep_warning, keep_message = keep_message,     output_handler = output_handler, include_timing = include_timing)
    20: evaluate(code, envir = env, new_device = FALSE, keep_warning = !isFALSE(options$warning),     keep_message = !isFALSE(options$message), stop_on_error = if (options$error &&         options$include) 0L else 2L, output_handler = knit_handlers(options$render,         options))
    21: in_dir(input_dir(), evaluate(code, envir = env, new_device = FALSE,     keep_warning = !isFALSE(options$warning), keep_message = !isFALSE(options$message),     stop_on_error = if (options$error && options$include) 0L else 2L,     output_handler = knit_handlers(options$render, options)))
    22: block_exec(params)
    23: call_block(x)
    24: process_group.block(group)
    25: process_group(group)
    26: withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        setwd(wd)        cat(res, sep = "\n", file = output %n% "")        message("Quitting from lines ", paste(current_lines(i),             collapse = "-"), " (", knit_concord$get("infile"),             ") ")    })
    27: process_file(text, output)
    28: knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet,     encoding = encoding)
    29: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv())
    30: vweave_rmarkdown(...)
    31: engine$weave(file, quiet = quiet, encoding = enc)
    32: doTryCatch(return(expr), name, parentenv, handler)
    33: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    34: tryCatchList(expr, classes, parentenv, handlers)
    35: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    find_vignette_product(name, by = "weave", engine = engine)}, error = function(e) {    stop(gettextf("processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)), domain = NA, call. = FALSE)})
    36: buildVignettes(dir = "/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/cellbaseR/new/cellbaseR.Rcheck/vign_test/cellbaseR")
    An irrecoverable exception occurred. R is aborting now ...
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

# clustRcompaR

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
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

# congressbr

Version: 0.1.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# corrr

Version: 0.2.1

## In both

*   checking whether package ‘corrr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/corrr/new/corrr.Rcheck/00install.out’ for details.
    ```

# countyfloods

Version: 0.0.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
    To use this package, you must install the hurricaneexposuredata
    package. To install that package, run
    `install.packages('hurricaneexposuredata',
    repos='https://geanders.github.io/drat/', type='source')`. See the
    `hurricaneexposure` vignette for more details.
    To use this function, you must have the `hurricaneexposuredata`
    package installed. See the `hurricaneexposure` package vignette
    for more details.
    Quitting from lines 304-306 (countyflood.Rmd) 
    Error: processing vignette 'countyflood.Rmd' failed with diagnostics:
    there is no package called 'hurricaneexposuredata'
    Execution halted
    ```

# countyweather

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked UTF-8 string
    ```

# curatedMetagenomicData

Version: 1.2.0

## Newly fixed

*   R CMD check timed out
    

## In both

*   checking whether package ‘curatedMetagenomicData’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/curatedMetagenomicData/new/curatedMetagenomicData.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘dplyr’ ‘phyloseq’ ‘Biobase’ ‘ExperimentHub’ ‘AnnotationHub’
      ‘magrittr’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.5Mb
      sub-directories of 1Mb or more:
        help   7.9Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘BiocInstaller’
    A package should be listed in only one of these fields.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘BiocInstaller’
      All declared Imports should be used.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ExpressionSet2MRexperiment: no visible global function definition for
      ‘AnnotatedDataFrame’
    ExpressionSet2MRexperiment: no visible global function definition for
      ‘phenoData’
    curatedMetagenomicData : <anonymous>: no visible global function
      definition for ‘exprs<-’
    Undefined global functions or variables:
      AnnotatedDataFrame exprs<- phenoData
    ```

*   checking Rd files ... NOTE
    ```
    prepare_Rd: HMP_2012.Rd:540-542: Dropping empty section \seealso
    prepare_Rd: KarlssonFH_2013.Rd:90-92: Dropping empty section \seealso
    prepare_Rd: LeChatelierE_2013.Rd:86-88: Dropping empty section \seealso
    prepare_Rd: LomanNJ_2013_Hi.Rd:82-84: Dropping empty section \seealso
    prepare_Rd: LomanNJ_2013_Mi.Rd:82-84: Dropping empty section \seealso
    prepare_Rd: NielsenHB_2014.Rd:94-96: Dropping empty section \seealso
    prepare_Rd: Obregon_TitoAJ_2015.Rd:94-96: Dropping empty section \seealso
    prepare_Rd: OhJ_2014.Rd:86-88: Dropping empty section \seealso
    prepare_Rd: QinJ_2012.Rd:106-108: Dropping empty section \seealso
    prepare_Rd: QinN_2014.Rd:94-96: Dropping empty section \seealso
    prepare_Rd: RampelliS_2015.Rd:90-92: Dropping empty section \seealso
    prepare_Rd: TettAJ_2016.Rd:184-186: Dropping empty section \seealso
    prepare_Rd: ZellerG_2014.Rd:94-96: Dropping empty section \seealso
    ```

# d3r

Version: 0.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Failed with error:  'there is no package called 'V8''
      [31m2. Error: d3_v8 has d3 (@test_v8.R#9) [39m------------------------------------------
      The V8 package must be installed for this function.  Please install.packages('V8').
      1: expect_identical(d3_v8()$get("global.d3.version"), d3_dep_v4()$version) at testthat/test_v8.R:9
      2: identical(object, expected)
      3: d3_v8()
      4: stop("The V8 package must be installed for this function.  Please install.packages('V8').")
      
      testthat results ================================================================
      OK: 11 SKIPPED: 3 FAILED: 2
      1. Error: d3-jetpack on latest release (@test_deps.R#47) 
      2. Error: d3_v8 has d3 (@test_v8.R#9) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# dartR

Version: 0.93

## In both

*   checking whether package ‘dartR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘adegenet’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/dartR/new/dartR.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘Demerelate’ ‘misc3d’ ‘plotly’ ‘quadprog’ ‘rgl’
      All declared Imports should be used.
    ```

# DChIPRep

Version: 1.6.2

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

# DeepBlueR

Version: 1.2.10

## In both

*   R CMD check timed out
    

# DEGreport

Version: 1.12.0

## In both

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

Version: 0.4.4

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 109 marked UTF-8 strings
    ```

# diceR

Version: 0.2.0

## In both

*   checking whether package ‘diceR’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/diceR/new/diceR.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘diceR’ ...
** package ‘diceR’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/new/Rcpp/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘diceR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/diceR/new/diceR.Rcheck/diceR’

```
### CRAN

```
* installing *source* package ‘diceR’ ...
** package ‘diceR’ successfully unpacked and MD5 sums checked
** libs
clang++ -std=gnu++11 -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/old/Rcpp/include" -I/usr/local/include  -fopenmp -fPIC  -Wall -g -O2 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘diceR’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/diceR/old/diceR.Rcheck/diceR’

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

# eechidna

Version: 1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        data   4.9Mb
        doc    1.2Mb
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

# emil

Version: 2.2.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rcpp’
      All declared Imports should be used.
    ```

# ENCODExplorer

Version: 2.2.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 73.6Mb
      sub-directories of 1Mb or more:
        data     23.9Mb
        doc       1.5Mb
        extdata  48.0Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘biosample_type’
    step6_control: no visible binding for global variable ‘controls’
    step6_date_released: no visible binding for global variable
      ‘date_released’
    step6_status: no visible binding for global variable ‘status’
    step6_target: no visible binding for global variable ‘target’
    step7: no visible binding for global variable ‘organism’
    step8: no visible binding for global variable ‘investigated_as’
    step8: no visible binding for global variable ‘target’
    step9: no visible binding for global variable ‘organism’
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

# evaluator

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘ggalt’ ‘pander’ ‘psych’
      All declared Imports should be used.
    Missing or unexported object: ‘purrr::by_row’
    ```

# eyetrackingR

Version: 0.1.6

## In both

*   checking examples ... ERROR
    ```
    ...
    +                                time_column = "TimeFromTrialOnset",
    +                                trackloss_column = "TrackLoss",
    +                                aoi_columns = c('Animate','Inanimate'),
    +                                treat_non_aoi_looks_as_missing = TRUE )
    `mutate_each()` is deprecated.
    Use `mutate_all()`, `mutate_at()` or `mutate_if()` instead.
    To map `funs` over a selection of variables, use `mutate_at()`
    > response_window <- subset_by_window(data, window_start_time = 15500, window_end_time = 21000, 
    +                                     rezero = FALSE)
    Avg. window length in new data will be 5500
    > response_time <- make_time_sequence_data(response_window, time_bin_size = 500, aois = "Animate", 
    +                                          predictor_columns = "Sex")
    > 
    > time_cluster_data <- make_time_cluster_data(data = response_time, predictor_column = "SexM", 
    +                          aoi = "Animate", test = "lmer", 
    +                          threshold = 1.5, 
    +                          formula = LogitAdjusted ~ Sex + (1|Trial) + (1|ParticipantName))
    Error in UseMethod("analyze_time_bins") : 
      no applicable method for 'analyze_time_bins' applied to an object of class "data.frame"
    Calls: make_time_cluster_data ... make_time_cluster_data.time_sequence_data -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Computing t.test for each time bin...
      Computing t.test for each time bin...
      `mutate_each()` is deprecated.
      Use `mutate_all()`, `mutate_at()` or `mutate_if()` instead.
      To map `funs` over a selection of variables, use `mutate_at()`
      Avg. window length in new data will be 5500
      Performing Trackloss Analysis...
      Will exclude trials whose trackloss proportion is greater than : 0.25
      	...removed  33  trials.
      Error in UseMethod("make_time_cluster_data") : 
        no applicable method for 'make_time_cluster_data' applied to an object of class "data.frame"
      Calls: test_check ... source_file -> eval -> eval -> make_time_cluster_data
      testthat results ================================================================
      OK: 38 SKIPPED: 0 FAILED: 0
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

Version: 0.2.0

## In both

*   checking whether package ‘fastR2’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/fastR2/new/fastR2.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
    ```

# fbar

Version: 0.1.23

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘Rglpk’ ‘ROI.plugin.glpk’
    ```

# foghorn

Version: 0.4.4

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      testthat results ================================================================
      OK: 51 SKIPPED: 0 FAILED: 8
      1. Failure: output of summary cran results (@test-foghorn.R#176) 
      2. Failure: output of summary cran results (@test-foghorn.R#178) 
      3. Failure: output of summary cran results (@test-foghorn.R#189) 
      4. Failure: output of summary cran results (@test-foghorn.R#201) 
      5. Failure: output of summary cran results (@test-foghorn.R#213) 
      6. Failure: output of summary cran results (@test-foghorn.R#226) 
      7. Failure: output of summary cran results (@test-foghorn.R#233) 
      8. Failure: output of summary cran results (@test-foghorn.R#239) 
      
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

# geoparser

Version: 0.1.1

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [31m2. Error: no problems if no results (@test_query.R#26) [39m-------------------------
      HTTP failure: 401
      1: geoparser_q(text_input = "no placename here") at testthat/test_query.R:26
      2: lapply(text_input, total, key = key)
      3: FUN(X[[i]], ...)
      4: geoparser_check(temp)
      5: stop("HTTP failure: ", status, call. = FALSE)
      
      testthat results ================================================================
      OK: 3 SKIPPED: 0 FAILED: 2
      1. Error: query returns a list of data.frames (@test_query.R#4) 
      2. Error: no problems if no results (@test_query.R#26) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 34-37 (geoparser.Rmd) 
    Error: processing vignette 'geoparser.Rmd' failed with diagnostics:
    HTTP failure: 401
    Execution halted
    ```

# geotoolsR

Version: 1.0

## In both

*   checking whether package ‘geotoolsR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/geotoolsR/new/geotoolsR.Rcheck/00install.out’ for details.
    ```

# GerminaR

Version: 1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘shinydashboard’
      All declared Imports should be used.
    ```

# gfer

Version: 0.1.8

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# ggCompNet

Version: 0.1.0

## In both

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

# ggfortify

Version: 0.4.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘ggfortify-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gglagplot
    > ### Title: Plot time series against lagged versions of themselves
    > ### Aliases: gglagplot
    > 
    > ### ** Examples
    > 
    > gglagplot(AirPassengers)
    Error: `x` must be a vector, not a ts object, do you want `stats::lag()`?
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
        df <- tibble(x = 1:3, y = list(1,2:3,4))
                                             ^
      
      
      testthat results ================================================================
      OK: 1618 SKIPPED: 0 FAILED: 6
      1. Failure: autoplot.aareg works for lung (@test-surv.R#220) 
      2. Failure: autoplot.aareg works for lung (@test-surv.R#221) 
      3. Failure: autoplot.aareg works for lung (@test-surv.R#222) 
      4. Failure: autoplot.aareg works for lung (@test-surv.R#223) 
      5. Error: gglagplot (@test-tslib.R#103) 
      6. Failure: Code Lint (@test_lint.R#27) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   5.0Mb
    ```

# ggmcmc

Version: 1.1

## In both

*   checking whether package ‘ggmcmc’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/ggmcmc/new/ggmcmc.Rcheck/00install.out’ for details.
    ```

# ggmosaic

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘NHANES’ ‘gridExtra’
      All declared Imports should be used.
    ```

# ggpubr

Version: 0.1.5

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘FactoMineR’
    ```

# ggRandomForests

Version: 2.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘randomForest’
      All declared Imports should be used.
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

# googleLanguageR

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: tryCatchList(expr, classes, parentenv, handlers)
      4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      5: value[[3L]](cond)
      6: stop(ex$message, call. = FALSE)
      
      testthat results ================================================================
      OK: 5 SKIPPED: 7 FAILED: 5
      1. Error: NLP returns expected fields (@test_unit.R#79) 
      2. Error: Speech recognise expected (@test_unit.R#115) 
      3. Error: Listing translations works (@test_unit.R#144) 
      4. Error: Translation detection works (@test_unit.R#159) 
      5. Error: Translation works (@test_unit.R#175) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# googlesheets

Version: 0.2.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(googlesheets)
      > 
      > if (identical(tolower(Sys.getenv("NOT_CRAN")), "true")) {
      +   test_check("googlesheets")
      + }
      Error: Cannot read token from alleged .rds file:
      googlesheets_token.rds
      testthat results ================================================================
      OK: 2 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 37-41 (basic-usage.Rmd) 
    Error: processing vignette 'basic-usage.Rmd' failed with diagnostics:
    Cannot read token from alleged .rds file:
    ../tests/testthat/googlesheets_token.rds
    Execution halted
    ```

# gutenbergr

Version: 0.1.3

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 13617 marked UTF-8 strings
    ```

# hansard

Version: 0.5.5

## In both

*   R CMD check timed out
    

# harrietr

Version: 0.2.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# hdr

Version: 0.1

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘hdr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_data
    > ### Title: Fetch data from the UNDP Human Development Report
    > ### Aliases: get_data
    > 
    > ### ** Examples
    > 
    > # Get the Human Development Index for Germany in 2013
    > df <- get_data(indicator = 137506, country = "DEU", year = 2013)
    Error in curl::curl_fetch_memory(url, handle = handle) : 
      Failed to connect to ec2-52-1-168-42.compute-1.amazonaws.com port 80: Connection refused
    Calls: get_data ... request_fetch -> request_fetch.write_memory -> <Anonymous> -> .Call
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 31-33 (undp_hdr.Rmd) 
    Error: processing vignette 'undp_hdr.Rmd' failed with diagnostics:
    Failed to connect to ec2-52-1-168-42.compute-1.amazonaws.com port 80: Connection refused
    Execution halted
    ```

# highcharter

Version: 0.5.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 16.4Mb
      sub-directories of 1Mb or more:
        doc          13.7Mb
        htmlwidgets   1.8Mb
    ```

# HTSSIP

Version: 1.2.0

## In both

*   R CMD check timed out
    

# hurricaneexposure

Version: 0.0.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

# IHWpaper

Version: 1.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.2Mb
      sub-directories of 1Mb or more:
        doc       3.4Mb
        extdata   9.8Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    scott_fdrreg: no visible global function definition for ‘FDRreg’
    scott_fdrreg: no visible global function definition for ‘getFDR’
    sim_fun_eval: no visible binding for global variable ‘fdr_method’
    sim_fun_eval: no visible binding for global variable ‘fdr_pars’
    sim_fun_eval: no visible binding for global variable ‘FDP’
    sim_fun_eval: no visible binding for global variable ‘rj_ratio’
    sim_fun_eval: no visible binding for global variable ‘FPR’
    sim_fun_eval: no visible binding for global variable ‘FWER’
    Undefined global functions or variables:
      FDP FDRreg FPR FWER fdr_method fdr_pars getFDR rj_ratio
    ```

# influxdbr

Version: 0.13.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 11
      1. Error: connection (@test_query.R#12) 
      2. Error: single query no chunking (@test_query.R#24) 
      3. Error: multiple query no chunking (@test_query.R#65) 
      4. Error: single query with chunking (@test_query.R#84) 
      5. Error: multiple query with chunking (@test_query.R#101) 
      6. Error: multiple query with chunking and xts result (@test_query.R#118) 
      7. Error: connection (@test_schema_exploration.R#12) 
      8. Error: show commands (@test_schema_exploration.R#25) 
      9. Error: connection (@test_write.R#12) 
      1. ...
      
      Error: testthat unit tests failed
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

# isomiRs

Version: 1.4.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    isoSelect.IsomirDataSeq: no visible binding for global variable ‘freq’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘mir’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘mism’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘add’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘t5’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘t3’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘id’
    isoSelect,IsomirDataSeq : <anonymous>: no visible binding for global
      variable ‘freq’
    isoSelect,IsomirDataSeq: no visible binding for global variable ‘freq’
    Undefined global functions or variables:
      Count DB X1 X2 add af ambiguity average change condition current
      enrich enrichGO error freq gene go group id mir mir_f mir_n mism
      mism_f mism_n ngene pct_abundance reference rowMax rowMin sel_genes
      t3 t5 term term_short type value y
    ```

# jpmesh

Version: 0.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

# jpndistrict

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 188 marked UTF-8 strings
    ```

# Lahman

Version: 6.0-0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.4Mb
      sub-directories of 1Mb or more:
        data   7.2Mb
    ```

# lplyr

Version: 0.1.6

## In both

*   checking examples ... ERROR
    ```
    ...
    
    > rename(xs, x0 = x1)
    $x0
    [1] 1 2 3
    
    $x2
    [1] 2 3 4 5
    
    $x3
    $x3[[1]]
    [1] "alpha"
    
    $x3[[2]]
    [1] "beta"  "gamma"
    
    
    > select(xs, -x3)
    Error in select.list(xs, -x3) : 
      select.list() cannot be used non-interactively
    Calls: select -> select.list
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
    
    
    Attaching package: 'lplyr'
    
    The following object is masked from 'package:dplyr':
    
        pull
    
    Quitting from lines 22-30 (lplyr-vignette.Rmd) 
    Error: processing vignette 'lplyr-vignette.Rmd' failed with diagnostics:
    select.list() cannot be used non-interactively
    Execution halted
    ```

# mafs

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘cmprsk’ ‘colorspace’ ‘etm’ ‘fracdiff’ ‘gtable’ ‘munsell’
      ‘numDeriv’ ‘plyr’ ‘quadprog’ ‘scales’ ‘timeDate’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
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

# modelr

Version: 0.1.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# mosaic

Version: 1.1.0

## In both

*   checking whether package ‘mosaic’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/mosaic/new/mosaic.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘manipulate’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cubature’
    ```

# mosaicModel

Version: 0.3.0

## In both

*   checking whether package ‘mosaicModel’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/mosaicModel/new/mosaicModel.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘caret’ ‘ggformula’ ‘knitr’ ‘testthat’ ‘tidyverse’
      All declared Imports should be used.
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

# neuropsychology

Version: 0.5.0

## In both

*   checking whether package ‘neuropsychology’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/neuropsychology/new/neuropsychology.Rcheck/00install.out’ for details.
    ```

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
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        data   7.5Mb
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

# nonmemica

Version: 0.7.6

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Quitting from lines 197-201 (parameter-table.Rmd) 
    Error: processing vignette 'parameter-table.Rmd' failed with diagnostics:
    package 'ReporteRsjars' could not be loaded
    Execution halted
    ```

# nzelect

Version: 0.4.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6409 marked UTF-8 strings
    ```

# parsemsf

Version: 0.1.0

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘parsemsf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_area_table
    > ### Title: Make a table of peptide areas
    > ### Aliases: make_area_table
    > 
    > ### ** Examples
    > 
    > make_area_table(parsemsf_example("test_db.msf"))
    Error: The dbplyr package is required to communicate with database backends.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      12: check_pkg("dbplyr", "communicate with database backends", install = FALSE)
      13: glubort(NULL, "The {name} package is required to {reason}.", if (install) "\nPlease install it with `install.packages(\"{name}\")`")
      14: .abort(text)
      
      Error: The dbplyr package is required to communicate with database backends.
      In addition: Warning message:
      package 'dplyr' was built under R version 3.4.2 
      testthat results ================================================================
      OK: 0 SKIPPED: 0 FAILED: 3
      1. Error: make_area_table creates a data frame with the correct column names (@test_make_area_table.R#16) 
      2. Error: make_pep_table creates a data frame with the correct column names (@test_make_pep_table.R#13) 
      3. Error: map_peptides creates a data frame with the correct column names (@test_map_peptides.R#16) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 20-25 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    The dbplyr package is required to communicate with database backends.
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RSQLite’
      All declared Imports should be used.
    ```

# pcaExplorer

Version: 2.2.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    pcaExplorer: no visible binding for '<<-' assignment to
      ‘pcaexplorer_env’
    pcaExplorer : <anonymous>: no visible binding for global variable
      ‘airway’
    pcaExplorer : <anonymous>: no visible binding for global variable
      ‘pcaexplorer_env’
    Undefined global functions or variables:
      airway pcaexplorer_env
    ```

# perccalc

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘devtools’ ‘ggplot2’ ‘haven’ ‘tidyverse’
      All declared Imports should be used.
    ```

# philr

Version: 1.2.0

## In both

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

# pmc

Version: 1.0.2

## In both

*   R CMD check timed out
    

# pointblank

Version: 0.1

## In both

*   checking whether package ‘pointblank’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/pointblank/new/pointblank.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘pointblank’ ...
** package ‘pointblank’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/pointblank/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/pointblank/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/pointblank/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘pointblank’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/pointblank/new/pointblank.Rcheck/pointblank’

```
### CRAN

```
* installing *source* package ‘pointblank’ ...
** package ‘pointblank’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/pointblank/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/pointblank/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/pointblank/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘pointblank’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/pointblank/old/pointblank.Rcheck/pointblank’

```
# powerlmm

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘testthat’
      All declared Imports should be used.
    ```

# prisonbrief

Version: 0.1.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# projmanr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# prophet

Version: 0.2

## In both

*   checking whether package ‘prophet’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/prophet/new/prophet.Rcheck/00install.out’ for details.
    ```

# proteoQC

Version: 1.12.3

## In both

*   checking examples ... ERROR
    ```
    ...
     *** caught illegal operation ***
    address 0x7fffe072dae4, cause 'illegal opcode'
    
    Traceback:
     1: mcfork(detached)
     2: parallel::mcparallel({    con <- NULL    suppressWarnings({        while (is.null(con)) {            con <- tryCatch({                socketConnection(host, port, FALSE, TRUE, "a+b",                   timeout = timeout)            }, error = function(e) {            })        }    })    node <- structure(list(con = con), class = "SOCK0node")    bploop(node)}, detached = TRUE)
     3: .bpforkChild(host, port, rank, timeout)
     4: .bpfork(nnodes, bptimeout(x), .hostname(x), .port(x))
     5: .local(x, ...)
     6: bpstart(BPPARAM, length(X))
     7: bpstart(BPPARAM, length(X))
     8: bplapply(spectraList, quantify, method, reporters, strict, BPPARAM = BPPARAM)
     9: bplapply(spectraList, quantify, method, reporters, strict, BPPARAM = BPPARAM)
    10: quantify_MSnExp(object, method, reporters, strict, BPPARAM, qual,     verbose)
    11: .local(object, ...)
    12: quantify(msmsdata, reporters = reporterClass, method = "max")
    13: quantify(msmsdata, reporters = reporterClass, method = "max")
    14: exprs(quantify(msmsdata, reporters = reporterClass, method = "max"))
    15: as.data.frame(exprs(quantify(msmsdata, reporters = reporterClass,     method = "max")))
    16: labelRatio("test.mgf", reporter = 2)
    An irrecoverable exception occurred. R is aborting now ...
    ```

*   checking whether package ‘proteoQC’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/proteoQC/new/proteoQC.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'proteoQC.Rmd' failed with diagnostics:
    there is no package called ‘prettydoc’
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.9Mb
      sub-directories of 1Mb or more:
        doc       3.2Mb
        extdata   3.9Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    plotMS2boxplot: no visible binding for global variable ‘techRep’
    plotMS2boxplot: no visible binding for global variable ‘fraction’
    plotMS2boxplot: no visible binding for global variable ‘MS2QC’
    plotSampleIDResultErrorBar: no visible binding for global variable
      ‘fraction’
    plotSampleIDResultErrorBar: no visible binding for global variable
      ‘val’
    plotSampleIDResultErrorBar: no visible binding for global variable ‘se’
    plotSampleVenn: no visible global function definition for ‘grid.draw’
    plotTechRepVenn : <anonymous>: no visible global function definition
      for ‘grid.draw’
    qcHist: no visible binding for global variable ‘error’
    qcHist: no visible binding for global variable ‘techRep’
    qcHist: no visible binding for global variable ‘bioRep’
    qcHist2: no visible binding for global variable ‘error’
    qcHist2: no visible binding for global variable ‘fractile’
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

# psycho

Version: 0.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rtf’ ‘tidyverse’
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

Version: 2.2.8

## In both

*   checking whether package ‘qdap’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/qdap/new/qdap.Rcheck/00install.out’ for details.
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
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/qdap/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/qdap/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/qdap/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/qdap/new/qdap.Rcheck/qdap’

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
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/qdap/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/qdap/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/qdap/rJava/libs/rJava.so
  Reason: image not found
ERROR: lazy loading failed for package ‘qdap’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/qdap/old/qdap.Rcheck/qdap’

```
# qualvar

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Quitting from lines 92-106 (wilcox1973.Rmd) 
    Error: processing vignette 'wilcox1973.Rmd' failed with diagnostics:
    there is no package called 'webshot'
    Execution halted
    ```

# qwraps2

Version: 0.2.4

## In both

*   checking Rd \usage sections ... NOTE
    ```
    S3 methods shown with full name in documentation object 'summary_table':
      ‘cbind.qwraps2_summary_table’
    
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# R6Frame

Version: 0.1.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      testthat results ================================================================
      OK: 139 SKIPPED: 0 FAILED: 10
      1.  Error: gather works with R6 data.frame (@test-tidyr_reshape.R#11) 
      2.  Error: gather works with R6 data.table (@test-tidyr_reshape.R#25) 
      3.  Error: gather works with R6 tbl_df (@test-tidyr_reshape.R#38) 
      4.  Error: spread works with R6 data.frame (@test-tidyr_reshape.R#52) 
      5.  Error: spread works with R6 data.table (@test-tidyr_reshape.R#67) 
      6.  Error: spread works with R6 tbl_df (@test-tidyr_reshape.R#81) 
      7.  Error: complete works with R6 data.frame (@test-tidyr_verbs.R#13) 
      8.  Error: complete works with R6 data.table (@test-tidyr_verbs.R#27) 
      9.  Error: complete works with R6 tbl_df (@test-tidyr_verbs.R#41) 
      10. Error: fill works with R6 tbl_df (@test-tidyr_verbs.R#72) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# radiant.basics

Version: 0.8.0

## In both

*   checking whether package ‘radiant.basics’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/radiant.basics/new/radiant.basics.Rcheck/00install.out’ for details.
    ```

# radiant.data

Version: 0.8.1

## In both

*   checking whether package ‘radiant.data’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/radiant.data/new/radiant.data.Rcheck/00install.out’ for details.
    ```

# radiant.model

Version: 0.8.0

## In both

*   checking whether package ‘radiant.model’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/radiant.model/new/radiant.model.Rcheck/00install.out’ for details.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# rattle

Version: 5.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Packages required but not available: ‘RGtk2’ ‘cairoDevice’
    
    Packages suggested but not available for checking:
      ‘gWidgetsRGtk2’ ‘playwith’ ‘rggobi’ ‘RGtk2Extras’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# rcongresso

Version: 0.1.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      
      [31m3. Failure: Campos do dataframe (@test_proposicoes.R#43) [39m-----------------------
      sapply(pec_241, class) not equal to `tipos_pec241`.
      Lengths differ: 13 vs 12
      
      
      testthat results ================================================================
      OK: 52 SKIPPED: 0 FAILED: 3
      1. Failure: Dimensoes do dataframe (@test_proposicoes.R#33) 
      2. Failure: Atributos do dataframe (@test_proposicoes.R#38) 
      3. Failure: Campos do dataframe (@test_proposicoes.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘utils’
      All declared Imports should be used.
    ```

# rcv

Version: 0.2.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6543 marked UTF-8 strings
    ```

# readat

Version: 1.2.1

## In both

*   checking R code for possible problems ... NOTE
    ```
    sfread: no visible binding for global variable ‘header’
    sfread: no visible binding for global variable ‘nrows’
    Undefined global functions or variables:
      header nrows
    ```

# REDCapR

Version: 0.9.8

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      4: capture_messages(object)
      5: withCallingHandlers(code, message = function(condition) {
             out$push(condition)
             invokeRestart("muffleMessage")
         })
      6: redcap_download_file_oneshot(record = record, field = field, redcap_uri = start_clean_result$redcap_project$redcap_uri, 
             token = start_clean_result$redcap_project$token)
      
      testthat results ================================================================
      OK: 568 SKIPPED: 0 FAILED: 2
      1. Failure: NameComesFromREDCap (@test-file-oneshot.R#15) 
      2. Error: NameComesFromREDCap (@test-file-oneshot.R#30) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rfishbase

Version: 2.1.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 44 marked UTF-8 strings
    ```

# rmapzen

Version: 0.3.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: FUN(X[[i]], ...)
      4: vector_url(x = tile_coordinates$x, y = tile_coordinates$y, z = tile_coordinates$z, 
             layers = "all", format = "json")
      5: structure(list(scheme = "https", hostname = "tile.mapzen.com", path = vector_path(layers, 
             x, y, z, format), query = list(api_key = api_key)), class = "url")
      6: mz_key()
      7: stop("Set the MAPZEN_KEY environment variable")
      
      testthat results ================================================================
      OK: 199 SKIPPED: 0 FAILED: 2
      1. Error: single tiles can be pulled (@test-mz-vector-tiles.R#14) 
      2. Error: multiple contiguous tiles can be pulled (@test-mz-vector-tiles.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# rmonad

Version: 0.3.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# RNeXML

Version: 2.0.7

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘rrdf’ ‘Sxslt’
    ```

# rnoaa

Version: 0.7.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 181 SKIPPED: 1 FAILED: 9
      1. Error: check_response returns an error (@test-check_response.r#7) 
      2. Error: check_response returns the correct error messages (@test-check_response.r#26) 
      3. Error: ncdc returns the correct ... (@test-ncdc.r#8) 
      4. Error: ncdc_datacats returns the correct ... (@test-ncdc_datacats.r#7) 
      5. Error: ncdc_datasets returns the correct class (@test-ncdc_datasets.r#7) 
      6. Error: ncdc_datatypes returns the correct class (@test-ncdc_datatypes.r#7) 
      7. Error: ncdc_locs returns the correct class (@test-ncdc_locs.r#7) 
      8. Error: ncdc_locs_cats returns the correct ... (@test-ncdc_locs_cats.r#7) 
      9. Error: ncdc_stations returns the correct... (@test-ncdc_stations.r#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# roadoi

Version: 0.4

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 73-79 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    Evaluation error: Result 2 is not a length 1 atomic vector.
    Execution halted
    ```

# rODE

Version: 0.99.5

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘data.table’
      All declared Imports should be used.
    ```

# rscopus

Version: 0.5.3

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# rtable

Version: 0.1.5

## In both

*   checking whether package ‘rtable’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/rtable/new/rtable.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rtable’ ...
** package ‘rtable’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘ReporteRsjars’:
 .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/rtable/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/rtable/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/rtable/rJava/libs/rJava.so
  Reason: image not found
Error : package ‘ReporteRsjars’ could not be loaded
ERROR: lazy loading failed for package ‘rtable’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/rtable/new/rtable.Rcheck/rtable’

```
### CRAN

```
* installing *source* package ‘rtable’ ...
** package ‘rtable’ successfully unpacked and MD5 sums checked
** R
** inst
** preparing package for lazy loading
Error: package or namespace load failed for ‘ReporteRsjars’:
 .onLoad failed in loadNamespace() for 'rJava', details:
  call: dyn.load(file, DLLpath = DLLpath, ...)
  error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/rtable/rJava/libs/rJava.so':
  dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/rtable/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
  Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/rtable/rJava/libs/rJava.so
  Reason: image not found
Error : package ‘ReporteRsjars’ could not be loaded
ERROR: lazy loading failed for package ‘rtable’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/rtable/old/rtable.Rcheck/rtable’

```
# RTCGA

Version: 1.6.0

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
      Welcome to the RTCGA (version: 1.6.0).
      > library(RTCGA.rnaseq)
      Error in library(RTCGA.rnaseq) : 
        there is no package called 'RTCGA.rnaseq'
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘RTCGA.rnaseq’ ‘RTCGA.clinical’ ‘RTCGA.mutations’ ‘RTCGA.RPPA’
      ‘RTCGA.mRNA’ ‘RTCGA.miRNASeq’ ‘RTCGA.methylation’ ‘RTCGA.CNV’
      ‘RTCGA.PANCAN12’
    ```

*   checking R code for possible problems ... NOTE
    ```
    availableDates: no visible binding for global variable ‘.’
    downloadTCGA: no visible binding for global variable ‘.’
    ggbiplot: no visible binding for global variable ‘xvar’
    ggbiplot: no visible binding for global variable ‘yvar’
    ggbiplot: no visible global function definition for ‘muted’
    ggbiplot: no visible binding for global variable ‘varname’
    ggbiplot: no visible binding for global variable ‘angle’
    ggbiplot: no visible binding for global variable ‘hjust’
    read.mutations: no visible binding for global variable ‘.’
    read.rnaseq: no visible binding for global variable ‘.’
    survivalTCGA: no visible binding for global variable ‘times’
    whichDateToUse: no visible binding for global variable ‘.’
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

# RxODE

Version: 0.6-0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lbfgs’ ‘numDeriv’
      All declared Imports should be used.
    ```

# scanstatistics

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gamlss.dist’
      All declared Imports should be used.
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

# sf

Version: 0.5-4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.0Mb
      sub-directories of 1Mb or more:
        doc      4.9Mb
        sqlite   1.5Mb
    ```

# sfc

Version: 0.1.0

## In both

*   checking whether package ‘sfc’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/sfc/new/sfc.Rcheck/00install.out’ for details.
    ```

# shazam

Version: 0.1.8

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
      error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/SIBER/rjags/libs/rjags.so':
      dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/SIBER/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/SIBER/rjags/libs/rjags.so
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
      error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/SIBER/rjags/libs/rjags.so':
      dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/SIBER/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
      Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/SIBER/rjags/libs/rjags.so
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
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/simglm/new/simglm.Rcheck/00install.out’ for details.
    ```

# sjmisc

Version: 2.6.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘sjPlot’
    ```

# sjPlot

Version: 2.3.3

## In both

*   checking examples ... WARNING
    ```
    Found the following significant warnings:
    
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
      Warning: 'sjstats::get_model_pval' is deprecated.
    Deprecated functions may be defunct as soon as of the next release of
    R.
    See ?Deprecated.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggeffects’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plm’
    ```

# sjstats

Version: 0.11.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘sjPlot’, ‘MuMIn’, ‘piecewiseSEM’
    ```

# sparseMVN

Version: 0.2.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 477-487 (sparseMVN.Rnw) 
    Error: processing vignette 'sparseMVN.Rnw' failed with diagnostics:
    there is no package called 'trustOptim'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘trustOptim’
    ```

# starmie

Version: 0.1.2

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.9Mb
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

# subSeq

Version: 1.6.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    summary.subsamples: no visible binding for global variable ‘o.padj’
    summary.subsamples: no visible binding for global variable
      ‘significant’
    summary.subsamples: no visible binding for global variable ‘estFDP’
    summary.subsamples: no visible binding for global variable ‘rFDP’
    summary.subsamples: no visible binding for global variable ‘metric’
    summary.subsamples: no visible binding for global variable ‘value’
    summary.subsamples: no visible binding for global variable ‘percent’
    voomLimma: no visible global function definition for ‘model.matrix’
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

# sunburstR

Version: 1.0.2

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘treemap’
    ```

# survminer

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.6Mb
      sub-directories of 1Mb or more:
        doc   5.3Mb
    ```

# sweep

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# teachingApps

Version: 1.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘data.table’ ‘datasets’ ‘stats’
      All declared Imports should be used.
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

# tidyquant

Version: 0.5.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      testthat results ================================================================
      OK: 182 SKIPPED: 0 FAILED: 9
      1. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      2. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      3. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      4. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      5. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      6. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      7. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      8. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      9. Failure: Test all stock.index options to ensure no issues during fetch. (@test_tq_index.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘quantmod’ was built under R version 3.4.2
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/tidyquant/new/tidyquant.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyquant/rJava/libs/rJava.so':
      dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyquant/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
      Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyquant/rJava/libs/rJava.so
      Reason: image not found
    
    Getting data...
    
    Getting holdings for DOW
    Warning in tq_index("DOW") :
      Error at DOW during download. 
    Error: .onLoad failed in loadNamespace() for 'rJava', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyquant/rJava/libs/rJava.so':
      dlopen(/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyquant/rJava/libs/rJava.so, 6): Library not loaded: @rpath/libjvm.dylib
      Referenced from: /Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyquant/rJava/libs/rJava.so
      Reason: image not found
    
    Quitting from lines 105-108 (TQ03-scaling-and-modeling-with-tidyquant.Rmd) 
    Error: processing vignette 'TQ03-scaling-and-modeling-with-tidyquant.Rmd' failed with diagnostics:
    subscript out of bounds
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘curl’ ‘devtools’ ‘rvest’ ‘timeSeries’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# tidyverse

Version: 1.1.1

## In both

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

# tilegramsR

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘sp’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 341 marked UTF-8 strings
    ```

# timekit

Version: 0.3.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# timetk

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

# tmap

Version: 1.10

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        data   1.5Mb
        doc    3.3Mb
    ```

# toxplot

Version: 0.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: package 'dplyr' was built under R version 3.4.2
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 48-52 (Using_ToxPlot_Package_to_Analyze_in_vitro_Screening_Data.Rmd) 
    Error: processing vignette 'Using_ToxPlot_Package_to_Analyze_in_vitro_Screening_Data.Rmd' failed with diagnostics:
    'roxygen2' >= 5.0.0 must be installed for this functionality.
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

*   R CMD check timed out
    

*   checking whether package ‘TPP’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/TPP/new/TPP.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.2Mb
      sub-directories of 1Mb or more:
        data           1.9Mb
        example_data   8.0Mb
        test_data      1.9Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
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
    plot_pVal_distribution: no visible binding for global variable
      ‘..density..’
    Undefined global functions or variables:
      ..density..
    ```

# translateSPSS2R

Version: 1.0.0

## In both

*   checking R code for possible problems ... NOTE
    ```
    ...
    xpssMeans: no visible global function definition for ‘anova’
    xpssRegression: no visible global function definition for ‘na.omit’
    xpssRegression: no visible global function definition for ‘anova’
    xpssRegression: no visible binding for global variable ‘sd’
    xpssTtest: no visible global function definition for ‘complete.cases’
    xpssTtest: no visible global function definition for ‘t.test’
    xpssTtest: no visible global function definition for ‘na.omit’
    xpssTtest: no visible global function definition for ‘sd’
    xpssTtest: no visible global function definition for ‘var’
    xpssTtest: no visible global function definition for ‘cor.test’
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

# unvotes

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4494 marked UTF-8 strings
    ```

# vqtl

Version: 1.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘iterators’ ‘knitr’ ‘testthat’
      All declared Imports should be used.
    ```

# VWPre

Version: 0.9.6

## In both

*   checking whether package ‘VWPre’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.2
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/VWPre/new/VWPre.Rcheck/00install.out’ for details.
    ```

# wand

Version: 0.2.0

## In both

*   checking whether package ‘wand’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/wand/new/wand.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/new/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/wand/new/wand.Rcheck/wand’

```
### CRAN

```
* installing *source* package ‘wand’ ...
** package ‘wand’ successfully unpacked and MD5 sums checked
Checking to see if libmagic is available...
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG -L/usr/include -L/usr/local/include -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library/tidyr/old/Rcpp/include" -I/usr/local/include   -fPIC  -Wall -g -O2  -c wand.cpp -o wand.o
ccache clang++ -Qunused-arguments -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/Library/Frameworks/R.framework/Resources/lib -L/usr/local/lib -o wand.so RcppExports.o wand.o -L/usr/local/lib -L/usr/lib -lmagic -F/Library/Frameworks/R.framework/.. -framework R -Wl,-framework -Wl,CoreFoundation
ld: library not found for -lmagic
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [wand.so] Error 1
ERROR: compilation failed for package ‘wand’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/wand/old/wand.Rcheck/wand’

```
# widyr

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# wordbankr

Version: 0.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 27-31 (wordbankr.Rmd) 
    Error: processing vignette 'wordbankr.Rmd' failed with diagnostics:
    The dbplyr package is required to communicate with database backends.
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RMySQL’
      All declared Imports should be used.
    ```

# zFactor

Version: 0.1.6

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rootSolve’ ‘tibble’
      All declared Imports should be used.
    ```

