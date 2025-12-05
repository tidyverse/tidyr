# Nest rows into a list-column of data frames

Nesting creates a list-column of data frames; unnesting flattens it back
out into regular columns. Nesting is implicitly a summarising operation:
you get one row for each group defined by the non-nested columns. This
is useful in conjunction with other summaries that work with whole
datasets, most notably models.

Learn more in
[`vignette("nest")`](https://tidyr.tidyverse.org/dev/articles/nest.md).

## Usage

``` r
nest(.data, ..., .by = NULL, .key = NULL, .names_sep = NULL)
```

## Arguments

- .data:

  A data frame.

- ...:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to nest; these will appear in the inner data frames.

  Specified using name-variable pairs of the form
  `new_col = c(col1, col2, col3)`. The right hand side can be any valid
  tidyselect expression.

  If not supplied, then `...` is derived as all columns *not* selected
  by `.by`, and will use the column name from `.key`.

  **\[deprecated\]**: previously you could write `df |> nest(x, y, z)`.
  Convert to `df |> nest(data = c(x, y, z))`.

- .by:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to nest *by*; these will remain in the outer data frame.

  `.by` can be used in place of or in conjunction with columns supplied
  through `...`.

  If not supplied, then `.by` is derived as all columns *not* selected
  by `...`.

- .key:

  The name of the resulting nested column. Only applicable when `...`
  isn't specified, i.e. in the case of `df |> nest(.by = x)`.

  If `NULL`, then `"data"` will be used by default.

- .names_sep:

  If `NULL`, the default, the inner names will come from the former
  outer names. If a string, the new inner names will use the outer names
  with `names_sep` automatically stripped. This makes `names_sep`
  roughly symmetric between nesting and unnesting.

## Details

If neither `...` nor `.by` are supplied, `nest()` will nest all
variables, and will use the column name supplied through `.key`.

## New syntax

tidyr 1.0.0 introduced a new syntax for `nest()` and
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) that's
designed to be more similar to other functions. Converting to the new
syntax should be straightforward (guided by the message you'll receive)
but if you just need to run an old analysis, you can easily revert to
the previous behaviour using
[`nest_legacy()`](https://tidyr.tidyverse.org/dev/reference/nest_legacy.md)
and
[`unnest_legacy()`](https://tidyr.tidyverse.org/dev/reference/nest_legacy.md)
as follows:

    library(tidyr)
    nest <- nest_legacy
    unnest <- unnest_legacy

## Grouped data frames

`df |> nest(data = c(x, y))` specifies the columns to be nested; i.e.
the columns that will appear in the inner data frame.
`df |> nest(.by = c(x, y))` specifies the columns to nest *by*; i.e. the
columns that will remain in the outer data frame. An alternative way to
achieve the latter is to `nest()` a grouped data frame created by
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html).
The grouping variables remain in the outer data frame and the others are
nested. The result preserves the grouping of the input.

Variables supplied to `nest()` will override grouping variables so that
`df |> group_by(x, y) |> nest(data = !z)` will be equivalent to
`df |> nest(data = !z)`.

You can't supply `.by` with a grouped data frame, as the groups already
represent what you are nesting by.

## Examples

``` r
df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)

# Specify variables to nest using name-variable pairs.
# Note that we get one row of output for each unique combination of
# non-nested variables.
df |> nest(data = c(y, z))
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>

# Specify variables to nest by (rather than variables to nest) using `.by`
df |> nest(.by = x)
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>

# In this case, since `...` isn't used you can specify the resulting column
# name with `.key`
df |> nest(.by = x, .key = "cols")
#> # A tibble: 3 × 2
#>       x cols            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>

# Use tidyselect syntax and helpers, just like in `dplyr::select()`
df |> nest(data = any_of(c("y", "z")))
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>

# `...` and `.by` can be used together to drop columns you no longer need,
# or to include the columns you are nesting by in the inner data frame too.
# This drops `z`:
df |> nest(data = y, .by = x)
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 1]>
#> 2     2 <tibble [2 × 1]>
#> 3     3 <tibble [1 × 1]>
# This includes `x` in the inner data frame:
df |> nest(data = everything(), .by = x)
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 3]>
#> 2     2 <tibble [2 × 3]>
#> 3     3 <tibble [1 × 3]>

# Multiple nesting structures can be specified at once
iris |>
  nest(petal = starts_with("Petal"), sepal = starts_with("Sepal"))
#> # A tibble: 3 × 3
#>   Species    petal             sepal            
#>   <fct>      <list>            <list>           
#> 1 setosa     <tibble [50 × 2]> <tibble [50 × 2]>
#> 2 versicolor <tibble [50 × 2]> <tibble [50 × 2]>
#> 3 virginica  <tibble [50 × 2]> <tibble [50 × 2]>
iris |>
  nest(width = contains("Width"), length = contains("Length"))
#> # A tibble: 3 × 3
#>   Species    width             length           
#>   <fct>      <list>            <list>           
#> 1 setosa     <tibble [50 × 2]> <tibble [50 × 2]>
#> 2 versicolor <tibble [50 × 2]> <tibble [50 × 2]>
#> 3 virginica  <tibble [50 × 2]> <tibble [50 × 2]>

# Nesting a grouped data frame nests all variables apart from the group vars
fish_encounters |>
  dplyr::group_by(fish) |>
  nest()
#> # A tibble: 19 × 2
#> # Groups:   fish [19]
#>    fish  data             
#>    <fct> <list>           
#>  1 4842  <tibble [11 × 2]>
#>  2 4843  <tibble [11 × 2]>
#>  3 4844  <tibble [11 × 2]>
#>  4 4845  <tibble [5 × 2]> 
#>  5 4847  <tibble [3 × 2]> 
#>  6 4848  <tibble [4 × 2]> 
#>  7 4849  <tibble [2 × 2]> 
#>  8 4850  <tibble [6 × 2]> 
#>  9 4851  <tibble [2 × 2]> 
#> 10 4854  <tibble [2 × 2]> 
#> 11 4855  <tibble [5 × 2]> 
#> 12 4857  <tibble [9 × 2]> 
#> 13 4858  <tibble [11 × 2]>
#> 14 4859  <tibble [5 × 2]> 
#> 15 4861  <tibble [11 × 2]>
#> 16 4862  <tibble [9 × 2]> 
#> 17 4863  <tibble [2 × 2]> 
#> 18 4864  <tibble [2 × 2]> 
#> 19 4865  <tibble [3 × 2]> 

# That is similar to `nest(.by = )`, except here the result isn't grouped
fish_encounters |>
  nest(.by = fish)
#> # A tibble: 19 × 2
#>    fish  data             
#>    <fct> <list>           
#>  1 4842  <tibble [11 × 2]>
#>  2 4843  <tibble [11 × 2]>
#>  3 4844  <tibble [11 × 2]>
#>  4 4845  <tibble [5 × 2]> 
#>  5 4847  <tibble [3 × 2]> 
#>  6 4848  <tibble [4 × 2]> 
#>  7 4849  <tibble [2 × 2]> 
#>  8 4850  <tibble [6 × 2]> 
#>  9 4851  <tibble [2 × 2]> 
#> 10 4854  <tibble [2 × 2]> 
#> 11 4855  <tibble [5 × 2]> 
#> 12 4857  <tibble [9 × 2]> 
#> 13 4858  <tibble [11 × 2]>
#> 14 4859  <tibble [5 × 2]> 
#> 15 4861  <tibble [11 × 2]>
#> 16 4862  <tibble [9 × 2]> 
#> 17 4863  <tibble [2 × 2]> 
#> 18 4864  <tibble [2 × 2]> 
#> 19 4865  <tibble [3 × 2]> 

# Nesting is often useful for creating per group models
mtcars |>
  nest(.by = cyl) |>
  dplyr::mutate(models = lapply(data, function(df) lm(mpg ~ wt, data = df)))
#> # A tibble: 3 × 3
#>     cyl data               models
#>   <dbl> <list>             <list>
#> 1     6 <tibble [7 × 10]>  <lm>  
#> 2     4 <tibble [11 × 10]> <lm>  
#> 3     8 <tibble [14 × 10]> <lm>  
```
