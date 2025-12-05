# Pivot data from wide to long

`pivot_longer()` "lengthens" data, increasing the number of rows and
decreasing the number of columns. The inverse transformation is
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)

Learn more in
[`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md).

## Usage

``` r
pivot_longer(
  data,
  cols,
  ...,
  cols_vary = "fastest",
  names_to = "name",
  names_prefix = NULL,
  names_sep = NULL,
  names_pattern = NULL,
  names_ptypes = NULL,
  names_transform = NULL,
  names_repair = "check_unique",
  values_to = "value",
  values_drop_na = FALSE,
  values_ptypes = NULL,
  values_transform = NULL
)
```

## Arguments

- data:

  A data frame to pivot.

- cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to pivot into longer format.

- ...:

  Additional arguments passed on to methods.

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
  [`pivot_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md)
  to create a spec object and process manually as needed.

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

- names_repair:

  What happens if the output has invalid column names? The default,
  `"check_unique"` is to error if the columns are duplicated. Use
  `"minimal"` to allow duplicates in the output, or `"unique"` to
  de-duplicated by adding numeric suffixes. See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for more options.

- values_to:

  A string specifying the name of the column to create from the data
  stored in cell values. If `names_to` is a character containing the
  special `.value` sentinel, this value will be ignored, and the name of
  the value column will be derived from part of the existing column
  names.

- values_drop_na:

  If `TRUE`, will drop rows that contain only `NA`s in the `values_to`
  column. This effectively converts explicit missing values to implicit
  missing values, and should generally be used only when missing values
  in `data` were created by its structure.

## Details

`pivot_longer()` is an updated approach to
[`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md),
designed to be both simpler to use and to handle more use cases. We
recommend you use `pivot_longer()` for new code;
[`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) isn't
going away but is no longer under active development.

## Examples

``` r
# See vignette("pivot") for examples and explanation

# Simplest case where column names are character data
relig_income
#> # A tibble: 18 × 11
#>    religion   `<$10k` `$10-20k` `$20-30k` `$30-40k` `$40-50k` `$50-75k`
#>    <chr>        <dbl>     <dbl>     <dbl>     <dbl>     <dbl>     <dbl>
#>  1 Agnostic        27        34        60        81        76       137
#>  2 Atheist         12        27        37        52        35        70
#>  3 Buddhist        27        21        30        34        33        58
#>  4 Catholic       418       617       732       670       638      1116
#>  5 Don’t kno…      15        14        15        11        10        35
#>  6 Evangelic…     575       869      1064       982       881      1486
#>  7 Hindu            1         9         7         9        11        34
#>  8 Historica…     228       244       236       238       197       223
#>  9 Jehovah's…      20        27        24        24        21        30
#> 10 Jewish          19        19        25        25        30        95
#> 11 Mainline …     289       495       619       655       651      1107
#> 12 Mormon          29        40        48        51        56       112
#> 13 Muslim           6         7         9        10         9        23
#> 14 Orthodox        13        17        23        32        32        47
#> 15 Other Chr…       9         7        11        13        13        14
#> 16 Other Fai…      20        33        40        46        49        63
#> 17 Other Wor…       5         2         3         4         2         7
#> 18 Unaffilia…     217       299       374       365       341       528
#> # ℹ 4 more variables: `$75-100k` <dbl>, `$100-150k` <dbl>,
#> #   `>150k` <dbl>, `Don't know/refused` <dbl>
relig_income |>
  pivot_longer(!religion, names_to = "income", values_to = "count")
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

# Slightly more complex case where columns have common prefix,
# and missing missings are structural so should be dropped.
billboard
#> # A tibble: 317 × 79
#>    artist  track date.entered   wk1   wk2   wk3   wk4   wk5   wk6   wk7
#>    <chr>   <chr> <date>       <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 2 Pac   Baby… 2000-02-26      87    82    72    77    87    94    99
#>  2 2Ge+her The … 2000-09-02      91    87    92    NA    NA    NA    NA
#>  3 3 Door… Kryp… 2000-04-08      81    70    68    67    66    57    54
#>  4 3 Door… Loser 2000-10-21      76    76    72    69    67    65    55
#>  5 504 Bo… Wobb… 2000-04-15      57    34    25    17    17    31    36
#>  6 98^0    Give… 2000-08-19      51    39    34    26    26    19     2
#>  7 A*Teens Danc… 2000-07-08      97    97    96    95   100    NA    NA
#>  8 Aaliyah I Do… 2000-01-29      84    62    51    41    38    35    35
#>  9 Aaliyah Try … 2000-03-18      59    53    38    28    21    18    16
#> 10 Adams,… Open… 2000-08-26      76    76    74    69    68    67    61
#> # ℹ 307 more rows
#> # ℹ 69 more variables: wk8 <dbl>, wk9 <dbl>, wk10 <dbl>, wk11 <dbl>,
#> #   wk12 <dbl>, wk13 <dbl>, wk14 <dbl>, wk15 <dbl>, wk16 <dbl>,
#> #   wk17 <dbl>, wk18 <dbl>, wk19 <dbl>, wk20 <dbl>, wk21 <dbl>,
#> #   wk22 <dbl>, wk23 <dbl>, wk24 <dbl>, wk25 <dbl>, wk26 <dbl>,
#> #   wk27 <dbl>, wk28 <dbl>, wk29 <dbl>, wk30 <dbl>, wk31 <dbl>,
#> #   wk32 <dbl>, wk33 <dbl>, wk34 <dbl>, wk35 <dbl>, wk36 <dbl>, …
billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE
  )
