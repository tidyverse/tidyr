# Pack and unpack

Packing and unpacking preserve the length of a data frame, changing its
width. `pack()` makes `df` narrow by collapsing a set of columns into a
single df-column. `unpack()` makes `data` wider by expanding df-columns
back out into individual columns.

## Usage

``` r
pack(.data, ..., .names_sep = NULL, .error_call = current_env())

unpack(
  data,
  cols,
  ...,
  names_sep = NULL,
  names_repair = "check_unique",
  error_call = current_env()
)
```

## Arguments

- ...:

  For `pack()`,
  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  columns to pack, specified using name-variable pairs of the form
  `new_col = c(col1, col2, col3)`. The right hand side can be any valid
  tidy select expression.

  For `unpack()`, these dots are for future extensions and must be
  empty.

- data, .data:

  A data frame.

- cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to unpack.

- names_sep, .names_sep:

  If `NULL`, the default, the names will be left as is. In `pack()`,
  inner names will come from the former outer names; in `unpack()`, the
  new outer names will come from the inner names.

  If a string, the inner and outer names will be used together. In
  `unpack()`, the names of the new outer columns will be formed by
  pasting together the outer and the inner column names, separated by
  `names_sep`. In `pack()`, the new inner names will have the outer
  names + `names_sep` automatically stripped. This makes `names_sep`
  roughly symmetric between packing and unpacking.

- names_repair:

  Used to check that output data frame has valid names. Must be one of
  the following options:

  - `"minimal`": no name repair or checks, beyond basic existence,

  - `"unique`": make sure names are unique and not empty,

  - `"check_unique`": (the default), no name repair, but check they are
    unique,

  - `"universal`": make the names unique and syntactic

  - a function: apply custom name repair.

  - [tidyr_legacy](https://tidyr.tidyverse.org/dev/reference/tidyr_legacy.md):
    use the name repair from tidyr 0.8.

  - a formula: a purrr-style anonymous function (see
    [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html))

  See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for more details on these terms and the strategies used to enforce
  them.

- error_call, .error_call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

## Details

Generally, unpacking is more useful than packing because it simplifies a
complex data structure. Currently, few functions work with df-cols, and
they are mostly a curiosity, but seem worth exploring further because
they mimic the nested column headers that are so popular in Excel.

## Examples

``` r
# Packing -------------------------------------------------------------------
# It's not currently clear why you would ever want to pack columns
# since few functions work with this sort of data.
df <- tibble(x1 = 1:3, x2 = 4:6, x3 = 7:9, y = 1:3)
df
#> # A tibble: 3 × 4
#>      x1    x2    x3     y
#>   <int> <int> <int> <int>
#> 1     1     4     7     1
#> 2     2     5     8     2
#> 3     3     6     9     3
df |> pack(x = starts_with("x"))
#> # A tibble: 3 × 2
#>       y  x$x1   $x2   $x3
#>   <int> <int> <int> <int>
#> 1     1     1     4     7
#> 2     2     2     5     8
#> 3     3     3     6     9
df |> pack(x = c(x1, x2, x3), y = y)
#> # A tibble: 3 × 2
#>    x$x1   $x2   $x3   y$y
#>   <int> <int> <int> <int>
#> 1     1     4     7     1
#> 2     2     5     8     2
#> 3     3     6     9     3

# .names_sep allows you to strip off common prefixes; this
# acts as a natural inverse to name_sep in unpack()
iris |>
  as_tibble() |>
  pack(
    Sepal = starts_with("Sepal"),
    Petal = starts_with("Petal"),
    .names_sep = "."
  )
#> # A tibble: 150 × 3
#>    Species Sepal$Length $Width Petal$Length $Width
#>    <fct>          <dbl>  <dbl>        <dbl>  <dbl>
#>  1 setosa           5.1    3.5          1.4    0.2
#>  2 setosa           4.9    3            1.4    0.2
#>  3 setosa           4.7    3.2          1.3    0.2
#>  4 setosa           4.6    3.1          1.5    0.2
#>  5 setosa           5      3.6          1.4    0.2
#>  6 setosa           5.4    3.9          1.7    0.4
#>  7 setosa           4.6    3.4          1.4    0.3
#>  8 setosa           5      3.4          1.5    0.2
#>  9 setosa           4.4    2.9          1.4    0.2
#> 10 setosa           4.9    3.1          1.5    0.1
#> # ℹ 140 more rows

# Unpacking -----------------------------------------------------------------
df <- tibble(
  x = 1:3,
  y = tibble(a = 1:3, b = 3:1),
  z = tibble(X = c("a", "b", "c"), Y = runif(3), Z = c(TRUE, FALSE, NA))
)
df
#> # A tibble: 3 × 3
#>       x   y$a    $b z$X      $Y $Z   
#>   <int> <int> <int> <chr> <dbl> <lgl>
#> 1     1     1     3 a     0.404 TRUE 
#> 2     2     2     2 b     0.218 FALSE
#> 3     3     3     1 c     0.418 NA   
df |> unpack(y)
#> # A tibble: 3 × 4
#>       x     a     b z$X      $Y $Z   
#>   <int> <int> <int> <chr> <dbl> <lgl>
#> 1     1     1     3 a     0.404 TRUE 
#> 2     2     2     2 b     0.218 FALSE
#> 3     3     3     1 c     0.418 NA   
df |> unpack(c(y, z))
#> # A tibble: 3 × 6
#>       x     a     b X         Y Z    
#>   <int> <int> <int> <chr> <dbl> <lgl>
#> 1     1     1     3 a     0.404 TRUE 
#> 2     2     2     2 b     0.218 FALSE
#> 3     3     3     1 c     0.418 NA   
df |> unpack(c(y, z), names_sep = "_")
#> # A tibble: 3 × 6
#>       x   y_a   y_b z_X     z_Y z_Z  
#>   <int> <int> <int> <chr> <dbl> <lgl>
#> 1     1     1     3 a     0.404 TRUE 
#> 2     2     2     2 b     0.218 FALSE
#> 3     3     3     1 c     0.418 NA   
```
