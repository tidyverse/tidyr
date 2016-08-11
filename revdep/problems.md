# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.0 (2016-05-03) |
|system   |x86_64, darwin13.4.0         |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/Chicago              |
|date     |2016-08-11                   |

## Packages

|package   |*  |version    |date       |source                           |
|:---------|:--|:----------|:----------|:--------------------------------|
|covr      |   |2.2.0      |2016-08-04 |cran (@2.2.0)                    |
|dplyr     |   |0.5.0.9000 |2016-07-19 |Github (hadley/dplyr@8b28b0b)    |
|gapminder |   |0.2.0      |2015-12-31 |CRAN (R 3.3.0)                   |
|knitr     |   |1.13       |2016-05-09 |CRAN (R 3.3.0)                   |
|lazyeval  |   |0.2.0.9000 |2016-06-17 |Github (hadley/lazyeval@c155c3d) |
|magrittr  |   |1.5        |2014-11-22 |CRAN (R 3.3.0)                   |
|Rcpp      |   |0.12.6     |2016-07-19 |cran (@0.12.6)                   |
|rmarkdown |   |1.0        |2016-07-08 |cran (@1.0)                      |
|stringi   |   |1.1.1      |2016-05-27 |cran (@1.1.1)                    |
|testthat  |*  |1.0.2.9000 |2016-07-19 |Github (hadley/testthat@46d15da) |
|tibble    |   |1.1-5      |2016-08-10 |Github (hadley/tibble@dbe66cf)   |
|tidyr     |   |0.5.1.9001 |2016-08-11 |local (hadley/tidyr@NA)          |

# Check results
4 packages with problems

## glycanr (0.3.0)
Maintainer: Ivo Ugrina <ivo@iugrina.com>  
Bug reports: https://github.com/iugrina/glycanr/issues

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘glycanr-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: quantilenorm
> ### Title: Quantile Normalization of glycan data
> ### Aliases: quantilenorm
> 
> ### ** Examples
> 
> data(mpiu)
> mpiun <- quantilenorm(mpiu)
Error in quantilenorm(mpiu) : 
  Unable to proceed since package preprocessCore from
        BioConductor is not available on this system. This
        package is a prerequisite to use the quantilenorm function!
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  The following objects are masked from 'package:base':
  
      intersect, setdiff, setequal, union
  
  Error in quantilenorm(mpiu, transpose = TRUE) : 
    Unable to proceed since package preprocessCore from
          BioConductor is not available on this system. This
          package is a prerequisite to use the quantilenorm function!
  Calls: test_check ... force -> source_file -> eval -> eval -> quantilenorm
  testthat results ================================================================
  OK: 5 SKIPPED: 0 FAILED: 0
  Execution halted

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘preprocessCore’
```

## ropenaq (0.1.1)
Maintainer: Maëlle Salmon <maelle.salmon@yahoo.se>  
Bug reports: http://github.com/ropenscilabs/ropenaq/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
    df <- data_frame(x = 1:3, y = list(1,2:3,4))
                                         ^
  tests/testthat/test-unnest.R:49:44: style: Commas should always have a space after.
    df <- data_frame(x = 1:3, y = list(1,2:3,4))
                                             ^
  
  
  testthat results ================================================================
  OK: 1 SKIPPED: 15 FAILED: 1
  1. Failure: Package Style (@tests.R#7) 
  
  Error: testthat unit tests failed
  Execution halted
```

## rplexos (1.1.4)
Maintainer: Eduardo Ibanez <edu.ibanez@gmail.com>  
Bug reports: https://github.com/NREL/rplexos/issues

1 error  | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘rplexos-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: process_folder
> ### Title: Convert PLEXOS files to SQLite databases
> ### Aliases: process_folder process_input process_solution
> 
> ### ** Examples
> 
> # Process the folder with the solution file provided by rplexos
> location <- location_solution_rplexos()
> process_folder(location)
Warning: `rbind_list()` is deprecated. Please use `bind_rows()` instead.
> 
> # Process the folder with the input file provided by rplexos
> location2 <- location_input_rplexos()
> process_folder(location2)
Error in sqliteSendQuery(con, statement, bind.data) : 
  error in statement: no such column: comp_collection
Calls: process_folder ... .local -> sqliteGetQuery -> sqliteSendQuery -> .Call
Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 186-187 (rplexos.Rmd) 
Error: processing vignette 'rplexos.Rmd' failed with diagnostics:
error in statement: no such column: comp_collection
Execution halted

```

## tigger (0.2.7)
Maintainer: Daniel Gadala-Maria <daniel.gadala-maria@yale.edu>  
Bug reports: https://bitbucket.org/kleinstein/tigger/issues

0 errors | 1 warning  | 0 notes

```
checking whether package ‘tigger’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import ‘alakazam::plot’ by ‘graphics::plot’ when loading ‘tigger’
See ‘/Users/hadley/Documents/tidy-data/tidyr/revdep/checks/tigger.Rcheck/00install.out’ for details.
```

