# ggseg

<details>

* Version: 1.6.4
* GitHub: https://github.com/ggseg/ggseg
* Source code: https://github.com/cran/ggseg
* Date/Publication: 2021-09-03 12:20:09 UTC
* Number of recursive dependencies: 125

Run `cloud_details(, "ggseg")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggseg-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ggseg
    > ### Title: ggseg: Plot brain segmentations with ggplot and plotly
    > ### Aliases: ggseg ggseg-package
    > ### Keywords: internal
    > 
    > ### ** Examples
    > 
    ...
      4.     └─ggseg::ggseg_atlas(dt)
      5.       └─ggseg:::brain_polygon(x$ggseg)
      6.         └─vctrs::vec_cast(x, list())
      7.           └─(function () ...
      8.             └─vctrs::vec_default_cast(...)
      9.               └─vctrs::stop_incompatible_cast(...)
     10.                 └─vctrs::stop_incompatible_type(...)
     11.                   └─vctrs:::stop_incompatible(...)
     12.                     └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      * scale_brain/geom-scale-brain2.svg
      * scale_brain/geom-scale-color-brain2.svg
      * scale_brain/geom-scale-colour-brain2.svg
      * scale_brain/geom-scale-fill-brain2.svg
      * scale_brain/ggseg-scale-brain-colour.svg
      * scale_brain/ggseg-scale-brain-fill.svg
      * scale_brain/ggseg-scale-color-brain.svg
      * scale_brain/ggseg-scale-colour-brain.svg
      * scale_brain/ggseg-scale-fill-brain.svg
      * theme_brain/theme-brain.svg
      * theme_brain/theme-brain2.svg
      * theme_brain/theme-custombrain.svg
      * theme_brain/theme-darkbrain.svg
      Error: Test failures
      Execution halted
    ```

# inspectdf

<details>

* Version: 0.0.11
* GitHub: https://github.com/alastairrushworth/inspectdf
* Source code: https://github.com/cran/inspectdf
* Date/Publication: 2021-04-02 12:00:02 UTC
* Number of recursive dependencies: 59

Run `cloud_details(, "inspectdf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘inspectdf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: inspect_types
    > ### Title: Summary and comparison of column types
    > ### Aliases: inspect_types
    > 
    > ### ** Examples
    > 
    > # Load dplyr for starwars data & pipe
    ...
     13. │           └─vctrs::vec_default_cast(...)
     14. │             └─vctrs::stop_incompatible_cast(...)
     15. │               └─vctrs::stop_incompatible_type(...)
     16. │                 └─vctrs:::stop_incompatible(...)
     17. │                   └─vctrs:::stop_vctrs(...)
     18. │                     └─rlang::abort(message, class = c(class, "vctrs_error"), ...)
     19. │                       └─rlang:::signal_abort(cnd)
     20. │                         └─base::signalCondition(cnd)
     21. └─(function (cnd) ...
    Execution halted
    ```

# isoreader

<details>

* Version: 1.3.1
* GitHub: https://github.com/isoverse/isoreader
* Source code: https://github.com/cran/isoreader
* Date/Publication: 2021-10-15 20:20:02 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "isoreader")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        6. ├─isoreader::iso_get_data(iso_file)
        7. │ └─isoreader::iso_get_all_data(...)
        8. │   └─`%>%`(...)
        9. └─isoreader:::merge_with_file_class(., "file_info")
       10.   └─dplyr::bind_rows(...)
       11.     └─vctrs::vec_rbind(!!!dots, .names_to = .id)
       12.       └─(function () ...
       13.         └─vctrs::vec_default_ptype2(...)
       14.           └─vctrs::stop_incompatible_type(...)
       15.             └─vctrs:::stop_incompatible(...)
       16.               └─vctrs:::stop_vctrs(...)
      
      [ FAIL 1 | WARN 0 | SKIP 9 | PASS 815 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Missing or unexported object: ‘glue::collapse’
    ```

# PKNCA

<details>

* Version: 0.9.5
* GitHub: https://github.com/billdenney/pknca
* Source code: https://github.com/cran/PKNCA
* Date/Publication: 2021-10-29 19:50:02 UTC
* Number of recursive dependencies: 74

Run `cloud_details(, "PKNCA")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      prepare_PKNCAintervals(.dat = tmp_intervals, vars = "g") not equal to tibble::tibble(g = "A", data_intervals = list(tibble::as_tibble(PKNCA.options("single.dose.aucs")))).
      Component "data_intervals": Attributes: < Modes: list, NULL >
      Component "data_intervals": Attributes: < Lengths: 2, 0 >
      Component "data_intervals": Attributes: < names for target but not for current >
      Component "data_intervals": Attributes: < current is not list-like >
      ── Failure (test-prepare_data.R:66:3): full_join for PKNCAconc, PKNCAdose, and PKNCAdata ──
      full_join_PKNCAdata(o_data) not equal to tidyr::crossing(..., data_intervals = list(as_tibble(PKNCA.options("single.dose.aucs")))).
      Component "data_intervals": Attributes: < Modes: list, NULL >
      Component "data_intervals": Attributes: < Lengths: 2, 0 >
      Component "data_intervals": Attributes: < names for target but not for current >
      Component "data_intervals": Attributes: < current is not list-like >
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 1336 ]
      Error: Test failures
      Execution halted
    ```

# ssimparser

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/ssimparser
* Date/Publication: 2021-05-11 09:10:02 UTC
* Number of recursive dependencies: 23

Run `cloud_details(, "ssimparser")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ssimparser-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: load_ssim
    > ### Title: load_ssim
    > ### Aliases: load_ssim
    > 
    > ### ** Examples
    > 
    > # Get a sample as a character vector
    ...
      9.             └─vctrs::df_cast(x, to, ...)
     10.               └─(function () ...
     11.                 └─vctrs:::df_lossy_cast(out = out, x = x, to = to)
     12.                   └─vctrs::maybe_lossy_cast(...)
     13.                     ├─base::withRestarts(...)
     14.                     │ └─base:::withOneRestart(expr, restarts[[1L]])
     15.                     │   └─base:::doWithOneRestart(return(expr), restart)
     16.                     └─vctrs:::stop_lossy_cast(...)
     17.                       └─vctrs:::stop_vctrs(...)
    Execution halted
    ```

