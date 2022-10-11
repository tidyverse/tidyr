# batchtma

<details>

* Version: 0.1.6
* GitHub: https://github.com/stopsack/batchtma
* Source code: https://github.com/cran/batchtma
* Date/Publication: 2021-12-06 08:10:02 UTC
* Number of recursive dependencies: 106

Run `cloud_details(, "batchtma")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘batchtma-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: adjust_batch
    > ### Title: Adjust for batch effects
    > ### Aliases: adjust_batch
    > 
    > ### ** Examples
    > 
    > # Data frame with two batches
    ...
    > adjust_batch(
    +   data = df,
    +   markers = biomarker,
    +   batch = tma,
    +   method = simple
    + )
    Error in tidyr::pivot_longer(., col = c(-.data$.batchvar), names_to = "marker",  : 
      argument 2 matches multiple formal arguments
    Calls: adjust_batch -> batchmean_simple -> %>%
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘batchtma.Rmd’ using rmarkdown
    ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
    ✔ ggplot2 3.3.5          ✔ purrr   0.3.4     
    ✔ tibble  3.1.6          ✔ dplyr   1.0.8     
    ✔ tidyr   1.2.0.9000     ✔ stringr 1.4.0     
    ✔ readr   2.1.2          ✔ forcats 0.5.1     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ...
    Quitting from lines 92-96 (batchtma.Rmd) 
    Error: processing vignette 'batchtma.Rmd' failed with diagnostics:
    argument 2 matches multiple formal arguments
    --- failed re-building ‘batchtma.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘batchtma.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# dartR

<details>

* Version: 2.0.3
* GitHub: NA
* Source code: https://github.com/cran/dartR
* Date/Publication: 2022-03-28 14:50:02 UTC
* Number of recursive dependencies: 274

Run `cloud_details(, "dartR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dartR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gl.report.pa
    > ### Title: Reports private alleles (and fixed alleles) per pair of
    > ###   populations
    > ### Aliases: gl.report.pa
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─dartR::gl.report.pa(testset.gl[1:20, ])
     2. │ ├─tidyr::pivot_longer(data_long, -source, "target")
     3. │ └─tidyr:::pivot_longer.data.frame(data_long, -source, "target")
     4. │   └─tidyr::pivot_longer_spec(...)
     5. │     └─rlang::arg_match0(...)
     6. └─rlang:::stop_arg_match(w, x, y, z)
     7.   └─rlang::abort(msg, call = error_call)
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘IntroTutorial_dartR.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(). If it fails to upgrade, you might be using a default random CTAN mirror that has not been fully synced to the main CTAN repository, and you need to wait for a few more days or use a CTAN mirror that is known to be up-to-date (see the "repository" argument on the help page ?tinytex::install_tinytex).
    
    tlmgr: Local TeX Live (2021) is older than remote repository (2022).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/tcolorbox.sty'' had status 1
    ...
    --- failed re-building ‘IntroTutorial_dartR.Rmd’
    
    --- re-building ‘dartRTutorials.Rmd’ using rmarkdown
    --- finished re-building ‘dartRTutorials.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘IntroTutorial_dartR.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.0Mb
      sub-directories of 1Mb or more:
        R      1.1Mb
        data   1.5Mb
    ```

# faux

<details>

* Version: 1.1.0
* GitHub: https://github.com/debruine/faux
* Source code: https://github.com/cran/faux
* Date/Publication: 2021-09-13 21:40:02 UTC
* Number of recursive dependencies: 133

Run `cloud_details(, "faux")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘codebook.Rmd’ using rmarkdown
    
    ************
    Welcome to faux. For support and examples visit:
    https://debruine.github.io/faux/
    - Get and set global package options with: faux_options()
    ************
    --- finished re-building ‘codebook.Rmd’
    
    ...
    https://debruine.github.io/faux/
    - Get and set global package options with: faux_options()
    ************
    --- finished re-building ‘sim_df.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘continuous.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# simpr

<details>

* Version: 0.2.2
* GitHub: https://github.com/statisfactions/simpr
* Source code: https://github.com/cran/simpr
* Date/Publication: 2022-02-13 00:40:02 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "simpr")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    pivot_longer:
      function(data, cols, cols_vary, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    pivot_longer.simpr_sims:
      function(data, cols, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    ...
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    pivot_longer.simpr_spec:
      function(data, cols, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

# sparklyr

<details>

* Version: 1.7.5
* GitHub: https://github.com/sparklyr/sparklyr
* Source code: https://github.com/cran/sparklyr
* Date/Publication: 2022-02-02 14:30:02 UTC
* Number of recursive dependencies: 107

Run `cloud_details(, "sparklyr")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    pivot_longer:
      function(data, cols, cols_vary, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    pivot_longer.tbl_spark:
      function(data, cols, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        R      1.5Mb
        java   3.4Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘lifecycle’
      All declared Imports should be used.
    ```

# tidyseurat

<details>

* Version: 0.5.1
* GitHub: https://github.com/stemangiola/tidyseurat
* Source code: https://github.com/cran/tidyseurat
* Date/Publication: 2022-02-03 13:20:02 UTC
* Number of recursive dependencies: 186

Run `cloud_details(, "tidyseurat")` for more info

</details>

## Newly broken

*   checking S3 generic/method consistency ... WARNING
    ```
    pivot_longer:
      function(data, cols, cols_vary, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    pivot_longer.Seurat:
      function(data, cols, names_to, names_prefix, names_sep,
               names_pattern, names_ptypes, names_transform, names_repair,
               values_to, values_drop_na, values_ptypes, values_transform,
               ...)
    
    See section ‘Generic functions and methods’ in the ‘Writing R
    Extensions’ manual.
    ```

