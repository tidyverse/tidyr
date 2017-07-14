# bootnet

Version: 1.0.0

## Newly broken

*   checking whether package ‘bootnet’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/bootnet/new/bootnet.Rcheck/00install.out’ for details.
    ```

# cdata

Version: 0.1.5

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cdata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: moveValuesToRows
    > ### Title: Move values from columns to rows (wrapper for 'tidyr::gather',
    > ###   or anti-pivot).
    > ### Aliases: moveValuesToRows
    > 
    > ### ** Examples
    > 
    > 
    > d <- data.frame(AUC= 0.6, R2= 0.2)
    > moveValuesToRows(d,
    +                  nameForNewKeyColumn= 'meas',
    +                  nameForNewValueColumn= 'val',
    +                  columnsToTakeFrom= c('AUC', 'R2'))
    Error: Variable context not set
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 284-292 (RowsAndColumns.Rmd) 
    Error: processing vignette 'RowsAndColumns.Rmd' failed with diagnostics:
    Variable context not set
    Execution halted
    ```

# corrr

Version: 0.2.1

## Newly broken

*   checking whether package ‘corrr’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/corrr/new/corrr.Rcheck/00install.out’ for details.
    ```

# d3r

Version: 0.6.6

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Warning: package ‘dplyr’ was built under R version 3.4.1
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > titanic_df <- data.frame(Titanic)
    > tit_tb <- titanic_df %>%
    +   select(Class,Age,Survived,Sex,Freq) %>%
    +   d3_nest(value_cols="Freq", root="titanic")
    Error in overscope_eval_next(overscope, expr) : 
      object 'children' not found
    Calls: %>% ... map -> lapply -> FUN -> overscope_eval_next -> .Call
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Packages which this enhances but not available for checking:
      ‘igraph’ ‘partykit’ ‘treemap’ ‘V8’
    ```

# fuzzyjoin

Version: 0.1.3

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > x1 <- data_frame(id1 = 1:4,
    +                  chromosome = c("chr1", "chr1", "chr2", "chr2"),
    +                  start = c(100, 200, 300, 400),
    +                  end = c(150, 250, 350, 450))
    > 
    > x2 <- data_frame(id2 = 1:4,
    +                  chromosome = c("chr1", "chr2", "chr2", "chr1"),
    +                  start = c(140, 210, 400, 300),
    +                  end = c(160, 240, 415, 320))
    > 
    > # note that the the third and fourth items don't join (even though
    > # 300-350 and 300-320 overlap) since the chromosomes are different:
    > genome_inner_join(x1, x2, by = c("chromosome", "start", "end"))
    Error in overscope_eval_next(overscope, expr) : object 'x_data' not found
    Calls: genome_inner_join ... map -> lapply -> FUN -> overscope_eval_next -> .Call
    Execution halted
    ```

# ggfortify

Version: 0.4.1

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following object is masked from 'package:dlm':
    
        bdiag
    
    Loading required package: foreach
    Loaded glmnet 2.0-10
    
    Loading required package: maps
    
    Attaching package: 'maps'
    
    The following object is masked from 'package:cluster':
    
        votes.repub
    
    Quitting from lines 138-139 (plot_pca.Rmd) 
    Error: processing vignette 'plot_pca.Rmd' failed with diagnostics:
    <text>:1:6: unexpected symbol
    1: Hook of
             ^
    Execution halted
    ```

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

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        doc   5.0Mb
    ```

# ggmcmc

Version: 1.1

## Newly broken

*   checking whether package ‘ggmcmc’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/ggmcmc/new/ggmcmc.Rcheck/00install.out’ for details.
    ```

# HTSSIP

Version: 1.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘HTSSIP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: phyloseq2table
    > ### Title: Phyloseq conversion to a ggplot-formatted table
    > ### Aliases: phyloseq2table
    > 
    > ### ** Examples
    > 
    > data(physeq_S2D1)
    > # Including some columns from sample metadata
    > df_OTU = phyloseq2table(physeq_S2D1,
    +                         include_sample_data=TRUE,
    +                         sample_col_keep=c('Buoyant_density', 'Substrate', 'Day'))
    Error in parse(text = x) : <text>:1:3: unexpected symbol
    1: 12C
          ^
    Calls: phyloseq2table ... eval_bare -> .Call -> parse_expr -> parse_exprs -> parse
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
    Quitting from lines 102-106 (qSIP.Rmd) 
    Error: processing vignette 'qSIP.Rmd' failed with diagnostics:
    <text>:1:3: unexpected symbol
    1: 12C
          ^
    Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    ```
    ```

