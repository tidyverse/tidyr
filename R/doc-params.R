#' Argument type: data-masking
#'
#' @description
#' This page describes the `<data-masking>` argument modifier which
#' indicates that the argument uses **data masking**, a sub-type of
#' tidy evaluation. If you've never heard of tidy evaluation before,
#' start with the practical introduction in
#' <https://r4ds.hadley.nz/functions.html#data-frame-functions> then
#' then read more about the underlying theory in
#' <https://rlang.r-lib.org/reference/topic-data-mask.html>.
#'
#' # Key techniques
#'
#' *  To allow the user to supply the column name in a function argument,
#'    embrace the argument, e.g. `filter(df, {{ var }})`.
#'
#'    ```R
#'    dist_summary <- function(df, var) {
#'      df %>%
#'        summarise(n = n(), min = min({{ var }}), max = max({{ var }}))
#'    }
#'    mtcars %>% dist_summary(mpg)
#'    mtcars %>% group_by(cyl) %>% dist_summary(mpg)
#'    ```
#'
#' *  To work with a column name recorded as a string, use the `.data`
#'    pronoun, e.g. `summarise(df, mean = mean(.data[[var]]))`.
#'
#'    ```R
#'    for (var in names(mtcars)) {
#'      mtcars %>% count(.data[[var]]) %>% print()
#'    }
#'
#'    lapply(names(mtcars), function(var) mtcars %>% count(.data[[var]]))
#'    ```
#'
#' *  To suppress `R CMD check` `NOTE`s about unknown variables
#'    use `.data$var` instead of `var`:
#'
#'    ```R
#'    # has NOTE
#'    df %>% mutate(z = x + y)
#'
#'    # no NOTE
#'    df %>% mutate(z = .data$x + .data$y)
#'    ```
#'
#'    You'll also need to import `.data` from rlang with (e.g.)
#'    `@importFrom rlang .data`.
#'
#' # Dot-dot-dot (...)
#'
#' `...` automatically provides indirection, so you can use it as is
#' (i.e. without embracing) inside a function:
#'
#' ```
#' grouped_mean <- function(df, var, ...) {
#'   df %>%
#'     group_by(...) %>%
#'     summarise(mean = mean({{ var }}))
#' }
#' ```
#'
#' You can also use `:=` instead of `=` to enable a glue-like syntax for
#' creating variables from user supplied data:
#'
#' ```
#' var_name <- "l100km"
#' mtcars %>% mutate("{var_name}" := 235 / mpg)
#'
#' summarise_mean <- function(df, var) {
#'   df %>%
#'     summarise("mean_of_{{var}}" := mean({{ var }}))
#' }
#' mtcars %>% group_by(cyl) %>% summarise_mean(mpg)
#' ```
#'
#' Learn more in <https://rlang.r-lib.org/reference/topic-data-mask-programming.html>.
#'
#' @keywords internal
#' @name tidyr_data_masking
NULL


#' Argument type: tidy-select
#'
#' @description
#' This page describes the `<tidy-select>` argument modifier which
#' indicates that the argument uses **tidy selection**, a sub-type of
#' tidy evaluation. If you've never heard of tidy evaluation before,
#' start with the practical introduction in
#' <https://r4ds.hadley.nz/functions.html#data-frame-functions> then
#' then read more about the underlying theory in
#' <https://rlang.r-lib.org/reference/topic-data-mask.html>.
#'
#' # Overview of selection features
#'
#' ```{r, child = "man/rmd/overview.Rmd"}
#' ```
#'
#' # Key techniques
#'
#' *   If you want the user to supply a tidyselect specification in a
#'     function argument, you need to tunnel the selection through the function
#'     argument. This is done by embracing the function argument `{{ }}`,
#'     e.g `unnest(df, {{ vars }})`.
#'
#' *   If you have a character vector of column names, use `all_of()`
#'     or `any_of()`, depending on whether or not you want unknown variable
#'     names to cause an error, e.g `unnest(df, all_of(vars))`,
#'     `unnest(df, !any_of(vars))`.
#'
#' *   To suppress `R CMD check` `NOTE`s about unknown variables use `"var"`
#'     instead of `var`:
#'
#'    ```R
#'    # has NOTE
#'    df %>% select(x, y, z)
#'
#'    # no NOTE
#'    df %>% select("x", "y", "z")
#'    ```
#'
#' @keywords internal
#' @name tidyr_tidy_select
NULL
