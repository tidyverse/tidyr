# curatedMetagenomicData

Version: 1.2.0

## Newly broken

*   R CMD check timed out
    ```
    ```

## Newly fixed

*   checking examples ... ERROR
    ```
    Running examples in ‘curatedMetagenomicData-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ExpressionSet2MRexperiment
    > ### Title: Convert an ExpressionSet object to a
    > ###   metagenomeSeq::MRexperiment-class object
    > ### Aliases: ExpressionSet2MRexperiment
    > 
    > ### ** Examples
    > 
    > eset <- LomanNJ_2013_Mi.metaphlan_bugs_list.stool()
    updating metadata: retrieving 1 resource
    snapshotDate(): 2016-10-01
    Error in readRDS(.db_index_file(x)) : error reading from connection
    Calls: LomanNJ_2013_Mi.metaphlan_bugs_list.stool ... query -> query -> .local -> .db_index_load -> readRDS
    Execution halted
    ```

## In both

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

# docxtools

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > set.seed(20161221)
    > n <- 5
    > a <- sample(letters, n)
    > b <- sample(letters, n)
    > w <- runif(n, min =  -5, max =  50) * 1e+5
    > y <- runif(n, min = -25, max =  40) / 1e+3
    > z <- runif(n, min =  -5, max = 100)
    > x <- data.frame(z, b, y, a, w, stringsAsFactors = FALSE)
    > 
    > # format different objects
    > print(x)
              z b            y a         w
    1  6.501440 c  0.001051893 q 2846529.3
    2 28.374092 o  0.000347614 y 4874357.1
    3 -3.849624 i  0.004599897 g -111651.4
    4 44.500979 a -0.003045062 a 1314715.7
    5 92.411835 x -0.001069473 i  417385.0
    > format_engr(x)
    Error in FUN(X[[i]], ...) : object 'm_numeric_cols' not found
    Calls: format_engr ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 63-64 (numbers-in-engineering-format.Rmd) 
    Error: processing vignette 'numbers-in-engineering-format.Rmd' failed with diagnostics:
    object 'm_numeric_cols' not found
    Execution halted
    ```

# ggtree

Version: 1.8.1

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following object is masked from 'package:IRanges':
    
        collapse
    
    The following object is masked from 'package:S4Vectors':
    
        expand
    
    The following object is masked from 'package:ape':
    
        rotate
    
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Warning: The plyr::rename operation has created duplicates for the following name(s): (`size`)
    Warning: Ignoring unknown aesthetics: x, y
    Warning: Ignoring unknown aesthetics: x, y
    Quitting from lines 99-115 (advanceTreeAnnotation.Rmd) 
    Error: processing vignette 'advanceTreeAnnotation.Rmd' failed with diagnostics:
    object 'cols' not found
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        doc        6.8Mb
        examples   3.7Mb
    ```

# LBSPR

Version: 0.1.1

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 233-234 (LBSPR.Rmd) 
    Error: processing vignette 'LBSPR.Rmd' failed with diagnostics:
    could not find function "ncol"
    Execution halted
    ```

# mosaicCore

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
       mean_hp trimmed_mean median_hp range_hp_1 range_hp_2 Q_25% Q_75%
    1 146.6875     141.1923       123         52        335  96.5   180
    > # force names to by syntactically valid
    > df_stats( ~ hp, data = mtcars, Q = quantile(c(0.25, 0.75)), nice_names = TRUE)
      Q_25. Q_75.
    1  96.5   180
    > # shorter names
    > df_stats( ~ hp, data = mtcars, mean, trimmed_mean = mean(trim = 0.1), "median", range,
    +   long_names = FALSE)
          mean trimmed_mean median range_1 range_2
    1 146.6875     141.1923    123      52     335
    > # wide vs long format
    > df_stats( hp ~ cyl, data = mtcars, mean, median, range)
      cyl   mean_hp median_hp range_hp_1 range_hp_2
    1   4  82.63636      91.0         52        113
    2   6 122.28571     110.0        105        175
    3   8 209.21429     192.5        150        335
    > df_stats( hp ~ cyl, data = mtcars, mean, median, range, format = "long")
    Error in FUN(X[[i]], ...) : object 'd' not found
    Calls: df_stats ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

# R6Frame

Version: 0.1.0

## Newly broken

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

# radiant.data

Version: 0.8.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘radiant.data-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dtab.explore
    > ### Title: Make a tabel of summary statistics in DT
    > ### Aliases: dtab.explore
    > 
    > ### ** Examples
    > 
    > tab <- explore("diamonds", "price:x") %>% dtab
    > tab <- explore("diamonds", "price", byvar = "cut", fun = c("length", "skew"), top = "byvar") %>%
    +   dtab
    Error in length(byvar) : could not find function "length"
    Calls: %>% ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

# rcv

Version: 0.2.0

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
    Error in ncol(results) : could not find function "ncol"
    Calls: make_d3list ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘forcats’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6543 marked UTF-8 strings
    ```

