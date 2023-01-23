# afex

<details>

* Version: 1.2-1
* GitHub: https://github.com/singmann/afex
* Source code: https://github.com/cran/afex
* Date/Publication: 2023-01-09 08:40:11 UTC
* Number of recursive dependencies: 212

Run `revdepcheck::cloud_details(, "afex")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/afex/new/afex.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘afex/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘afex’ version ‘1.2-1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘afex_analysing_accuracy_data.Rmd’ using ‘UTF-8’... OK
  ‘afex_anova_example.Rmd’ using ‘UTF-8’... OK
  ‘afex_mixed_example.Rmd’ using ‘UTF-8’... OK
  ‘afex_plot_introduction.Rmd’ using ‘UTF-8’... OK
  ‘afex_plot_supported_models.Rmd’ using ‘UTF-8’... OK
  ‘assumptions_of_ANOVAs.Rmd’ using ‘UTF-8’... OK
  ‘introduction-mixed-models.pdf.asis’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/afex/old/afex.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘afex/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘afex’ version ‘1.2-1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘afex_analysing_accuracy_data.Rmd’ using ‘UTF-8’... OK
  ‘afex_anova_example.Rmd’ using ‘UTF-8’... OK
  ‘afex_mixed_example.Rmd’ using ‘UTF-8’... OK
  ‘afex_plot_introduction.Rmd’ using ‘UTF-8’... OK
  ‘afex_plot_supported_models.Rmd’ using ‘UTF-8’... OK
  ‘assumptions_of_ANOVAs.Rmd’ using ‘UTF-8’... OK
  ‘introduction-mixed-models.pdf.asis’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# autoTS

<details>

* Version: 0.9.11
* GitHub: https://github.com/vivienroussez/autots
* Source code: https://github.com/cran/autoTS
* Date/Publication: 2020-06-05 12:20:06 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::cloud_details(, "autoTS")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/autoTS/new/autoTS.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘autoTS/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘autoTS’ version ‘0.9.11’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/autoTS/old/autoTS.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘autoTS/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘autoTS’ version ‘0.9.11’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# bayesnec

<details>

* Version: 2.1.0.0
* GitHub: https://github.com/open-aims/bayesnec
* Source code: https://github.com/cran/bayesnec
* Date/Publication: 2022-12-15 06:40:02 UTC
* Number of recursive dependencies: 133

Run `revdepcheck::cloud_details(, "bayesnec")` for more info

</details>

## In both

*   checking whether package ‘bayesnec’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/bayesnec/new/bayesnec.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘rstan’
    ```

## Installation

### Devel

```
* installing *source* package ‘bayesnec’ ...
** package ‘bayesnec’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘brms’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
...
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘bayesnec’
* removing ‘/tmp/workdir/bayesnec/new/bayesnec.Rcheck/bayesnec’


```
### CRAN

```
* installing *source* package ‘bayesnec’ ...
** package ‘bayesnec’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘brms’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
...
by .GlobalEnv when processing object ‘manec_example’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘manec_example’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘bayesnec’
* removing ‘/tmp/workdir/bayesnec/old/bayesnec.Rcheck/bayesnec’


```
# BayesPostEst

<details>

* Version: 0.3.2
* GitHub: https://github.com/ShanaScogin/BayesPostEst
* Source code: https://github.com/cran/BayesPostEst
* Date/Publication: 2021-11-11 08:10:05 UTC
* Number of recursive dependencies: 159

Run `revdepcheck::cloud_details(, "BayesPostEst")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/BayesPostEst/new/BayesPostEst.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘BayesPostEst/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘BayesPostEst’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/BayesPostEst/old/BayesPostEst.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘BayesPostEst/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘BayesPostEst’ version ‘0.3.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# beadplexr

<details>

* Version: 0.4.1
* GitHub: NA
* Source code: https://github.com/cran/beadplexr
* Date/Publication: 2022-03-05 13:50:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "beadplexr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/beadplexr/new/beadplexr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘beadplexr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘beadplexr’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘cba_macsplex_example.Rmd’ using ‘UTF-8’... OK
  ‘legendplex_analysis.Rmd’ using ‘UTF-8’... OK
  ‘preparing_flow_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/beadplexr/old/beadplexr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘beadplexr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘beadplexr’ version ‘0.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘cba_macsplex_example.Rmd’ using ‘UTF-8’... OK
  ‘legendplex_analysis.Rmd’ using ‘UTF-8’... OK
  ‘preparing_flow_data.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# breathtestcore

<details>

* Version: 0.8.4
* GitHub: https://github.com/dmenne/breathtestcore
* Source code: https://github.com/cran/breathtestcore
* Date/Publication: 2022-04-07 13:42:34 UTC
* Number of recursive dependencies: 118

Run `revdepcheck::cloud_details(, "breathtestcore")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/breathtestcore/new/breathtestcore.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘breathtestcore/DESCRIPTION’ ... OK
* this is package ‘breathtestcore’ version ‘0.8.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘data_formats.Rmd’ using ‘UTF-8’... OK
  ‘methods_and_concepts.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/breathtestcore/old/breathtestcore.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘breathtestcore/DESCRIPTION’ ... OK
