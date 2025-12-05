# Create the full sequence of values in a vector

This is useful if you want to fill in missing values that should have
been observed but weren't. For example, `full_seq(c(1, 2, 4, 6), 1)`
will return `1:6`.

## Usage

``` r
full_seq(x, period, tol = 1e-06)
```

## Arguments

- x:

  A numeric vector.

- period:

  Gap between each observation. The existing data will be checked to
  ensure that it is actually of this periodicity.

- tol:

  Numerical tolerance for checking periodicity.

## Examples

``` r
full_seq(c(1, 2, 4, 5, 10), 1)
#>  [1]  1  2  3  4  5  6  7  8  9 10
```
