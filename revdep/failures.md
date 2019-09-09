# BgeeDB

<details>

* Version: 2.10.0
* Source code: https://github.com/cran/BgeeDB
* URL: https://github.com/BgeeDB/BgeeDB_R
* BugReports: https://github.com/BgeeDB/BgeeDB_R/issues
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 65

Run `revdep_details(,"BgeeDB")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether package ‘BgeeDB’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘AnnotationDbi’ was built under R version 3.6.1
      Warning: package ‘IRanges’ was built under R version 3.6.1
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/BgeeDB/new/BgeeDB.Rcheck/00install.out’ for details.
    ```

*   checking top-level files ... NOTE
    ```
    File
      LICENSE
    is not mentioned in the DESCRIPTION file.
    ```

# circumplex

<details>

* Version: 0.3.2
* Source code: https://github.com/cran/circumplex
* URL: https://github.com/jmgirard/circumplex
* BugReports: https://github.com/jmgirard/circumplex/issues
* Date/Publication: 2019-08-21 17:50:02 UTC
* Number of recursive dependencies: 94

Run `revdep_details(,"circumplex")` for more info

</details>

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
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/circumplex/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/circumplex/new/circumplex.Rcheck/circumplex’

```
### CRAN

```
* installing *source* package ‘circumplex’ ...
** package ‘circumplex’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/circumplex/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘circumplex’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/circumplex/old/circumplex.Rcheck/circumplex’

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

# colorednoise

<details>

* Version: 1.0.4
* Source code: https://github.com/cran/colorednoise
* BugReports: http://github.com/japilo/colorednoise/issues
* Date/Publication: 2019-01-23 12:50:14 UTC
* Number of recursive dependencies: 78

Run `revdep_details(,"colorednoise")` for more info

</details>

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
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/colorednoise/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/colorednoise/new/colorednoise.Rcheck/colorednoise’

```
### CRAN

```
* installing *source* package ‘colorednoise’ ...
** package ‘colorednoise’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/colorednoise/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘colorednoise’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/colorednoise/old/colorednoise.Rcheck/colorednoise’

```
# dexter

<details>

* Version: 1.0.0
* Source code: https://github.com/cran/dexter
* URL: http://dexterities.netlify.com
* BugReports: https://github.com/jessekps/dexter/issues
* Date/Publication: 2019-08-22 12:30:02 UTC
* Number of recursive dependencies: 67

Run `revdep_details(,"dexter")` for more info

</details>

## In both

*   checking whether package ‘dexter’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dexter/new/dexter.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘dexter’ ...
** package ‘dexter’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dexter/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dexter’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dexter/new/dexter.Rcheck/dexter’

```
### CRAN

```
* installing *source* package ‘dexter’ ...
** package ‘dexter’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dexter/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dexter’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dexter/old/dexter.Rcheck/dexter’

```
# dynfrail

<details>

* Version: 0.5.2
* Source code: https://github.com/cran/dynfrail
* Date/Publication: 2017-10-30 10:11:49 UTC
* Number of recursive dependencies: 62

Run `revdep_details(,"dynfrail")` for more info

</details>

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
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dynfrail/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dynfrail’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dynfrail/new/dynfrail.Rcheck/dynfrail’

```
### CRAN

```
* installing *source* package ‘dynfrail’ ...
** package ‘dynfrail’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
ccache clang++ -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/dynfrail/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘dynfrail’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/dynfrail/old/dynfrail.Rcheck/dynfrail’