* this is package ‘breathtestcore’ version ‘0.8.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘data_formats.Rmd’ using ‘UTF-8’... OK
  ‘methods_and_concepts.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# broom.helpers

<details>

* Version: 1.11.0
* GitHub: https://github.com/larmarange/broom.helpers
* Source code: https://github.com/cran/broom.helpers
* Date/Publication: 2023-01-06 08:50:06 UTC
* Number of recursive dependencies: 222

Run `revdepcheck::cloud_details(, "broom.helpers")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/broom.helpers/new/broom.helpers.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.helpers/DESCRIPTION’ ... OK
* this is package ‘broom.helpers’ version ‘1.11.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/broom.helpers/old/broom.helpers.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.helpers/DESCRIPTION’ ... OK
* this is package ‘broom.helpers’ version ‘1.11.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# broom.mixed

<details>

* Version: 0.2.9.4
* GitHub: https://github.com/bbolker/broom.mixed
* Source code: https://github.com/cran/broom.mixed
* Date/Publication: 2022-04-17 17:42:29 UTC
* Number of recursive dependencies: 164

Run `revdepcheck::cloud_details(, "broom.mixed")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/broom.mixed/new/broom.mixed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.mixed/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘broom.mixed’ version ‘0.2.9.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘broom_mixed_intro.rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/broom.mixed/old/broom.mixed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘broom.mixed/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘broom.mixed’ version ‘0.2.9.4’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘test-all.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘broom_mixed_intro.rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# datawizard

<details>

* Version: 0.6.5
* GitHub: https://github.com/easystats/datawizard
* Source code: https://github.com/cran/datawizard
* Date/Publication: 2022-12-14 23:50:02 UTC
* Number of recursive dependencies: 191

Run `revdepcheck::cloud_details(, "datawizard")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/datawizard/new/datawizard.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘datawizard/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘datawizard’ version ‘0.6.5’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘selection_syntax.Rmd’ using ‘UTF-8’... OK
  ‘standardize_data.Rmd’ using ‘UTF-8’... OK
  ‘tidyverse_translation.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/datawizard/old/datawizard.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘datawizard/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘datawizard’ version ‘0.6.5’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘selection_syntax.Rmd’ using ‘UTF-8’... OK
  ‘standardize_data.Rmd’ using ‘UTF-8’... OK
  ‘tidyverse_translation.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# embed

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/embed
* Source code: https://github.com/cran/embed
* Date/Publication: 2022-07-02 16:50:02 UTC
* Number of recursive dependencies: 183

Run `revdepcheck::cloud_details(, "embed")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/embed/new/embed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘embed/DESCRIPTION’ ... OK
* this is package ‘embed’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  i In index: 1.
  i With name: x3.
  Caused by error in `.f()`:
  ! The package `rstanarm` is required.
  
  [ FAIL 1 | WARN 2 | SKIP 56 | PASS 162 ]
  Error: Test failures
  Execution halted
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/embed/old/embed.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘embed/DESCRIPTION’ ... OK
* this is package ‘embed’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  i In index: 1.
  i With name: x3.
  Caused by error in `.f()`:
  ! The package `rstanarm` is required.
  
  [ FAIL 1 | WARN 2 | SKIP 56 | PASS 162 ]
  Error: Test failures
  Execution halted
* DONE
Status: 1 ERROR, 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# escalation

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/escalation
* Date/Publication: 2020-10-18 21:40:06 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::cloud_details(, "escalation")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/escalation/new/escalation.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘escalation/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘escalation’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘trialr’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/escalation/old/escalation.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘escalation/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘escalation’ version ‘0.1.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘trialr’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ESTER

<details>

* Version: 0.2.0
* GitHub: https://github.com/lnalborczyk/ESTER
* Source code: https://github.com/cran/ESTER
* Date/Publication: 2017-12-10 14:21:14 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "ESTER")` for more info

</details>

## In both

*   checking whether package ‘ESTER’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ESTER/new/ESTER.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ESTER’ ...
** package ‘ESTER’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘ESTER’
* removing ‘/tmp/workdir/ESTER/new/ESTER.Rcheck/ESTER’


```
### CRAN

```
* installing *source* package ‘ESTER’ ...
** package ‘ESTER’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘ESTER’
* removing ‘/tmp/workdir/ESTER/old/ESTER.Rcheck/ESTER’


```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# FAMetA

