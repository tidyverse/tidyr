#' Argument type: tidy-select
#'
#' @description
#' This page the describes the `<tidy-select>` argument modifier which indicates
#' the argument uses tidy evaluation with **tidy selection**. Tidy selection
#' provides a concise DSL for selecting variables based on their names.
#' If you've never head of tidy evaluation before, start with
#' `vignette("programming")`.
#'
#' # General usage
#'
#' If you have a data frame with variables `apple`, `banana`, `cantelope`,
#' `date`, `eggplant`, `fig`, `grape` you can:
#'
#' * Select individual variables with their name: e.g. `c(apple, fig, grape)`.
#'
#' * Select data-variables stored in a env-variable with `all_of()` (which
#'   will error if a variable is not found) or `any_of()` (which is
#'   relaxed and will silently drop missing variables), e.g.
#'   if `vars <- c("apple", "fig", "peach")`, then `all_of(vars)` will
#'   error; `any_of(vars)` will select `apple` and `fig`.
#'
#' * Select contiguous variables with `:`, e.g. `apple:date`.
#'
#' * Select variables with named-based helpers: e.g. `ends_with("a")`,
#'   `contains("g")`. See full list in [tidyselect::select_helpers].
#'
#' * Select variables of a given type with a `is` function: `is.numeric`,
#'   `is.factor`, `is.character`, etc.
#'
#' * Invert a selection with `!`: `!is.numeric`, or `!contains("x")`.
#'
#' * Create logical combination with `|` and `&`:
#'   `starts_with("a") | starts_with("b")`, `contains("x") & is.numeric`
#'
#' * Remove variables from a collection with `&` and `!`:
#'   `is.numeric & !starts_with("a")`
#'
#' # Indirection
#'
#' There are two main cases:
#'
#' *   If you have a character vector of column names, use `all_of()`
#'     or `any_of()`, depending on whether or not you want unknown variable
#'     names to cause an error, e.g `unnest(df, all_of(vars))`,
#'     `unnest(df, -any_of(vars))`.
#'
#' *   If you you want the user to supply a tidyselect specification in a
#'     function argument, embrace the function argument, e.g
#'     `unnest(df, {{ vars }})`.
#'
#' @keywords internal
#' @name tidyr_tidy_select
NULL
