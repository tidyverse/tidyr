# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.0 (2016-05-03) |
|system   |x86_64, darwin13.4.0         |
|ui       |RStudio (0.99.1186)          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|tz       |America/Chicago              |
|date     |2016-05-24                   |

## Packages

|package   |*  |version    |date       |source               |
|:---------|:--|:----------|:----------|:--------------------|
|covr      |   |2.0.1      |2016-04-06 |CRAN (R 3.3.0)       |
|dplyr     |   |0.4.3      |2015-09-01 |CRAN (R 3.3.0)       |
|knitr     |   |1.13       |2016-05-09 |CRAN (R 3.3.0)       |
|lazyeval  |   |0.1.10     |2015-01-02 |CRAN (R 3.3.0)       |
|magrittr  |   |1.5        |2014-11-22 |CRAN (R 3.3.0)       |
|Rcpp      |   |0.12.5     |2016-05-14 |CRAN (R 3.3.0)       |
|rmarkdown |   |0.9.6      |2016-05-01 |CRAN (R 3.3.0)       |
|stringi   |   |1.0-1      |2015-10-22 |CRAN (R 3.3.0)       |
|testthat  |*  |1.0.2      |2016-04-23 |CRAN (R 3.3.0)       |
|tibble    |   |1.0        |2016-03-23 |CRAN (R 3.3.0)       |
|tidyr     |   |0.4.1.9000 |2016-05-24 |local (hadley/tidyr) |

# Check results
69 packages

## ARTool (0.10.2)
Maintainer: Matthew Kay <mjskay@uw.edu>  
Bug reports: https://github.com/mjskay/ARTool/issues/new

0 errors | 0 warnings | 0 notes

## broom (0.4.0)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/dgrtwo/broom/issues

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘broom-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: survfit_tidiers
> ### Title: tidy survival curve fits
> ### Aliases: glance.survfit survfit_tidiers tidy.survfit
> 
> ### ** Examples
... 48 lines ...

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