```
# ELMER

<details>

* Version: 2.8.3
* Source code: https://github.com/cran/ELMER
* Date/Publication: 2019-09-06
* Number of recursive dependencies: 203

Run `revdep_details(,"ELMER")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    ...
    Identifying gene position for each probe
    
      |                                                                            
      |                                                                      |   0%
      |                                                                            
      |======================================================================| 100%Saving as: .//cg19403323.schematic.byProbe
    
    > schematic.plot(data,
    +                group.col = "definition",
    +                group1 = "Primary solid Tumor",
    +                group2 = "Solid Tissue Normal",
    +                pair = pair,
    +                byGeneID = "ENSG00000009790")
    
      |                                                                            
      |                                                                      |   0%
      |                                                                            
      |======================================================================| 100%Error in if (chromosome != "" & !(chromosome %in% seqlevels(x))) { : 
      the condition has length > 1
    Calls: schematic.plot
    Execution halted
    ```

*   R CMD check timed out
    

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: package or namespace load failed for ‘ELMER’:
     unable to load R code in package ‘circlize’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking Rd \usage sections ... WARNING
    ```
    ...
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 75.8Mb
      sub-directories of 1Mb or more:
        doc  75.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
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

# maEndToEnd

<details>

* Version: 
* Source code: ???
* URL: https://tidyr.tidyverse.org, https://github.com/tidyverse/tidyr
* BugReports: https://github.com/tidyverse/tidyr/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```

  There is a binary version available but the source version is later:
            binary source needs_compilation
matrixStats 0.54.0 0.55.0              TRUE

  Binaries will be installed


installing the source packages ‘hugene10sttranscriptcluster.db’, ‘pd.hugene.1.0.st.v1’, ‘reactome.db’



```
### CRAN

```

  There is a binary version available but the source version is later:
            binary source needs_compilation
matrixStats 0.54.0 0.55.0              TRUE

  Binaries will be installed


installing the source packages ‘hugene10sttranscriptcluster.db’, ‘pd.hugene.1.0.st.v1’, ‘reactome.db’



```
# MSstats

<details>

* Version: 3.16.2
* Source code: https://github.com/cran/MSstats
* URL: http://msstats.org
* BugReports: https://groups.google.com/forum/#!forum/msstats
* Date/Publication: 2019-08-16
* Number of recursive dependencies: 86

Run `revdep_details(,"MSstats")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether package ‘MSstats’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘MASS::select’ by ‘dplyr::select’ when loading ‘MSstats’
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/MSstats/new/MSstats.Rcheck/00install.out’ for details.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
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
      .resid ABUNDANCE FEATURE FRACTION INTENSITY Intensity LABEL Mean Name
      PEPTIDE PROTEIN PeptideSequence Protein ProteinName Protein_number
      RUN Selected_fragments Selected_peptides Train_size
      aggr_Fragment_Annotation aggr_Peak_Area analysis censored ciw
      cover_feature datafeature df_resid fea feature is_censored is_lowcvr
      is_obs is_olr label log2inty logFC min_obs missing.col nb_feature
      nb_full nb_obs nb_run ncount originalRUN ount peptide pi_obs protein
      resid_null residual rlm_fit run s_resid s_resid_eb shape svar_feature
      svar_ref var_feature var_resid_eb weight x y ymax ymin
    ```

# nlmixr

<details>

* Version: 1.1.1-2
* Source code: https://github.com/cran/nlmixr
* URL: https://github.com/nlmixrdevelopment/nlmixr
* Date/Publication: 2019-08-29 12:10:03 UTC
* Number of recursive dependencies: 165

Run `revdep_details(,"nlmixr")` for more info

</details>

## In both

*   checking whether package ‘nlmixr’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘nlmixr’ ...
** package ‘nlmixr’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... ccache clang -Qunused-arguments
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether ccache clang -Qunused-arguments accepts -g... yes
checking for ccache clang -Qunused-arguments option to accept ISO C89... none needed
checking for ccache clang -Qunused-arguments option to support OpenMP... unsupported
configure: creating ./config.status
config.status: creating src/Makevars
--------[begin src/Makevars]--------
# -*- mode: makefile-gmake -*-
ARMA=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`
BH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`
RCPP=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`
EG=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`
SH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`

CXX_STD     = CXX14


PKG_LIBS = $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)
PKG_CXXFLAGS = -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"$(BH)" -I"$(EG)" -I"$(SH)" -I"$(RCPP)" -I"$(ARMA)"
SHLIB_LDFLAGS = $(SHLIB_CXXLDFLAGS) 
SHLIB_LD = $(SHLIB_CXXLD)
SOURCES_C = jj.c jj.g.d_parser.c init.c rprintf.c merge3.c lbfgsR.c
SOURCES_CPP = neldermead.cpp slice.cpp RcppExportMod.cpp ode_cmt1.cpp RcppExports.cpp resid.cpp inner.cpp saem.cpp
OBJECTS = $(SOURCES_C:.c=.o) $(SOURCES_CPP:.cpp=.o)

all: $(SHLIB)
$(SHLIB): $(OBJECTS)

