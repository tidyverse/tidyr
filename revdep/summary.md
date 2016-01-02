# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.2.2 (2015-08-14) |
|system   |x86_64, darwin13.4.0         |
|ui       |RStudio (0.99.830)           |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/Chicago              |
|date     |2016-01-01                   |

## Packages

|package    |*  |version |date       |source         |
|:----------|:--|:-------|:----------|:--------------|
|covr       |   |1.2.0   |2015-06-25 |CRAN (R 3.2.0) |
|data.table |   |1.9.6   |2015-09-19 |CRAN (R 3.2.0) |
|dplyr      |*  |0.4.3   |2015-09-01 |CRAN (R 3.2.0) |
|gapminder  |   |0.1.0   |2015-03-17 |CRAN (R 3.2.0) |
|knitr      |   |1.10.5  |2015-05-06 |CRAN (R 3.2.0) |
|lazyeval   |   |0.1.10  |2015-01-02 |CRAN (R 3.2.0) |
|magrittr   |   |1.5     |2014-11-22 |CRAN (R 3.2.0) |
|Rcpp       |   |0.12.2  |2015-11-15 |CRAN (R 3.2.2) |
|stringi    |   |1.0-1   |2015-10-22 |CRAN (R 3.2.0) |
|testthat   |*  |0.11.0  |2015-10-14 |CRAN (R 3.2.0) |

# Check results
40 checked out of 41 dependencies 

## broom (0.4.0)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/dgrtwo/broom/issues

__OK__

## causaldrf (0.3)
Maintainer: Douglas Galagate <galagated@gmail.com>

__OK__

## eemR (0.1.1)
Maintainer: Philippe Massicotte <pm@bios.au.dk>  
Bug reports: https://github.com/PMassicotte/eemR/issues

__OK__

## EFDR (0.1.1)
Maintainer: Andrew Zammit-Mangion <andrewzm@gmail.com>

__OK__

## emil (2.2.3)
Maintainer: Christofer Backlin <emil@christofer.backlin.se>  
Bug reports: https://github.com/Molmed/emil/issues

__OK__

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
checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...
trying URL 'http://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing?sort=1&file=data%2Ftsdtr210.tsv.gz'
Content type 'application/octet-stream;charset=UTF-8' length 4001 bytes
==================================================
downloaded 4001 bytes

Quitting from lines 92-93 (eurostat_tutorial.Rmd) 
Error: processing vignette 'eurostat_tutorial.Rmd' failed with diagnostics:
argument is of length zero
Execution halted

```
```
DONE
Status: 2 NOTEs
```

## evolqg (0.2-2)
Maintainer: Diogo Melo <diogro@usp.br>  
Bug reports: https://github.com/lem-usp/evolqg/issues

```
checking whether package ‘evolqg’ can be installed ... ERROR
Installation failed.
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/evolqg.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 ERROR
```

## explor (0.1)
Maintainer: Julien Barnier <julien.barnier@ens-lyon.fr>

__OK__

## ezsummary (0.1.9)
Maintainer: Hao Zhu <haozhu@hsl.harvard.edu>

__OK__

## ggfortify (0.1.0)
Maintainer: Masaaki Horikoshi <sinhrks@gmail.com>

```
checking whether package ‘ggfortify’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘ggplot2’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/ggfortify.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## ggmcmc (0.7.2)
Maintainer: Xavier Fernández i Marín <xavier.fim@gmail.com>  
Bug reports: https://github.com/xfim/ggmcmc/issues

```
checking whether package ‘ggmcmc’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘ggplot2’ was built under R version 3.2.3
  Warning: package ‘GGally’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/ggmcmc.Rcheck/00install.out’ for details.
```
```
checking examples ... ERROR
Running examples in ‘ggmcmc-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: ggmcmc
> ### Title: Wrapper function that creates a single pdf file with all plots
> ###   that ggmcmc can produce.
> ### Aliases: ggmcmc ggmcmc-package
> 
> ### ** Examples
> 
> data(linear)
> ggmcmc(ggs(s))  # Directly from a coda object
Plotting histograms
Error in factor(x, levels = 1:n, labels = labels) : 
  invalid 'labels'; length 0 should be 1 or 3
Calls: ggmcmc ... print -> ggs_histogram -> cbind -> gl_unq -> factor
Execution halted
```
```
DONE
Status: 1 ERROR, 1 WARNING
```