<details>

* Version: 0.1.5
* GitHub: NA
* Source code: https://github.com/cran/FAMetA
* Date/Publication: 2023-01-11 09:33:11 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::cloud_details(, "FAMetA")` for more info

</details>

## In both

*   checking whether package ‘FAMetA’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/FAMetA/new/FAMetA.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘FAMetA’ ...
** package ‘FAMetA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘LipidMS’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘readMzXmlData’
Execution halted
ERROR: lazy loading failed for package ‘FAMetA’
* removing ‘/tmp/workdir/FAMetA/new/FAMetA.Rcheck/FAMetA’


```
### CRAN

```
* installing *source* package ‘FAMetA’ ...
** package ‘FAMetA’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘LipidMS’ in loadNamespace(j <- i[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘readMzXmlData’
Execution halted
ERROR: lazy loading failed for package ‘FAMetA’
* removing ‘/tmp/workdir/FAMetA/old/FAMetA.Rcheck/FAMetA’


```
# finnts

<details>

* Version: 0.2.1
* GitHub: https://github.com/microsoft/finnts
* Source code: https://github.com/cran/finnts
* Date/Publication: 2022-11-15 23:30:02 UTC
* Number of recursive dependencies: 210

Run `revdepcheck::cloud_details(, "finnts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/finnts/new/finnts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘finnts/DESCRIPTION’ ... OK
* this is package ‘finnts’ version ‘0.2.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
  ‘best-model-selection.Rmd’ using ‘UTF-8’... OK
  ‘external-regressors.Rmd’ using ‘UTF-8’... OK
  ‘feature-engineering.Rmd’ using ‘UTF-8’... OK
  ‘finnts.Rmd’ using ‘UTF-8’... OK
  ‘hierarchical-forecasting.Rmd’ using ‘UTF-8’... OK
  ‘models-used-in-finnts.Rmd’ using ‘UTF-8’... OK
  ‘parallel-processing.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/finnts/old/finnts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘finnts/DESCRIPTION’ ... OK
* this is package ‘finnts’ version ‘0.2.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
  ‘best-model-selection.Rmd’ using ‘UTF-8’... OK
  ‘external-regressors.Rmd’ using ‘UTF-8’... OK
  ‘feature-engineering.Rmd’ using ‘UTF-8’... OK
  ‘finnts.Rmd’ using ‘UTF-8’... OK
  ‘hierarchical-forecasting.Rmd’ using ‘UTF-8’... OK
  ‘models-used-in-finnts.Rmd’ using ‘UTF-8’... OK
  ‘parallel-processing.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# genekitr

<details>

* Version: 1.1.0
* GitHub: https://github.com/GangLiLab/genekitr
* Source code: https://github.com/cran/genekitr
* Date/Publication: 2023-01-20 03:30:02 UTC
* Number of recursive dependencies: 200

Run `revdepcheck::cloud_details(, "genekitr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/genekitr/new/genekitr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/genekitr/old/genekitr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘genekitr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘genekitr’ version ‘1.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# ggPMX

<details>

* Version: 1.2.8
* GitHub: https://github.com/ggPMXdevelopment/ggPMX
* Source code: https://github.com/cran/ggPMX
* Date/Publication: 2022-06-17 23:10:02 UTC
* Number of recursive dependencies: 177

Run `revdepcheck::cloud_details(, "ggPMX")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggPMX/new/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 14 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggPMX/old/ggPMX.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggPMX/DESCRIPTION’ ... OK
* this is package ‘ggPMX’ version ‘1.2.8’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
  [ FAIL 1 | WARN 14 | SKIP 8 | PASS 327 ]
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘ggPMX-guide.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 2 NOTEs





```
# ggstatsplot

<details>

* Version: 0.10.0
* GitHub: https://github.com/IndrajeetPatil/ggstatsplot
* Source code: https://github.com/cran/ggstatsplot
* Date/Publication: 2022-11-27 13:20:02 UTC
* Number of recursive dependencies: 169

Run `revdepcheck::cloud_details(, "ggstatsplot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/ggstatsplot/new/ggstatsplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggstatsplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggstatsplot’ version ‘0.10.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘additional.Rmd’ using ‘UTF-8’... OK
  ‘ggstatsplot.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/ggstatsplot/old/ggstatsplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘ggstatsplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘ggstatsplot’ version ‘0.10.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Running ‘spelling.R’
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘additional.Rmd’ using ‘UTF-8’... OK
  ‘ggstatsplot.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# healthyR.ai

<details>

* Version: 0.0.11
* GitHub: https://github.com/spsanderson/healthyR.ai
* Source code: https://github.com/cran/healthyR.ai
* Date/Publication: 2023-01-12 17:20:02 UTC
* Number of recursive dependencies: 189

Run `revdepcheck::cloud_details(, "healthyR.ai")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/healthyR.ai/new/healthyR.ai.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ai/DESCRIPTION’ ... OK
* this is package ‘healthyR.ai’ version ‘0.0.11’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘auto-kmeans.Rmd’ using ‘UTF-8’... OK
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘kmeans-umap.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/healthyR.ai/old/healthyR.ai.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ai/DESCRIPTION’ ... OK
* this is package ‘healthyR.ai’ version ‘0.0.11’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘auto-kmeans.Rmd’ using ‘UTF-8’... OK
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘kmeans-umap.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: OK





```
# healthyR.ts

<details>

* Version: 0.2.6
* GitHub: https://github.com/spsanderson/healthyR.ts
* Source code: https://github.com/cran/healthyR.ts
* Date/Publication: 2023-01-06 22:40:02 UTC
* Number of recursive dependencies: 191

Run `revdepcheck::cloud_details(, "healthyR.ts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/healthyR.ts/new/healthyR.ts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ts/DESCRIPTION’ ... OK
* this is package ‘healthyR.ts’ version ‘0.2.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘using-tidy-fft.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/healthyR.ts/old/healthyR.ts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘healthyR.ts/DESCRIPTION’ ... OK
* this is package ‘healthyR.ts’ version ‘0.2.6’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking files in ‘vignettes’ ... OK
* checking examples ... OK
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
  ‘using-tidy-fft.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# historicalborrowlong

<details>

* Version: 0.0.5
* GitHub: https://github.com/wlandau/historicalborrowlong
* Source code: https://github.com/cran/historicalborrowlong
* Date/Publication: 2022-09-13 10:20:06 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::cloud_details(, "historicalborrowlong")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/historicalborrowlong/new/historicalborrowlong.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘historicalborrowlong/DESCRIPTION’ ... OK
* this is package ‘historicalborrowlong’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'rstan', 'trialr'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/historicalborrowlong/old/historicalborrowlong.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘historicalborrowlong/DESCRIPTION’ ... OK
* this is package ‘historicalborrowlong’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'rstan', 'trialr'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# INSPECTumours

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/INSPECTumours
* Date/Publication: 2022-05-06 12:10:02 UTC
* Number of recursive dependencies: 175

Run `revdepcheck::cloud_details(, "INSPECTumours")` for more info

</details>

## In both

*   checking whether package ‘INSPECTumours’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/INSPECTumours/new/INSPECTumours.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘INSPECTumours’ ...
** package ‘INSPECTumours’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘INSPECTumours’
* removing ‘/tmp/workdir/INSPECTumours/new/INSPECTumours.Rcheck/INSPECTumours’


```
### CRAN

```
* installing *source* package ‘INSPECTumours’ ...
** package ‘INSPECTumours’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]) : 
  there is no package called ‘rstan’
