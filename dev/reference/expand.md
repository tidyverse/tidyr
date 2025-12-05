# Expand data frame to include all possible combinations of values

`expand()` generates all combination of variables found in a dataset. It
is paired with `nesting()` and `crossing()` helpers. `crossing()` is a
wrapper around
[`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md)
that de-duplicates and sorts its inputs; `nesting()` is a helper that
only finds combinations already present in the data.

`expand()` is often useful in conjunction with joins:

- use it with `right_join()` to convert implicit missing values to
  explicit missing values (e.g., fill in gaps in your data frame).

- use it with `anti_join()` to figure out which combinations are missing
  (e.g., identify gaps in your data frame).

## Usage

``` r
expand(data, ..., .name_repair = "check_unique")

crossing(..., .name_repair = "check_unique")

nesting(..., .name_repair = "check_unique")
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

  When used with factors, `expand()` and
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  use the full set of levels, not just those that appear in the data. If
  you want to use only the values seen in the data, use
  `forcats::fct_drop()`.

  When used with continuous variables, you may need to fill in values
  that do not appear in the data: to do so use expressions like
  `year = 2010:2020` or `year = full_seq(year,1)`.

- .name_repair:

  One of `"check_unique"`, `"unique"`, `"universal"`, `"minimal"`,
  `"unique_quiet"`, or `"universal_quiet"`. See
  [`vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for the meaning of these options.

## Grouped data frames

With grouped data frames created by
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html),
`expand()` operates *within* each group. Because of this, you cannot
expand on a grouping column.

## See also

[`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md) to
expand list objects.
[`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md)
to input vectors rather than a data frame.

## Examples

``` r
# Finding combinations ------------------------------------------------------
fruits <- tibble(
  type = c("apple", "orange", "apple", "orange", "orange", "orange"),
  year = c(2010, 2010, 2012, 2010, 2011, 2012),
  size = factor(
    c("XS", "S", "M", "S", "S", "M"),
    levels = c("XS", "S", "M", "L")
  ),
  weights = rnorm(6, as.numeric(size) + 2)
)

# All combinations, including factor levels that are not used
fruits |> expand(type)
#> # A tibble: 2 × 1
#>   type  
#>   <chr> 
#> 1 apple 
#> 2 orange
fruits |> expand(size)
#> # A tibble: 4 × 1
#>   size 
#>   <fct>
#> 1 XS   
#> 2 S    
#> 3 M    
#> 4 L    
fruits |> expand(type, size)
#> # A tibble: 8 × 2
#>   type   size 
#>   <chr>  <fct>
#> 1 apple  XS   
#> 2 apple  S    
#> 3 apple  M    
#> 4 apple  L    
#> 5 orange XS   
#> 6 orange S    
#> 7 orange M    
#> 8 orange L    
fruits |> expand(type, size, year)
#> # A tibble: 24 × 3
#>    type  size   year
#>    <chr> <fct> <dbl>
#>  1 apple XS     2010
#>  2 apple XS     2011
#>  3 apple XS     2012
#>  4 apple S      2010
#>  5 apple S      2011
#>  6 apple S      2012
#>  7 apple M      2010
#>  8 apple M      2011
#>  9 apple M      2012
#> 10 apple L      2010
#> # ℹ 14 more rows

# Only combinations that already appear in the data
fruits |> expand(nesting(type))
#> # A tibble: 2 × 1
#>   type  
#>   <chr> 
#> 1 apple 
#> 2 orange
fruits |> expand(nesting(size))
#> # A tibble: 3 × 1
#>   size 
#>   <fct>
#> 1 XS   
#> 2 S    
#> 3 M    
fruits |> expand(nesting(type, size))
#> # A tibble: 4 × 2
#>   type   size 
#>   <chr>  <fct>
#> 1 apple  XS   
#> 2 apple  M    
#> 3 orange S    
#> 4 orange M    
fruits |> expand(nesting(type, size, year))
#> # A tibble: 5 × 3
#>   type   size   year
#>   <chr>  <fct> <dbl>
#> 1 apple  XS     2010
#> 2 apple  M      2012
#> 3 orange S      2010
#> 4 orange S      2011
#> 5 orange M      2012

# Other uses ----------------------------------------------------------------
# Use with `full_seq()` to fill in values of continuous variables
fruits |> expand(type, size, full_seq(year, 1))
#> # A tibble: 24 × 3
#>    type  size  `full_seq(year, 1)`
#>    <chr> <fct>               <dbl>
#>  1 apple XS                   2010
#>  2 apple XS                   2011
#>  3 apple XS                   2012
#>  4 apple S                    2010
#>  5 apple S                    2011
#>  6 apple S                    2012
#>  7 apple M                    2010
#>  8 apple M                    2011
#>  9 apple M                    2012
#> 10 apple L                    2010
#> # ℹ 14 more rows
fruits |> expand(type, size, 2010:2013)
#> # A tibble: 32 × 3
#>    type  size  `2010:2013`
#>    <chr> <fct>       <int>
#>  1 apple XS           2010
#>  2 apple XS           2011
#>  3 apple XS           2012
#>  4 apple XS           2013
#>  5 apple S            2010
#>  6 apple S            2011
#>  7 apple S            2012
#>  8 apple S            2013
#>  9 apple M            2010
#> 10 apple M            2011
#> # ℹ 22 more rows

# Use `anti_join()` to determine which observations are missing
all <- fruits |> expand(type, size, year)
all
#> # A tibble: 24 × 3
#>    type  size   year
#>    <chr> <fct> <dbl>
#>  1 apple XS     2010
#>  2 apple XS     2011
#>  3 apple XS     2012
#>  4 apple S      2010
#>  5 apple S      2011
#>  6 apple S      2012
#>  7 apple M      2010
#>  8 apple M      2011
#>  9 apple M      2012
#> 10 apple L      2010
#> # ℹ 14 more rows
all |> dplyr::anti_join(fruits)
#> Joining with `by = join_by(type, size, year)`
#> # A tibble: 19 × 3
#>    type   size   year
#>    <chr>  <fct> <dbl>
#>  1 apple  XS     2011
#>  2 apple  XS     2012
#>  3 apple  S      2010
#>  4 apple  S      2011
#>  5 apple  S      2012
#>  6 apple  M      2010
#>  7 apple  M      2011
#>  8 apple  L      2010
#>  9 apple  L      2011
#> 10 apple  L      2012
#> 11 orange XS     2010
#> 12 orange XS     2011
#> 13 orange XS     2012
#> 14 orange S      2012
#> 15 orange M      2010
#> 16 orange M      2011
#> 17 orange L      2010
#> 18 orange L      2011
#> 19 orange L      2012

# Use with `right_join()` to fill in missing rows (like `complete()`)
fruits |> dplyr::right_join(all)
#> Joining with `by = join_by(type, year, size)`
#> # A tibble: 25 × 4
#>    type    year size  weights
#>    <chr>  <dbl> <fct>   <dbl>
#>  1 apple   2010 XS       1.18
#>  2 orange  2010 S        3.75
#>  3 apple   2012 M        4.76
#>  4 orange  2010 S        3.72
#>  5 orange  2011 S        3.45
#>  6 orange  2012 M        5.63
#>  7 apple   2011 XS      NA   
#>  8 apple   2012 XS      NA   
#>  9 apple   2010 S       NA   
#> 10 apple   2011 S       NA   
#> # ℹ 15 more rows

# Use with `group_by()` to expand within each group
fruits |>
  dplyr::group_by(type) |>
  expand(year, size)
#> # A tibble: 20 × 3
#> # Groups:   type [2]
#>    type    year size 
#>    <chr>  <dbl> <fct>
#>  1 apple   2010 XS   
#>  2 apple   2010 S    
#>  3 apple   2010 M    
#>  4 apple   2010 L    
#>  5 apple   2012 XS   
#>  6 apple   2012 S    
#>  7 apple   2012 M    
#>  8 apple   2012 L    
#>  9 orange  2010 XS   
#> 10 orange  2010 S    
#> 11 orange  2010 M    
#> 12 orange  2010 L    
#> 13 orange  2011 XS   
#> 14 orange  2011 S    
#> 15 orange  2011 M    
#> 16 orange  2011 L    
#> 17 orange  2012 XS   
#> 18 orange  2012 S    
#> 19 orange  2012 M    
#> 20 orange  2012 L    
```