## ggRandomForests (1.2.1)
Maintainer: John Ehrlinger <john.ehrlinger@gmail.com>  
Bug reports: https://github.com/ehrlinger/ggRandomForests/issues

```
checking installed package size ... NOTE
  installed size is  5.9Mb
  sub-directories of 1Mb or more:
    data   2.6Mb
    doc    3.0Mb
```
```
DONE
Status: 1 NOTE
```

## glycanr (0.2.0)
Maintainer: Ivo Ugrina <ivo@iugrina.com>  
Bug reports: https://github.com/iugrina/glycanr/issues

__OK__

## googlesheets (0.1.0)
Maintainer: Jennifer Bryan <jenny@stat.ubc.ca>  
Bug reports: https://github.com/jennybc/googlesheets/issues

__OK__

## htmltab (0.6.0)
Maintainer: Christian Rubba <christian.rubba@gmail.com>  
Bug reports: https://github.com/crubba/htmltab/issues

__OK__

## IMP (0.1)
Maintainer: Anup Nair <nairanup50695@gmail.com>

__OK__

## JacobiEigen (0.2-2)
Maintainer: Bill Venables <Bill.Venables@gmail.com>

__OK__

## mosaic (0.13.0)
Maintainer: Randall Pruim <rpruim@calvin.edu>  
Bug reports: https://github.com/ProjectMOSAIC/mosaic/issues

```
checking whether package ‘mosaic’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘ggplot2’ was built under R version 3.2.3
  Warning: package ‘car’ was built under R version 3.2.3
  Warning: package ‘mosaicData’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/mosaic.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## NeuralNetTools (1.4.0)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/NeuralNetTools/issues

```
checking whether package ‘NeuralNetTools’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import by ‘scales::alpha’ when loading ‘NeuralNetTools’
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/NeuralNetTools.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## pixiedust (0.5.0)
Maintainer: Benjamin Nutter <nutter@battelle.org>  
Bug reports: https://github.com/nutterb/pixiedust/issues

__OK__

## pmc (1.0.1)
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

## qdap (2.2.4)
Maintainer: Tyler Rinker <tyler.rinker@gmail.com>  
Bug reports: http://github.com/trinker/qdap/issues

```
checking whether package ‘qdap’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘qdapRegex’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/qdap.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## qualvar (0.1.0)
Maintainer: Joel Gombin <joel.gombin@gmail.com>

__OK__

## quickpsy (0.1.2)
Maintainer: Linares Daniel <danilinares@gmail.com>

```
checking whether package ‘quickpsy’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘ggplot2’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/quickpsy.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## RDML (0.9-1)
Maintainer: Konstantin A. Blagodatskikh <k.blag@yandex.ru>

__OK__

## rfishbase (2.1.0)
Maintainer: Carl Boettiger <cboettig@ropensci.org>  
Bug reports: https://github.com/ropensci/rfishbase/issues

```
checking data for non-ASCII characters ... NOTE
  Note: found 33 marked UTF-8 strings
```
```
DONE
Status: 1 NOTE
```

## RNeXML (2.0.5)
Maintainer: Carl Boettiger <cboettig@gmail.com>  
Bug reports: https://github.com/ropensci/RNeXML/issues

```
checking package dependencies ... NOTE
Packages suggested but not available for checking: ‘rrdf’ ‘Sxslt’
```
```
checking whether package ‘RNeXML’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘ape’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/RNeXML.Rcheck/00install.out’ for details.
```
```
checking re-building of vignette outputs ... NOTE
Error in re-building vignettes:
  ...


Retrieving data for taxon 'Trachypithecus_pileatus'


Retrieving data for taxon 'Trachypithecus_vetulus'


Retrieving data for taxon 'Varecia_variegata'

Warning: package 'phytools' was built under R version 3.2.3
Loading required package: maps
Warning: package 'maps' was built under R version 3.2.3

 # ATTENTION: maps v3.0 has an updated 'world' map.        #
 # Many country borders and names have changed since 1990. #
 # Type '?world' or 'news(package="maps")'. See README_v3. #


Error in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called 'Biostrings'
Quitting from lines 148-150 (simmap.Rmd) 
Error: processing vignette 'simmap.Rmd' failed with diagnostics:
package or namespace load failed for 'phytools'
Execution halted

```
```
DONE
Status: 1 WARNING, 2 NOTEs
```

