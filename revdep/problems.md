# cogmapr

<details>

* Version: 0.9.2
* GitHub: NA
* Source code: https://github.com/cran/cogmapr
* Date/Publication: 2021-11-20 16:20:02 UTC
* Number of recursive dependencies: 113

Run `cloud_details(, "cogmapr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cogmapr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: RelationshipTest
    > ### Title: Compare relationships weight between maps
    > ### Aliases: RelationshipTest
    > 
    > ### ** Examples
    > 
    > project_name <- "a_new_project"
    ...
      3. ├─tidyr::replace_na(., list(p.value = "NR"))
      4. └─tidyr:::replace_na.data.frame(., list(p.value = "NR"))
      5.   └─vctrs::vec_assign(...)
      6.     └─(function () ...
      7.       └─vctrs::vec_default_cast(...)
      8.         └─vctrs::stop_incompatible_cast(...)
      9.           └─vctrs::stop_incompatible_type(...)
     10.             └─vctrs:::stop_incompatible(...)
     11.               └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        4. ├─cogmapr::RelationshipTest(project, units = c("Belgium", "Québec"))
        5. │ └─`%>%`(...)
        6. ├─tidyr::replace_na(., list(p.value = "NR"))
        7. └─tidyr:::replace_na.data.frame(., list(p.value = "NR"))
        8.   └─vctrs::vec_assign(...)
        9.     └─(function () ...
       10.       └─vctrs::vec_default_cast(...)
       11.         └─vctrs::stop_incompatible_cast(...)
       12.           └─vctrs::stop_incompatible_type(...)
       13.             └─vctrs:::stop_incompatible(...)
       14.               └─vctrs:::stop_vctrs(...)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 17 ]
      Error: Test failures
      Execution halted
    ```

# dartR

<details>

* Version: 1.9.9.1
* GitHub: NA
* Source code: https://github.com/cran/dartR
* Date/Publication: 2021-05-28 17:10:05 UTC
* Number of recursive dependencies: 195

Run `cloud_details(, "dartR")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘dartR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: gl.pcoa.plot
    > ### Title: Bivariate plot of the results of an ordination generated using
    > ###   gl.pcoa()
    > ### Aliases: gl.pcoa.plot
    > 
    > ### ** Examples
    > 
    ...
      While waiting, returning ggplot compliant object
    Completed: gl.pcoa.plot 
    Starting gl.pcoa.plot 
      Displaying an interactive plot
        NOTE: Returning the ordination scores, not a ggplot2 compatable object
    Ignore any warning on the number of shape categories
      Preparing plot .... please wait
    Error: `gather_()` was deprecated in tidyr 1.2.0 and is now defunct.
    Please use `gather()` instead.
    Execution halted
    ```

# InjurySeverityScore

<details>

* Version: 0.0.0.2
* GitHub: https://github.com/dajuntian/InjurySeverityScore
* Source code: https://github.com/cran/InjurySeverityScore
* Date/Publication: 2019-05-19 04:11:18 UTC
* Number of recursive dependencies: 20

Run `cloud_details(, "InjurySeverityScore")` for more info

</details>

## Newly broken

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

## Newly fixed

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘tidyr’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# modeltime.resample

<details>

* Version: 0.2.0
* GitHub: https://github.com/business-science/modeltime.resample
* Source code: https://github.com/cran/modeltime.resample
* Date/Publication: 2021-03-14 20:40:07 UTC
* Number of recursive dependencies: 212

Run `cloud_details(, "modeltime.resample")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        1. ├─m750_models_resample %>% plot_modeltime_resamples(.interactive = TRUE) test-modeltime_fit_resamples.R:116:4
        2. └─modeltime.resample::plot_modeltime_resamples(., .interactive = TRUE)
        3.   ├─plotly::ggplotly(g)
        4.   └─plotly:::ggplotly.ggplot(g)
        5.     └─plotly::gg2list(...)
        6.       └─plotly:::layers2traces(data, prestats_data, layout, plot)
        7.         ├─plotly::to_basic(...)
        8.         └─plotly:::to_basic.GeomVline(...)
        9.           └─tidyr::gather_(...)
       10.             └─lifecycle::deprecate_stop("1.2.0", "gather_()", "gather()")
       11.               └─lifecycle:::deprecate_stop0(msg)
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 16 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘crayon’ ‘dials’ ‘glue’ ‘parsnip’
      All declared Imports should be used.
    ```