# lans2r

Version: 1.0.5

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: package 'dplyr' was built under R version 3.4.1
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 40-56 (lans2r-calculate.Rmd) 
    Error: processing vignette 'lans2r-calculate.Rmd' failed with diagnostics:
    non-numeric argument to binary operator
    Execution halted
    ```

# mafs

Version: 0.0.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mafs-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gg_fit
    > ### Title: Graphical results of forecast models
    > ### Aliases: gg_fit
    > 
    > ### ** Examples
    > 
    > gg_fit(AirPassengers, 12, "snaive")
    Error in parse(text = x) : <text>:1:10: unexpected symbol
    1: Original Series
                 ^
    Calls: gg_fit ... eval_bare -> .Call -> parse_expr -> parse_exprs -> parse
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rcpp’ ‘cmprsk’ ‘colorspace’ ‘etm’ ‘fracdiff’ ‘gtable’ ‘munsell’
      ‘numDeriv’ ‘plyr’ ‘quadprog’ ‘scales’ ‘timeDate’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# mosaic

Version: 0.14.4

## Newly broken

*   checking whether package ‘mosaic’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/mosaic/new/mosaic.Rcheck/00install.out’ for details.
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘manipulate’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  9.2Mb
      sub-directories of 1Mb or more:
        R     1.8Mb
        doc   6.8Mb
    ```

*   checking R code for possible problems ... NOTE
    ```
    mMap: no visible binding for global variable ‘facet’
    mScatter: no visible binding for global variable ‘facet’
    mUniplot: no visible binding for global variable ‘facet’
    Undefined global functions or variables:
      facet
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cubature’
    ```

# mtconnectR

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: map_gcode_mtc
    > ### Title: Create a mapping between simulated and actual data
    > ### Aliases: map_gcode_mtc
    > 
    > ### ** Examples
    > 
    > data("example_gcode_parsed") # Parsed gcode
    > data("example_mtc_device_3") # MTCDevice object of actual log data
    > simulated_gcode_data = na.omit(simulate_data_from_gcode(example_gcode_parsed, 
    + start_time = 0, data_res = 0.1, data_type = "HH"))
    > mtc_device_sim = create_mtc_device_from_ts(simulated_gcode_data)
    > mtc_sim_mapped = map_gcode_mtc(mtc_device_sim, example_mtc_device_3, elasticity = 200)
    Using the following mapping: 
      sim_name                                                 mtc_name
    1    x_pos nist_testbed_GF_Agie_1<Device>:path_pos_x<PATH_POSITION>
    2    y_pos nist_testbed_GF_Agie_1<Device>:path_pos_y<PATH_POSITION>
    3    z_pos nist_testbed_GF_Agie_1<Device>:path_pos_z<PATH_POSITION>
    Error: Variable context not set
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 102-107 (simulate_map_gcode.Rmd) 
    Error: processing vignette 'simulate_map_gcode.Rmd' failed with diagnostics:
    Variable context not set
    Execution halted
    ```

# neuropsychology

Version: 0.5.0

## Newly broken

*   checking whether package ‘neuropsychology’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/neuropsychology/new/neuropsychology.Rcheck/00install.out’ for details.
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘htmlTable’ ‘lme4’ ‘stringi’
      All declared Imports should be used.
    ```

# radiant.basics

Version: 0.8.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘radiant.basics-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.cross_tabs
    > ### Title: Plot method for the cross_tabs function
    > ### Aliases: plot.cross_tabs
    > 
    > ### ** Examples
    > 
    > result <- cross_tabs("newspaper", "Income", "Newspaper")
    > plot(result, check = c("observed","expected","chi_sq"))
    Error in parse(text = x) : <text>:1:4: unexpected symbol
    1: WS Journal
           ^
    Calls: plot ... _fseq -> freduce -> withVisible -> <Anonymous> -> sshhr
    Execution halted
    ```

*   checking whether package ‘radiant.basics’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/radiant.basics/new/radiant.basics.Rcheck/00install.out’ for details.
    ```

