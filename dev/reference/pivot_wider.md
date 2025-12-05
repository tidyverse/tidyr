# Pivot data from long to wide

`pivot_wider()` "widens" data, increasing the number of columns and
decreasing the number of rows. The inverse transformation is
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md).

Learn more in
[`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md).

## Usage

``` r
pivot_wider(
  data,
  ...,
  id_cols = NULL,
  id_expand = FALSE,
  names_from = name,
  names_prefix = "",
  names_sep = "_",
  names_glue = NULL,
  names_sort = FALSE,
  names_vary = "fastest",
  names_expand = FALSE,
  names_repair = "check_unique",
  values_from = value,
  values_fill = NULL,
  values_fn = NULL,
  unused_fn = NULL
)
```

## Arguments

- data:

  A data frame to pivot.

- ...:

  Additional arguments passed on to methods.

- id_cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  A set of columns that uniquely identify each observation. Typically
  used when you have redundant variables, i.e. variables whose values
  are perfectly correlated with existing variables.

  Defaults to all columns in `data` except for the columns specified
  through `names_from` and `values_from`. If a tidyselect expression is
  supplied, it will be evaluated on `data` after removing the columns
  specified through `names_from` and `values_from`.

- id_expand:

  Should the values in the `id_cols` columns be expanded by
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  before pivoting? This results in more rows, the output will contain a
  complete expansion of all possible values in `id_cols`. Implicit
  factor levels that aren't represented in the data will become
  explicit. Additionally, the row values corresponding to the expanded
  `id_cols` will be sorted.

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

- names_repair:

  What happens if the output has invalid column names? The default,
  `"check_unique"` is to error if the columns are duplicated. Use
  `"minimal"` to allow duplicates in the output, or `"unique"` to
  de-duplicated by adding numeric suffixes. See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for more options.

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

## Details

`pivot_wider()` is an updated approach to
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md),
designed to be both simpler to use and to handle more use cases. We
recommend you use `pivot_wider()` for new code;
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) isn't
going away but is no longer under active development.

## See also

[`pivot_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md)
to pivot "by hand" with a data frame that defines a pivoting
specification.

## Examples