# sjPlot

Version: 2.3.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sjPlot-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: set_theme
    > ### Title: Set default theme for sjp-functions
    > ### Aliases: set_theme
    > 
    > ### ** Examples
    > 
    > library(sjmisc)
    > data(efc)
    > 
    > # of the ggplot base theme
    > set_theme("539")
    > sjp.xtab(efc$e42dep, efc$e16sex)
    Warning: This function will be removed in future versions of sjmisc and has been moved to package 'sjlabelled'. Please use sjlabelled::get_label() instead.
    Warning: This function will be removed in future versions of sjmisc and has been moved to package 'sjlabelled'. Please use sjlabelled::get_label() instead.
    Error in grpcount + 1 : could not find function "+"
    Calls: sjp.xtab ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Warning: This function will be removed in future versions of sjmisc and has been moved to package 'sjlabelled'. Please use sjlabelled::get_label() instead.
    Warning: This function will be removed in future versions of sjmisc and has been moved to package 'sjlabelled'. Please use sjlabelled::get_label() instead.
    Quitting from lines 22-28 (blackwhitefigures.Rmd) 
    Error: processing vignette 'blackwhitefigures.Rmd' failed with diagnostics:
    could not find function "+"
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Missing object imported by a ':::' call: ‘sjstats:::lm_pval_fstat’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plm’
    ```

# WRTDStidal

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘WRTDStidal-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: dynaplot
    > ### Title: Plot model response to salinity or flow as a lineplot for all
    > ###   months
    > ### Aliases: dynaplot dynaplot.tidal dynaplot.tidalmean
    > 
    > ### ** Examples
    > 
    > 
    > # load a fitted tidal object
    > data(tidfit)
    > 
    > # plot using defaults, 
    > # defaults to the fiftieth quantile for all years
    > dynaplot(tidfit)
    Error in ncol(to_plo) : could not find function "ncol"
    Calls: dynaplot ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

# zFactor

Version: 0.1.6

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ## calculate for one Tpr curve at a Ppr
    > z.DranchukPurvisRobinson(pres.pr = 1.5, temp.pr = 2.0)
    [1] 0.9546382
    > 
    > ## For vectors of Ppr and Tpr:
    > ppr <- c(0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5)
    > tpr <- c(1.3, 1.5, 1.7, 2)
    > z.DranchukPurvisRobinson(pres.pr = ppr, temp.pr = tpr)
              0.5       1.5       2.5       3.5       4.5       5.5       6.5
    1.3 0.9197157 0.7525940 0.6366665 0.6337883 0.6891997 0.7650171 0.8480804
    1.5 0.9504834 0.8583491 0.7926325 0.7720713 0.7914322 0.8348883 0.8915239
    1.7 0.9677844 0.9121791 0.8752677 0.8630002 0.8743271 0.9033216 0.9440582
    2   0.9822021 0.9546382 0.9399310 0.9391490 0.9512966 0.9740256 1.0047347
    > 
    > ## create a matrix of z values
    > tpr2 <- c(1.05, 1.1, 1.2, 1.3)
    > ppr2 <- c(0.5, 1.0, 1.5, 2, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5)
    > sk_corr_2 <- createTidyFromMatrix(ppr2, tpr2, correlation = "DPR")
    Error in ncol(sk_df) : could not find function "ncol"
    Calls: createTidyFromMatrix ... <Anonymous> -> map_if -> map -> lapply -> FUN -> .Call
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘rootSolve’ ‘tibble’
      All declared Imports should be used.
    ```

