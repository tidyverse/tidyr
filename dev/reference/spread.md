# Spread a key-value pair across multiple columns

**\[superseded\]**

Development on `spread()` is complete, and for new code we recommend
switching to
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md),
which is easier to use, more featureful, and still under active
development. `df |> spread(key, value)` is equivalent to
`df |> pivot_wider(names_from = key, values_from = value)`

See more details in
[`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md).

## Usage

``` r
spread(data, key, value, fill = NA, convert = FALSE, drop = TRUE, sep = NULL)
```

## Arguments

- data:

  A data frame.

- key, value:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to use for `key` and `value`.

- fill:

  If set, missing values will be replaced with this value. Note that
  there are two types of missingness in the input: explicit missing
  values (i.e. `NA`), and implicit missings, rows that simply aren't
  present. Both types of missing value will be replaced by `fill`.

- convert:

  If `TRUE`,
  [`type.convert()`](https://rdrr.io/r/utils/type.convert.html) with
  `asis = TRUE` will be run on each of the new columns. This is useful
  if the value column was a mix of variables that was coerced to a
  string. If the class of the value column was factor or date, note that
  will not be true of the new columns that are produced, which are
  coerced to character before type conversion.

- drop:

  If `FALSE`, will keep factor levels that don't appear in the data,
  filling in missing combinations with `fill`.

- sep:

  If `NULL`, the column names will be taken from the values of `key`
  variable. If non-`NULL`, the column names will be given by
  `"<key_name><sep><key_value>"`.

## Examples

``` r
stocks <- tibble(
  time = as.Date("2009-01-01") + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocksm <- stocks |> gather(stock, price, -time)
stocksm |> spread(stock, price)
#> # A tibble: 10 × 4
#>    time            X      Y      Z
#>    <date>      <dbl>  <dbl>  <dbl>
#>  1 2009-01-01 -0.679 -3.56  10.3  
#>  2 2009-01-02  0.738 -1.43  -3.16 
#>  3 2009-01-03 -0.861  1.82   2.35 
#>  4 2009-01-04  0.421 -1.54  -2.85 
#>  5 2009-01-05  1.45  -1.56   6.34 
#>  6 2009-01-06  0.194 -0.864  2.71 
#>  7 2009-01-07 -0.691 -1.34  -0.931
#>  8 2009-01-08  1.34   2.78   2.55 
#>  9 2009-01-09  2.74   1.82  -5.48 
#> 10 2009-01-10 -0.944  0.411 -5.70 
stocksm |> spread(time, price)
#> # A tibble: 3 × 11
#>   stock `2009-01-01` `2009-01-02` `2009-01-03` `2009-01-04`
#>   <chr>        <dbl>        <dbl>        <dbl>        <dbl>
#> 1 X           -0.679        0.738       -0.861        0.421
#> 2 Y           -3.56        -1.43         1.82        -1.54 
#> 3 Z           10.3         -3.16         2.35        -2.85 
#> # ℹ 6 more variables: `2009-01-05` <dbl>, `2009-01-06` <dbl>,
#> #   `2009-01-07` <dbl>, `2009-01-08` <dbl>, `2009-01-09` <dbl>,
#> #   `2009-01-10` <dbl>

# Spread and gather are complements
df <- tibble(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
df |>
  spread(x, y) |>
  gather("x", "y", a:b, na.rm = TRUE)
#> # A tibble: 2 × 3
#>       z x         y
#>   <dbl> <chr> <dbl>
#> 1     5 a         3
#> 2     6 b         4

# Use 'convert = TRUE' to produce variables of mixed type
df <- tibble(
  row = rep(c(1, 51), each = 3),
  var = rep(c("Sepal.Length", "Species", "Species_num"), 2),
  value = c(5.1, "setosa", 1, 7.0, "versicolor", 2)
)
df |> spread(var, value) |> str()
#> tibble [2 × 4] (S3: tbl_df/tbl/data.frame)
#>  $ row         : num [1:2] 1 51
#>  $ Sepal.Length: chr [1:2] "5.1" "7"
#>  $ Species     : chr [1:2] "setosa" "versicolor"
#>  $ Species_num : chr [1:2] "1" "2"
df |> spread(var, value, convert = TRUE) |> str()
#> tibble [2 × 4] (S3: tbl_df/tbl/data.frame)
#>  $ row         : num [1:2] 1 51
#>  $ Sepal.Length: num [1:2] 5.1 7
#>  $ Species     : chr [1:2] "setosa" "versicolor"
#>  $ Species_num : int [1:2] 1 2
```
