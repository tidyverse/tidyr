# EpiNow2

<details>

* Version: 1.3.2
* GitHub: https://github.com/epiforecasts/EpiNow2
* Source code: https://github.com/cran/EpiNow2
* Date/Publication: 2020-12-14 09:00:15 UTC
* Number of recursive dependencies: 153

Run `cloud_details(, "EpiNow2")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is 265.8Mb
      sub-directories of 1Mb or more:
        libs  264.0Mb
    ```

## Newly fixed

*   checking whether package ‘EpiNow2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/EpiNow2/old/EpiNow2.Rcheck/00install.out’ for details.
    ```

# rMorningStar

<details>

* Version: 1.0.7
* GitHub: NA
* Source code: https://github.com/cran/rMorningStar
* Date/Publication: 2021-01-16 12:30:05 UTC
* Number of recursive dependencies: 76

Run `cloud_details(, "rMorningStar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rMorningStar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ms.LastClose
    > ### Title: ms.LastClose
    > ### Aliases: ms.LastClose
    > 
    > ### ** Examples
    > 
    > ms.LastClose('FXAIX')
    Error in open.connection(x, "rb") : HTTP error 503.
    Calls: ms.LastClose ... %>% -> html_table -> read_html -> read_html.default
    Execution halted
    ```