--------[end src/Makevars]--------
** libs
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c jj.c -o jj.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c jj.g.d_parser.c -o jj.g.d_parser.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c init.c -o init.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c rprintf.c -o rprintf.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c merge3.c -o merge3.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c lbfgsR.c -o lbfgsR.o
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c neldermead.cpp -o neldermead.o
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c slice.cpp -o slice.o
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c RcppExportMod.cpp -o RcppExportMod.o
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:535:
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
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c ode_cmt1.cpp -o ode_cmt1.o
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:535:
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
In file included from ode_cmt1.cpp:9:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat.hpp:292:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/prob/dirichlet_rng.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/random/gamma_distribution.hpp:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/random/exponential_distribution.hpp:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/random/detail/int_float_pair.hpp:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/random/detail/integer_log2.hpp:19:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/pending/integer_log2.hpp:7:1: warning: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead. [-W#pragma-messages]
BOOST_HEADER_DEPRECATED("<boost/integer/integer_log2.hpp>");
^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/config/header_deprecated.hpp:23:37: note: expanded from macro 'BOOST_HEADER_DEPRECATED'
# define BOOST_HEADER_DEPRECATED(a) BOOST_PRAGMA_MESSAGE("This header is deprecated. Use " a " instead.")
                                    ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include/boost/config/pragma_message.hpp:24:34: note: expanded from macro 'BOOST_PRAGMA_MESSAGE'
# define BOOST_PRAGMA_MESSAGE(x) _Pragma(BOOST_STRINGIZE(message(x)))
                                 ^
<scratch space>:54:2: note: expanded from here
 message("This header is deprecated. Use " "<boost/integer/integer_log2.hpp>" " instead.")
 ^
In file included from ode_cmt1.cpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core.hpp:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:14:13: warning: unused function 'set_zero_all_adjoints' [-Wunused-function]
static void set_zero_all_adjoints() {
            ^
In file included from ode_cmt1.cpp:9:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat.hpp:336:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/prob/poisson_log_glm_log.hpp:5:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/prob/poisson_log_glm_lpmf.hpp:64:59: warning: unused typedef 'T_alpha_val' [-Wunused-local-typedef]
      typename partials_return_type<T_alpha>::type>::type T_alpha_val;
                                                          ^
20 warnings generated.
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:535:
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
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c resid.cpp -o resid.o
In file included from resid.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppArmadillo/include/RcppArmadillo.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppArmadillo/include/RcppArmadilloForward.h:46:
In file included from /usr/local/include/armadillo:87:
/usr/local/include/armadillo_bits/include_hdf5.hpp:26:14: fatal error: '/usr/local/Cellar/hdf5/1.10.5_1/include/hdf5.h' file not found
    #include ARMA_INCFILE_WRAP(ARMA_HDF5_HEADER)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/include/armadillo_bits/compiler_setup.hpp:79:30: note: expanded from macro 'ARMA_INCFILE_WRAP'
#define ARMA_INCFILE_WRAP(x) <x>
                             ^~~
1 error generated.
make: *** [resid.o] Error 1
ERROR: compilation failed for package ‘nlmixr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/new/nlmixr.Rcheck/nlmixr’

```
### CRAN

```
* installing *source* package ‘nlmixr’ ...
** package ‘nlmixr’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... ccache clang -Qunused-arguments
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether ccache clang -Qunused-arguments accepts -g... yes
checking for ccache clang -Qunused-arguments option to accept ISO C89... none needed
checking for ccache clang -Qunused-arguments option to support OpenMP... unsupported
configure: creating ./config.status
config.status: creating src/Makevars
--------[begin src/Makevars]--------
# -*- mode: makefile-gmake -*-
ARMA=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`
BH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`
RCPP=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`
EG=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`
SH=`"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`

CXX_STD     = CXX14


PKG_LIBS = $(LAPACK_LIBS) $(BLAS_LIBS) $(FLIBS)
PKG_CXXFLAGS = -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"$(BH)" -I"$(EG)" -I"$(SH)" -I"$(RCPP)" -I"$(ARMA)"
SHLIB_LDFLAGS = $(SHLIB_CXXLDFLAGS) 
SHLIB_LD = $(SHLIB_CXXLD)
SOURCES_C = jj.c jj.g.d_parser.c init.c rprintf.c merge3.c lbfgsR.c
SOURCES_CPP = neldermead.cpp slice.cpp RcppExportMod.cpp ode_cmt1.cpp RcppExports.cpp resid.cpp inner.cpp saem.cpp
OBJECTS = $(SOURCES_C:.c=.o) $(SOURCES_CPP:.cpp=.o)

all: $(SHLIB)
$(SHLIB): $(OBJECTS)

--------[end src/Makevars]--------
** libs
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c jj.c -o jj.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c jj.g.d_parser.c -o jj.g.d_parser.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c init.c -o init.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c rprintf.c -o rprintf.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c merge3.c -o merge3.o
ccache clang -Qunused-arguments  -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2  -c lbfgsR.c -o lbfgsR.o
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c neldermead.cpp -o neldermead.o
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c slice.cpp -o slice.o
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c RcppExportMod.cpp -o RcppExportMod.o
In file included from RcppExportMod.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:535:
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
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c ode_cmt1.cpp -o ode_cmt1.o
In file included from ode_cmt1.cpp:1:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:535:
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
In file included from ode_cmt1.cpp:9:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat.hpp:292:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/prob/dirichlet_rng.hpp:5:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/random/gamma_distribution.hpp:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/random/exponential_distribution.hpp:27:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/random/detail/int_float_pair.hpp:26:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/random/detail/integer_log2.hpp:19:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/pending/integer_log2.hpp:7:1: warning: This header is deprecated. Use <boost/integer/integer_log2.hpp> instead. [-W#pragma-messages]
BOOST_HEADER_DEPRECATED("<boost/integer/integer_log2.hpp>");
^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/config/header_deprecated.hpp:23:37: note: expanded from macro 'BOOST_HEADER_DEPRECATED'
# define BOOST_HEADER_DEPRECATED(a) BOOST_PRAGMA_MESSAGE("This header is deprecated. Use " a " instead.")
                                    ^
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include/boost/config/pragma_message.hpp:24:34: note: expanded from macro 'BOOST_PRAGMA_MESSAGE'
# define BOOST_PRAGMA_MESSAGE(x) _Pragma(BOOST_STRINGIZE(message(x)))
                                 ^
<scratch space>:54:2: note: expanded from here
 message("This header is deprecated. Use " "<boost/integer/integer_log2.hpp>" " instead.")
 ^
In file included from ode_cmt1.cpp:7:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core.hpp:45:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/core/set_zero_all_adjoints.hpp:14:13: warning: unused function 'set_zero_all_adjoints' [-Wunused-function]
static void set_zero_all_adjoints() {
            ^
In file included from ode_cmt1.cpp:9:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math.hpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/rev/mat.hpp:12:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat.hpp:336:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/prob/poisson_log_glm_log.hpp:5:
/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include/stan/math/prim/mat/prob/poisson_log_glm_lpmf.hpp:64:59: warning: unused typedef 'T_alpha_val' [-Wunused-local-typedef]
      typename partials_return_type<T_alpha>::type>::type T_alpha_val;
                                                          ^
20 warnings generated.
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
In file included from RcppExports.cpp:4:
In file included from ./../inst/include/nlmixr_types.h:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigen.h:25:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/RcppEigenForward.h:30:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Dense:1:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include/Eigen/Core:535:
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
clang++ -std=gnu++14 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/dparser/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RxODE/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppEigen/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/lbfgsb3c/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/BH/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/StanHeaders/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Id -I../inst/include -DBOOST_DISABLE_ASSERTS -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("BH"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppEigen"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("StanHeaders"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("Rcpp"),"include"))'`" -I"`"/Library/Frameworks/R.framework/Resources/bin/Rscript" -e 'cat(file.path(find.package("RcppArmadillo"),"include"))'`" -fPIC  -Wall -g -O2  -c resid.cpp -o resid.o
In file included from resid.cpp:4:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppArmadillo/include/RcppArmadillo.h:31:
In file included from /Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/nlmixr/RcppArmadillo/include/RcppArmadilloForward.h:46:
In file included from /usr/local/include/armadillo:87:
/usr/local/include/armadillo_bits/include_hdf5.hpp:26:14: fatal error: '/usr/local/Cellar/hdf5/1.10.5_1/include/hdf5.h' file not found
    #include ARMA_INCFILE_WRAP(ARMA_HDF5_HEADER)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/include/armadillo_bits/compiler_setup.hpp:79:30: note: expanded from macro 'ARMA_INCFILE_WRAP'
#define ARMA_INCFILE_WRAP(x) <x>
                             ^~~
1 error generated.
make: *** [resid.o] Error 1
ERROR: compilation failed for package ‘nlmixr’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/nlmixr/old/nlmixr.Rcheck/nlmixr’

```
# phenofit

<details>

* Version: 0.2.5-2
* Source code: https://github.com/cran/phenofit
* URL: https://github.com/kongdd/phenofit
* BugReports: https://github.com/kongdd/phenofit/issues
* Date/Publication: 2019-06-07 08:00:08 UTC
* Number of recursive dependencies: 76

Run `revdep_details(,"phenofit")` for more info

</details>

## In both

*   checking whether package ‘phenofit’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/phenofit/new/phenofit.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘phenofit’ ...
** package ‘phenofit’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/phenofit/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘phenofit’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/phenofit/new/phenofit.Rcheck/phenofit’

```
### CRAN

```
* installing *source* package ‘phenofit’ ...
** package ‘phenofit’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/phenofit/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp  -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘phenofit’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/phenofit/old/phenofit.Rcheck/phenofit’

```
# psycho

<details>

* Version: 
* Source code: ???
* URL: https://tidyr.tidyverse.org, https://github.com/tidyverse/tidyr
* BugReports: https://github.com/tidyverse/tidyr/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# sesame

<details>

* Version: 
* Source code: ???
* URL: https://tidyr.tidyverse.org, https://github.com/tidyverse/tidyr
* BugReports: https://github.com/tidyverse/tidyr/issues
* Number of recursive dependencies: 0

Run `revdep_details(,"")` for more info

</details>

## Error before installation

### Devel

```

  There is a binary version available but the source version is later:
            binary source needs_compilation
matrixStats 0.54.0 0.55.0              TRUE

  Binaries will be installed


installing the source packages ‘FlowSorted.Blood.450k’, ‘FlowSorted.CordBloodNorway.450k’



```
### CRAN

```

  There is a binary version available but the source version is later:
            binary source needs_compilation
matrixStats 0.54.0 0.55.0              TRUE

  Binaries will be installed


installing the source packages ‘FlowSorted.Blood.450k’, ‘FlowSorted.CordBloodNorway.450k’



```
# sf

<details>

* Version: 0.7-7
* Source code: https://github.com/cran/sf
* URL: https://github.com/r-spatial/sf/, https://r-spatial.github.io/sf/
* BugReports: https://github.com/r-spatial/sf/issues/
* Date/Publication: 2019-07-24 10:30:02 UTC
* Number of recursive dependencies: 138

Run `revdep_details(,"sf")` for more info

</details>

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
** using staged installation
configure: CC: ccache clang -Qunused-arguments
configure: CXX: clang++ -std=gnu++11
checking for gdal-config... /usr/local/bin/gdal-config
checking gdal-config usability... yes
configure: GDAL: 2.1.2
checking GDAL version >= 2.0.1... yes
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
checking GDAL: checking whether PROJ is available fur running:... dyld: Library not loaded: /usr/local/opt/armadillo/lib/libarmadillo.7.dylib
  Referenced from: /usr/local/opt/gdal2/lib/libgdal.20.dylib
  Reason: image not found
./configure: line 3626: 39271 Abort trap: 6           ./gdal_proj
no
configure: error: OGRCoordinateTransformation() does not return a coord.trans: PROJ not available?
ERROR: configuration failed for package ‘sf’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/new/sf.Rcheck/sf’

```
### CRAN

```
* installing *source* package ‘sf’ ...
** package ‘sf’ successfully unpacked and MD5 sums checked
** using staged installation
configure: CC: ccache clang -Qunused-arguments
configure: CXX: clang++ -std=gnu++11
checking for gdal-config... /usr/local/bin/gdal-config
checking gdal-config usability... yes
configure: GDAL: 2.1.2
checking GDAL version >= 2.0.1... yes
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
checking GDAL: checking whether PROJ is available fur running:... dyld: Library not loaded: /usr/local/opt/armadillo/lib/libarmadillo.7.dylib
  Referenced from: /usr/local/opt/gdal2/lib/libgdal.20.dylib
  Reason: image not found
./configure: line 3626: 38284 Abort trap: 6           ./gdal_proj
no
configure: error: OGRCoordinateTransformation() does not return a coord.trans: PROJ not available?
ERROR: configuration failed for package ‘sf’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/sf/old/sf.Rcheck/sf’

```
# TCGAbiolinks

<details>

* Version: 2.12.6
* Source code: https://github.com/cran/TCGAbiolinks
* URL: https://github.com/BioinformaticsFMRP/TCGAbiolinks
* BugReports: https://github.com/BioinformaticsFMRP/TCGAbiolinks/issues
* Date/Publication: 2019-09-05
* Number of recursive dependencies: 264

Run `revdep_details(,"TCGAbiolinks")` for more info

</details>

## In both

*   R CMD check timed out
    

*   checking whether the package can be unloaded cleanly ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: package or namespace load failed for ‘TCGAbiolinks’:
     unable to load R code in package ‘circlize’
    Execution halted
    ```

*   checking whether the namespace can be loaded with stated dependencies ... WARNING
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    
    A namespace must be able to be loaded with just the base namespace
    loaded: otherwise if the namespace gets loaded by a saved object, the
    session will be unable to start.
    
    Probably some imports need to be declared in the NAMESPACE file.
    ```

*   checking S3 generic/method consistency ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking replacement functions ... WARNING
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The argument of a replacement function which corresponds to the right
    hand side must be named ‘value’.
    ```

*   checking for missing documentation entries ... WARNING
    ```
    Warning: package ‘maftools’ was built under R version 3.6.1
    All user-level objects in a package should have documentation entries.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking for code/documentation mismatches ... WARNING
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 97.3Mb
      sub-directories of 1Mb or more:
        R      2.7Mb
        data   4.3Mb
        doc   90.1Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    ...
    Call sequence:
    6: stop(msg, call. = FALSE, domain = NA)
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    ```

*   checking foreign function calls ... NOTE
    ```
    ...
    5: value[[3L]](cond)
    4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    See chapter ‘System and foreign language interfaces’ in the ‘Writing R
    Extensions’ manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    Error in setLoadActions(function(ns) { : 
      could not find function "setLoadActions"
    Error: unable to load R code in package ‘circlize’
    Execution halted
    ```

*   checking Rd \usage sections ... NOTE
    ```
    ...
    3: tryCatchList(expr, classes, parentenv, handlers)
    2: tryCatch({
           attr(package, "LibPath") <- which.lib.loc
           ns <- loadNamespace(package, lib.loc)
           env <- attachNamespace(ns, pos = pos, deps, exclude, include.only)
       }, error = function(e) {
           P <- if (!is.null(cc <- conditionCall(e))) 
               paste(" in", deparse(cc)[1L])
           else ""
           msg <- gettextf("package or namespace load failed for %s%s:\n %s", 
               sQuote(package), P, conditionMessage(e))
           if (logical.return) 
               message(paste("Error:", msg), domain = NA)
           else stop(msg, call. = FALSE, domain = NA)
       })
    1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
    Execution halted
    The \usage entries for S3 methods should use the \method markup and not
    their full name.
    See chapter ‘Writing R documentation files’ in the ‘Writing R
    Extensions’ manual.
    ```

# TPP

<details>

* Version: 3.12.0
* Source code: https://github.com/cran/TPP
* Date/Publication: 2019-05-02
* Number of recursive dependencies: 86

Run `revdep_details(,"TPP")` for more info

</details>

## Newly broken

*   R CMD check timed out
    

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.9Mb
      sub-directories of 1Mb or more:
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

# trialr

<details>

* Version: 0.1.2
* Source code: https://github.com/cran/trialr
* URL: https://github.com/brockk/trialr
* BugReports: https://github.com/brockk/trialr/issues
* Date/Publication: 2019-06-25 11:40:03 UTC
* Number of recursive dependencies: 105

Run `revdep_details(,"trialr")` for more info

</details>

## In both

*   R CMD check timed out
    

# vlad

<details>

* Version: 0.2.0
* Source code: https://github.com/cran/vlad
* BugReports: https://github.com/wittenberg/vlad/issues
* Date/Publication: 2018-12-06 08:50:03 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"vlad")` for more info

</details>

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
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -I../inst/include/ -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/new/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/vlad/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘vlad’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/vlad/new/vlad.Rcheck/vlad’

```
### CRAN

```
* installing *source* package ‘vlad’ ...
** package ‘vlad’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG -I../inst/include/ -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/tidyr/old/Rcpp/include" -I"/Users/hadley/Documents/tidy-data/tidyr/revdep/library.noindex/vlad/RcppArmadillo/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp -fPIC  -Wall -g -O2  -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘vlad’
* removing ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks.noindex/vlad/old/vlad.Rcheck/vlad’

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

