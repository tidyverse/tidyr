# Separate a collapsed column into multiple rows

**\[superseded\]**

`separate_rows()` has been superseded in favour of
[`separate_longer_delim()`](https://tidyr.tidyverse.org/dev/reference/separate_longer_delim.md)
because it has a more consistent API with other separate functions.
Superseded functions will not go away, but will only receive critical
bug fixes.

If a variable contains observations with multiple delimited values,
`separate_rows()` separates the values and places each one in its own
row.

## Usage

``` r
separate_rows(data, ..., sep = "[^[:alnum:].]+", convert = FALSE)
```

## Arguments

- data:

  A data frame.

- ...:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to separate across multiple rows

- sep:

  Separator delimiting collapsed values.

- convert:

  If `TRUE` will automatically run
  [`type.convert()`](https://rdrr.io/r/utils/type.convert.html) on the
  key column. This is useful if the column types are actually numeric,
  integer, or logical.

## Examples

``` r
df <- tibble(
  x = 1:3,
  y = c("a", "d,e,f", "g,h"),
  z = c("1", "2,3,4", "5,6")
)
separate_rows(df, y, z, convert = TRUE)
#> # A tibble: 6 × 3
#>       x y         z
#>   <int> <chr> <int>
#> 1     1 a         1
#> 2     2 d         2
#> 3     2 e         3
#> 4     2 f         4
#> 5     3 g         5
#> 6     3 h         6

# Now recommended
df |>
  separate_longer_delim(c(y, z), delim = ",")
#> # A tibble: 6 × 3
#>       x y     z    
#>   <int> <chr> <chr>
#> 1     1 a     1    
#> 2     2 d     2    
#> 3     2 e     3    
#> 4     2 f     4    
#> 5     3 g     5    
#> 6     3 h     6    
```
