#' Argument type: tidy-select
#'
#' @description
#' This page the describes the `<tidy-select>` argument modifier which indicates
#' the argument uses **tidy selection** (a special type of tidy evaluation).
#' Tidy selection provides a concise DSL for selecting variables based on their
#' names.
#'
#' # Overview of selection features
#'
#' ```{r, child = "man/rmd/overview.Rmd"}
#' ```
#'
#' # Indirection
#'
#' There are two main cases:
#'
#' *   If you have a character vector of column names, use `all_of()`
#'     or `any_of()`, depending on whether or not you want unknown variable
#'     names to cause an error, e.g `unnest(df, all_of(vars))`,
#'     `unnest(df, !any_of(vars))`.
#'
#' *   If you want the user to supply a tidyselect specification in a
#'     function argument, you need to tunnel the selection through the function
#'     argument. This is done by embracing the function argument `{{ }}`,
#'     e.g `unnest(df, {{ vars }})`.
#'
#' Learn more in `vignette("programming.Rmd")`.
#'
#' @keywords internal
#' @name tidyr_tidy_select
NULL
