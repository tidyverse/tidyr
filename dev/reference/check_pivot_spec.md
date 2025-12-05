# Check assumptions about a pivot `spec`

`check_pivot_spec()` is a developer facing helper function for
validating the pivot spec used in
[`pivot_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md)
or
[`pivot_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md).
It is only useful if you are extending
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
or
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
with new S3 methods.

`check_pivot_spec()` makes the following assertions:

- `spec` must be a data frame.

- `spec` must have a character column named `.name`.

- `spec` must have a character column named `.value`.

- The `.name` column must be unique.

- The `.name` and `.value` columns must be the first two columns in the
  data frame, and will be reordered if that is not true.

## Usage

``` r
check_pivot_spec(spec, call = caller_env())
```

## Arguments

- spec:

  A specification data frame. This is useful for more complex pivots
  because it gives you greater control on how metadata stored in the
  columns become column names in the result.

  Must be a data frame containing character `.name` and `.value`
  columns. Additional columns in `spec` should be named to match columns
  in the long format of the dataset and contain values corresponding to
  columns pivoted from the wide format. The special `.seq` variable is
  used to disambiguate rows internally; it is automatically removed
  after pivoting.

## Examples

``` r
# A valid spec
spec <- tibble(.name = "a", .value = "b", foo = 1)
check_pivot_spec(spec)
#> # A tibble: 1 × 3
#>   .name .value   foo
#>   <chr> <chr>  <dbl>
#> 1 a     b          1

spec <- tibble(.name = "a")
try(check_pivot_spec(spec))
#> Error in eval(expr, envir) : 
#>   `spec` must have `.name` and `.value` columns.

# `.name` and `.value` are forced to be the first two columns
spec <- tibble(foo = 1, .value = "b", .name = "a")
check_pivot_spec(spec)
#> # A tibble: 1 × 3
#>   .name .value   foo
#>   <chr> <chr>  <dbl>
#> 1 a     b          1
```
