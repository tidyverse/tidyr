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
#>    time            X      Y        Z
#>    <date>      <dbl>  <dbl>    <dbl>
#>  1 2009-01-01 -2.05  -1.40   0.00192
#>  2 2009-01-02  0.151  1.95   3.02   
#>  3 2009-01-03 -0.293 -0.154  1.37   
#>  4 2009-01-04  0.255  1.79   0.674  
#>  5 2009-01-05 -0.553 -1.56   5.59   
#>  6 2009-01-06  1.41   0.874 -2.72   
#>  7 2009-01-07 -0.795  0.827  2.95   
#>  8 2009-01-08 -1.57   1.95  -3.44   
#>  9 2009-01-09 -1.04   2.29   1.68   
#> 10 2009-01-10  1.02   2.43   5.80   
stocksm |> spread(time, price)
#> # A tibble: 3 × 11
#>   stock `2009-01-01` `2009-01-02` `2009-01-03` `2009-01-04`
#>   <chr>        <dbl>        <dbl>        <dbl>        <dbl>
#> 1 X         -2.05           0.151       -0.293        0.255
#> 2 Y         -1.40           1.95        -0.154        1.79 
#> 3 Z          0.00192        3.02         1.37         0.674
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