# radiant.data

Version: 0.8.1

## Newly broken

*   checking whether package ‘radiant.data’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/radiant.data/new/radiant.data.Rcheck/00install.out’ for details.
    ```

# radiant.model

Version: 0.8.0

## Newly broken

*   checking whether package ‘radiant.model’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/radiant.model/new/radiant.model.Rcheck/00install.out’ for details.
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# rprev

Version: 0.2.3

## Newly broken

*   R CMD check timed out
    ```
    ```

# rtdists

Version: 0.7-3

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Loading required package: tidyr
    Loading required package: purrr
    
    Attaching package: 'purrr'
    
    The following objects are masked from 'package:dplyr':
    
        contains, order_by
    
    Loading required package: lattice
    Loading required package: latticeExtra
    Loading required package: RColorBrewer
    Loading required package: binom
    Quitting from lines 374-396 (reanalysis_rr98.Rmd) 
    Error: processing vignette 'reanalysis_rr98.Rmd' failed with diagnostics:
    Variable context not set
    Execution halted
    ```

# sfc

Version: 0.1.0

## Newly broken

*   checking whether package ‘sfc’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/sfc/new/sfc.Rcheck/00install.out’ for details.
    ```

# shazam

Version: 0.1.8

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Loading required package: ggplot2
    Quitting from lines 282-285 (Baseline-Vignette.Rmd) 
    Error: processing vignette 'Baseline-Vignette.Rmd' failed with diagnostics:
    `-0.98`, `-0.969999999999999`, `-0.960000000000001`, `-0.949999999999999`, `-0.940000000000001`, ... must resolve to integer column positions, not a double vector
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2 marked UTF-8 strings
    ```

# simglm

Version: 0.5.0

## Newly broken

*   checking whether package ‘simglm’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/simglm/new/simglm.Rcheck/00install.out’ for details.
    ```

# textreuse

Version: 0.1.4

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘textreuse-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: lsh
    > ### Title: Locality sensitive hashing for minhash
    > ### Aliases: lsh
    > 
    > ### ** Examples
    > 
    > dir <- system.file("extdata/legal", package = "textreuse")
    > minhash <- minhash_generator(200, seed = 235)
    > corpus <- TextReuseCorpus(dir = dir,
    +                           tokenizer = tokenize_ngrams, n = 5,
    +                           minhash_func = minhash)
    > buckets <- lsh(corpus, bands = 50)
    Error in overscope_eval_next(overscope, expr) : object 'ca1851' not found
    Calls: lsh ... map -> lapply -> FUN -> overscope_eval_next -> .Call
    Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘tm’
    ```

# tidygenomics

Version: 0.1.0

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
    Error in overscope_eval_next(overscope, expr) : object 'x_data' not found
    Calls: genome_complement ... map -> lapply -> FUN -> overscope_eval_next -> .Call
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning: package 'dplyr' was built under R version 3.4.1
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 55-66 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    object 'x_data' not found
    Execution halted
    ```

# tidyverse

Version: 1.1.1

## Newly broken

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

# tigger

Version: 0.2.10

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tigger-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: getPopularMutationCount
    > ### Title: Find Frequent Sequences' Mutation Counts
    > ### Aliases: getPopularMutationCount
    > 
    > ### ** Examples
    > 
    > data(sample_db, germline_ighv)
    > getPopularMutationCount(sample_db, germline_ighv)
    Error in grouped_df_impl(data, unname(vars), drop) : 
      Value of SET_STRING_ELT() must be a 'CHARSXP' not a 'NULL'
    Calls: getPopularMutationCount ... group_by.data.frame -> grouped_df -> grouped_df_impl -> .Call
    Execution halted
    ```

## Newly fixed

*   R CMD check timed out
    ```
    ```

# visdat

Version: 0.1.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 58-61 (using_visdat.Rmd) 
    Error: processing vignette 'using_visdat.Rmd' failed with diagnostics:
    could not find function "Height"
    Execution halted
    ```

# VWPre

Version: 0.9.6

## Newly broken

*   checking whether package ‘VWPre’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘dplyr’ was built under R version 3.4.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/VWPre/new/VWPre.Rcheck/00install.out’ for details.
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
    Error: Variable context not set
    Execution halted
    ```

