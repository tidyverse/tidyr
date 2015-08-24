# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.2.1 (2015-06-18) |
|system   |x86_64, darwin13.4.0         |
|ui       |RStudio (0.99.667)           |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/Chicago              |
|date     |2015-08-24                   |

## Packages

|package    |*  |version |date       |source         |
|:----------|:--|:-------|:----------|:--------------|
|covr       |   |1.2.0   |2015-06-25 |CRAN (R 3.2.0) |
|data.table |   |1.9.4   |2014-10-02 |CRAN (R 3.2.0) |
|dplyr      |*  |0.4.2   |2015-06-16 |CRAN (R 3.2.0) |
|knitr      |   |1.10.5  |2015-05-06 |CRAN (R 3.2.0) |
|lazyeval   |   |0.1.10  |2015-01-02 |CRAN (R 3.2.0) |
|magrittr   |   |1.5     |2014-11-22 |CRAN (R 3.2.0) |
|Rcpp       |   |0.12.0  |2015-07-25 |CRAN (R 3.2.0) |
|stringi    |   |0.5-5   |2015-06-29 |CRAN (R 3.2.0) |
|testthat   |*  |0.10.0  |2015-05-22 |CRAN (R 3.2.0) |

# Check results
26 checked out of 27 dependencies 

## broom (0.3.7)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/dgrtwo/broom/issues

__OK__

## EFDR (0.1.1)
Maintainer: Andrew Zammit-Mangion <andrewzm@gmail.com>

__OK__

## emil (2.1.1)
Maintainer: Christofer Backlin <emil@christofer.backlin.se>  
Bug reports: https://github.com/Molmed/emil/issues

```
checking whether package ‘emil’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import by ‘tidyr::%>%’ when loading ‘emil’
See ‘/private/tmp/Rtmp5nYH93/check_cranb673158d7feb/emil.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## eurostat (1.0.16)
Maintainer: Lahti Leo <louhos@googlegroups.com>  
Bug reports: https://github.com/ropengov/eurostat/issues

```
checking files in ‘vignettes’ ... NOTE
The following directory looks like a leftover from 'knitr':
  ‘figure’
Please remove from your package.
```
```
DONE
Status: 1 NOTE
```

## evolqg (0.1-7)
Maintainer: Diogo Melo <diogro@usp.br>  
Bug reports: https://github.com/lem-usp/evolqg/issues

__OK__

## gapminder (0.1.0)
Maintainer: Jennifer Bryan <jenny@stat.ubc.ca>  
Bug reports: https://github.com/jennybc/gapminder/issues

__OK__

## ggmcmc (0.7.1)
Maintainer: Xavier Fernández i Marín <xavier.fim@gmail.com>

```
checking whether package ‘ggmcmc’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import by ‘tidyr::%>%’ when loading ‘ggmcmc’
See ‘/private/tmp/Rtmp5nYH93/check_cranb673158d7feb/ggmcmc.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## googlesheets (0.1.0)
Maintainer: Jennifer Bryan <jenny@stat.ubc.ca>  
Bug reports: https://github.com/jennybc/googlesheets/issues

__OK__

## htmltab (0.6.0)
Maintainer: Christian Rubba <christian.rubba@gmail.com>  
Bug reports: https://github.com/crubba/htmltab/issues

__OK__

## JacobiEigen (0.1)
Maintainer: Bill Venables <Bill.Venables@gmail.com>

__OK__

## mosaic (0.10.0)
Maintainer: Randall Pruim <rpruim@calvin.edu>

__OK__

## pixiedust (0.1.1)
Maintainer: Benjamin Nutter <nutter@battelle.org>  
Bug reports: https://github.com/nutterb/pixiedust/issues

```
checking package dependencies ... ERROR
Packages required but not available: ‘ArgumentCheck’ ‘lazyWeave’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```
```
DONE
Status: 1 ERROR
```

## pmc (1.0.0)
Maintainer: Carl Boettiger <cboettig@gmail.com>  
Bug reports: https://github.com/cboettig/pmc/issues

```
checking package dependencies ... ERROR
Package required but not available: ‘ouch’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```
```
DONE
Status: 1 ERROR
```

## qdap (2.2.2)
Maintainer: Tyler Rinker <tyler.rinker@gmail.com>  
Bug reports: http://github.com/trinker/qdap/issues

__OK__

## qualvar (0.1.0)
Maintainer: Joel Gombin <joel.gombin@gmail.com>

```
checking package dependencies ... NOTE
Package suggested but not available for checking: ‘DT’
```
```
checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...
Quitting from lines 92-106 (wilcox1973.Rmd) 
Error: processing vignette 'wilcox1973.Rmd' failed with diagnostics:
there is no package called 'DT'
Execution halted

```
```
DONE
Status: 2 NOTEs
```

