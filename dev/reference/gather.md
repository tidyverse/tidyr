# Gather columns into key-value pairs

**\[superseded\]**

Development on `gather()` is complete, and for new code we recommend
switching to
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md),
which is easier to use, more featureful, and still under active
development. `df |> gather("key", "value", x, y, z)` is equivalent to
`df |> pivot_longer(c(x, y, z), names_to = "key", values_to = "value")`

See more details in
[`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md).

## Usage

``` r
gather(
  data,
  key = "key",
  value = "value",
  ...,
  na.rm = FALSE,
  convert = FALSE,
  factor_key = FALSE
)
```

## Arguments

- data:

  A data frame.

- key, value:

  Names of new key and value columns, as strings or symbols.

  This argument is passed by expression and supports
  [quasiquotation](https://rlang.r-lib.org/reference/topic-inject.html)
  (you can unquote strings and symbols). The name is captured from the
  expression with
  [`rlang::ensym()`](https://rlang.r-lib.org/reference/defusing-advanced.html)
  (note that this kind of interface where symbols do not represent
  actual objects is now discouraged in the tidyverse; we support it here
  for backward compatibility).

- ...:

  A selection of columns. If empty, all variables are selected. You can
  supply bare variable names, select all variables between x and z with
  `x:z`, exclude y with `-y`. For more options, see the
  [`dplyr::select()`](https://dplyr.tidyverse.org/reference/select.html)
  documentation. See also the section on selection rules below.

- na.rm:

  If `TRUE`, will remove rows from output where the value column is
  `NA`.

- convert:

  If `TRUE` will automatically run
  [`type.convert()`](https://rdrr.io/r/utils/type.convert.html) on the
  key column. This is useful if the column types are actually numeric,
  integer, or logical.

- factor_key:

  If `FALSE`, the default, the key values will be stored as a character
  vector. If `TRUE`, will be stored as a factor, which preserves the
  original ordering of the columns.

## Rules for selection

Arguments for selecting columns are passed to
[`tidyselect::vars_select()`](https://tidyselect.r-lib.org/reference/vars_select.html)
and are treated specially. Unlike other verbs, selecting functions make
a strict distinction between data expressions and context expressions.

- A data expression is either a bare name like `x` or an expression like
  `x:y` or `c(x, y)`. In a data expression, you can only refer to
  columns from the data frame.

- Everything else is a context expression in which you can only refer to
  objects that you have defined with `<-`.

For instance, `col1:col3` is a data expression that refers to data
columns, while `seq(start, end)` is a context expression that refers to
objects from the contexts.

If you need to refer to contextual objects from a data expression, you
can use [`all_of()`](https://tidyselect.r-lib.org/reference/all_of.html)
or [`any_of()`](https://tidyselect.r-lib.org/reference/all_of.html).
These functions are used to select data-variables whose names are stored
in a env-variable. For instance, `all_of(a)` selects the variables
listed in the character vector `a`. For more details, see the
[`tidyselect::select_helpers()`](https://tidyselect.r-lib.org/reference/language.html)
documentation.

## Examples

``` r
# From https://stackoverflow.com/questions/1181060
stocks <- tibble(
  time = as.Date("2009-01-01") + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)

gather(stocks, "stock", "price", -time)
#> # A tibble: 30 × 3
#>    time       stock   price
#>    <date>     <chr>   <dbl>
#>  1 2009-01-01 X     -0.0526
#>  2 2009-01-02 X      0.543 
#>  3 2009-01-03 X     -0.914 
#>  4 2009-01-04 X      0.468 
#>  5 2009-01-05 X      0.363 
#>  6 2009-01-06 X     -1.30  
#>  7 2009-01-07 X      0.738 
#>  8 2009-01-08 X      1.89  
#>  9 2009-01-09 X     -0.0974
#> 10 2009-01-10 X     -0.936 
#> # ℹ 20 more rows
stocks |> gather("stock", "price", -time)
#> # A tibble: 30 × 3
#>    time       stock   price
#>    <date>     <chr>   <dbl>
#>  1 2009-01-01 X     -0.0526
#>  2 2009-01-02 X      0.543 
#>  3 2009-01-03 X     -0.914 
#>  4 2009-01-04 X      0.468 
#>  5 2009-01-05 X      0.363 
#>  6 2009-01-06 X     -1.30  
#>  7 2009-01-07 X      0.738 
#>  8 2009-01-08 X      1.89  
#>  9 2009-01-09 X     -0.0974
#> 10 2009-01-10 X     -0.936 
#> # ℹ 20 more rows

# get first observation for each Species in iris data -- base R
mini_iris <- iris[c(1, 51, 101), ]
# gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
gather(mini_iris, key = "flower_att", value = "measurement",
       Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
#>       Species   flower_att measurement
#> 1      setosa Sepal.Length         5.1
#> 2  versicolor Sepal.Length         7.0
#> 3   virginica Sepal.Length         6.3
#> 4      setosa  Sepal.Width         3.5
#> 5  versicolor  Sepal.Width         3.2
#> 6   virginica  Sepal.Width         3.3
#> 7      setosa Petal.Length         1.4
#> 8  versicolor Petal.Length         4.7
#> 9   virginica Petal.Length         6.0
#> 10     setosa  Petal.Width         0.2
#> 11 versicolor  Petal.Width         1.4
#> 12  virginica  Petal.Width         2.5
# same result but less verbose
gather(mini_iris, key = "flower_att", value = "measurement", -Species)
#>       Species   flower_att measurement
#> 1      setosa Sepal.Length         5.1
#> 2  versicolor Sepal.Length         7.0
#> 3   virginica Sepal.Length         6.3
#> 4      setosa  Sepal.Width         3.5
#> 5  versicolor  Sepal.Width         3.2
#> 6   virginica  Sepal.Width         3.3
#> 7      setosa Petal.Length         1.4
#> 8  versicolor Petal.Length         4.7
#> 9   virginica Petal.Length         6.0
#> 10     setosa  Petal.Width         0.2
#> 11 versicolor  Petal.Width         1.4
#> 12  virginica  Petal.Width         2.5
```
