# amt

<details>

* Version: 0.1.1
* Source code: https://github.com/cran/amt
* URL: https://github.com/jmsigner/amt
* Date/Publication: 2020-04-28 12:10:02 UTC
* Number of recursive dependencies: 167

Run `cloud_details(, "amt")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘amt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hr_to_sf
    > ### Title: Convert
    > ### Aliases: hr_to_sf hr_to_sf.tbl_df
    > 
    > ### ** Examples
    > 
    > 
    > data("amt_fisher")
    > hr <- amt_fisher %>% nest(data = -id) %>%
    +   mutate(hr = map(data, hr_mcp), n = map_int(data, nrow)) %>%
    +   hr_to_sf(hr, id, n)
    Error in UseMethod("hr_mcp", x) : 
      no applicable method for 'hr_mcp' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: %>% ... mutate -> mutate.tbl_df -> mutate_impl -> map -> .f
    Execution halted
    ```

# cutpointr

<details>

* Version: 1.0.2
* Source code: https://github.com/cran/cutpointr
* URL: https://github.com/thie1e/cutpointr
* BugReports: https://github.com/thie1e/cutpointr/issues
* Date/Publication: 2020-04-14 08:50:10 UTC
* Number of recursive dependencies: 78

Run `cloud_details(, "cutpointr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cutpointr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: maximize_boot_metric
    > ### Title: Optimize a metric function in binary classification after
    > ###   bootstrapping
    > ### Aliases: maximize_boot_metric minimize_boot_metric
    > 
    > ### ** Examples
    > 
    > set.seed(100)
    > cutpointr(suicide, dsi, suicide, method = maximize_boot_metric,
    +           metric = accuracy, boot_cut = 30)
    Assuming the positive class is yes
    Assuming the positive class has higher x values
    Error in UseMethod("auc", x) : 
      no applicable method for 'auc' applied to an object of class "c('tbl_df', 'tbl', 'data.frame')"
    Calls: cutpointr -> cutpointr.default -> cutpointr_internal -> auc
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       10. cutpointr:::cutpointr.default(...)
       13. cutpointr:::cutpointr_internal(...)
       14. cutpointr::auc(optcut$roc_curve[[1]])
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 360 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 6 ]
      1. Error: no duplicate column names are returned (@test-cutpointr.R#163) 
      2. Error: Metric colnames that are already in cutpointr are modified (@test-cutpointr.R#300) 
      3. Error: bootstrapped cutpoints lead to plausible results (@test-cutpointr.R#927) 
      4. Error: cutpointr works with custom method function (@test-cutpointr.R#1116) 
      5. Error: summary is printed correctly (@test-cutpointr.R#1195) 
      6. Error: cutpointr works if method / metric are called with :: (@test-cutpointr.R#1291) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# processR

<details>

* Version: 0.2.3
* Source code: https://github.com/cran/processR
* URL: https://github.com/cardiomoon/processR
* BugReports: https://github.com/cardiomoon/processR/issues
* Date/Publication: 2020-01-27 14:10:02 UTC
* Number of recursive dependencies: 165

Run `cloud_details(, "processR")` for more info

</details>

## Newly broken

*   checking whether package ‘processR’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: 'rgl.init' failed, running with 'rgl.useNULL = TRUE'.
    See ‘/tmp/workdir/processR/new/processR.Rcheck/00install.out’ for details.
    ```

# SEERaBomb

<details>

* Version: 2019.2
* Source code: https://github.com/cran/SEERaBomb
* URL: http://epbi-radivot.cwru.edu/SEERaBomb/SEERaBomb.html
* Date/Publication: 2019-12-12 18:50:03 UTC
* Number of recursive dependencies: 149

Run `cloud_details(, "SEERaBomb")` for more info

</details>

## Newly broken

*   checking whether package ‘SEERaBomb’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: 'rgl.init' failed, running with 'rgl.useNULL = TRUE'.
    See ‘/tmp/workdir/SEERaBomb/new/SEERaBomb.Rcheck/00install.out’ for details.
    ```

