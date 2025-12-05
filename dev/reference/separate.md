# Separate a character column into multiple columns with a regular expression or numeric locations

**\[superseded\]**

`separate()` has been superseded in favour of
[`separate_wider_position()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md)
and
[`separate_wider_delim()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md)
because the two functions make the two uses more obvious, the API is
more polished, and the handling of problems is better. Superseded
functions will not go away, but will only receive critical bug fixes.

Given either a regular expression or a vector of character positions,
`separate()` turns a single character column into multiple columns.

## Usage

``` r
separate(
  data,
  col,
  into,
  sep = "[^[:alnum:]]+",
  remove = TRUE,
  convert = FALSE,
  extra = "warn",
  fill = "warn",
  ...
)
```

## Arguments

- data:

  A data frame.

- col:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Column to expand.

- into:

  Names of new variables to create as character vector. Use `NA` to omit
  the variable in the output.

- sep:

  Separator between columns.

  If character, `sep` is interpreted as a regular expression. The
  default value is a regular expression that matches any sequence of
  non-alphanumeric values.

  If numeric, `sep` is interpreted as character positions to split at.
  Positive values start at 1 at the far-left of the string; negative
  value start at -1 at the far-right of the string. The length of `sep`
  should be one less than `into`.

- remove:

  If `TRUE`, remove input column from output data frame.

- convert:

  If `TRUE`, will run
  [`type.convert()`](https://rdrr.io/r/utils/type.convert.html) with
  `as.is = TRUE` on new columns. This is useful if the component columns
  are integer, numeric or logical.

  NB: this will cause string `"NA"`s to be converted to `NA`s.

- extra:

  If `sep` is a character vector, this controls what happens when there
  are too many pieces. There are three valid options:

  - `"warn"` (the default): emit a warning and drop extra values.

  - `"drop"`: drop any extra values without a warning.

  - `"merge"`: only splits at most `length(into)` times

- fill:

  If `sep` is a character vector, this controls what happens when there
  are not enough pieces. There are three valid options:

  - `"warn"` (the default): emit a warning and fill from the right

  - `"right"`: fill with missing values on the right

  - `"left"`: fill with missing values on the left

- ...:

  Additional arguments passed on to methods.

## See also

[`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md), the
complement,
[`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
which uses regular expression capturing groups.

## Examples

``` r
# If you want to split by any non-alphanumeric value (the default):
df <- tibble(x = c(NA, "x.y", "x.z", "y.z"))
df |> separate(x, c("A", "B"))
#> # A tibble: 4 × 2
#>   A     B    
#>   <chr> <chr>
#> 1 NA    NA   
#> 2 x     y    
#> 3 x     z    
#> 4 y     z    

# If you just want the second variable:
df |> separate(x, c(NA, "B"))
#> # A tibble: 4 × 1
#>   B    
#>   <chr>
#> 1 NA   
#> 2 y    
#> 3 z    
#> 4 z    

# We now recommend separate_wider_delim() instead:
df |> separate_wider_delim(x, ".", names = c("A", "B"))
#> # A tibble: 4 × 2
#>   A     B    
#>   <chr> <chr>
#> 1 NA    NA   
#> 2 x     y    
#> 3 x     z    
#> 4 y     z    
df |> separate_wider_delim(x, ".", names = c(NA, "B"))
#> # A tibble: 4 × 1
#>   B    
#>   <chr>
#> 1 NA   
#> 2 y    
#> 3 z    
#> 4 z    

# Controlling uneven splits -------------------------------------------------
# If every row doesn't split into the same number of pieces, use
# the extra and fill arguments to control what happens:
df <- tibble(x = c("x", "x y", "x y z", NA))
df |> separate(x, c("a", "b"))
#> Warning: Expected 2 pieces. Additional pieces discarded in 1 rows [3].
#> Warning: Expected 2 pieces. Missing pieces filled with `NA` in 1 rows [1].
#> # A tibble: 4 × 2
#>   a     b    
#>   <chr> <chr>
#> 1 x     NA   
#> 2 x     y    
#> 3 x     y    
#> 4 NA    NA   
# The same behaviour as previous, but drops the c without warnings:
df |> separate(x, c("a", "b"), extra = "drop", fill = "right")
#> # A tibble: 4 × 2
#>   a     b    
#>   <chr> <chr>
#> 1 x     NA   
#> 2 x     y    
#> 3 x     y    
#> 4 NA    NA   
# Opposite of previous, keeping the c and filling left:
df |> separate(x, c("a", "b"), extra = "merge", fill = "left")
#> # A tibble: 4 × 2
#>   a     b    
#>   <chr> <chr>
#> 1 NA    x    
#> 2 x     y    
#> 3 x     y z  
#> 4 NA    NA   
# Or you can keep all three:
df |> separate(x, c("a", "b", "c"))
#> Warning: Expected 3 pieces. Missing pieces filled with `NA` in 2 rows [1, 2].
#> # A tibble: 4 × 3
#>   a     b     c    
#>   <chr> <chr> <chr>
#> 1 x     NA    NA   
#> 2 x     y     NA   
#> 3 x     y     z    
#> 4 NA    NA    NA   

# To only split a specified number of times use extra = "merge":
df <- tibble(x = c("x: 123", "y: error: 7"))
df |> separate(x, c("key", "value"), ": ", extra = "merge")
#> # A tibble: 2 × 2
#>   key   value   
#>   <chr> <chr>   
#> 1 x     123     
#> 2 y     error: 7

# Controlling column types --------------------------------------------------
# convert = TRUE detects column classes:
df <- tibble(x = c("x:1", "x:2", "y:4", "z", NA))
df |> separate(x, c("key", "value"), ":") |> str()
#> Warning: Expected 2 pieces. Missing pieces filled with `NA` in 1 rows [4].
#> tibble [5 × 2] (S3: tbl_df/tbl/data.frame)
#>  $ key  : chr [1:5] "x" "x" "y" "z" ...
#>  $ value: chr [1:5] "1" "2" "4" NA ...
df |> separate(x, c("key", "value"), ":", convert = TRUE) |> str()
#> Warning: Expected 2 pieces. Missing pieces filled with `NA` in 1 rows [4].
#> tibble [5 × 2] (S3: tbl_df/tbl/data.frame)
#>  $ key  : chr [1:5] "x" "x" "y" "z" ...
#>  $ value: int [1:5] 1 2 4 NA NA
```