Calls: <Anonymous> ... loadNamespace -> withRestarts -> withOneRestart -> doWithOneRestart
Execution halted
ERROR: lazy loading failed for package ‘INSPECTumours’
* removing ‘/tmp/workdir/INSPECTumours/old/INSPECTumours.Rcheck/INSPECTumours’


```
# loon.ggplot

<details>

* Version: 1.3.3
* GitHub: https://github.com/great-northern-diver/loon.ggplot
* Source code: https://github.com/cran/loon.ggplot
* Date/Publication: 2022-11-12 22:30:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::cloud_details(, "loon.ggplot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/loon.ggplot/new/loon.ggplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.ggplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.ggplot’ version ‘1.3.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘loon’

Package suggested but not available for checking: ‘zenplots’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/loon.ggplot/old/loon.ggplot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘loon.ggplot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘loon.ggplot’ version ‘1.3.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘loon’

Package suggested but not available for checking: ‘zenplots’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# marginaleffects

<details>

* Version: 0.8.1
* GitHub: https://github.com/vincentarelbundock/marginaleffects
* Source code: https://github.com/cran/marginaleffects
* Date/Publication: 2022-11-23 22:20:06 UTC
* Number of recursive dependencies: 348

Run `revdepcheck::cloud_details(, "marginaleffects")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/marginaleffects/new/marginaleffects.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘marginaleffects/DESCRIPTION’ ... OK
* this is package ‘marginaleffects’ version ‘0.8.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘tinytest.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘documentation.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/marginaleffects/old/marginaleffects.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘marginaleffects/DESCRIPTION’ ... OK
* this is package ‘marginaleffects’ version ‘0.8.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘spelling.R’
  Running ‘tinytest.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘documentation.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# modeltime

<details>

