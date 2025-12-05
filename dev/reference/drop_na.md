# Drop rows containing missing values

`drop_na()` drops rows where any column specified by `...` contains a
missing value.

## Usage

``` r
drop_na(data, ...)
```

## Arguments

- data:

  A data frame.

- ...:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to inspect for missing values. If empty, all columns are used.

## Details

Another way to interpret `drop_na()` is that it only keeps the
"complete" rows (where no rows contain missing values). Internally, this
completeness is computed through
[`vctrs::vec_detect_complete()`](https://vctrs.r-lib.org/reference/vec_detect_complete.html).

## Examples

``` r
df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
df |> drop_na()
#> # A tibble: 1 × 2
#>       x y    
#>   <dbl> <chr>
#> 1     1 a    
df |> drop_na(x)
#> # A tibble: 2 × 2
#>       x y    
#>   <dbl> <chr>
#> 1     1 a    
#> 2     2 NA   

vars <- "y"
df |> drop_na(x, any_of(vars))
#> # A tibble: 1 × 2
#>       x y    
#>   <dbl> <chr>
#> 1     1 a    
```
