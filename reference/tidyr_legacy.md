# Legacy name repair

Ensures all column names are unique using the approach found in tidyr
0.8.3 and earlier. Only use this function if you want to preserve the
naming strategy, otherwise you're better off adopting the new tidyverse
standard with `name_repair = "universal"`

## Usage

``` r
tidyr_legacy(nms, prefix = "V", sep = "")
```

## Arguments

- nms:

  Character vector of names

- prefix:

  prefix Prefix to use for unnamed column

- sep:

  Separator to use between name and unique suffix

## Examples

``` r
df <- tibble(x = 1:2, y = list(tibble(x = 3:5), tibble(x = 4:7)))

# Doesn't work because it would produce a data frame with two
# columns called x
if (FALSE) { # \dontrun{
unnest(df, y)
} # }

# The new tidyverse standard:
unnest(df, y, names_repair = "universal")
#> New names:
#> • `x` -> `x...1`
#> • `x` -> `x...2`
#> # A tibble: 7 × 2
#>   x...1 x...2
#>   <int> <int>
#> 1     1     3
#> 2     1     4
#> 3     1     5
#> 4     2     4
#> 5     2     5
#> 6     2     6
#> 7     2     7

# The old tidyr approach
unnest(df, y, names_repair = tidyr_legacy)
#> # A tibble: 7 × 2
#>       x    x1
#>   <int> <int>
#> 1     1     3
#> 2     1     4
#> 3     1     5
#> 4     2     4
#> 5     2     5
#> 6     2     6
#> 7     2     7
```