* Version: 1.2.4
* GitHub: https://github.com/business-science/modeltime
* Source code: https://github.com/cran/modeltime
* Date/Publication: 2022-11-16 12:10:28 UTC
* Number of recursive dependencies: 250

Run `revdepcheck::cloud_details(, "modeltime")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime/new/modeltime.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime/DESCRIPTION’ ... OK
* this is package ‘modeltime’ version ‘1.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime/old/modeltime.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime/DESCRIPTION’ ... OK
* this is package ‘modeltime’ version ‘1.2.4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

Package suggested but not available for checking: ‘rstan’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# modeltime.ensemble

<details>

* Version: 1.0.2
* GitHub: https://github.com/business-science/modeltime.ensemble
* Source code: https://github.com/cran/modeltime.ensemble
* Date/Publication: 2022-10-18 23:02:40 UTC
* Number of recursive dependencies: 220

Run `revdepcheck::cloud_details(, "modeltime.ensemble")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.ensemble/new/modeltime.ensemble.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.ensemble/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.ensemble’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- finished re-building ‘recursive-ensembles.Rmd’

SUMMARY: processing the following file failed:
  ‘getting-started-with-modeltime-ensemble.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.ensemble/old/modeltime.ensemble.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.ensemble/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.ensemble’ version ‘1.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
--- finished re-building ‘recursive-ensembles.Rmd’

SUMMARY: processing the following file failed:
  ‘getting-started-with-modeltime-ensemble.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
# modeltime.gluonts

<details>

* Version: 0.1.0
* GitHub: https://github.com/business-science/modeltime.gluonts
* Source code: https://github.com/cran/modeltime.gluonts
* Date/Publication: 2020-11-30 09:40:02 UTC
* Number of recursive dependencies: 211

Run `revdepcheck::cloud_details(, "modeltime.gluonts")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.gluonts/new/modeltime.gluonts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.gluonts/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.gluonts’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.gluonts/old/modeltime.gluonts.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.gluonts/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘modeltime.gluonts’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘getting-started.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# modeltime.h2o

<details>

* Version: 0.1.1
* GitHub: https://github.com/business-science/modeltime.h2o
* Source code: https://github.com/cran/modeltime.h2o
* Date/Publication: 2021-04-05 14:40:03 UTC
* Number of recursive dependencies: 211

Run `revdepcheck::cloud_details(, "modeltime.h2o")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.h2o/new/modeltime.h2o.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.h2o/DESCRIPTION’ ... OK
* this is package ‘modeltime.h2o’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.h2o/old/modeltime.h2o.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.h2o/DESCRIPTION’ ... OK
* this is package ‘modeltime.h2o’ version ‘0.1.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking for code/documentation mismatches ... OK
* checking Rd \usage sections ... OK
* checking Rd contents ... OK
* checking for unstated dependencies in examples ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: OK





```
# modeltime.resample

<details>

* Version: 0.2.2
* GitHub: https://github.com/business-science/modeltime.resample
* Source code: https://github.com/cran/modeltime.resample
* Date/Publication: 2022-10-18 03:00:06 UTC
* Number of recursive dependencies: 218

Run `revdepcheck::cloud_details(, "modeltime.resample")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/modeltime.resample/new/modeltime.resample.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.resample/DESCRIPTION’ ... OK
* this is package ‘modeltime.resample’ version ‘0.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
--- failed re-building ‘panel-data.Rmd’

SUMMARY: processing the following file failed:
  ‘panel-data.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/modeltime.resample/old/modeltime.resample.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘modeltime.resample/DESCRIPTION’ ... OK
* this is package ‘modeltime.resample’ version ‘0.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
--- failed re-building ‘panel-data.Rmd’

SUMMARY: processing the following file failed:
  ‘panel-data.Rmd’

Error: Vignette re-building failed.
Execution halted

* DONE
Status: 1 ERROR, 1 WARNING, 1 NOTE





```
# mpower

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/mpower
* Date/Publication: 2022-09-21 08:50:05 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "mpower")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/mpower/new/mpower.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mpower/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘mpower’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/mpower/old/mpower.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘mpower/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘mpower’ version ‘0.1.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# numbat

<details>

* Version: 1.2.1
* GitHub: https://github.com/kharchenkolab/numbat
* Source code: https://github.com/cran/numbat
* Date/Publication: 2023-01-11 00:20:02 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::cloud_details(, "numbat")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/numbat/new/numbat.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.2.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/numbat/old/numbat.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘numbat/DESCRIPTION’ ... OK
* this is package ‘numbat’ version ‘1.2.1’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Packages required but not available: 'ggtree', 'scistreer'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# OlinkAnalyze

<details>

* Version: 3.2.2
* GitHub: NA
* Source code: https://github.com/cran/OlinkAnalyze
* Date/Publication: 2022-11-16 00:30:05 UTC
* Number of recursive dependencies: 202

Run `revdepcheck::cloud_details(, "OlinkAnalyze")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/new/OlinkAnalyze.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘OlinkAnalyze’ version ‘3.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Vignett.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/OlinkAnalyze/old/OlinkAnalyze.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘OlinkAnalyze/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘OlinkAnalyze’ version ‘3.2.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘Vignett.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# ordbetareg

