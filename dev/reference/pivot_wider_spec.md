# Pivot data from long to wide using a spec

This is a low level interface to pivoting, inspired by the cdata
package, that allows you to describe pivoting with a data frame.

## Usage

``` r
pivot_wider_spec(
  data,
  spec,
  ...,
  names_repair = "check_unique",
  id_cols = NULL,
  id_expand = FALSE,
  values_fill = NULL,
  values_fn = NULL,
  unused_fn = NULL,
  error_call = current_env()
)

build_wider_spec(
  data,
  ...,
  names_from = name,
  values_from = value,
  names_prefix = "",
  names_sep = "_",
  names_glue = NULL,
  names_sort = FALSE,
  names_vary = "fastest",
  names_expand = FALSE,
  error_call = current_env()
)
```

## Arguments

- data:

  A data frame to pivot.

- spec:

  A specification data frame. This is useful for more complex pivots
  because it gives you greater control on how metadata stored in the
  columns become column names in the result.

  Must be a data frame containing character `.name` and `.value`
  columns. Additional columns in `spec` should be named to match columns
  in the long format of the dataset and contain values corresponding to
  columns pivoted from the wide format. The special `.seq` variable is
  used to disambiguate rows internally; it is automatically removed
  after pivoting.

- ...:

  These dots are for future extensions and must be empty.

- names_repair:

  What happens if the output has invalid column names? The default,
  `"check_unique"` is to error if the columns are duplicated. Use
  `"minimal"` to allow duplicates in the output, or `"unique"` to
  de-duplicated by adding numeric suffixes. See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for more options.

- id_cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  A set of columns that uniquely identifies each observation. Defaults
  to all columns in `data` except for the columns specified in
  `spec$.value` and the columns of the `spec` that aren't named `.name`
  or `.value`. Typically used when you have redundant variables, i.e.
  variables whose values are perfectly correlated with existing
  variables.

- id_expand:

  Should the values in the `id_cols` columns be expanded by
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  before pivoting? This results in more rows, the output will contain a
  complete expansion of all possible values in `id_cols`. Implicit
  factor levels that aren't represented in the data will become
  explicit. Additionally, the row values corresponding to the expanded
  `id_cols` will be sorted.

- values_fill:

  Optionally, a (scalar) value that specifies what each `value` should
  be filled in with when missing.

  This can be a named list if you want to apply different fill values to
  different value columns.

- values_fn:

  Optionally, a function applied to the value in each cell in the
  output. You will typically use this when the combination of `id_cols`
  and `names_from` columns does not uniquely identify an observation.

  This can be a named list if you want to apply different aggregations
  to different `values_from` columns.

- unused_fn:

  Optionally, a function applied to summarize the values from the unused
  columns (i.e. columns not identified by `id_cols`, `names_from`, or
  `values_from`).

  The default drops all unused columns from the result.

  This can be a named list if you want to apply different aggregations
  to different unused columns.

  `id_cols` must be supplied for `unused_fn` to be useful, since
  otherwise all unspecified columns will be considered `id_cols`.

  This is similar to grouping by the `id_cols` then summarizing the
  unused columns using `unused_fn`.

- error_call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

- names_from, values_from:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  A pair of arguments describing which column (or columns) to get the
  name of the output column (`names_from`), and which column (or
  columns) to get the cell values from (`values_from`).

  If `values_from` contains multiple values, the value will be added to
  the front of the output column.

- names_prefix:

  String added to the start of every variable name. This is particularly
  useful if `names_from` is a numeric vector and you want to create
  syntactic variable names.

- names_sep:

  If `names_from` or `values_from` contains multiple variables, this
  will be used to join their values together into a single string to use
  as a column name.

- names_glue:

  Instead of `names_sep` and `names_prefix`, you can supply a glue
  specification that uses the `names_from` columns (and special
  `.value`) to create custom column names.

- names_sort:

  Should the column names be sorted? If `FALSE`, the default, column
  names are ordered by first appearance.

- names_vary:

  When `names_from` identifies a column (or columns) with multiple
  unique values, and multiple `values_from` columns are provided, in
  what order should the resulting column names be combined?

  - `"fastest"` varies `names_from` values fastest, resulting in a
    column naming scheme of the form:
    `value1_name1, value1_name2, value2_name1, value2_name2`. This is
    the default.

  - `"slowest"` varies `names_from` values slowest, resulting in a
    column naming scheme of the form:
    `value1_name1, value2_name1, value1_name2, value2_name2`.

