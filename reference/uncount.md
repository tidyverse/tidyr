# "Uncount" a data frame

Performs the opposite operation to
[`dplyr::count()`](https://dplyr.tidyverse.org/reference/count.html),
duplicating rows according to a weighting variable (or expression).

## Usage

``` r
uncount(data, weights, ..., .remove = TRUE, .id = NULL)
```

## Arguments

- data:

  A data frame, tibble, or grouped tibble.

- weights:

  A vector of weights. Evaluated in the context of `data`; supports
  quasiquotation.

- ...:

  Additional arguments passed on to methods.

- .remove:

  If `TRUE`, and `weights` is the name of a column in `data`, then this
  column is removed.

- .id:

  Supply a string to create a new variable which gives a unique
  identifier for each created row.

## Examples

``` r
df <- tibble(x = c("a", "b"), n = c(1, 2))
uncount(df, n)
#> # A tibble: 3 × 1
#>   x    
#>   <chr>
#> 1 a    
#> 2 b    
#> 3 b    
uncount(df, n, .id = "id")
#> # A tibble: 3 × 2
#>   x        id
#>   <chr> <int>
#> 1 a         1
#> 2 b         1
#> 3 b         2

# You can also use constants
uncount(df, 2)
#> # A tibble: 4 × 2
#>   x         n
#>   <chr> <dbl>
#> 1 a         1
#> 2 a         1
#> 3 b         2
#> 4 b         2

# Or expressions
uncount(df, 2 / n)
#> # A tibble: 3 × 2
#>   x         n
#>   <chr> <dbl>
#> 1 a         1
#> 2 a         1
#> 3 b         2
```