<details>

* Version: 0.5.0
* GitHub: https://github.com/saudiwin/ordbetareg_pack
* Source code: https://github.com/cran/ordbetareg
* Date/Publication: 2022-10-25 05:22:36 UTC
* Number of recursive dependencies: 183

Run `revdepcheck::cloud_details(, "ordbetareg")` for more info

</details>

## In both

*   checking whether package ‘ordbetareg’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/ordbetareg/new/ordbetareg.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘ordbetareg’ ...
** package ‘ordbetareg’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_mean’
Warning: namespace ‘ordbetareg’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_mean’
...
by .GlobalEnv when processing object ‘ord_fit_phi’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_phi’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘ordbetareg’
* removing ‘/tmp/workdir/ordbetareg/new/ordbetareg.Rcheck/ordbetareg’


```
### CRAN

```
* installing *source* package ‘ordbetareg’ ...
** package ‘ordbetareg’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_mean’
Warning: namespace ‘ordbetareg’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_mean’
...
by .GlobalEnv when processing object ‘ord_fit_phi’
Warning: namespace ‘rstan’ is not available and has been replaced
by .GlobalEnv when processing object ‘ord_fit_phi’
** inst
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for ‘brms’ in loadNamespace(j <- imp[[1L]], c(lib.loc, .libPaths()), versionCheck = vI[[j]]):
 there is no package called ‘rstan’
Execution halted
ERROR: lazy loading failed for package ‘ordbetareg’
* removing ‘/tmp/workdir/ordbetareg/old/ordbetareg.Rcheck/ordbetareg’


```
# Platypus

<details>

* Version: 3.4.1
* GitHub: NA
* Source code: https://github.com/cran/Platypus
* Date/Publication: 2022-08-15 07:20:20 UTC
* Number of recursive dependencies: 356

Run `revdepcheck::cloud_details(, "Platypus")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Platypus/new/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Packages suggested but not available for checking:
  'Matrix.utils', 'monocle3', 'ProjecTILs', 'SeuratWrappers'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Platypus/old/Platypus.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Platypus/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Platypus’ version ‘3.4.1’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking package dependencies ... ERROR
Package required but not available: ‘ggtree’

Packages suggested but not available for checking:
  'Matrix.utils', 'monocle3', 'ProjecTILs', 'SeuratWrappers'

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# RBesT

<details>

* Version: 1.6-4
* GitHub: NA
* Source code: https://github.com/cran/RBesT
* Date/Publication: 2022-08-08 13:40:24 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::cloud_details(, "RBesT")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/RBesT/new/RBesT.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RBesT/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘RBesT’ version ‘1.6-4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstan’

Package suggested but not available for checking: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/RBesT/old/RBesT.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RBesT/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘RBesT’ version ‘1.6-4’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstan’

Package suggested but not available for checking: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# rdss

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/rdss
* Date/Publication: 2023-01-17 17:40:02 UTC
* Number of recursive dependencies: 207

Run `revdepcheck::cloud_details(, "rdss")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/rdss/new/rdss.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rdss/DESCRIPTION’ ... OK
* this is package ‘rdss’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/rdss/old/rdss.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘rdss/DESCRIPTION’ ... OK
* this is package ‘rdss’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* DONE
Status: 1 NOTE





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# Robyn

<details>

* Version: 3.7.2
* GitHub: https://github.com/facebookexperimental/Robyn
* Source code: https://github.com/cran/Robyn
* Date/Publication: 2022-09-01 20:20:02 UTC
* Number of recursive dependencies: 139

Run `revdepcheck::cloud_details(, "Robyn")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/Robyn/new/Robyn.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Robyn/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Robyn’ version ‘3.7.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/Robyn/old/Robyn.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘Robyn/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘Robyn’ version ‘3.7.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘prophet’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# RVA

<details>

* Version: 0.0.5
* GitHub: https://github.com/THERMOSTATS/RVA
* Source code: https://github.com/cran/RVA
* Date/Publication: 2021-11-01 21:40:02 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "RVA")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/RVA/new/RVA.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/RVA/old/RVA.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘RVA/DESCRIPTION’ ... OK
* this is package ‘RVA’ version ‘0.0.5’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# SCpubr

<details>

