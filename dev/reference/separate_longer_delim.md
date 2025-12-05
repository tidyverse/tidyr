# Split a string into rows

**\[experimental\]**

Each of these functions takes a string and splits it into multiple rows:

- `separate_longer_delim()` splits by a delimiter.

- `separate_longer_position()` splits by a fixed width.

## Usage

``` r
separate_longer_delim(data, cols, delim, ...)

separate_longer_position(data, cols, width, ..., keep_empty = FALSE)
```

## Arguments

- data:

  A data frame.

- cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to separate.

- delim:

  For `separate_longer_delim()`, a string giving the delimiter between
  values. By default, it is interpreted as a fixed string; use
  [`stringr::regex()`](https://stringr.tidyverse.org/reference/modifiers.html)
  and friends to split in other ways.

- ...:

  These dots are for future extensions and must be empty.

- width:

  For `separate_longer_position()`, an integer giving the number of
  characters to split by.

- keep_empty:

  By default, you'll get `ceiling(nchar(x) / width)` rows for each
  observation. If `nchar(x)` is zero, this means the entire input row
  will be dropped from the output. If you want to preserve all rows, use
  `keep_empty = TRUE` to replace size-0 elements with a missing value.

## Value

A data frame based on `data`. It has the same columns, but different
rows.

## Examples

``` r
df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
df |> separate_longer_delim(x, delim = " ")
#> # A tibble: 7 × 2
#>      id x    
#>   <int> <chr>
#> 1     1 x    
#> 2     2 x    
#> 3     2 y    
#> 4     3 x    
#> 5     3 y    
#> 6     3 z    
#> 7     4 NA   

# You can separate multiple columns at once if they have the same structure
df <- tibble(id = 1:3, x = c("x", "x y", "x y z"), y = c("a", "a b", "a b c"))
df |> separate_longer_delim(c(x, y), delim = " ")
#> # A tibble: 6 × 3
#>      id x     y    
#>   <int> <chr> <chr>
#> 1     1 x     a    
#> 2     2 x     a    
#> 3     2 y     b    
#> 4     3 x     a    
#> 5     3 y     b    
#> 6     3 z     c    

# Or instead split by a fixed length
df <- tibble(id = 1:3, x = c("ab", "def", ""))
df |> separate_longer_position(x, 1)
#> # A tibble: 5 × 2
#>      id x    
#>   <int> <chr>
#> 1     1 a    
#> 2     1 b    
#> 3     2 d    
#> 4     2 e    
#> 5     2 f    
df |> separate_longer_position(x, 2)
#> # A tibble: 3 × 2
#>      id x    
#>   <int> <chr>
#> 1     1 ab   
#> 2     2 de   
#> 3     2 f    
df |> separate_longer_position(x, 2, keep_empty = TRUE)
#> # A tibble: 4 × 2
#>      id x    
#>   <int> <chr>
#> 1     1 ab   
#> 2     2 de   
#> 3     2 f    
#> 4     3 NA   
```
