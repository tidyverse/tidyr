# Extract a character column into multiple columns using regular expression groups

**\[superseded\]**

`extract()` has been superseded in favour of
[`separate_wider_regex()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md)
because it has a more polished API and better handling of problems.
Superseded functions will not go away, but will only receive critical
bug fixes.

Given a regular expression with capturing groups, `extract()` turns each
group into a new column. If the groups don't match, or the input is NA,
the output will be NA.

## Usage

``` r
extract(
  data,
  col,
  into,
  regex = "([[:alnum:]]+)",
  remove = TRUE,
  convert = FALSE,
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

- regex:

  A string representing a regular expression used to extract the desired
  values. There should be one group (defined by `()`) for each element
  of `into`.

- remove:

  If `TRUE`, remove input column from output data frame.

- convert:

  If `TRUE`, will run
  [`type.convert()`](https://rdrr.io/r/utils/type.convert.html) with
  `as.is = TRUE` on new columns. This is useful if the component columns
  are integer, numeric or logical.

  NB: this will cause string `"NA"`s to be converted to `NA`s.

- ...:

  Additional arguments passed on to methods.

## See also

[`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md) to
split up by a separator.

## Examples

``` r
df <- tibble(x = c(NA, "a-b", "a-d", "b-c", "d-e"))
df |> extract(x, "A")
#> # A tibble: 5 × 1
#>   A    
#>   <chr>
#> 1 NA   
#> 2 a    
#> 3 a    
#> 4 b    
#> 5 d    
df |> extract(x, c("A", "B"), "([[:alnum:]]+)-([[:alnum:]]+)")
#> # A tibble: 5 × 2
#>   A     B    
#>   <chr> <chr>
#> 1 NA    NA   
#> 2 a     b    
#> 3 a     d    
#> 4 b     c    
#> 5 d     e    

# Now recommended
df |>
  separate_wider_regex(
    x,
    patterns = c(A = "[[:alnum:]]+", "-", B = "[[:alnum:]]+")
  )
#> # A tibble: 5 × 2
#>   A     B    
#>   <chr> <chr>
#> 1 NA    NA   
#> 2 a     b    
#> 3 a     d    
#> 4 b     c    
#> 5 d     e    

# If no match, NA:
df |> extract(x, c("A", "B"), "([a-d]+)-([a-d]+)")
#> # A tibble: 5 × 2
#>   A     B    
#>   <chr> <chr>
#> 1 NA    NA   
#> 2 a     b    
#> 3 a     d    
#> 4 b     c    
#> 5 NA    NA   
```