* Version: 1.1.2
* GitHub: https://github.com/enblacar/SCpubr
* Source code: https://github.com/cran/SCpubr
* Date/Publication: 2023-01-18 12:20:02 UTC
* Number of recursive dependencies: 290

Run `revdepcheck::cloud_details(, "SCpubr")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/SCpubr/new/SCpubr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SCpubr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘SCpubr’ version ‘1.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘reference_manual.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 WARNING, 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/SCpubr/old/SCpubr.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘SCpubr/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘SCpubr’ version ‘1.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘reference_manual.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 WARNING, 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# sjPlot

<details>

* Version: 2.8.12
* GitHub: https://github.com/strengejacke/sjPlot
* Source code: https://github.com/cran/sjPlot
* Date/Publication: 2022-11-19 22:20:02 UTC
* Number of recursive dependencies: 186

Run `revdepcheck::cloud_details(, "sjPlot")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sjPlot/new/sjPlot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sjPlot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sjPlot’ version ‘2.8.12’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘plot_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘sjtitemanalysis.Rmd’ using ‘UTF-8’... OK
  ‘tab_bayes.Rmd’ using ‘UTF-8’... OK
  ‘tab_mixed.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_robust.Rmd’ using ‘UTF-8’... OK
  ‘table_css.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/sjPlot/old/sjPlot.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sjPlot/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘sjPlot’ version ‘2.8.12’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  ‘plot_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘sjtitemanalysis.Rmd’ using ‘UTF-8’... OK
  ‘tab_bayes.Rmd’ using ‘UTF-8’... OK
  ‘tab_mixed.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_estimates.Rmd’ using ‘UTF-8’... OK
  ‘tab_model_robust.Rmd’ using ‘UTF-8’... OK
  ‘table_css.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# sknifedatar

<details>

* Version: 0.1.2
* GitHub: https://github.com/rafzamb/sknifedatar
* Source code: https://github.com/cran/sknifedatar
* Date/Publication: 2021-06-01 08:00:02 UTC
* Number of recursive dependencies: 180

Run `revdepcheck::cloud_details(, "sknifedatar")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/sknifedatar/new/sknifedatar.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sknifedatar/DESCRIPTION’ ... OK
* this is package ‘sknifedatar’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
* DONE
Status: OK





```
### CRAN

```
* using log directory ‘/tmp/workdir/sknifedatar/old/sknifedatar.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘sknifedatar/DESCRIPTION’ ... OK
* this is package ‘sknifedatar’ version ‘0.1.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... OK
...
* checking contents of ‘data’ directory ... OK
* checking data for non-ASCII characters ... OK
* checking LazyData ... OK
* checking data for ASCII and uncompressed saves ... OK
* checking examples ... OK
* checking for unstated dependencies in ‘tests’ ... OK
* checking tests ... OK
  Running ‘spelling.R’
* DONE
Status: OK





```
# statsExpressions

<details>

* Version: 1.4.0
* GitHub: https://github.com/IndrajeetPatil/statsExpressions
* Source code: https://github.com/cran/statsExpressions
* Date/Publication: 2023-01-14 20:20:02 UTC
* Number of recursive dependencies: 152

Run `revdepcheck::cloud_details(, "statsExpressions")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/statsExpressions/new/statsExpressions.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘statsExpressions/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘statsExpressions’ version ‘1.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘statsExpressions.Rmd’ using ‘UTF-8’... OK
  ‘stats_details.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/statsExpressions/old/statsExpressions.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘statsExpressions/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘statsExpressions’ version ‘1.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
...
  Error: Test failures
  Execution halted
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘statsExpressions.Rmd’ using ‘UTF-8’... OK
  ‘stats_details.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 ERROR, 1 NOTE





```
# tidybayes

<details>

* Version: 3.0.2
* GitHub: https://github.com/mjskay/tidybayes
* Source code: https://github.com/cran/tidybayes
* Date/Publication: 2022-01-05 06:10:02 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "tidybayes")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidybayes/new/tidybayes.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybayes/DESCRIPTION’ ... OK
* this is package ‘tidybayes’ version ‘3.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy-brms.Rmd’ using ‘UTF-8’... OK
  ‘tidy-posterior.Rmd’ using ‘UTF-8’... OK
  ‘tidy-rstanarm.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes-residuals.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidybayes/old/tidybayes.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidybayes/DESCRIPTION’ ... OK
* this is package ‘tidybayes’ version ‘3.0.2’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘tidy-brms.Rmd’ using ‘UTF-8’... OK
  ‘tidy-posterior.Rmd’ using ‘UTF-8’... OK
  ‘tidy-rstanarm.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes-residuals.Rmd’ using ‘UTF-8’... OK
  ‘tidybayes.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# tidyposterior

<details>

