# Create a tibble from all combinations of inputs

`expand_grid()` is heavily motivated by
[`expand.grid()`](https://rdrr.io/r/base/expand.grid.html). Compared to
[`expand.grid()`](https://rdrr.io/r/base/expand.grid.html), it:

- Produces sorted output by varying the first column the slowest by
  default.

- Returns a tibble, not a data frame.

- Never converts strings to factors.

- Does not add any additional attributes.

- Can expand any generalised vector, including data frames.

## Usage

``` r
expand_grid(..., .name_repair = "check_unique", .vary = "slowest")
```

## Arguments

- ...:

  Name-value pairs. The name will become the column name in the output.

- .name_repair:

  One of `"check_unique"`, `"unique"`, `"universal"`, `"minimal"`,
  `"unique_quiet"`, or `"universal_quiet"`. See
  [`vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for the meaning of these options.

- .vary:

  One of:

  - `"slowest"` to vary the first column slowest. This produces sorted
    output and is generally the most useful.

  - `"fastest"` to vary the first column fastest. This matches the
    behavior of
    [`expand.grid()`](https://rdrr.io/r/base/expand.grid.html).

## Value

A tibble with one column for each input in `...`. The output will have
one row for each combination of the inputs, i.e. the size will be equal
to the product of the sizes of the inputs. This implies that if any
input has length 0, the output will have zero rows. The ordering of the
output depends on the `.vary` argument.

## Examples

``` r
# Default behavior varies the first column "slowest"
expand_grid(x = 1:3, y = 1:2)
#> # A tibble: 6 × 2
#>       x     y
#>   <int> <int>
#> 1     1     1
#> 2     1     2
#> 3     2     1
#> 4     2     2
#> 5     3     1
#> 6     3     2

# Vary the first column "fastest", like `expand.grid()`
expand_grid(x = 1:3, y = 1:2, .vary = "fastest")
#> # A tibble: 6 × 2
#>       x     y
#>   <int> <int>
#> 1     1     1
#> 2     2     1
#> 3     3     1
#> 4     1     2
#> 5     2     2
#> 6     3     2

# Can also expand data frames
expand_grid(df = tibble(x = 1:2, y = c(2, 1)), z = 1:3)
#> # A tibble: 6 × 2
#>    df$x    $y     z
#>   <int> <dbl> <int>
#> 1     1     2     1
#> 2     1     2     2
#> 3     1     2     3
#> 4     2     1     1
#> 5     2     1     2
#> 6     2     1     3

# And matrices
expand_grid(x1 = matrix(1:4, nrow = 2), x2 = matrix(5:8, nrow = 2))
#> # A tibble: 4 × 2
#>   x1[,1]  [,2] x2[,1]  [,2]
#>    <int> <int>  <int> <int>
#> 1      1     3      5     7
#> 2      1     3      6     8
#> 3      2     4      5     7
#> 4      2     4      6     8
```