``` r
# See vignette("pivot") for examples and explanation

fish_encounters
#> # A tibble: 114 × 3
#>    fish  station  seen
#>    <fct> <fct>   <int>
#>  1 4842  Release     1
#>  2 4842  I80_1       1
#>  3 4842  Lisbon      1
#>  4 4842  Rstr        1
#>  5 4842  Base_TD     1
#>  6 4842  BCE         1
#>  7 4842  BCW         1
#>  8 4842  BCE2        1
#>  9 4842  BCW2        1
#> 10 4842  MAE         1
#> # ℹ 104 more rows
fish_encounters |>
  pivot_wider(names_from = station, values_from = seen)
#> # A tibble: 19 × 12
#>    fish  Release I80_1 Lisbon  Rstr Base_TD   BCE   BCW  BCE2  BCW2
#>    <fct>   <int> <int>  <int> <int>   <int> <int> <int> <int> <int>
#>  1 4842        1     1      1     1       1     1     1     1     1
#>  2 4843        1     1      1     1       1     1     1     1     1
#>  3 4844        1     1      1     1       1     1     1     1     1
#>  4 4845        1     1      1     1       1    NA    NA    NA    NA
#>  5 4847        1     1      1    NA      NA    NA    NA    NA    NA
#>  6 4848        1     1      1     1      NA    NA    NA    NA    NA
#>  7 4849        1     1     NA    NA      NA    NA    NA    NA    NA
#>  8 4850        1     1     NA     1       1     1     1    NA    NA
#>  9 4851        1     1     NA    NA      NA    NA    NA    NA    NA
#> 10 4854        1     1     NA    NA      NA    NA    NA    NA    NA
#> 11 4855        1     1      1     1       1    NA    NA    NA    NA
#> 12 4857        1     1      1     1       1     1     1     1     1
#> 13 4858        1     1      1     1       1     1     1     1     1
#> 14 4859        1     1      1     1       1    NA    NA    NA    NA
#> 15 4861        1     1      1     1       1     1     1     1     1
#> 16 4862        1     1      1     1       1     1     1     1     1
#> 17 4863        1     1     NA    NA      NA    NA    NA    NA    NA
#> 18 4864        1     1     NA    NA      NA    NA    NA    NA    NA
#> 19 4865        1     1      1    NA      NA    NA    NA    NA    NA
#> # ℹ 2 more variables: MAE <int>, MAW <int>
# Fill in missing values
fish_encounters |>
  pivot_wider(names_from = station, values_from = seen, values_fill = 0)
#> # A tibble: 19 × 12
#>    fish  Release I80_1 Lisbon  Rstr Base_TD   BCE   BCW  BCE2  BCW2
#>    <fct>   <int> <int>  <int> <int>   <int> <int> <int> <int> <int>
#>  1 4842        1     1      1     1       1     1     1     1     1
#>  2 4843        1     1      1     1       1     1     1     1     1
#>  3 4844        1     1      1     1       1     1     1     1     1
#>  4 4845        1     1      1     1       1     0     0     0     0
#>  5 4847        1     1      1     0       0     0     0     0     0
#>  6 4848        1     1      1     1       0     0     0     0     0
#>  7 4849        1     1      0     0       0     0     0     0     0
#>  8 4850        1     1      0     1       1     1     1     0     0
#>  9 4851        1     1      0     0       0     0     0     0     0
#> 10 4854        1     1      0     0       0     0     0     0     0
#> 11 4855        1     1      1     1       1     0     0     0     0
#> 12 4857        1     1      1     1       1     1     1     1     1
#> 13 4858        1     1      1     1       1     1     1     1     1
#> 14 4859        1     1      1     1       1     0     0     0     0
#> 15 4861        1     1      1     1       1     1     1     1     1
#> 16 4862        1     1      1     1       1     1     1     1     1
#> 17 4863        1     1      0     0       0     0     0     0     0
#> 18 4864        1     1      0     0       0     0     0     0     0
#> 19 4865        1     1      1     0       0     0     0     0     0
#> # ℹ 2 more variables: MAE <int>, MAW <int>

# Generate column names from multiple variables
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
us_rent_income |>
  pivot_wider(
    names_from = variable,
    values_from = c(estimate, moe)
  )
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

# You can control whether `names_from` values vary fastest or slowest
# relative to the `values_from` column names using `names_vary`.
us_rent_income |>
  pivot_wider(
    names_from = variable,
    values_from = c(estimate, moe),
    names_vary = "slowest"
  )
#> # A tibble: 52 × 6
#>    GEOID NAME         estimate_income moe_income estimate_rent moe_rent
#>    <chr> <chr>                  <dbl>      <dbl>         <dbl>    <dbl>
#>  1 01    Alabama                24476        136           747        3
#>  2 02    Alaska                 32940        508          1200       13
#>  3 04    Arizona                27517        148           972        4
#>  4 05    Arkansas               23789        165           709        5
#>  5 06    California             29454        109          1358        3
#>  6 08    Colorado               32401        109          1125        5
#>  7 09    Connecticut            35326        195          1123        5
#>  8 10    Delaware               31560        247          1076       10
#>  9 11    District of…           43198        681          1424       17
#> 10 12    Florida                25952         70          1077        3
#> # ℹ 42 more rows

# When there are multiple `names_from` or `values_from`, you can use
# use `names_sep` or `names_glue` to control the output variable names
us_rent_income |>
  pivot_wider(
    names_from = variable,
    names_sep = ".",
    values_from = c(estimate, moe)
  )
#> # A tibble: 52 × 6
#>    GEOID NAME         estimate.income estimate.rent moe.income moe.rent
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
us_rent_income |>
  pivot_wider(
    names_from = variable,
    names_glue = "{variable}_{.value}",
    values_from = c(estimate, moe)
  )
#> # A tibble: 52 × 6
#>    GEOID NAME         income_estimate rent_estimate income_moe rent_moe
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

# Can perform aggregation with `values_fn`
warpbreaks <- as_tibble(warpbreaks[c("wool", "tension", "breaks")])
warpbreaks
#> # A tibble: 54 × 3
#>    wool  tension breaks
#>    <fct> <fct>    <dbl>
#>  1 A     L           26
#>  2 A     L           30
#>  3 A     L           54
#>  4 A     L           25
#>  5 A     L           70
#>  6 A     L           52
#>  7 A     L           51
#>  8 A     L           26
#>  9 A     L           67
#> 10 A     M           18
#> # ℹ 44 more rows
warpbreaks |>
  pivot_wider(
    names_from = wool,
    values_from = breaks,
    values_fn = mean
  )
#> # A tibble: 3 × 3
#>   tension     A     B
#>   <fct>   <dbl> <dbl>
#> 1 L        44.6  28.2
#> 2 M        24    28.8
#> 3 H        24.6  18.8

# Can pass an anonymous function to `values_fn` when you
# need to supply additional arguments
warpbreaks$breaks[1] <- NA
warpbreaks |>
  pivot_wider(
    names_from = wool,
    values_from = breaks,
    values_fn = ~ mean(.x, na.rm = TRUE)
  )
#> # A tibble: 3 × 3
#>   tension     A     B
#>   <fct>   <dbl> <dbl>
#> 1 L        46.9  28.2
#> 2 M        24    28.8
#> 3 H        24.6  18.8
```