* Version: 1.0.0
* GitHub: https://github.com/tidymodels/tidyposterior
* Source code: https://github.com/cran/tidyposterior
* Date/Publication: 2022-06-23 20:20:02 UTC
* Number of recursive dependencies: 170

Run `revdepcheck::cloud_details(, "tidyposterior")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tidyposterior/new/tidyposterior.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidyposterior/DESCRIPTION’ ... OK
* this is package ‘tidyposterior’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tidyposterior/old/tidyposterior.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tidyposterior/DESCRIPTION’ ... OK
* this is package ‘tidyposterior’ version ‘1.0.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘rstanarm’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# timetk

<details>

* Version: 2.8.2
* GitHub: https://github.com/business-science/timetk
* Source code: https://github.com/cran/timetk
* Date/Publication: 2022-11-17 19:30:02 UTC
* Number of recursive dependencies: 223

Run `revdepcheck::cloud_details(, "timetk")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/timetk/new/timetk.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘timetk/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘timetk’ version ‘2.8.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘TK04_Plotting_Time_Series.Rmd’ using ‘UTF-8’... OK
  ‘TK07_Time_Series_Data_Wrangling.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
### CRAN

```
* using log directory ‘/tmp/workdir/timetk/old/timetk.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘timetk/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘timetk’ version ‘2.8.2’
* package encoding: UTF-8
* checking package namespace information ... OK
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘TK04_Plotting_Time_Series.Rmd’ using ‘UTF-8’... OK
  ‘TK07_Time_Series_Data_Wrangling.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 1 NOTE





```
# tinyarray

<details>

* Version: 2.2.7
* GitHub: https://github.com/xjsun1221/tinyarray
* Source code: https://github.com/cran/tinyarray
* Date/Publication: 2021-11-08 10:00:02 UTC
* Number of recursive dependencies: 228

Run `revdepcheck::cloud_details(, "tinyarray")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/tinyarray/new/tinyarray.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tinyarray/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tinyarray’ version ‘2.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/tinyarray/old/tinyarray.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘tinyarray/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘tinyarray’ version ‘2.2.7’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘clusterProfiler’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
# vivid

<details>

* Version: 0.2.3
* GitHub: NA
* Source code: https://github.com/cran/vivid
* Date/Publication: 2021-11-20 01:30:02 UTC
* Number of recursive dependencies: 206

Run `revdepcheck::cloud_details(, "vivid")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/vivid/new/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘vivid.Rmd’ using ‘UTF-8’... OK
  ‘vividQStart.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
### CRAN

```
* using log directory ‘/tmp/workdir/vivid/old/vivid.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘vivid/DESCRIPTION’ ... OK
* this is package ‘vivid’ version ‘0.2.3’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... NOTE
...
* checking tests ... OK
  Running ‘testthat.R’
* checking for unstated dependencies in vignettes ... OK
* checking package vignettes in ‘inst/doc’ ... OK
* checking running R code from vignettes ... NONE
  ‘vivid.Rmd’ using ‘UTF-8’... OK
  ‘vividQStart.Rmd’ using ‘UTF-8’... OK
* checking re-building of vignette outputs ... OK
* DONE
Status: 2 NOTEs





```
# NA

<details>

* Version: NA
* GitHub: NA
* Source code: https://github.com/cran/NA
* Number of recursive dependencies: 0

Run `revdepcheck::cloud_details(, "NA")` for more info

</details>

## Error before installation

### Devel

```






```
### CRAN

```






```
# xpose.nlmixr2

<details>

* Version: 0.4.0
* GitHub: NA
* Source code: https://github.com/cran/xpose.nlmixr2
* Date/Publication: 2022-06-08 09:10:02 UTC
* Number of recursive dependencies: 161

Run `revdepcheck::cloud_details(, "xpose.nlmixr2")` for more info

</details>

## Error before installation

### Devel

```
* using log directory ‘/tmp/workdir/xpose.nlmixr2/new/xpose.nlmixr2.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘xpose.nlmixr2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘xpose.nlmixr2’ version ‘0.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘nlmixr2est’

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
### CRAN

```
* using log directory ‘/tmp/workdir/xpose.nlmixr2/old/xpose.nlmixr2.Rcheck’
* using R version 4.1.1 (2021-08-10)
* using platform: x86_64-pc-linux-gnu (64-bit)
* using session charset: UTF-8
* using option ‘--no-manual’
* checking for file ‘xpose.nlmixr2/DESCRIPTION’ ... OK
* checking extension type ... Package
* this is package ‘xpose.nlmixr2’ version ‘0.4.0’
* package encoding: UTF-8
* checking package namespace information ... OK
* checking package dependencies ... ERROR
Package required but not available: ‘nlmixr2est’

Package suggested but not available for checking: ‘nlmixr2’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
* DONE
Status: 1 ERROR





```