- names_expand:

  Should the values in the `names_from` columns be expanded by
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  before pivoting? This results in more columns, the output will contain
  column names corresponding to a complete expansion of all possible
  values in `names_from`. Implicit factor levels that aren't represented
  in the data will become explicit. Additionally, the column names will
  be sorted, identical to what `names_sort` would produce.

## Examples

``` r
# See vignette("pivot") for examples and explanation

us_rent_income
#> # A tibble: 104 × 5
#>    GEOID NAME       variable estimate   moe
#>    <chr> <chr>      <chr>       <dbl> <dbl>
#>  1 01    Alabama    income      24476   136
#>  2 01    Alabama    rent          747     3
#>  3 02    Alaska     income      32940   508
#>  4 02    Alaska     rent         1200    13
#>  5 04    Arizona    income      27517   148
#>  6 04    Arizona    rent          972     4
#>  7 05    Arkansas   income      23789   165
#>  8 05    Arkansas   rent          709     5
#>  9 06    California income      29454   109
#> 10 06    California rent         1358     3
#> # ℹ 94 more rows
spec1 <- us_rent_income |>
  build_wider_spec(names_from = variable, values_from = c(estimate, moe))
spec1
#> # A tibble: 4 × 3
#>   .name           .value   variable
#>   <chr>           <chr>    <chr>   
#> 1 estimate_income estimate income  
#> 2 estimate_rent   estimate rent    
#> 3 moe_income      moe      income  
#> 4 moe_rent        moe      rent    

us_rent_income |>
  pivot_wider_spec(spec1)
#> # A tibble: 52 × 6
#>    GEOID NAME         estimate_income estimate_rent moe_income moe_rent
#>    <chr> <chr>                  <dbl>         <dbl>      <dbl>    <dbl>
#>  1 01    Alabama                24476           747        136        3
#>  2 02    Alaska                 32940          1200        508       13
#>  3 04    Arizona                27517           972        148        4
#>  4 05    Arkansas               23789           709        165        5
#>  5 06    California             29454          1358        109        3
#>  6 08    Colorado               32401          1125        109        5
#>  7 09    Connecticut            35326          1123        195        5
#>  8 10    Delaware               31560          1076        247       10
#>  9 11    District of…           43198          1424        681       17
#> 10 12    Florida                25952          1077         70        3
#> # ℹ 42 more rows

# Is equivalent to
us_rent_income |>
  pivot_wider(names_from = variable, values_from = c(estimate, moe))
#> # A tibble: 52 × 6
#>    GEOID NAME         estimate_income estimate_rent moe_income moe_rent
#>    <chr> <chr>                  <dbl>         <dbl>      <dbl>    <dbl>
#>  1 01    Alabama                24476           747        136        3
#>  2 02    Alaska                 32940          1200        508       13
#>  3 04    Arizona                27517           972        148        4
#>  4 05    Arkansas               23789           709        165        5
#>  5 06    California             29454          1358        109        3
#>  6 08    Colorado               32401          1125        109        5
#>  7 09    Connecticut            35326          1123        195        5
#>  8 10    Delaware               31560          1076        247       10
#>  9 11    District of…           43198          1424        681       17
#> 10 12    Florida                25952          1077         70        3
#> # ℹ 42 more rows

# `pivot_wider_spec()` provides more control over column names and output format
# instead of creating columns with estimate_ and moe_ prefixes,
# keep original variable name for estimates and attach _moe as suffix
spec2 <- tibble(
  .name = c("income", "rent", "income_moe", "rent_moe"),
  .value = c("estimate", "estimate", "moe", "moe"),
  variable = c("income", "rent", "income", "rent")
)

us_rent_income |>
  pivot_wider_spec(spec2)
#> # A tibble: 52 × 6
#>    GEOID NAME                 income  rent income_moe rent_moe
#>    <chr> <chr>                 <dbl> <dbl>      <dbl>    <dbl>
#>  1 01    Alabama               24476   747        136        3
#>  2 02    Alaska                32940  1200        508       13
#>  3 04    Arizona               27517   972        148        4
#>  4 05    Arkansas              23789   709        165        5
#>  5 06    California            29454  1358        109        3
#>  6 08    Colorado              32401  1125        109        5
#>  7 09    Connecticut           35326  1123        195        5
#>  8 10    Delaware              31560  1076        247       10
#>  9 11    District of Columbia  43198  1424        681       17
#> 10 12    Florida               25952  1077         70        3
#> # ℹ 42 more rows
```
