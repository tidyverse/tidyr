# afex

Version: 0.18-0

## In both

*   checking whether package ‘afex’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lme4’ was built under R version 3.4.3
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

# BgeeDB

Version: 2.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
    Downloading expression data for the experiment GSE30617 ...
    trying URL 'ftp://ftp.bgee.org/bgee_v13_2/download/processed_expr_values/rna_seq/Mus_musculus/Mus_musculus_RNA-Seq_read_counts_RPKM_GSE30617.tsv.zip'
    Content type 'unknown' length 10651169 bytes (10.2 MB)
    ==================================================
    
    Saved expression data file in /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BgeeDB/new/BgeeDB.Rcheck/Mus_musculus_Bgee_13_2 folder. Now unzipping /Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BgeeDB/new/BgeeDB.Rcheck/Mus_musculus_Bgee_13_2/Mus_musculus_RNA-Seq_read_counts_RPKM_GSE30617.tsv.zip file...
    
    Read 19.9% of 1410444 rows
    Read 92.2% of 1410444 rows
    Read 1410444 rows and 13 (of 13) columns from 0.210 GB file in 00:00:04
    
    Saving all data in .rds file...
    
    Extracting expression data matrix...
      Keeping only present genes.
    Warning: Setting row names on a tibble is deprecated.
    Error in `row.names<-.data.frame`(`*tmp*`, value = value) : 
      invalid 'row.names' length
    Calls: formatData ... row.names<-.tbl_df -> NextMethod -> row.names<-.data.frame
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Checking gene list......................
      
      WARNING: Some genes in your gene list have no expression data in Bgee, and will not be included in the analysis. 66 genes in background will be kept.
      
      Building most specific Ontology terms...  (  1  Ontology terms found. )
      
      Building DAG topology...................  (  13  Ontology terms and  15  relations. )
      
      Annotating nodes (Can be long)..........  (  66  genes annotated to the Ontology terms. )
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 20 SKIPPED: 0 FAILED: 1
      1. Error: Formatting gene expression files (@test_format_data.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    downloaded 707 bytes
    
    trying URL 'http://bgee.org/bgee13/?page=species&display_type=tsv'
    downloaded 707 bytes
    
    trying URL 'http://bgee.org/bgee13/?page=species&display_type=tsv'
    downloaded 707 bytes
    
    trying URL 'ftp://ftp.bgee.org/bgee_v13_2/download/processed_expr_values/rna_seq/Mus_musculus/Mus_musculus_RNA-Seq_experiments_libraries.zip'
    Content type 'unknown' length 9292 bytes
    ==================================================
    trying URL 'ftp://ftp.bgee.org/bgee_v13_2/download/processed_expr_values/rna_seq/Mus_musculus/Mus_musculus_RNA-Seq_read_counts_RPKM.zip'
    Content type 'unknown' length 32872528 bytes (31.3 MB)
    ==================================================
    trying URL 'ftp://ftp.bgee.org/bgee_v13_2/download/processed_expr_values/rna_seq/Mus_musculus/Mus_musculus_RNA-Seq_read_counts_RPKM_GSE30617.tsv.zip'
    Content type 'unknown' length 10651169 bytes (10.2 MB)
    ==================================================
    Quitting from lines 111-114 (BgeeDB_Manual.Rmd) 
    Error: processing vignette 'BgeeDB_Manual.Rmd' failed with diagnostics:
    invalid 'row.names' length
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

*   checking examples ... ERROR
    ```
    Running examples in ‘cellbaseR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: AnnotateVcf,CellBaseR-method
    > ### Title: AnnotateVcf
    > ### Aliases: AnnotateVcf,CellBaseR-method AnnotateVcf
    > 
    > ### ** Examples
    > 
    > cb <- CellBaseR()
    > fl <- system.file("extdata", "hapmap_exome_chr22_500.vcf.gz",
    +                   package = "cellbaseR" )
    > res <- AnnotateVcf(object=cb, file=fl, BPPARAM = bpparam(workers=2))
    Error: BiocParallel errors
      element index: 1
      first error: lexical error: invalid char in json text.
                                           <html><body><h1>504 Gateway Tim
                         (right here) ------^
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Attaching package: 'VariantAnnotation'
    
    The following object is masked from 'package:base':
    
        tabulate
    
    Warning: 'rbind.pages' is deprecated.
    Use 'rbind_pages' instead.
    See help("Deprecated")
    Warning: 'rbind.pages' is deprecated.
    Use 'rbind_pages' instead.
    See help("Deprecated")
    Warning: 'rbind.pages' is deprecated.
    Use 'rbind_pages' instead.
    See help("Deprecated")
    Warning in .bcfHeaderAsSimpleList(header) :
      duplicate keys in header will be forced to unique rownames
    Error: processing vignette 'cellbaseR.Rmd' failed with diagnostics:
    path for html_dependency not found: 
    Execution halted
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

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    R(1415,0x7fff94071340) malloc: *** error for object 0x7ff3c6e7bf18: incorrect checksum for freed object - object was probably modified after being freed.
    *** set a breakpoint in malloc_error_break to debug
    ```

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
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        data   5.2Mb
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

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/runTests.R’ failed.
    Last 13 lines of output:
       
      FAILURE in test.design_wide: Error in RUnit::checkIdentical(obs[1], data.table(File = "ENCFF000XAH.bam",  : 
        FALSE 
       
      
      Test files with failing tests
      
         test_createDesign.R 
           test.design_split_wide 
           test.design_wide 
      
      
      Error in BiocGenerics:::testPackage("ENCODExplorer") : 
        unit tests failed for package ENCODExplorer
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 73.7Mb
      sub-directories of 1Mb or more:
        data     24.0Mb
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

# eurostat

Version: 3.1.5

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    trying URL 'http://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing?sort=1&file=data%2Ften00081.tsv.gz'
    Content type 'application/octet-stream;charset=UTF-8' length 13546 bytes (13 KB)
    ==================================================
    downloaded 13 KB
    
    Table ten00081 cached at /tmp/RtmpQkobhJ/eurostat/ten00081_date_code_TF.rds
    Quitting from lines 230-279 (eurostat_tutorial.Rmd) 
    Error: processing vignette 'eurostat_tutorial.Rmd' failed with diagnostics:
    Columns `Biofuels`, `Wind, solar, waste and Other`, `Hydro power` must be length 93, not 31, 31, 31
    Execution halted
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

# fastqcr

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    # A tibble: 60 x 7
       sample module                       status tot.seq  seq.length pct.gc pct.d…
     * <chr>  <chr>                        <chr>  <chr>    <chr>       <dbl>  <dbl>
     1 S1     Basic Statistics             PASS   50299587 35-76        48.0   17.2
     2 S1     Per base sequence quality    PASS   50299587 35-76        48.0   17.2
     3 S1     Per tile sequence quality    PASS   50299587 35-76        48.0   17.2
     4 S1     Per sequence quality scores  PASS   50299587 35-76        48.0   17.2
     5 S1     Per base sequence content    FAIL   50299587 35-76        48.0   17.2
     6 S1     Per sequence GC content      WARN   50299587 35-76        48.0   17.2
     7 S1     Per base N content           PASS   50299587 35-76        48.0   17.2
     8 S1     Sequence Length Distribution WARN   50299587 35-76        48.0   17.2
     9 S1     Sequence Duplication Levels  PASS   50299587 35-76        48.0   17.2
    10 S1     Overrepresented sequences    PASS   50299587 35-76        48.0   17.2
    # ... with 50 more rows
    > 
    > # Generates a summary of qc_aggregate
    > summary(qc)
    Error in mutate_impl(.data, dots) : 
      Evaluation error: Columns `nb_fail`, `nb_pass`, `nb_warn` must be length 13, not 12, 12, 12.
    Calls: summary ... <Anonymous> -> mutate.tbl_df -> mutate_impl -> .Call
    Execution halted
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

Version: 0.3.0

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
      9: lapply(seq(1:lags), .lag)
      10: FUN(X[[i]], ...)
      11: as.vector(lag(ts, k))
      12: lag(ts, k)
      13: bad_args("x", "must be a vector, not a ts object, do you want `stats::lag()`?")
      14: glubort(fmt_args(args), ..., .envir = .envir)
      15: .abort(text)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1434 SKIPPED: 9 FAILED: 2
      1. Error: infer, fortify and autoplot works for KFAS::signal (@test-base-infer.R#95) 
      2. Error: gglagplot (@test-tslib.R#103) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    
    Attaching package: 'forecast'
    
    The following object is masked from 'package:ggfortify':
    
        gglagplot
    
    Successfully loaded changepoint package version 2.2.2
     NOTE: Predefined penalty values changed in version 2.2.  Previous penalty values with a postfix 1 i.e. SIC1 are now without i.e. SIC and previous penalties without a postfix i.e. SIC are now with a postfix 0 i.e. SIC0. See NEWS and help files for further details.
    
    Attaching package: 'dlm'
    
    The following object is masked from 'package:ggplot2':
    
        %+%
    
    Quitting from lines 269-277 (intro_Chinese.Rmd) 
    Error: processing vignette 'intro_Chinese.Rmd' failed with diagnostics:
    there is no package called 'KFAS'
    Execution halted
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘KFAS’
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

# GSODR

Version: 1.1.2

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Attaching package: 'gridExtra'
    
    The following object is masked from 'package:dplyr':
    
        combine
    
    trying URL 'http://biogeo.ucdavis.edu/data/gadm2.8/rds/PHL_adm0.rds'
    Content type 'text/html; charset=iso-8859-1' length 3439625 bytes (3.3 MB)
    ==================================================
    downloaded 3.3 MB
    
    trying URL 'http://biogeo.ucdavis.edu/data/gadm2.8/rds/PHL_adm1.rds'
    Content type 'text/html; charset=iso-8859-1' length 3687395 bytes (3.5 MB)
    ==================================================
    downloaded 3.5 MB
    
    Quitting from lines 145-167 (Specified_stations_for_a_range_of_years.Rmd) 
    Error: processing vignette 'Specified_stations_for_a_range_of_years.Rmd' failed with diagnostics:
    Got a 530 ftp-server response when 220 was expected
    Execution halted
    ```

# gutenbergr

Version: 0.1.3

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

Version: 1.11.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pxweb’
    ```

# HTSSIP

Version: 1.3.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 57 SKIPPED: 23 FAILED: 11
      1. Error: Beta diversity from a list of phyloseq objects (@test-BD_ordinations.R#2) 
      2. Error: Beta diversity from a list of phyloseq objects (parallel) (@test-BD_ordinations.R#9) 
      3. Error: phyloseq sim (@test-HTSSIP_sim.R#59) 
      4. Error: phyloseq sim w/ metadata (@test-HTSSIP_sim.R#75) 
      5. Error: phyloseq sample_data can be converted to dataframe (@test-Util.R#10) 
      6. Error: phyloseq tax_table can be converted to dataframe (@test-Util.R#18) 
      7. Error: phyloseq otu_table can be converted to dataframe (@test-Util.R#25) 
      8. Error: phyloseq-rep sample_data can be converted to dataframe (@test-Util.R#35) 
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
        data   4.4Mb
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
      installed size is  7.5Mb
      sub-directories of 1Mb or more:
        data   7.3Mb
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

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: swap
    > 
    > ### ** Examples
    > 
    > if (require(tidyr)) {
    +   Sleep2 <- sleep %>% spread( key=group, val=extra )
    +   names(Sleep2) <- c("subject", "drug1", "drug2")
    +   swap(Sleep2, drug1 ~ drug2)
    +   mean( ~(drug1 - drug2), data=Sleep2)
    +   do(3) * mean( ~(drug1 - drug2), data=Sleep2 %>% swap(drug1 ~ drug2) ) 
    + } 
    Loading required package: tidyr
    
    Attaching package: ‘tidyr’
    
    The following object is masked from ‘package:Matrix’:
    
        expand
    
    Error: Can't use matrix or array for column indexing
    Execution halted
    ```

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
      installed size is  8.7Mb
      sub-directories of 1Mb or more:
        data   8.4Mb
    ```

# nmfem

Version: 1.0.0

## Newly broken

*   checking examples ... WARNING
    ```
    Found the following significant warnings:
    
      Warning: Setting row names on a tibble is deprecated.
      Warning: Setting row names on a tibble is deprecated.
      Warning: Setting row names on a tibble is deprecated.
    Deprecated functions may be defunct as soon as of the next release of
    R.
    See ?Deprecated.
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

# PKNCA

Version: 0.8.4

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(PKNCA)
      > 
      > test_check("PKNCA")
      ── 1. Failure: PKNCAresults generation (@test-class-PKNCAresults.R#63)  ────────
      as.data.frame(myresult, out.format = "wide") not equal to tidyr::spread_(verify.result, "PPTESTCD", "PPORRES").
      Incompatible type for column `ID`: x integer, y numeric
      Conversion of PKNCAresults to a data.frame in wide format (specifying wide format)
      
      Provenance hash a generated on b with c.
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1189 SKIPPED: 2 FAILED: 1
      1. Failure: PKNCAresults generation (@test-class-PKNCAresults.R#63) 
      
      Error: testthat unit tests failed
      Execution halted
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

Version: 0.2.0

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 5 marked UTF-8 strings
    ```

# psycho

Version: 0.0.2

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

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
    ```

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

# rcongresso

Version: 0.3.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      x[4]: "id_votacao"
      y[4]: "partido"
      
      ── 2. Failure: Campos do dataframe (@test_votacoes.R#75)  ──────────────────────
      sapply(votos_partidos_pec241, class) not equal to `tipos_votos_partidos_pec241`.
      Names: 4 string mismatches
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 65 SKIPPED: 0 FAILED: 2
      1. Failure: Atributos do dataframe (@test_votacoes.R#66) 
      2. Failure: Campos do dataframe (@test_votacoes.R#75) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rcv

Version: 0.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rcv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: make_d3list
    > ### Title: Creates a data frame for use with the networkD3 package
    > ### Aliases: make_d3list
    > 
    > ### ** Examples
    > 
    > make_d3list(results = sf_7_results)
    Error in match.names(clabs, names(xi)) : 
      names do not match previous names
    Calls: make_d3list -> rbind -> rbind -> match.names
    Execution halted
    ```

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

Version: 2.1.0

## In both

*   checking whether package ‘Seurat’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘cowplot’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/Seurat/new/Seurat.Rcheck/00install.out’ for details.
    ```

# sf

Version: 0.6-0

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Assertion failed: (0), function query, file ../../../../src/geos-3.6.1/src/index/strtree/AbstractSTRtree.cpp, line 287.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 14.4Mb
      sub-directories of 1Mb or more:
        doc     10.1Mb
        sqlite   1.5Mb
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

# sjPlot

Version: 2.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ##D # labels and expected values
    > ##D sjt.xtab(efc$e16sex, efc$e42dep, var.labels = c("Elder's gender",
    > ##D          "Elder's dependency"), value.labels = list(efc.labels[['e16sex']],
    > ##D          efc.labels[['e42dep']]), show.exp = TRUE)
    > ##D 
    > ##D # print minimal cross table with labels, total col/row highlighted
    > ##D sjt.xtab(efc$e16sex, efc$e42dep, show.cell.prc = FALSE, emph.total = TRUE)
    > ##D 
    > ##D # User defined style sheet
    > ##D sjt.xtab(efc$e16sex, efc$e42dep,
    > ##D          CSS = list(css.table = "border: 2px solid;",
    > ##D                     css.tdata = "border: 1px solid;",
    > ##D                     css.horline = "border-bottom: double blue;"))
    > ## End(Not run)
    > 
    > # ordinal data, use Kendall's tau
    > sjt.xtab(efc$e42dep, efc$quol_5, statistics = "kendall")
    Error in sprintf("<span class=\"td_n\">%i</span>", tab[irow, icol]) : 
      unsupported type
    Calls: sjt.xtab -> sprintf
    Execution halted
    ```

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

Version: 0.13.0

## In both

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘sjPlot’, ‘MuMIn’, ‘piecewiseSEM’
    ```

# skimr

Version: 1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘knitr’
      All declared Imports should be used.
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

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    ✖ dplyr::first()           masks xts::first()
    ✖ lubridate::intersect()   masks base::intersect()
    ✖ dplyr::lag()             masks stats::lag()
    ✖ dplyr::last()            masks xts::last()
    ✖ lubridate::setdiff()     masks base::setdiff()
    ✖ lubridate::union()       masks base::union()
    
    Attaching package: 'tidyquant'
    
    The following object is masked from 'package:dplyr':
    
        as_tibble
    
    The following object is masked from 'package:tibble':
    
        as_tibble
    
    Quitting from lines 68-76 (SW00_Introduction_to_sweep.Rmd) 
    Error: processing vignette 'SW00_Introduction_to_sweep.Rmd' failed with diagnostics:
    ggplot2 doesn't know how to deal with data of class logical
    Execution halted
    ```

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

# syuzhet

Version: 1.0.4

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        R         1.5Mb
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

# tidyhydat

Version: 0.3.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 7 marked UTF-8 strings
    ```

# tidyquant

Version: 0.5.3

## In both

*   checking examples ... ERROR
    ```
    ...
     6 2016-01-11  97.9  98.6  95.4  97.5 29873100     97.5  NA  
     7 2016-01-12  99.0 100.0  97.6  99.4 28395400     99.4  NA  
     8 2016-01-13 101   101    95.2  95.4 33410600     95.4  NA  
     9 2016-01-14  95.8  98.9  92.4  98.4 48658600     98.4  NA  
    10 2016-01-15  94.0  96.4  93.5  95.0 46132800     95.0  95.0
    # ... with 242 more rows
    > 
    > # Example 3: Using tq_mutate to work with non-OHLC data
    > tq_get("DCOILWTICO", get = "economic.data") %>%
    +     tq_mutate(select = price, mutate_fun = lag.xts, k = 1, na.pad = TRUE)
    Warning: x = 'DCOILWTICO', get = 'economic.data': Error: Failed to download file. Error message:
    cannot open URL 'https://fred.stlouisfed.org/series/DCOILWTICO/downloaddata/DCOILWTICO.csv'
    If this is related to https, possible solutions are:
    1. Explicitly pass method= via the getSymbols call (or via setDefaults)
    2. Install downloader, which may be able to automagically determine a method
    3. Set the download.file.method global option
    
    Error in tq_mutate_.default(data = data, select = lazyeval::expr_text(select),  : 
      data must be a tibble or data.frame object
    Calls: %>% ... <Anonymous> -> tq_mutate -> tq_mutate_ -> tq_mutate_.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 147 SKIPPED: 2 FAILED: 9
      1. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_economic_data.R#20) 
      2. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_economic_data.R#21) 
      3. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_economic_data.R#25) 
      4. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_economic_data.R#27) 
      5. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#15) 
      6. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#17) 
      7. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#19) 
      8. Error: Test error on invalid data inputs. (@test_tq_mutate.R#142) 
      9. Error: Test error on invalid data inputs. (@test_tq_transmute.R#121) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘quantmod’ was built under R version 3.4.3
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

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    ✖ dplyr::first()           masks xts::first()
    ✖ lubridate::intersect()   masks base::intersect()
    ✖ dplyr::lag()             masks stats::lag()
    ✖ dplyr::last()            masks xts::last()
    ✖ lubridate::setdiff()     masks base::setdiff()
    ✖ lubridate::union()       masks base::union()
    
    Attaching package: 'tidyquant'
    
    The following object is masked from 'package:dplyr':
    
        as_tibble
    
    The following object is masked from 'package:tibble':
    
        as_tibble
    
    Quitting from lines 57-64 (TK00_Time_Series_Coercion.Rmd) 
    Error: processing vignette 'TK00_Time_Series_Coercion.Rmd' failed with diagnostics:
    no applicable method for 'rename_' applied to an object of class "logical"
    Execution halted
    ```

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

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Importing 2D-TPP dataset: X020471
    Warning in function_list[[k]](value) : NAs introduced by coercion
    Warning in function_list[[k]](value) : NAs introduced by coercion
    Warning in function_list[[k]](value) : NAs introduced by coercion
    Warning in function_list[[k]](value) : NAs introduced by coercion
    Warning in function_list[[k]](value) : NAs introduced by coercion
    Removing duplicate identifiers using quality column 'qupm'...
    261 out of 261 rows kept for further analysis.
    Reformating data for input into function 'analyzeTPPCCR' ...
    Done.
    No output directory specified. No result files or plots will be produced.
    Looking for intensity column prefix: 'sumionarea_protein_'
    Computing fold changes...
    Done.
    Found the following column name in attr(data, 'importSettings')$proteinIdCol: 'representative'
    Found the following column name in attr(data, 'importSettings')$fcStr: 'rel_fc_protein_'
    Performing median normalization per temperature...
    Error in slice_impl(.data, dots) : 
      slice condition does not evaluate to an integer or numeric vector. 
    Calls: analyze2DTPP ... <Anonymous> -> slice.data.frame -> slice_impl -> .Call
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      [[1]]
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 13552 SKIPPED: 1 FAILED: 7
      1. Error: allOK (@test_analyze2DTPP.R#14) 
      2. Error: allOK_scientific_drug_concentration_format (@test_analyze2DTPP.R#37) 
      3. Error: warning_deprecated_fct_arg (@test_analyze2DTPP.R#62) 
      4. Error: all_ok1 (@test_tpp2dNormalize.R#14) 
      5. Failure: all_ok2 (@test_tpp2dNormalize.R#24) 
      6. Failure: all_ok2_different_sorting (@test_tpp2dNormalize.R#33) 
      7. Failure: all_ok2_scientificFotma (@test_tpp2dNormalize.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Removing duplicate identifiers using quality column 'qupm'...
    306 out of 306 rows kept for further analysis.
    Importing 2D-TPP dataset: X020471
    Removing duplicate identifiers using quality column 'qupm'...
    261 out of 261 rows kept for further analysis.
    Importing 2D-TPP dataset: X020471
    Removing duplicate identifiers using quality column 'qupm'...
    261 out of 261 rows kept for further analysis.
    Reformating data for input into function 'analyzeTPPCCR' ...
    Done.
    No output directory specified. No result files or plots will be produced.
    Looking for intensity column prefix: 'sumionarea_protein_'
    Computing fold changes...
    Done.
    Found the following column name in attr(data, 'importSettings')$proteinIdCol: 'representative'
    Found the following column name in attr(data, 'importSettings')$fcStr: 'rel_fc_protein_'
    Performing median normalization per temperature...
    Quitting from lines 143-154 (TPP_introduction_2D.Rnw) 
    Error: processing vignette 'TPP_introduction_2D.Rnw' failed with diagnostics:
    slice condition does not evaluate to an integer or numeric vector. 
    Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    

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

# WRTDStidal

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘WRTDStidal-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fitplot
    > ### Title: Plot the fitted results for a tidal object
    > ### Aliases: fitplot fitplot.tidal fitplot.tidalmean
    > 
    > ### ** Examples
    > 
    > 
    > ## load a fitted tidal object
    > data(tidfit)
    > 
    > # plot using defaults
    > fitplot(tidfit)
    Error: Columns `fit0.1`, `fit0.5`, `fit0.9`, `res` must be length 1 or 840, not 120, 120, 120, 120
    Execution halted
    ```

# xpose

Version: 0.4.0

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: compare.default(act$val, exp$val)
      4: all.equal(x, y, ...)
      5: all.equal.tbl_df(x, y, ...)
      6: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, 
             convert = convert)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 525 SKIPPED: 0 FAILED: 4
      1. Failure: Check list_data returns a proper message (@test-console_outputs.R#43) 
      2. Failure: Check list_files returns a proper message (@test-console_outputs.R#47) 
      3. Failure: Check list_special returns a proper message (@test-console_outputs.R#51) 
      4. Error: vpc_data works properly with xpdb tables (@test-vpc.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘gridExtra’
      All declared Imports should be used.
    ```

# zFactor

Version: 0.1.7

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rootSolve’
      All declared Imports should be used.
    ```

