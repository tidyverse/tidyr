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

Version: 0.19-1

## In both

*   checking whether package ‘afex’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lme4’ was built under R version 3.4.3
      Warning: package ‘emmeans’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/afex/new/afex.Rcheck/00install.out’ for details.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘ez’, ‘ascii’
    ```

# aire.zmvm

Version: 0.5.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 38 marked UTF-8 strings
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
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/anomalyDetection/new/anomalyDetection.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘anomalyDetection’ ...
** package ‘anomalyDetection’ successfully unpacked and MD5 sums checked
** libs
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
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
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/anomalyDetection/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘anomalyDetection’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/anomalyDetection/old/anomalyDetection.Rcheck/anomalyDetection’

```
# auctestr

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# basecallQC

Version: 1.0.1

## In both

*   checking whether package ‘basecallQC’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘knitr’ was built under R version 3.4.3
      Warning: package ‘yaml’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/basecallQC/new/basecallQC.Rcheck/00install.out’ for details.
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
      ── 1. Failure: bib2df() throws error messages (@tests.R#53)  ───────────────────
      `bib2df("https://www.ottlngr.de/data/x.bib")` did not throw an error.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 15 SKIPPED: 0 FAILED: 1
      1. Failure: bib2df() throws error messages (@tests.R#53) 
      
      Error: testthat unit tests failed
      Execution halted
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

# bioCancer

Version: 1.4.0

## In both

*   checking whether package ‘bioCancer’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘cgdsr’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/bioCancer/new/bioCancer.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'bioCancer.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Depends: includes the non-default packages:
      ‘magrittr’ ‘ggplot2’ ‘lubridate’ ‘tidyr’ ‘cgdsr’ ‘RCurl’ ‘XML’
    Adding so many packages to the search path is excessive and importing
    selectively is preferable.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 22.1Mb
      sub-directories of 1Mb or more:
        base        6.8Mb
        bioCancer   3.1Mb
        doc         2.8Mb
        quant       7.7Mb
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

Version: 0.4.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘breathteststan’
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

*   R CMD check timed out
    

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

# curatedMetagenomicData

Version: 1.2.2

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      The data you have provided does not have
    any singletons. This is highly suspicious. Results of richness
    estimates (for example) are probably unreliable, or wrong, if you have already
    trimmed low-abundance taxa from the data.
    
    We recommended that you find the un-trimmed data and retry.
    Warning in graphics:::plotHclust(n1, merge, height, order(x$order), hang,  :
      "method" is not a graphical parameter
    Warning in graphics:::plotHclust(n1, merge, height, order(x$order), hang,  :
      "method" is not a graphical parameter
    Warning in axis(2, at = pretty(range(height)), ...) :
      "method" is not a graphical parameter
    Warning in title(main = main, sub = sub, xlab = xlab, ylab = ylab, ...) :
      "method" is not a graphical parameter
    Warning in replayPlot(x) : "method" is not a graphical parameter
    Warning in replayPlot(x) : "method" is not a graphical parameter
    Warning in replayPlot(x) : "method" is not a graphical parameter
    Warning in replayPlot(x) : "method" is not a graphical parameter
    Error: processing vignette 'curatedMetagenomicData.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
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

Version: 0.7.1

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# dartR

Version: 1.0

## In both

*   checking whether package ‘dartR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘ade4’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dartR/new/dartR.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DBI’ ‘Demerelate’ ‘misc3d’ ‘plotly’ ‘quadprog’ ‘rgl’
      All declared Imports should be used.
    ```

# dbplot

Version: 0.2.0

## In both

*   checking whether package ‘dbplot’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘rlang’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dbplot/new/dbplot.Rcheck/00install.out’ for details.
    ```

# DChIPRep

Version: 1.6.2

## In both

*   checking whether package ‘DChIPRep’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package 'matrixStats' was built under R version 3.4.3
      Warning: package ‘matrixStats’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/DChIPRep/new/DChIPRep.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        anyMissing, rowMedians
    
    
    Attaching package: 'DelayedArray'
    
    The following objects are masked from 'package:matrixStats':
    
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following object is masked from 'package:base':
    
        apply
    
    
    gene-wise dispersion estimates
    mean-dispersion relationship
    final dispersion estimates
    `geom_smooth()` using method = 'gam'
    Error: processing vignette 'DChIPRepVignette.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Malformed Description field: should contain one or more complete sentences.
    ```

# DeepBlueR

Version: 1.2.10

## In both

*   checking examples ... ERROR
    ```
    ...
    + 
    +     experiment_names = deepblue_extract_names(experiments_list)
    +     histones_datasets[[epigenetic_marks[[i]]]] = experiment_names
    + }
    Called method: deepblue_list_experiments
    Reported status was: okay
    Called method: deepblue_list_experiments
    Reported status was: okay
    Called method: deepblue_list_experiments
    Reported status was: okay
    > 
    > deepblue_enrich_region_overlap(
    +   query_id=filtered_query_id,
    +   background_query=rg_10kb_tilling,
    +   datasets=histones_datasets,
    +   genome="grch38")
    Called method: deepblue_enrich_region_overlap
    Reported status was: error
    Error in deepblue_enrich_region_overlap(query_id = filtered_query_id,  : 
      Command enrich_region_overlap does not exists.
    Execution halted
    ```

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

Version: 0.6.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 109 marked UTF-8 strings
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
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dynfrail/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
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
ccache clang++ -Qunused-arguments  -I/Library/Frameworks/R.framework/Resources/include -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dynfrail/RcppArmadillo/include" -I/usr/local/include  -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dynfrail’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dynfrail/old/dynfrail.Rcheck/dynfrail’

```
# eechidna

Version: 1.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
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

# eiCompare

Version: 2.1

## In both

*   checking whether package ‘eiCompare’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘MASS’ was built under R version 3.4.3
      Warning: package ‘msm’ was built under R version 3.4.3
      Warning: package ‘mvtnorm’ was built under R version 3.4.3
      Warning: package ‘foreach’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/eiCompare/new/eiCompare.Rcheck/00install.out’ for details.
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

*   checking whether package ‘ENCODExplorer’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘DT’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/ENCODExplorer/new/ENCODExplorer.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 73.8Mb
      sub-directories of 1Mb or more:
        data     24.1Mb
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
      Predictor:	 Target 
      Formula:	 Prop ~ Target 
      Runs of Significant Time Bins: 
      Positive Run 1  ===== 
      	Time:		 15900 - 21000 ── 1. Error: (unknown) (@test_cluster_analysis.R#143)  ─────────────────────────
      no applicable method for 'make_time_cluster_data' applied to an object of class "data.frame"
      1: make_time_cluster_data(response_time_by_ppt, predictor_column = "Sex", test = "boot_splines", 
             within_subj = FALSE, smoother = "smooth.spline", alpha = 0.05) at testthat/test_cluster_analysis.R:143
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 42 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test_cluster_analysis.R#143) 
      
      Error: testthat unit tests failed
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
      Warning: package ‘mosaic’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/fastR2/new/fastR2.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘magrittr’
      All declared Imports should be used.
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

# GerminaR

Version: 1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘shinydashboard’
      All declared Imports should be used.
    ```

# GetTDData

Version: 1.3

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GetTDData-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get.yield.curve
    > ### Title: Gets the current yield curve
    > ### Aliases: get.yield.curve
    > 
    > ### ** Examples
    > 
    > df.yield <- get.yield.curve()
    Error in names(df) <- c("n.biz.days", "type", "value") : 
      'names' attribute [3] must be the same length as the vector [2]
    Calls: get.yield.curve
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 17-21 (gtdd-vignette_YieldCurve.Rmd) 
    Error: processing vignette 'gtdd-vignette_YieldCurve.Rmd' failed with diagnostics:
    'names' attribute [3] must be the same length as the vector [2]
    Execution halted
    ```

# gfer

Version: 0.1.9

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyr’
      All declared Imports should be used.
    ```

# ggalluvial

Version: 0.5.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘alluvial’ ‘grid’
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

# ggeffects

Version: 0.3.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘ordinal’
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

# ggfortify

Version: 0.4.1

## In both

*   checking examples ... ERROR
    ```
    ...
    > 
    > data(Canada, package = 'vars')
    > autoplot(AirPassengers)
    > autoplot(UKgas, ts.geom = 'bar')
    > autoplot(Canada)
    > autoplot(Canada, facets = FALSE)
    > 
    > library(zoo)
    Warning: package ‘zoo’ was built under R version 3.4.3
    
    Attaching package: ‘zoo’
    
    The following objects are masked from ‘package:base’:
    
        as.Date, as.Date.numeric
    
    > autoplot(xts::as.xts(AirPassengers))
    Error in data.frame(index(model), ...) : 
      arguments imply differing number of rows: 144, 1, 0
    Calls: autoplot ... autoplot.xts -> <Anonymous> -> fortify.zoo -> cbind -> data.frame
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      10: FUN(X[[i]], ...)
      11: as.vector(lag(ts, k))
      12: lag(ts, k)
      13: bad_args("x", "must be a vector, not a ts object, do you want `stats::lag()`?")
      14: glubort(fmt_args(args), ..., .envir = .envir)
      15: .abort(text)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1440 SKIPPED: 9 FAILED: 3
      1. Error: fortify.ts works for timeserieses (@test-base_ts.R#13) 
      2. Error: autoplot works for xts (@test-ts.R#122) 
      3. Error: gglagplot (@test-tslib.R#103) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Loading required package: ggplot2
    Loading required package: MASS
    Warning: package 'MASS' was built under R version 3.4.3
    Loading required package: strucchange
    Loading required package: zoo
    Warning: package 'zoo' was built under R version 3.4.3
    
    Attaching package: 'zoo'
    
    The following objects are masked from 'package:base':
    
        as.Date, as.Date.numeric
    
    Loading required package: sandwich
    Loading required package: urca
    Loading required package: lmtest
    Quitting from lines 169-174 (intro_Chinese.Rmd) 
    Error: processing vignette 'intro_Chinese.Rmd' failed with diagnostics:
    arguments imply differing number of rows: 144, 1, 0
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   5.0Mb
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

Version: 0.1.6

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
      installed size is 16.4Mb
      sub-directories of 1Mb or more:
        doc          13.7Mb
        htmlwidgets   1.8Mb
    ```

# htmlTable

Version: 1.11.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pxweb’
    ```

# HTSSIP

Version: 1.3.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 83 SKIPPED: 17 FAILED: 11
      1. Error: Beta diversity from a list of phyloseq objects (@test-BD_ordinations.R#2) 
      2. Error: Beta diversity from a list of phyloseq objects (parallel) (@test-BD_ordinations.R#9) 
      3. Error: phyloseq sim (@test-HTSSIP_sim.R#59) 
      4. Error: phyloseq sim w/ metadata (@test-HTSSIP_sim.R#75) 
      5. Error: phyloseq sample_data can be converted to dataframe (@test-Util.R#10) 
      6. Error: phyloseq tax_table can be converted to dataframe (@test-Util.R#18) 
      7. Error: phyloseq otu_table can be converted to dataframe (@test-Util.R#25) 
      8. Error: phyloseq_re sample_data can be converted to dataframe (@test-Util.R#35) 
      9. Error: phyloseq otu_table can be converted to dataframe (@test-Util.R#48) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    converting counts to integer mode
    Quitting from lines 68-72 (beta_diversity_ordinations.Rmd) 
    Error: processing vignette 'beta_diversity_ordinations.Rmd' failed with diagnostics:
    Incorrect number of arguments (7), expecting 5 for 'node_depth_edgelength'
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

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'BH-explanation.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

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

# IONiseR

Version: 2.0.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following object is masked from 'package:base':
    
        apply
    
    
    Attaching package: 'GenomicAlignments'
    
    The following object is masked from 'package:dplyr':
    
        last
    
    
    Attaching package: 'ShortRead'
    
    The following object is masked from 'package:dplyr':
    
        id
    
    Error: processing vignette 'IONiseR.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

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

*   checking whether package ‘isomiRs’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘matrixStats’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/isomiRs/new/isomiRs.Rcheck/00install.out’ for details.
    ```

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

Version: 1.0.1

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.5Mb
      sub-directories of 1Mb or more:
        R   4.6Mb
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘readr’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 176 marked UTF-8 strings
    ```

# jpndistrict

Version: 0.3.0

## In both

*   checking whether package ‘jpndistrict’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘jpmesh’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/jpndistrict/new/jpndistrict.Rcheck/00install.out’ for details.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 502 marked UTF-8 strings
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

# memapp

Version: 2.7

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

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Matrix’ ‘shiny’
      All declared Imports should be used.
    ```

# mixOmics

Version: 6.3.1

## In both

*   checking whether package ‘mixOmics’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘MASS’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/mixOmics/new/mixOmics.Rcheck/00install.out’ for details.
    ```

# modelr

Version: 0.1.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘lme4’, ‘rstanarm’
    ```

# mosaic

Version: 1.1.1

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘manipulate’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        R     2.2Mb
        doc   2.4Mb
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
      Warning: package ‘mosaicCore’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/mosaicModel/new/mosaicModel.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘MASS’ ‘caret’ ‘ggformula’ ‘knitr’ ‘testthat’ ‘tidyverse’
      All declared Imports should be used.
    ```

# mudata2

Version: 1.0.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘hms’ ‘methods’
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

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    Error in prepMultiAssay(objlist3, patient.data, dfmap) : 
      ExperimentList does not have names, assign names
    Error in if (dim(object)[2] > 0 && is.null(colnames(object))) { : 
      missing value where TRUE/FALSE needed
    Error: processing vignette 'QuickStartMultiAssay.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
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
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/neuropsychology/new/neuropsychology.Rcheck/00install.out’ for details.
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
      installed size is  8.9Mb
      sub-directories of 1Mb or more:
        data   8.5Mb
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

# parsemsf

Version: 0.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dbplyr’
      All declared Imports should be used.
    ```

# PathoStat

Version: 1.2.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: Transformation introduced infinite values in discrete y-axis
    Error: processing vignette 'PathoStatAdvanced.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

# pcaExplorer

Version: 2.2.1

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        colMaxs, colMins, colRanges, rowMaxs, rowMins, rowRanges
    
    The following object is masked from 'package:base':
    
        apply
    
    Loading required package: AnnotationDbi
    
    'select()' returned 1:many mapping between keys and columns
    Warning in cor.test.default(x[, j], coldata[, i], method = "spearman") :
      Cannot compute exact p-value with ties
    Warning in cor.test.default(x[, j], coldata[, i], method = "spearman") :
      Cannot compute exact p-value with ties
    Warning in cor.test.default(x[, j], coldata[, i], method = "spearman") :
      Cannot compute exact p-value with ties
    Warning in cor.test.default(x[, j], coldata[, i], method = "spearman") :
      Cannot compute exact p-value with ties
    Warning: Removed 8 rows containing missing values (geom_text).
    Error: processing vignette 'pcaExplorer.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

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

# pcr

Version: 1.1.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Joining, by = c("group", "gene")
    Parsed with column specification:
    cols(
      ref = col_double(),
      target = col_double()
    )
    Joining, by = c("group", "gene")
    Joining, by = c("group", "gene", "calibrated")
    Joining, by = c("group", "gene")
    Error producing PDF.
    ! LaTeX Error: \caption outside float.
    
    See the LaTeX manual or LaTeX Companion for explanation.
    Type  H <return>  for immediate help.
     ...                                              
                                                      
    l.527 \caption
    
    Error: processing vignette 'qpcr_analysis.Rmd' failed with diagnostics:
    pandoc document conversion failed with error 43
    Execution halted
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

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
        intersect, setdiff, setequal, union
    
    Found more than one class "phylo" in cache; using the first, from namespace 'treeio'
    Also defined by 'phyloseq'
    Found more than one class "phylo" in cache; using the first, from namespace 'treeio'
    Also defined by 'phyloseq'
    
    Attaching package: 'tidyr'
    
    The following object is masked from 'package:ggtree':
    
        expand
    
    The following object is masked from 'package:Matrix':
    
        expand
    
    Error: processing vignette 'philr-intro.Rmd' failed with diagnostics:
    path for html_dependency not found: 
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

# pmc

Version: 1.0.2

## In both

*   R CMD check timed out
    

# pointblank

Version: 0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Hmisc’ ‘digest’ ‘htmltools’ ‘knitr’ ‘lazyWeave’ ‘lubridate’ ‘rJava’
      All declared Imports should be used.
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

Version: 0.2.1

## In both

*   checking whether package ‘prophet’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘Rcpp’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/prophet/new/prophet.Rcheck/00install.out’ for details.
    ```

# proteoQC

Version: 1.12.3

## In both

*   checking whether package ‘proteoQC’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘VennDiagram’ was built under R version 3.4.3
      Warning: package ‘Rcpp’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/proteoQC/new/proteoQC.Rcheck/00install.out’ for details.
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

# psychmeta

Version: 0.2.2

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5 marked UTF-8 strings
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

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘gplots’
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

# radiant.model

Version: 0.8.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# railtrails

Version: 0.0.1

## Newly fixed

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        data   5.0Mb
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4483 marked UTF-8 strings
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

# rclimateca

Version: 1.0.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 24 marked UTF-8 strings
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

# redcapAPI

Version: 2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘DBI’
      All declared Imports should be used.
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

# rmapzen

Version: 0.3.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      Warning message:
      package 'testthat' was built under R version 3.4.3 
      > library(rmapzen)
      > 
      > test_check("rmapzen")
      Assertion failed: (!"should never be reached"), function itemsTree, file ../../../../src/geos-3.6.1/src/index/strtree/AbstractSTRtree.cpp, line 373.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 31 marked UTF-8 strings
    ```

# RNeXML

Version: 2.0.8

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘rrdf’ ‘Sxslt’
    ```

# rODE

Version: 0.99.6

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

*   checking whether package ‘rtable’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘ReporteRs’ was built under R version 3.4.3
      Warning: package ‘ReporteRsjars’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/rtable/new/rtable.Rcheck/00install.out’ for details.
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
      Warning message:
      package 'testthat' was built under R version 3.4.3 
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

# RtutoR

Version: 1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘DT’ ‘rmarkdown’
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

# Seurat

Version: 2.2.0

## In both

*   checking whether package ‘Seurat’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘cowplot’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/new/Seurat.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘MetaDE’
    ```

# sf

Version: 0.6-0

## In both

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘sf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: geos_measures
    > ### Title: Compute geometric measurements
    > ### Aliases: geos_measures st_area geos_measures st_length geos_measures
    > ###   st_distance
    > 
    > ### ** Examples
    > 
    > b0 = st_polygon(list(rbind(c(-1,-1), c(1,-1), c(1,1), c(-1,1), c(-1,-1))))
    > b1 = b0 + 2
    > b2 = b0 + c(-0.2, 2)
    > x = st_sfc(b0, b1, b2)
    > st_area(x)
    [1] 4 4 4
    > line = st_sfc(st_linestring(rbind(c(30,30), c(40,40))), crs = 4326)
    > st_length(line)
    Error in st_length(line) : 
      package lwgeom required, please install it first
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 795-797 (sf1.Rmd) 
    Error: processing vignette 'sf1.Rmd' failed with diagnostics:
    package lwgeom required, please install it first
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘lwgeom’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 14.4Mb
      sub-directories of 1Mb or more:
        doc     10.1Mb
        sqlite   1.5Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lwgeom’
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
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/simglm/new/simglm.Rcheck/00install.out’ for details.
    ```

# sjPlot

Version: 2.4.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘prediction’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plm’
    ```

# sjstats

Version: 0.14.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘sjPlot’, ‘MuMIn’, ‘piecewiseSEM’
    ```

# skimr

Version: 1.0.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
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

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘moments’ ‘poweRlaw’
      All declared Imports should be used.
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

Version: 0.4.1

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        doc   4.9Mb
    ```

# survtmle

Version: 1.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > set.seed(341796)
    > n <- 100
    > t_0 <- 10
    > W <- data.frame(W1 = runif(n), W2 = rbinom(n, 1, 0.5))
    > A <- rbinom(n, 1, 0.5)
    > T <- rgeom(n,plogis(-4 + W$W1 * W$W2 - A)) + 1
    > C <- rgeom(n, plogis(-6 + W$W1)) + 1
    > ftime <- pmin(T, C)
    > ftype <- as.numeric(ftime == T)
    > suppressWarnings(
    +   fit <- survtmle(ftime = ftime, ftype = ftype,
    +                   adjustVars = W, glm.ftime = "I(W1*W2) + trt + t",
    +                   trt = A, glm.ctime = "W1 + t", method = "hazard",
    +                   verbose = TRUE,  t0 = t_0, maxIter = 2)
    + )
    > tpfit <- timepoints(fit, times = seq_len(t_0))
    > plot(tpfit)
    Error in names(x) <- value : 
      'names' attribute [3] must be the same length as the vector [2]
    Calls: plot -> plot.tp.survtmle -> colnames<-
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 540-542 (survtmle_intro.Rmd) 
    Error: processing vignette 'survtmle_intro.Rmd' failed with diagnostics:
    'names' attribute [3] must be the same length as the vector [2]
    Execution halted
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

# switchde

Version: 1.2.0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    The following object is masked from 'package:Biobase':
    
        combine
    
    The following objects are masked from 'package:BiocGenerics':
    
        combine, intersect, setdiff, union
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Warning: Removed 68 rows containing missing values (geom_path).
    Error: processing vignette 'switchde_vignette.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
    ```

# SWMPr

Version: 2.2.0

## In both

*   checking whether package ‘SWMPr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘zoo’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/SWMPr/new/SWMPr.Rcheck/00install.out’ for details.
    ```

# syuzhet

Version: 1.0.4

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        R         1.6Mb
        extdata   3.1Mb
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

# tibbletime

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘tidyselect’
      All declared Imports should be used.
    ```

# tidypredict

Version: 0.1.0

## In both

*   checking whether package ‘tidypredict’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘rlang’ was built under R version 3.4.3
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidypredict/new/tidypredict.Rcheck/00install.out’ for details.
    ```

# tidyquant

Version: 0.5.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         })
      9: expr_type_of(.x)
      10: typeof(x)
      11: duplicate(quo)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 149 SKIPPED: 2 FAILED: 5
      1. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#15) 
      2. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#17) 
      3. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#19) 
      4. Error: Test error on invalid data inputs. (@test_tq_mutate.R#142) 
      5. Error: Test error on invalid data inputs. (@test_tq_transmute.R#121) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘zoo’ was built under R version 3.4.3
      Warning: package ‘quantmod’ was built under R version 3.4.3
      Warning: package ‘TTR’ was built under R version 3.4.3
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidyquant/new/tidyquant.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
    
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing AAPL.
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=FB&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'FB', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=FB&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing FB.
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOG&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'GOOG', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOG&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing GOOG.
    Quitting from lines 211-214 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    object 'Ask' not found
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘curl’ ‘devtools’ ‘rvest’ ‘timeSeries’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# tidytext

Version: 0.1.6

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      4: quanteda::as.dfm
      5: getExportedValue(pkg, name)
      6: asNamespace(ns)
      7: getNamespace(ns)
      8: tryCatch(loadNamespace(name), error = function(e) stop(e))
      9: tryCatchList(expr, classes, parentenv, handlers)
      10: tryCatchOne(expr, names, parentenv, handlers[[1L]])
      11: value[[3L]](cond)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 206 SKIPPED: 5 FAILED: 1
      1. Error: can augment an stm output (@test-stm-tidiers.R#59) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘quanteda’
    ```

# tidyverse

Version: 1.2.1

## In both

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# tidyxl

Version: 1.0.0

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

*   checking for missing documentation entries ... WARNING
    ```
    Warning: package ‘sp’ was built under R version 3.4.3
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘sp’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 341 marked UTF-8 strings
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

Version: 1.11

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

# ukbtools

Version: 0.10.0

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
    Condition message must be a string
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘RMySQL’
      All declared Imports should be used.
    ```

# xpose

Version: 0.4.1

## In both

*   checking examples ... ERROR
    ```
    ...
    2       2 T      <tibble [11,000 × 12]> F       
    > 
    > # List output files data
    > list_files(xpdb_ex_pk)
    Files:
      name       extension problem subprob method data               modified
      <chr>      <chr>       <dbl>   <dbl> <chr>  <list>             <lgl>   
    1 run001.cor cor          1.00       0 foce   <tibble [14 × 15]> F       
    2 run001.cov cov          1.00       0 foce   <tibble [14 × 15]> F       
    3 run001.ext ext          1.00       0 foce   <tibble [28 × 16]> F       
    4 run001.grd grd          1.00       0 foce   <tibble [21 × 11]> F       
    5 run001.phi phi          1.00       0 foce   <tibble [74 × 12]> F       
    6 run001.shk shk          1.00       0 foce   <tibble [7 × 5]>   F       
    > 
    > # List special data
    > xpdb_ex_pk %>% 
    + vpc_data(quiet = TRUE) %>% 
    + list_special()
    Error in sim_cols$sim : $ operator is invalid for atomic vectors
    Calls: %>% ... <Anonymous> -> vpc_data -> <Anonymous> -> add_sim_index_number
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             bin_mid = opt$bin_mid, obs_cols = obs_cols, sim_cols = sim_cols, stratify = stratify, 
             pred_corr = opt$pred_corr, pred_corr_lower_bnd = opt$pred_corr_lower_bnd, pi = opt$pi, 
             ci = opt$ci, uloq = opt$uloq, lloq = opt$lloq, smooth = FALSE, vpcdb = TRUE, 
             verbose = !quiet)
      10: add_sim_index_number(sim, id = "id", sim_label = sim_cols$sim)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 425 SKIPPED: 4 FAILED: 4
      1. Error: (unknown) (@test-console_outputs.R#4) 
      2. Error: (unknown) (@test-edits.R#17) 
      3. Error: (unknown) (@test-vpc.R#17) 
      4. Error: (unknown) (@test-xpdb_access.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Returning data from run001.ext, $prob no.1, subprob no.0, method foce
    Returning parameter estimates from $prob no.1, subprob no.0, method foce
    Quitting from lines 13-26 (customize_plots.Rmd) 
    Error: processing vignette 'customize_plots.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    Execution halted
    ```

# zFactor

Version: 0.1.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rootSolve’
      All declared Imports should be used.
    ```

