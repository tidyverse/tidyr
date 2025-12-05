# Pivot data from wide to long using a spec

This is a low level interface to pivoting, inspired by the cdata
package, that allows you to describe pivoting with a data frame.

## Usage

``` r
pivot_longer_spec(
  data,
  spec,
  ...,
  cols_vary = "fastest",
  names_repair = "check_unique",
  values_drop_na = FALSE,
  values_ptypes = NULL,
  values_transform = NULL,
  error_call = current_env()
)

build_longer_spec(
  data,
  cols,
  ...,
  names_to = "name",
  values_to = "value",
  names_prefix = NULL,
  names_sep = NULL,
  names_pattern = NULL,
  names_ptypes = NULL,
  names_transform = NULL,
  error_call = current_env()
)
```

## Arguments

- data:

  A data frame to pivot.

- spec:

  A specification data frame. This is useful for more complex pivots
  because it gives you greater control on how metadata stored in the
  column names turns into columns in the result.

  Must be a data frame containing character `.name` and `.value`
  columns. Additional columns in `spec` should be named to match columns
  in the long format of the dataset and contain values corresponding to
  columns pivoted from the wide format. The special `.seq` variable is
  used to disambiguate rows internally; it is automatically removed
  after pivoting.

- ...:

  These dots are for future extensions and must be empty.

- cols_vary:

  When pivoting `cols` into longer format, how should the output rows be
  arranged relative to their original row number?

  - `"fastest"`, the default, keeps individual rows from `cols` close
    together in the output. This often produces intuitively ordered
    output when you have at least one key column from `data` that is not
    involved in the pivoting process.

  - `"slowest"` keeps individual columns from `cols` close together in
    the output. This often produces intuitively ordered output when you
    utilize all of the columns from `data` in the pivoting process.

- names_repair:

  What happens if the output has invalid column names? The default,
  `"check_unique"` is to error if the columns are duplicated. Use
  `"minimal"` to allow duplicates in the output, or `"unique"` to
  de-duplicated by adding numeric suffixes. See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for more options.

- values_drop_na:

  If `TRUE`, will drop rows that contain only `NA`s in the `values_to`
  column. This effectively converts explicit missing values to implicit
  missing values, and should generally be used only when missing values
  in `data` were created by its structure.

- error_call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

- cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to pivot into longer format.

- names_to:

  A character vector specifying the new column or columns to create from
  the information stored in the column names of `data` specified by
  `cols`.

  - If length 0, or if `NULL` is supplied, no columns will be created.

  - If length 1, a single column will be created which will contain the
    column names specified by `cols`.

  - If length \>1, multiple columns will be created. In this case, one
    of `names_sep` or `names_pattern` must be supplied to specify how
    the column names should be split. There are also two additional
    character values you can take advantage of:

    - `NA` will discard the corresponding component of the column name.

    - `".value"` indicates that the corresponding component of the
      column name defines the name of the output column containing the
      cell values, overriding `values_to` entirely.

- values_to:

  A string specifying the name of the column to create from the data
  stored in cell values. If `names_to` is a character containing the
  special `.value` sentinel, this value will be ignored, and the name of
  the value column will be derived from part of the existing column
  names.

- names_prefix:

  A regular expression used to remove matching text from the start of
  each variable name.

- names_sep, names_pattern:

  If `names_to` contains multiple values, these arguments control how
  the column name is broken up.

  `names_sep` takes the same specification as
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md),
  and can either be a numeric vector (specifying positions to break on),
  or a single string (specifying a regular expression to split on).

  `names_pattern` takes the same specification as
  [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md), a
  regular expression containing matching groups (`()`).

  If these arguments do not give you enough control, use
  `pivot_longer_spec()` to create a spec object and process manually as
  needed.

- names_ptypes, values_ptypes:

  Optionally, a list of column name-prototype pairs. Alternatively, a
  single empty prototype can be supplied, which will be applied to all
  columns. A prototype (or ptype for short) is a zero-length vector
  (like [`integer()`](https://rdrr.io/r/base/integer.html) or
  [`numeric()`](https://rdrr.io/r/base/numeric.html)) that defines the
  type, class, and attributes of a vector. Use these arguments if you
  want to confirm that the created columns are the types that you
  expect. Note that if you want to change (instead of confirm) the types
  of specific columns, you should use `names_transform` or
  `values_transform` instead.

- names_transform, values_transform:

  Optionally, a list of column name-function pairs. Alternatively, a
  single function can be supplied, which will be applied to all columns.
  Use these arguments if you need to change the types of specific
  columns. For example, `names_transform = list(week = as.integer)`
  would convert a character variable called `week` to an integer.

  If not specified, the type of the columns generated from `names_to`
  will be character, and the type of the variables generated from
  `values_to` will be the common type of the input columns used to
  generate them.

## Examples

``` r
# See vignette("pivot") for examples and explanation

# Use `build_longer_spec()` to build `spec` using similar syntax to `pivot_longer()`
# and run `pivot_longer_spec()` based on `spec`.
spec <- relig_income |> build_longer_spec(
  cols = !religion,
  names_to = "income",
  values_to = "count"
)
spec
#> # A tibble: 10 × 3
#>    .name              .value income            
#>    <chr>              <chr>  <chr>             
#>  1 <$10k              count  <$10k             
#>  2 $10-20k            count  $10-20k           
#>  3 $20-30k            count  $20-30k           
#>  4 $30-40k            count  $30-40k           
#>  5 $40-50k            count  $40-50k           
#>  6 $50-75k            count  $50-75k           
#>  7 $75-100k           count  $75-100k          
#>  8 $100-150k          count  $100-150k         
#>  9 >150k              count  >150k             
#> 10 Don't know/refused count  Don't know/refused

pivot_longer_spec(relig_income, spec)
#> # A tibble: 180 × 3
#>    religion income             count
#>    <chr>    <chr>              <dbl>
#>  1 Agnostic <$10k                 27
#>  2 Agnostic $10-20k               34
#>  3 Agnostic $20-30k               60
#>  4 Agnostic $30-40k               81
#>  5 Agnostic $40-50k               76
#>  6 Agnostic $50-75k              137
#>  7 Agnostic $75-100k             122
#>  8 Agnostic $100-150k            109
#>  9 Agnostic >150k                 84
#> 10 Agnostic Don't know/refused    96
#> # ℹ 170 more rows

# Is equivalent to:
relig_income |> pivot_longer(
  cols = !religion,
  names_to = "income",
  values_to = "count"
)
#> # A tibble: 180 × 3
#>    religion income             count
#>    <chr>    <chr>              <dbl>
#>  1 Agnostic <$10k                 27
#>  2 Agnostic $10-20k               34
#>  3 Agnostic $20-30k               60
#>  4 Agnostic $30-40k               81
#>  5 Agnostic $40-50k               76
#>  6 Agnostic $50-75k              137
#>  7 Agnostic $75-100k             122
#>  8 Agnostic $100-150k            109
#>  9 Agnostic >150k                 84
#> 10 Agnostic Don't know/refused    96
#> # ℹ 170 more rows
```