#> # A tibble: 5,307 × 5
#>    artist  track                   date.entered week   rank
#>    <chr>   <chr>                   <date>       <chr> <dbl>
#>  1 2 Pac   Baby Don't Cry (Keep... 2000-02-26   1        87
#>  2 2 Pac   Baby Don't Cry (Keep... 2000-02-26   2        82
#>  3 2 Pac   Baby Don't Cry (Keep... 2000-02-26   3        72
#>  4 2 Pac   Baby Don't Cry (Keep... 2000-02-26   4        77
#>  5 2 Pac   Baby Don't Cry (Keep... 2000-02-26   5        87
#>  6 2 Pac   Baby Don't Cry (Keep... 2000-02-26   6        94
#>  7 2 Pac   Baby Don't Cry (Keep... 2000-02-26   7        99
#>  8 2Ge+her The Hardest Part Of ... 2000-09-02   1        91
#>  9 2Ge+her The Hardest Part Of ... 2000-09-02   2        87
#> 10 2Ge+her The Hardest Part Of ... 2000-09-02   3        92
#> # ℹ 5,297 more rows

# Multiple variables stored in column names
who |> pivot_longer(
  cols = new_sp_m014:newrel_f65,
  names_to = c("diagnosis", "gender", "age"),
  names_pattern = "new_?(.*)_(.)(.*)",
  values_to = "count"
)
#> # A tibble: 405,440 × 8
#>    country     iso2  iso3   year diagnosis gender age   count
#>    <chr>       <chr> <chr> <dbl> <chr>     <chr>  <chr> <dbl>
#>  1 Afghanistan AF    AFG    1980 sp        m      014      NA
#>  2 Afghanistan AF    AFG    1980 sp        m      1524     NA
#>  3 Afghanistan AF    AFG    1980 sp        m      2534     NA
#>  4 Afghanistan AF    AFG    1980 sp        m      3544     NA
#>  5 Afghanistan AF    AFG    1980 sp        m      4554     NA
#>  6 Afghanistan AF    AFG    1980 sp        m      5564     NA
#>  7 Afghanistan AF    AFG    1980 sp        m      65       NA
#>  8 Afghanistan AF    AFG    1980 sp        f      014      NA
#>  9 Afghanistan AF    AFG    1980 sp        f      1524     NA
#> 10 Afghanistan AF    AFG    1980 sp        f      2534     NA
#> # ℹ 405,430 more rows

# Multiple observations per row. Since all columns are used in the pivoting
# process, we'll use `cols_vary` to keep values from the original columns
# close together in the output.
anscombe
#>    x1 x2 x3 x4    y1   y2    y3    y4
#> 1  10 10 10  8  8.04 9.14  7.46  6.58
#> 2   8  8  8  8  6.95 8.14  6.77  5.76
#> 3  13 13 13  8  7.58 8.74 12.74  7.71
#> 4   9  9  9  8  8.81 8.77  7.11  8.84
#> 5  11 11 11  8  8.33 9.26  7.81  8.47
#> 6  14 14 14  8  9.96 8.10  8.84  7.04
#> 7   6  6  6  8  7.24 6.13  6.08  5.25
#> 8   4  4  4 19  4.26 3.10  5.39 12.50
#> 9  12 12 12  8 10.84 9.13  8.15  5.56
#> 10  7  7  7  8  4.82 7.26  6.42  7.91
#> 11  5  5  5  8  5.68 4.74  5.73  6.89
anscombe |>
  pivot_longer(
    everything(),
    cols_vary = "slowest",
    names_to = c(".value", "set"),
    names_pattern = "(.)(.)"
  )
#> # A tibble: 44 × 3
#>    set       x     y
#>    <chr> <dbl> <dbl>
#>  1 1        10  8.04
#>  2 1         8  6.95
#>  3 1        13  7.58
#>  4 1         9  8.81
#>  5 1        11  8.33
#>  6 1        14  9.96
#>  7 1         6  7.24
#>  8 1         4  4.26
#>  9 1        12 10.8 
#> 10 1         7  4.82
#> # ℹ 34 more rows
```