## quickpsy (0.1.0)
Maintainer: Linares Daniel <danilinares@gmail.com>

```
checking whether package ‘quickpsy’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import by ‘tidyr::%>%’ when loading ‘quickpsy’
See ‘/private/tmp/Rtmp5nYH93/check_cranb673158d7feb/quickpsy.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## radiant (0.1.83)
Maintainer: Vincent Nijs <radiant@rady.ucsd.edu>  
Bug reports: https://github.com/vnijs/radiant/issues

```
checking examples ... ERROR
Running examples in ‘radiant-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: plot.cross_tabs
> ### Title: Plot method for the cross_tabs function
> ### Aliases: plot.cross_tabs
> 
> ### ** Examples
> 
> result <- cross_tabs("newspaper", "Income", "Newspaper")
> plot(result, ct_check = c("observed","expected","chi_sq"))
Error in gather_.data.frame(., "variable", "values") : 
  argument "gather_cols" is missing, with no default
Calls: plot ... _fseq -> freduce -> withVisible -> <Anonymous> -> sshhr
Execution halted
```
```
DONE
Status: 1 ERROR
```

## RDML (0.9-1)
Maintainer: Konstantin A. Blagodatskikh <k.blag@yandex.ru>

__OK__

## rfishbase (2.0.1)
Maintainer: Carl Boettiger <cboettig@ropensci.org>  
Bug reports: https://github.com/ropensci/rfishbase/issues

__OK__

## rnoaa (0.4.2)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: http://www.github.com/ropensci/rnoaa/issues

__OK__

## rplexos (1.1.4)
Maintainer: Eduardo Ibanez <edu.ibanez@gmail.com>  
Bug reports: https://github.com/NREL/rplexos/issues

__OK__

## rtable (0.1.0)
Maintainer: David Gohel <david.gohel@lysis-consultants.fr>  
Bug reports: https://github.com/davidgohel/rtable/issues

__OK__

## sjPlot (1.8.2)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

```
checking whether package ‘sjPlot’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import by ‘tidyr::%>%’ when loading ‘sjPlot’
  Warning: replacing previous import by ‘tidyr::replace_na’ when loading ‘sjPlot’
See ‘/private/tmp/Rtmp5nYH93/check_cranb673158d7feb/sjPlot.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## statar (0.3.0)
Maintainer: Matthieu Gomez <mattg@princeton.edu>  
Bug reports: https://github.com/matthieugomez/statar/issues

__OK__

## SWMPr (2.1.0)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/SWMPr/issues

__OK__

## translateSPSS2R (1.0.0)
Maintainer: Andreas Wygrabek <Andreas.Wygrabek@eoda.de>  
Bug reports: https://github.com/eodaGmbH/translateSPSS2R/issues

```
checking R code for possible problems ... NOTE
Error: package or namespace load failed for ‘translateSPSS2R’
Call sequence:
2: stop(gettextf("package or namespace load failed for %s", sQuote(package)), 
       call. = FALSE, domain = NA)
1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
Execution halted
```
```
checking for missing documentation entries ... ERROR
Error: package or namespace load failed for ‘translateSPSS2R’
Call sequence:
2: stop(gettextf("package or namespace load failed for %s", sQuote(package)), 
       call. = FALSE, domain = NA)
1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
Execution halted
```
```
checking Rd \usage sections ... NOTE
Error: package or namespace load failed for ‘translateSPSS2R’
Call sequence:
2: stop(gettextf("package or namespace load failed for %s", sQuote(package)), 
       call. = FALSE, domain = NA)
1: library(package, lib.loc = lib.loc, character.only = TRUE, verbose = FALSE)
Execution halted
The \usage entries for S3 methods should use the \method markup and not
their full name.
See chapter ‘Writing R documentation files’ in the ‘Writing R
Extensions’ manual.
```
```
checking examples ... ERROR
Running examples in ‘translateSPSS2R-Ex.R’ failed
The error occurred in:


R version 3.2.1 (2015-06-18) -- "World-Famous Astronaut"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> pkgname <- "translateSPSS2R"
> source(file.path(R.home("share"), "R", "examples-header.R"))
> options(warn = 1)
> base::assign(".ExTimings", "translateSPSS2R-Ex.timings", pos = 'CheckExEnv')
> base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
> base::assign(".format_ptime",
+ function(x) {
+   if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
+   if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
+   options(OutDec = '.')
+   format(x[1L:3L], digits = 7L)
+ },
+ pos = 'CheckExEnv')
> 
> ### * </HEADER>
> library('translateSPSS2R')
Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) : 
  there is no package called ‘scales’
Error: package or namespace load failed for ‘translateSPSS2R’
Execution halted
```
```
DONE
Status: 2 ERRORs, 2 NOTEs
```