## rnoaa (0.5.0)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: http://www.github.com/ropensci/rnoaa/issues

__OK__

## rollply (0.4.2)
Maintainer: Alexandre Genin <alex@lecairn.org>  
Bug reports: https://github.com/alexgenin/rollply

__OK__

## rpdo (0.1.0)
Maintainer: Joe Thorley <joe@poissonconsulting.ca>

__OK__

## rplexos (1.1.4)
Maintainer: Eduardo Ibanez <edu.ibanez@gmail.com>  
Bug reports: https://github.com/NREL/rplexos/issues

__OK__

## rtable (0.1.5)
Maintainer: David Gohel <david.gohel@lysis-consultants.fr>  
Bug reports: https://github.com/davidgohel/rtable/issues

__OK__

## simmer (3.1.1)
Maintainer: Iñaki Ucar <i.ucar86@gmail.com>  
Bug reports: https://github.com/Bart6114/simmer/issues

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  
  2. Failure (at test-simulation-1.R#37): a simple deterministic simulation with rejections behaves as expected 
  mean(resources$server) not equal to 2/3
  0.662 - 0.667 == -0.00442
  
  Trajectory: anonymous, 1 activities
  testthat results ================================================================
  OK: 178 SKIPPED: 0 FAILED: 2
  1. Failure (at test-simulation-1.R#35): a simple deterministic simulation with rejections behaves as expected 
  2. Failure (at test-simulation-1.R#37): a simple deterministic simulation with rejections behaves as expected 
  
  Error: testthat unit tests failed
  Execution halted
```
```
DONE
Status: 1 ERROR
```

## sjPlot (1.8.4)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

```
checking whether package ‘sjPlot’ can be installed ... WARNING
Found the following significant warnings:
  Warning: replacing previous import by ‘grid::unit’ when loading ‘sjPlot’
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/sjPlot.Rcheck/00install.out’ for details.
```
```
checking examples ... ERROR
Running examples in ‘sjPlot-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: adjust_plot_range
> ### Title: Adjust y range of ggplot-objects
> ### Aliases: adjust_plot_range
> 
> ### ** Examples
> 
> # sample data set
> library(sjmisc)
> data(efc)
> # show frequencies of relationship-variable and
> # retrieve plot object
> gp <- sjp.frq(efc$e15relat, printPlot = FALSE)
> # show current plot
> plot(gp$plot)
Error: Aesthetics must be either length 1 or the same as the data (8): fill
Execution halted
```
```
DONE
Status: 1 ERROR, 1 WARNING
```

## statar (0.4.0)
Maintainer: Matthieu Gomez <mattg@princeton.edu>  
Bug reports: https://github.com/matthieugomez/statar/issues

__OK__

## strptimer (0.1.0)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>

__OK__

## SWMPr (2.1.4)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/SWMPr/issues

```
checking whether package ‘SWMPr’ can be installed ... WARNING
Found the following significant warnings:
  Warning: package ‘ggplot2’ was built under R version 3.2.3
See ‘/private/tmp/Rtmp3Xn9Gj/check_cranb0a8822a434/SWMPr.Rcheck/00install.out’ for details.
```
```
DONE
Status: 1 WARNING
```

## textreuse (0.1.2)
Maintainer: Lincoln Mullen <lincoln@lincolnmullen.com>  
Bug reports: https://github.com/ropensci/textreuse/issues

__OK__

## translateSPSS2R (1.0.0)
Maintainer: Andreas Wygrabek <Andreas.Wygrabek@eoda.de>  
Bug reports: https://github.com/eodaGmbH/translateSPSS2R/issues

__OK__

## wordbankr (0.1)
Maintainer: Mika Braginsky <mika.br@gmail.com>  
Bug reports: http://github.com/langcog/wordbankr/issues

```
checking dependencies in R code ... NOTE
Namespace in Imports field not imported from: ‘RMySQL’
  All declared Imports should be used.
```
```
DONE
Status: 1 NOTE
```

