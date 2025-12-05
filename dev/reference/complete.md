# Complete a data frame with missing combinations of data

Turns implicit missing values into explicit missing values. This is a
wrapper around
[`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
[`dplyr::full_join()`](https://dplyr.tidyverse.org/reference/mutate-joins.html)
and
[`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
that's useful for completing missing combinations of data.

## Usage

``` r
complete(data, ..., fill = list(), explicit = TRUE)
```

## Arguments

- data:

  A data frame.

- ...:

  \<[`data-masking`](https://tidyr.tidyverse.org/dev/reference/tidyr_data_masking.md)\>
  Specification of columns to expand or complete. Columns can be atomic
  vectors or lists.

  - To find all unique combinations of `x`, `y` and `z`, including those
    not present in the data, supply each variable as a separate
    argument: `expand(df, x, y, z)` or `complete(df, x, y, z)`.

  - To find only the combinations that occur in the data, use `nesting`:
    `expand(df, nesting(x, y, z))`.

  - You can combine the two forms. For example,
    `expand(df, nesting(school_id, student_id), date)` would produce a
    row for each present school-student combination for all possible
    dates.

  When used with factors,
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) and
  `complete()` use the full set of levels, not just those that appear in
  the data. If you want to use only the values seen in the data, use
  `forcats::fct_drop()`.

  When used with continuous variables, you may need to fill in values
  that do not appear in the data: to do so use expressions like
  `year = 2010:2020` or `year = full_seq(year,1)`.

- fill:

  A named list that for each variable supplies a single value to use
  instead of `NA` for missing combinations.

- explicit:

  Should both implicit (newly created) and explicit (pre-existing)
  missing values be filled by `fill`? By default, this is `TRUE`, but if
  set to `FALSE` this will limit the fill to only implicit missing
  values.

## Grouped data frames

With grouped data frames created by
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html),
`complete()` operates *within* each group. Because of this, you cannot
complete a grouping column.

## Examples

``` r
df <- tibble(
  group = c(1:2, 1, 2),
  item_id = c(1:2, 2, 3),
  item_name = c("a", "a", "b", "b"),
  value1 = c(1, NA, 3, 4),
  value2 = 4:7
)
df
#> # A tibble: 4 × 5
#>   group item_id item_name value1 value2
#>   <dbl>   <dbl> <chr>      <dbl>  <int>
#> 1     1       1 a              1      4
#> 2     2       2 a             NA      5
#> 3     1       2 b              3      6
#> 4     2       3 b              4      7

# Combinations --------------------------------------------------------------
# Generate all possible combinations of `group`, `item_id`, and `item_name`
# (whether or not they appear in the data)
df |> complete(group, item_id, item_name)
#> # A tibble: 12 × 5
#>    group item_id item_name value1 value2
#>    <dbl>   <dbl> <chr>      <dbl>  <int>
#>  1     1       1 a              1      4
#>  2     1       1 b             NA     NA
#>  3     1       2 a             NA     NA
#>  4     1       2 b              3      6
#>  5     1       3 a             NA     NA
#>  6     1       3 b             NA     NA
#>  7     2       1 a             NA     NA
#>  8     2       1 b             NA     NA
#>  9     2       2 a             NA      5
#> 10     2       2 b             NA     NA
#> 11     2       3 a             NA     NA
#> 12     2       3 b              4      7

# Cross all possible `group` values with the unique pairs of
# `(item_id, item_name)` that already exist in the data
df |> complete(group, nesting(item_id, item_name))
#> # A tibble: 8 × 5
#>   group item_id item_name value1 value2
#>   <dbl>   <dbl> <chr>      <dbl>  <int>
#> 1     1       1 a              1      4
#> 2     1       2 a             NA     NA
#> 3     1       2 b              3      6
#> 4     1       3 b             NA     NA
#> 5     2       1 a             NA     NA
#> 6     2       2 a             NA      5
#> 7     2       2 b             NA     NA
#> 8     2       3 b              4      7

# Within each `group`, generate all possible combinations of
# `item_id` and `item_name` that occur in that group
df |>
  dplyr::group_by(group) |>
  complete(item_id, item_name)
#> # A tibble: 8 × 5
#> # Groups:   group [2]
#>   group item_id item_name value1 value2
#>   <dbl>   <dbl> <chr>      <dbl>  <int>
#> 1     1       1 a              1      4
#> 2     1       1 b             NA     NA
#> 3     1       2 a             NA     NA
#> 4     1       2 b              3      6
#> 5     2       2 a             NA      5
#> 6     2       2 b             NA     NA
#> 7     2       3 a             NA     NA
#> 8     2       3 b              4      7

# Supplying values for new rows ---------------------------------------------
# Use `fill` to replace NAs with some value. By default, affects both new
# (implicit) and pre-existing (explicit) missing values.
df |>
  complete(
    group,
    nesting(item_id, item_name),
    fill = list(value1 = 0, value2 = 99)
  )
#> # A tibble: 8 × 5
#>   group item_id item_name value1 value2
#>   <dbl>   <dbl> <chr>      <dbl>  <int>
#> 1     1       1 a              1      4
#> 2     1       2 a              0     99
#> 3     1       2 b              3      6
#> 4     1       3 b              0     99
#> 5     2       1 a              0     99
#> 6     2       2 a              0      5
#> 7     2       2 b              0     99
#> 8     2       3 b              4      7

# Limit the fill to only the newly created (i.e. previously implicit)
# missing values with `explicit = FALSE`
df |>
  complete(
    group,
    nesting(item_id, item_name),
    fill = list(value1 = 0, value2 = 99),
    explicit = FALSE
  )
#> # A tibble: 8 × 5
#>   group item_id item_name value1 value2
#>   <dbl>   <dbl> <chr>      <dbl>  <int>
#> 1     1       1 a              1      4
#> 2     1       2 a              0     99
#> 3     1       2 b              3      6
#> 4     1       3 b              0     99
#> 5     2       1 a              0     99
#> 6     2       2 a             NA      5
#> 7     2       2 b              0     99
#> 8     2       3 b              4      7
```
