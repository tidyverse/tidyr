# Chop and unchop

Chopping and unchopping preserve the width of a data frame, changing its
length. `chop()` makes `df` shorter by converting rows within each group
into list-columns. `unchop()` makes `df` longer by expanding
list-columns so that each element of the list-column gets its own row in
the output. `chop()` and `unchop()` are building blocks for more
complicated functions (like
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
and
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md))
and are generally more suitable for programming than interactive data
analysis.

## Usage

``` r
chop(data, cols, ..., error_call = current_env())

unchop(
  data,
  cols,
  ...,
  keep_empty = FALSE,
  ptype = NULL,
  error_call = current_env()
)
```

## Arguments

- data:

  A data frame.

- cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to chop or unchop.

  For `unchop()`, each column should be a list-column containing
  generalised vectors (e.g. any mix of `NULL`s, atomic vector, S3
  vectors, a lists, or data frames).

- ...:

  These dots are for future extensions and must be empty.

- error_call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

- keep_empty:

  By default, you get one row of output for each element of the list
  that you are unchopping/unnesting. This means that if there's a size-0
  element (like `NULL` or an empty data frame or vector), then that
  entire row will be dropped from the output. If you want to preserve
  all rows, use `keep_empty = TRUE` to replace size-0 elements with a
  single row of missing values.

- ptype:

  Optionally, a named list of column name-prototype pairs to coerce
  `cols` to, overriding the default that will be guessed from combining
  the individual values. Alternatively, a single empty ptype can be
  supplied, which will be applied to all `cols`.

## Details

Generally, unchopping is more useful than chopping because it simplifies
a complex data structure, and
[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md)ing is
usually more appropriate than `chop()`ing since it better preserves the
connections between observations.

`chop()` creates list-columns of class
[`vctrs::list_of()`](https://vctrs.r-lib.org/reference/list_of.html) to
ensure consistent behaviour when the chopped data frame is emptied. For
instance this helps getting back the original column types after the
roundtrip chop and unchop. Because `<list_of>` keeps tracks of the type
of its elements, `unchop()` is able to reconstitute the correct vector
type even for empty list-columns.

## Examples

``` r
# Chop ----------------------------------------------------------------------
df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
# Note that we get one row of output for each unique combination of
# non-chopped variables
df |> chop(c(y, z))
#> # A tibble: 3 × 3
#>       x           y           z
#>   <dbl> <list<int>> <list<int>>
#> 1     1         [3]         [3]
#> 2     2         [2]         [2]
#> 3     3         [1]         [1]
# cf nest
df |> nest(data = c(y, z))
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>

# Unchop --------------------------------------------------------------------
df <- tibble(x = 1:4, y = list(integer(), 1L, 1:2, 1:3))
df |> unchop(y)
#> # A tibble: 6 × 2
#>       x     y
#>   <int> <int>
#> 1     2     1
#> 2     3     1
#> 3     3     2
#> 4     4     1
#> 5     4     2
#> 6     4     3
df |> unchop(y, keep_empty = TRUE)
#> # A tibble: 7 × 2
#>       x     y
#>   <int> <int>
#> 1     1    NA
#> 2     2     1
#> 3     3     1
#> 4     3     2
#> 5     4     1
#> 6     4     2
#> 7     4     3

# unchop will error if the types are not compatible:
df <- tibble(x = 1:2, y = list("1", 1:3))
try(df |> unchop(y))
#> Error in unchop(df, y) : 
#>   Can't combine `y[[1]]` <character> and `y[[2]]` <integer>.

# Unchopping a list-col of data frames must generate a df-col because
# unchop leaves the column names unchanged
df <- tibble(x = 1:3, y = list(NULL, tibble(x = 1), tibble(y = 1:2)))
df |> unchop(y)
#> # A tibble: 3 × 2
#>       x   y$x    $y
#>   <int> <dbl> <int>
#> 1     2     1    NA
#> 2     3    NA     1
#> 3     3    NA     2
df |> unchop(y, keep_empty = TRUE)
#> # A tibble: 4 × 2
#>       x   y$x    $y
#>   <int> <dbl> <int>
#> 1     1    NA    NA
#> 2     2     1    NA
#> 3     3    NA     1
#> 4     3    NA     2
```