Error: Unknown column 'median'
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  3: as.expectation(exp, ..., srcref = srcref)
  4: identical(as.vector(object), TRUE)
  5: as.vector(object)
  6: augmented$disp
  7: `$.tbl_df`(augmented, disp)
  8: stop("Unknown column '", i, "'", call. = FALSE)
  
  testthat results ================================================================
  OK: 490 SKIPPED: 0 FAILED: 1
  1. Error: rowwise tidiers can be applied to sub-models (@test-rowwise.R#21) 
  
  Error: testthat unit tests failed
  Execution halted

checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘akima’
```

## causaldrf (0.3)
Maintainer: Douglas Galagate <galagated@gmail.com>

0 errors | 0 warnings | 0 notes

## cdom (0.1.0)
Maintainer: Philippe Massicotte <pm@bios.au.dk>  
Bug reports: https://github.com/PMassicotte/cdom/issues

0 errors | 0 warnings | 0 notes

## compareDF (1.0.0)
Maintainer: Alex Joseph <alexsanjoseph@gmail.com>

0 errors | 0 warnings | 0 notes

## crawl (2.0)
Maintainer: Devin S. Johnson <devin.johnson@noaa.gov>

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘RcppArmadillo’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## easyformatr (0.1.1)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>  
Bug reports: https://github.com/bramtayl/easyformatr/issues

0 errors | 0 warnings | 0 notes

## edeaR (0.3.2)
Maintainer: Gert Janssenswillen <gert.janssenswillen@uhasselt.be>

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...

Attaching package: 'edeaR'

The following object is masked from 'package:utils':

    timestamp

Quitting from lines 96-108 (selection.Rmd) 
Error: processing vignette 'selection.Rmd' failed with diagnostics:
Start_point should be a date object.
Execution halted

```

## eechidna (0.1)
Maintainer: Ben Marwick <benmarwick@gmail.com>

0 errors | 0 warnings | 0 notes

## eemR (0.1.3)
Maintainer: Philippe Massicotte <pm@bios.au.dk>  
Bug reports: https://github.com/PMassicotte/eemR/issues

0 errors | 0 warnings | 0 notes

## EFDR (0.1.1)
Maintainer: Andrew Zammit-Mangion <andrewzm@gmail.com>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
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

## emil (2.2.3)
Maintainer: Christofer Backlin <emil@christofer.backlin.se>  
Bug reports: https://github.com/Molmed/emil/issues

0 errors | 0 warnings | 0 notes

## eurostat (1.2.21)
Maintainer: Lahti Leo <louhos@googlegroups.com>  
Bug reports: https://github.com/ropengov/eurostat/issues

0 errors | 0 warnings | 0 notes

## evolqg (0.2-2)
Maintainer: Diogo Melo <diogro@usp.br>  
Bug reports: https://github.com/lem-usp/evolqg/issues

0 errors | 0 warnings | 0 notes

## explor (0.2.1)
Maintainer: Julien Barnier <julien.barnier@ens-lyon.fr>  
Bug reports: https://github.com/juba/explor/issues

0 errors | 0 warnings | 0 notes

## eyelinker (0.1)
Maintainer: Simon Barthelme <simon.barthelme@gipsa-lab.fr>

0 errors | 0 warnings | 0 notes

## eyetrackingR (0.1.6)
Maintainer: Jacob Dink <jacobwdink@gmail.com>  
Bug reports: https://github.com/jwdink/eyetrackingR/issues

0 errors | 0 warnings | 0 notes

## ezsummary (0.1.9)
Maintainer: Hao Zhu <haozhu@hsl.harvard.edu>

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  ezsummary_quantitative(df, n = T) not equivalent to `expected_data_frame_N`.
  Different types: x tbl_df, tbl, data.frame, y data.frame
  
  
  testthat results ================================================================
  OK: 47 SKIPPED: 0 FAILED: 4
  1. Failure: ezsummary_categorical can work without grouping data (@test-ezsummary_categorical.R#11) 
  2. Failure: ezsummary_categorical can work without grouping data (@test-ezsummary_categorical.R#12) 
  3. Failure: ezsummary_quantitative can work correctly with 1 variable and no grouping data (@test-ezsummary_quantitative.R#13) 
  4. Failure: ezsummary_quantitative can work correctly with 1 variable and no grouping data (@test-ezsummary_quantitative.R#14) 
  
  Error: testthat unit tests failed
  Execution halted
```

## fuzzyjoin (0.1)
Maintainer: David Robinson <drobinson@stackoverflow.com>

0 errors | 0 warnings | 0 notes

## ggmcmc (1.0)
Maintainer: Xavier Fernández i Marín <xavier.fim@gmail.com>  
Bug reports: https://github.com/xfim/ggmcmc/issues

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘ggmcmc-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: ggs_caterpillar
> ### Title: Caterpillar plot with thick and thin CI
> ### Aliases: ggs_caterpillar
> 
> ### ** Examples
> 
> data(linear)
> ggs_caterpillar(ggs(s))
> ggs_caterpillar(list(A=ggs(s), B=ggs(s))) # silly example duplicating the same model
Error: Unknown column 'description'
Execution halted
```

## ggRandomForests (1.2.1)
Maintainer: John Ehrlinger <john.ehrlinger@gmail.com>  
Bug reports: https://github.com/ehrlinger/ggRandomForests/issues

2 errors | 0 warnings | 1 note 

```
checking examples ... ERROR
Running examples in ‘ggRandomForests-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: gg_rfsrc.rfsrc
> ### Title: Predicted response data object
> ### Aliases: gg_rfsrc gg_rfsrc.rfsrc
> 
> ### ** Examples
... 19 lines ...
> ##D gg_dta<- gg_rfsrc(rfsrc_airq)
> ##D 
> ##D plot(gg_dta)
> ## End(Not run)
> 
> ## -------- Boston data
> data(rfsrc_Boston, package="ggRandomForests")
> plot(rfsrc_Boston) 
Error in if (x$tree.err == FALSE) { : argument is of length zero
Calls: plot -> plot.rfsrc
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  6: sort(randomForestSRC::vimp(object)$importance, decreasing = TRUE)
  7: randomForestSRC::vimp(object)
  8: generic.predict.rfsrc(object, outcome.target = outcome.target, importance = importance, 
         importance.xvar = xvar.names, seed = seed, do.trace = do.trace, membership = FALSE, 
         subset = subset, ...)
  9: stop()
  
  testthat results ================================================================
  OK: 412 SKIPPED: 0 FAILED: 1
  1. Error: gg_vimp survival (@test_gg_vimp.R#139) 
  
  Error: testthat unit tests failed
  Execution halted

checking installed package size ... NOTE
  installed size is  5.9Mb
  sub-directories of 1Mb or more:
    data   2.6Mb
    doc    3.0Mb
```

## ggspectra (0.1.7)
Maintainer: Pedro J. Aphalo <pedro.aphalo@helsinki.fi>  
Bug reports: https://bitbucket.org/aphalo/ggspectra

0 errors | 0 warnings | 0 notes

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

## googlesheets (0.2.0)
Maintainer: Jennifer Bryan <jenny@stat.ubc.ca>  
Bug reports: https://github.com/jennybc/googlesheets/issues

0 errors | 0 warnings | 0 notes

## GSODR (0.1.5)
Maintainer: Adam Sparks <adamhsparks@gmail.com>

0 errors | 0 warnings | 0 notes

## gutenbergr (0.1.1)
Maintainer: David Robinson <admiral.david@gmail.com>  
Bug reports: http://github.com/ropenscilabs/gutenbergr/issues

0 errors | 0 warnings | 0 notes

## hdr (0.1)
Maintainer: Eric Persson <expersso5@gmail.com>  
Bug reports: https://github.com/expersso/hdr

0 errors | 0 warnings | 0 notes

## heemod (0.3.1)
Maintainer: Antoine Filipovic-Pierucci <pierucci@gmail.com>  
Bug reports: https://github.com/pierucci/heemod/issues

1 error  | 1 warning  | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  12: compute_icer(normalize_ce(object))
  13: `*tmp*`$.icer
  14: `$.tbl_df`(`*tmp*`, .icer)
  15: stop("Unknown column '", i, "'", call. = FALSE)
  
  testthat results ================================================================
  OK: 101 SKIPPED: 0 FAILED: 3
  1. Error: Model evaluation, 2 models (@test_model.R#211) 
  2. Error: run_models behaves as expected (@test_run_model.R#150) 
  3. Error: Discounting (@test_run_model.R#265) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 214-215 (homogeneous.Rmd) 
Error: processing vignette 'homogeneous.Rmd' failed with diagnostics:
Unknown column '.icer'
Execution halted

```

## highcharter (0.3.0)
Maintainer: Joshua Kunst <jbkunst@gmail.com>  
Bug reports: https://github.com/jbkunst/highcharter/issues

0 errors | 0 warnings | 0 notes

## htmltab (0.6.0)
Maintainer: Christian Rubba <christian.rubba@gmail.com>  
Bug reports: https://github.com/crubba/htmltab/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
         which = "//table[5]")
  3: select_tab(which = which, Node = Node)
  4: select_tab.character(which = which, Node = Node)
  5: ifstop(cond = is.null(Node[[1]]), mess = "Couldn't find the table. Try passing (a different) information to the which argument.")
  6: eval(quote(cond))
  7: eval(expr, envir, enclos)
  
  testthat results ================================================================
  OK: 118 SKIPPED: 0 FAILED: 1
  1. Error: check_type produces class output (@test_inputs.R#9) 
  
  Error: testthat unit tests failed
  Execution halted
```

## idbr (0.1.2)
Maintainer: Kyle Walker <kyle.walker@tcu.edu>

0 errors | 0 warnings | 0 notes

## IMP (1.1)
Maintainer: Anup Nair <nairanup50695@gmail.com>

0 errors | 0 warnings | 0 notes

## IncucyteDRC (0.5.4)
Maintainer: Phil Chapman <phil.chapman@cruk.manchester.ac.uk>  
Bug reports: https://github.com/chapmandu2/IncucyteDRC/issues

0 errors | 0 warnings | 0 notes

## JacobiEigen (0.2-2)
Maintainer: Bill Venables <Bill.Venables@gmail.com>

0 errors | 0 warnings | 0 notes

## mosaic (0.13.0)
Maintainer: Randall Pruim <rpruim@calvin.edu>  
Bug reports: https://github.com/ProjectMOSAIC/mosaic/issues

0 errors | 0 warnings | 0 notes

## mpoly (1.0.1)
Maintainer: David Kahle <david.kahle@gmail.com>  
Bug reports: https://github.com/dkahle/mpoly/issues

0 errors | 0 warnings | 0 notes

## NeuralNetTools (1.4.0)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/NeuralNetTools/issues

0 errors | 0 warnings | 0 notes

## pixiedust (0.7.0)
Maintainer: Benjamin Nutter <nutter@battelle.org>  
Bug reports: https://github.com/nutterb/pixiedust/issues

0 errors | 1 warning  | 0 notes

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 173-185 (advancedMagic.Rmd) 
Error: processing vignette 'advancedMagic.Rmd' failed with diagnostics:
Unknown column 'html_row_pos'
Execution halted

```

## plotly (3.6.0)
Maintainer: Carson Sievert <cpsievert1@gmail.com>  
Bug reports: https://github.com/ropensci/plotly/issues

0 errors | 0 warnings | 0 notes

## pmc (1.0.1)
Maintainer: Carl Boettiger <cboettig@gmail.com>  
Bug reports: https://github.com/cboettig/pmc/issues

0 errors | 0 warnings | 0 notes

## qdap (2.2.4)
Maintainer: Tyler Rinker <tyler.rinker@gmail.com>  
Bug reports: http://github.com/trinker/qdap/issues

0 errors | 0 warnings | 0 notes

## qualvar (0.1.0)
Maintainer: Joel Gombin <joel.gombin@gmail.com>

0 errors | 0 warnings | 0 notes

## quickpsy (0.1.2)
Maintainer: Linares Daniel <danilinares@gmail.com>

1 error  | 0 warnings | 0 notes

```
checking examples ... ERROR
Running examples in ‘quickpsy-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: logliks
> ### Title: Calculates the loglikelihoods
> ### Aliases: logliks
> 
> ### ** Examples
> 
> library(MPDiR) # contains the Vernier data
> fit <- quickpsy(Vernier, Phaseshift, NumUpward, N,
+                 grouping = .(Direction, WaveForm, TempFreq), B = 20)
Estimating parameters...
Error: Unknown column 'y'
Execution halted
```

## radarchart (0.2.0)
Maintainer: Doug Ashton <dashton@mango-solutions.com>  
Bug reports: https://github.com/mangothecat/radarchart/issues

0 errors | 0 warnings | 0 notes

## RDML (0.9-1)
Maintainer: Konstantin A. Blagodatskikh <k.blag@yandex.ru>

0 errors | 0 warnings | 0 notes

## rfishbase (2.1.0)
Maintainer: Carl Boettiger <cboettig@ropensci.org>  
Bug reports: https://github.com/ropensci/rfishbase/issues

0 errors | 0 warnings | 0 notes

## rgho (0.0.1)
Maintainer: Antoine Filipovic-Pierucci <pierucci@gmail.com>  
Bug reports: https://github.com/pierucci/rgho/issues

1 error  | 1 warning  | 0 notes

```
checking examples ... ERROR
Running examples in ‘rgho-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: search_gho
> ### Title: Search Codes or Dimensions Labels
> ### Aliases: search_codes search_dimensions search_gho
> 
> ### ** Examples
... 27 lines ...
DEFINITION_XML
DISPLAY_ES
DISPLAY_FR
IMR_ID
RENDERER_ID
> 
> result <- get_gho_codes(dimension = "REGION")
Error in `colnames<-`(`*tmp*`, value = "V") : 
  'names' attribute [1] must be the same length as the vector [0]
Calls: get_gho_codes ... spread_.data.frame -> as_data_frame_matrix -> <Anonymous> -> colnames<-
Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Quitting from lines 52-54 (intro.Rmd) 
Error: processing vignette 'intro.Rmd' failed with diagnostics:
'names' attribute [1] must be the same length as the vector [0]
Execution halted

```

## RNeXML (2.0.6)
Maintainer: Carl Boettiger <cboettig@gmail.com>  
Bug reports: https://github.com/ropensci/RNeXML/issues

2 errors | 1 warning  | 1 note 

```
checking examples ... ERROR
Running examples in ‘RNeXML-Ex.R’ failed
The error most likely occurred in:

> base::assign(".ptime", proc.time(), pos = "CheckExEnv")
> ### Name: add_basic_meta
> ### Title: Add basic metadata
> ### Aliases: add_basic_meta
> 
> ### ** Examples
> 
> nex <- add_basic_meta(title = "My test title",
+              description = "A description of my test",
+              creator = "Carl Boettiger <cboettig@gmail.com>",
+              publisher = "unpublished data",
+              pubdate = "2012-04-01")
Error: Unknown column 'content'
Execution halted

checking tests ... ERROR
Running the tests in ‘tests/test-all.R’ failed.
Last 13 lines of output:
  1.  Error: We can serialize the various versions of the ape format (@test_ape.R#40) 
  2.  Error: We can read and write NeXML to phylo and back without edge.lengths (@test_ape.R#52) 
  3.  Error: Rooted trees remain rooted on conversions (@test_ape.R#65) 
  4.  Error: Unrooted trees remain unrooted on conversions (@test_ape.R#74) 
  5.  Error: we can add characters to a nexml file using a data.frame (@test_characters.R#92) 
  6.  Error: We can serialize tree and trait data for a comparative analysis (@test_comp_analysis.R#25) 
  7.  Error: We can generate valid EML with uuid ids on all elements (@test_global_ids.R#11) 
  8.  Error: We can add additional metadata (@test_meta.R#8) 
  9.  Error: We can add R bibentry type metadata (@test_meta.R#28) 
  10. Error: We can add additional metadata (@test_meta.R#42) 
  
  Error: testthat unit tests failed
  Execution halted

checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Loading required package: ape
Quitting from lines 46-67 (metadata.Rmd) 
Error: processing vignette 'metadata.Rmd' failed with diagnostics:
Unknown column 'content'
Execution halted


checking package dependencies ... NOTE
Packages suggested but not available for checking: ‘rrdf’ ‘Sxslt’
```

## rnoaa (0.5.6)
Maintainer: Scott Chamberlain <myrmecocystus@gmail.com>  
Bug reports: http://www.github.com/ropensci/rnoaa/issues

0 errors | 0 warnings | 0 notes

## rollply (0.5.0)
Maintainer: Alexandre Genin <alex@lecairn.org>  
Bug reports: https://github.com/alexgenin/rollply

0 errors | 0 warnings | 0 notes

## rpdo (0.2.0)
Maintainer: Joe Thorley <joe@poissonconsulting.ca>

0 errors | 0 warnings | 0 notes

## rplexos (1.1.4)
Maintainer: Eduardo Ibanez <edu.ibanez@gmail.com>  
Bug reports: https://github.com/NREL/rplexos/issues

0 errors | 0 warnings | 0 notes

## rtable (0.1.5)
Maintainer: David Gohel <david.gohel@lysis-consultants.fr>  
Bug reports: https://github.com/davidgohel/rtable/issues

0 errors | 0 warnings | 0 notes

## rtdists (0.5-2)
Maintainer: Henrik Singmann <singmann+rtdists@gmail.com>

0 errors | 0 warnings | 0 notes

## shazam (0.1.2)
Maintainer: Jason Vander Heiden <jason.vanderheiden@yale.edu>  
Bug reports: https://bitbucket.org/kleinstein/shazam/issues

0 errors | 0 warnings | 0 notes

## simmer (3.2.1)
Maintainer: Iñaki Ucar <i.ucar86@gmail.com>  
Bug reports: https://github.com/Enchufa2/simmer/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘BH’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## sjmisc (1.8)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>

0 errors | 0 warnings | 0 notes

## sjPlot (2.0.0)
Maintainer: Daniel Lüdecke <d.luedecke@uke.de>  
Bug reports: https://github.com/sjPlot/devel/issues

0 errors | 0 warnings | 0 notes

## sprintfr (0.1.0)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>  
Bug reports: https://github.com/bramtayl/sprintfr/issues

0 errors | 0 warnings | 0 notes

## statar (0.6.1)
Maintainer: Matthieu Gomez <mattg@princeton.edu>  
Bug reports: https://github.com/matthieugomez/statar/issues

0 errors | 0 warnings | 0 notes

## strptimer (0.1.0)
Maintainer: Brandon Taylor <brandon.taylor221@gmail.com>

0 errors | 0 warnings | 0 notes

## SWMPr (2.1.5)
Maintainer: Marcus W. Beck <mbafs2012@gmail.com>  
Bug reports: https://github.com/fawda123/SWMPr/issues

0 errors | 0 warnings | 0 notes

## textreuse (0.1.3)
Maintainer: Lincoln Mullen <lincoln@lincolnmullen.com>  
Bug reports: https://github.com/ropensci/textreuse/issues

1 error  | 0 warnings | 0 notes

```
checking package dependencies ... ERROR
Package required but not available: ‘BH’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

## tidytext (0.1.0)
Maintainer: Julia Silge <julia.silge@gmail.com>  
Bug reports: http://github.com/juliasilge/tidytext/issues

0 errors | 0 warnings | 0 notes

## translateSPSS2R (1.0.0)
Maintainer: Andreas Wygrabek <Andreas.Wygrabek@eoda.de>  
Bug reports: https://github.com/eodaGmbH/translateSPSS2R/issues

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
applyMetaCheck: no visible global function definition for
  ‘globalVariables’
computeCfvar: no visible global function definition for ‘sd’
computeLag: no visible global function definition for ‘tail’
computeLag: no visible global function definition for ‘head’
computeMedian: no visible global function definition for ‘median’
computeSd: no visible global function definition for ‘sd’
computeVariance: no visible global function definition for ‘var’
enter: no visible global function definition for ‘lm’
... 27 lines ...
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

## VWPre (0.5.0)
Maintainer: Vincent Porretta <vincentporretta@gmail.com>

0 errors | 0 warnings | 0 notes

## wordbankr (0.1)
Maintainer: Mika Braginsky <mika.br@gmail.com>  
Bug reports: http://github.com/langcog/wordbankr/issues

0 errors | 0 warnings | 0 notes

## wrswoR.benchmark (0.1-1)
Maintainer: Kirill Müller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/krlmlr/wrswoR.benchmark/issues

0 errors | 0 warnings | 0 notes

## wrswoR (1.0-1)
Maintainer: Kirill Müller <krlmlr+r@mailbox.org>  
Bug reports: https://github.com/krlmlr/wrswoR/issues

0 errors | 0 warnings | 0 notes

