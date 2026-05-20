# Chop and unchop

Chopping and unchopping preserve the width of a data frame, changing its
length. `chop()` makes `data` shorter by converting rows within each
group into list-columns. `unchop()` makes `data` longer by expanding
list-columns so that each element of the list-column gets its own row in
the output.

`chop()` and `unchop()` are building blocks for more complicated
functions (like
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
and
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)).

## Usage

``` r
chop(data, ..., cols = NULL, by = NULL, error_call = current_env())

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

- ...:

  These dots are for future extensions and must be empty.

- cols, by:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Column selectors.

  For `chop()`:

  - `by` selects columns to chop by. If not specified, will be derived
    as all columns not selected by `cols`.

  - `cols` selects columns to chop. If not specified, will be derived as
    all columns not selected by `by`.

  Specifying both `by` and `cols` drops all unselected columns in `data`
  from the output. Note that columns selected by `by` are removed from
  `data` before evaluating `cols`.

  At least one of `by` or `cols` must be specified.

  For `unchop()`, `cols` selects columns to unchop. Each column should
  be a list-column containing generalised vectors (e.g. any mix of
  `NULL`s, atomic vectors, S3 vectors, lists, or data frames).

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

When multiple columns are being chopped at once,
[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) is usually
more appropriate than `chop()` since it better preserves the connections
between observations.

`chop()` creates list-columns of class
[`vctrs::list_of()`](https://vctrs.r-lib.org/reference/list_of.html) to
ensure consistent behaviour when the chopped data frame is emptied. For
instance this helps getting back the original column types after the
roundtrip chop and unchop. Because `<list_of>` keeps tracks of the type
of its elements, `unchop()` is able to reconstitute the correct vector
type even for empty list-columns.

## Connection to [`split()`](https://rdrr.io/r/base/split.html)

`chop()` is the tidyverse version of
[`base::split()`](https://rdrr.io/r/base/split.html), with a few key
changes:

- The unique values of the columns used to chop by are preserved
  losslessly as output columns, rather than being converted to character
  labels used as names on the output list. This is particularly useful
  when chopping by non-string columns or multiple columns.

- Multiple columns can be chopped at once, producing one list-column per
  chopped column. The closest
  [`split()`](https://rdrr.io/r/base/split.html) equivalent is to split
  a data frame, which produces a result more similar to
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) than
  `chop()`.

- When chopping by multiple columns, only the combinations present in
  the data are included in the output. This is different from
  [`split()`](https://rdrr.io/r/base/split.html), which takes the
  [`interaction()`](https://rdrr.io/r/base/interaction.html) of the
  columns, leading to a potential combinatorial explosion of output
  elements.

For an even lower-level version, see
[`vctrs::vec_split()`](https://vctrs.r-lib.org/reference/vec_split.html).

## Examples

``` r
# Chop ----------------------------------------------------------------------
df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = c(1, 1, 2, 3, 3, 4), z = 1:6)

# `chop()` is most useful as a tidyverse alternative to `base::split()`

# Chop `z` by `x` and `y`. Note that we get one row of output for each unique
# combination of variables that we chop by.
df |> chop(by = c(x, y))
#> # A tibble: 4 × 3
#>       x     y           z
#>   <dbl> <dbl> <list<int>>
#> 1     1     1         [2]
#> 2     1     2         [1]
#> 3     2     3         [2]
#> 4     3     4         [1]

# Compare to `split()`, notice how `x` and `y` are converted to character
# labels
df |> split(df[c("x", "y")], drop = TRUE)
#> $`1.1`
#> # A tibble: 2 × 3
#>       x     y     z
#>   <dbl> <dbl> <int>
#> 1     1     1     1
#> 2     1     1     2
#> 
#> $`1.2`
#> # A tibble: 1 × 3
#>       x     y     z
#>   <dbl> <dbl> <int>
#> 1     1     2     3
#> 
#> $`2.3`
#> # A tibble: 2 × 3
#>       x     y     z
#>   <dbl> <dbl> <int>
#> 1     2     3     4
#> 2     2     3     5
#> 
#> $`3.4`
#> # A tibble: 1 × 3
#>       x     y     z
#>   <dbl> <dbl> <int>
#> 1     3     4     6
#> 

# Equivalently, specify variables to chop (rather than variables to chop by)
df |> chop(cols = z)
#> # A tibble: 4 × 3
#>       x     y           z
#>   <dbl> <dbl> <list<int>>
#> 1     1     1         [2]
#> 2     1     2         [1]
#> 3     2     3         [2]
#> 4     3     4         [1]

# `cols` and `by` can be used together to drop columns you no longer need.
# This drops `y`:
df |> chop(cols = z, by = x)
#> # A tibble: 3 × 2
#>       x           z
#>   <dbl> <list<int>>
#> 1     1         [3]
#> 2     2         [2]
#> 3     3         [1]

# You cannot chop a column you are also trying to chop by
try(df |> chop(cols = x, by = x))
#> Error in chop(df, cols = x, by = x) : 
#>   `cols` can't reference a column already selected by `by`.
#> ℹ Column `x` has already been selected.

# Multiple columns can be chopped at once, producing one list-column per
# chopped column
df |> chop(by = x)
#> # A tibble: 3 × 3
#>       x           y           z
#>   <dbl> <list<dbl>> <list<int>>
#> 1     1         [3]         [3]
#> 2     2         [2]         [2]
#> 3     3         [1]         [1]
# Compare to `nest()`, which keeps the chopped `y` and `z` columns together
# in nested data frames
df |> nest(.by = x)
#> # A tibble: 3 × 2
#>       x data            
#>   <dbl> <list>          
#> 1     1 <tibble [3 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>
# `split()` is more similar to `nest()` here
split(df[c("y", "z")], df["x"])
#> $`1`
#> # A tibble: 3 × 2
#>       y     z
#>   <dbl> <int>
#> 1     1     1
#> 2     1     2
#> 3     2     3
#> 
#> $`2`
#> # A tibble: 2 × 2
#>       y     z
#>   <dbl> <int>
#> 1     3     4
#> 2     3     5
#> 
#> $`3`
#> # A tibble: 1 × 2
#>       y     z
#>   <dbl> <int>
#> 1     4     6
#> 

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

# `unchop()` will error if the types are not compatible:
df <- tibble(x = 1:2, y = list("1", 1:3))
try(df |> unchop(y))
#> Error in unchop(df, y) : 
#>   Can't combine `y[[1]]` <character> and `y[[2]]` <integer>.

# Unchopping a list-col of data frames must generate a df-col because
# `unchop()` leaves the column names unchanged
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
