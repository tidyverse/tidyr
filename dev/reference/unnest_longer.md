# Unnest a list-column into rows

`unnest_longer()` turns each element of a list-column into a row. It is
most naturally suited to list-columns where the elements are unnamed and
the length of each element varies from row to row.

`unnest_longer()` generally preserves the number of columns of `x` while
modifying the number of rows.

Learn more in
[`vignette("rectangle")`](https://tidyr.tidyverse.org/dev/articles/rectangle.md).

## Usage

``` r
unnest_longer(
  data,
  col,
  values_to = NULL,
  indices_to = NULL,
  indices_include = NULL,
  keep_empty = FALSE,
  names_repair = "check_unique",
  simplify = TRUE,
  ptype = NULL,
  transform = NULL
)
```

## Arguments

- data:

  A data frame.

- col:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  List-column(s) to unnest.

  When selecting multiple columns, values from the same row will be
  recycled to their common size.

- values_to:

  A string giving the column name (or names) to store the unnested
  values in. If multiple columns are specified in `col`, this can also
  be a glue string containing `"{col}"` to provide a template for the
  column names. The default, `NULL`, gives the output columns the same
  names as the input columns.

- indices_to:

  A string giving the column name (or names) to store the inner names or
  positions (if not named) of the values. If multiple columns are
  specified in `col`, this can also be a glue string containing
  `"{col}"` to provide a template for the column names. The default,
  `NULL`, gives the output columns the same names as `values_to`, but
  suffixed with `"_id"`.

- indices_include:

  A single logical value specifying whether or not to add an index
  column. If any value has inner names, the index column will be a
  character vector of those names, otherwise it will be an integer
  vector of positions. If `NULL`, defaults to `TRUE` if any value has
  inner names or if `indices_to` is provided.

  If `indices_to` is provided, then `indices_include` can't be `FALSE`.

- keep_empty:

  By default, you get one row of output for each element of the list
  that you are unchopping/unnesting. This means that if there's a size-0
  element (like `NULL` or an empty data frame or vector), then that
  entire row will be dropped from the output. If you want to preserve
  all rows, use `keep_empty = TRUE` to replace size-0 elements with a
  single row of missing values.

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

- simplify:

  If `TRUE`, will attempt to simplify lists of length-1 vectors to an
  atomic vector. Can also be a named list containing `TRUE` or `FALSE`
  declaring whether or not to attempt to simplify a particular column.
  If a named list is provided, the default for any unspecified columns
  is `TRUE`.

- ptype:

  Optionally, a named list of prototypes declaring the desired output
  type of each component. Alternatively, a single empty prototype can be
  supplied, which will be applied to all components. Use this argument
  if you want to check that each element has the type you expect when
  simplifying.

  If a `ptype` has been specified, but `simplify = FALSE` or
  simplification isn't possible, then a
  [list-of](https://vctrs.r-lib.org/reference/list_of.html) column will
  be returned and each element will have type `ptype`.

- transform:

  Optionally, a named list of transformation functions applied to each
  component. Alternatively, a single function can be supplied, which
  will be applied to all components. Use this argument if you want to
  transform or parse individual elements as they are extracted.

  When both `ptype` and `transform` are supplied, the `transform` is
  applied before the `ptype`.

## See also

Other rectangling:
[`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)

## Examples

``` r
# `unnest_longer()` is useful when each component of the list should
# form a row
df <- tibble(
  x = 1:4,
  y = list(NULL, 1:3, 4:5, integer())
)
df |> unnest_longer(y)
#> # A tibble: 5 × 2
#>       x     y
#>   <int> <int>
#> 1     2     1
#> 2     2     2
#> 3     2     3
#> 4     3     4
#> 5     3     5

# Note that empty values like `NULL` and `integer()` are dropped by
# default. If you'd like to keep them, set `keep_empty = TRUE`.
df |> unnest_longer(y, keep_empty = TRUE)
#> # A tibble: 7 × 2
#>       x     y
#>   <int> <int>
#> 1     1    NA
#> 2     2     1
#> 3     2     2
#> 4     2     3
#> 5     3     4
#> 6     3     5
#> 7     4    NA

# If the inner vectors are named, the names are copied to an `_id` column
df <- tibble(
  x = 1:2,
  y = list(c(a = 1, b = 2), c(a = 10, b = 11, c = 12))
)
df |> unnest_longer(y)
#> # A tibble: 5 × 3
#>       x y_id      y
#>   <int> <chr> <dbl>
#> 1     1 a         1
#> 2     1 b         2
#> 3     2 a        10
#> 4     2 b        11
#> 5     2 c        12

# Multiple columns ----------------------------------------------------------
# If columns are aligned, you can unnest simultaneously
df <- tibble(
  x = 1:2,
  y = list(1:2, 3:4),
  z = list(5:6, 7:8)
)
df |>
  unnest_longer(c(y, z))
#> # A tibble: 4 × 3
#>       x     y     z
#>   <int> <int> <int>
#> 1     1     1     5
#> 2     1     2     6
#> 3     2     3     7
#> 4     2     4     8

# This is important because sequential unnesting would generate the
# Cartesian product of the rows
df |>
  unnest_longer(y) |>
  unnest_longer(z)
#> # A tibble: 8 × 3
#>       x     y     z
#>   <int> <int> <int>
#> 1     1     1     5
#> 2     1     1     6
#> 3     1     2     5
#> 4     1     2     6
#> 5     2     3     7
#> 6     2     3     8
#> 7     2     4     7
#> 8     2     4     8
```
