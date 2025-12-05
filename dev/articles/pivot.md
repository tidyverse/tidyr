# Pivoting

## Introduction

This vignette describes the use of the new
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
functions. Their goal is to improve the usability of
[`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) and
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md), and
incorporate state-of-the-art features found in other packages.

For some time, it’s been obvious that there is something fundamentally
wrong with the design of
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) and
[`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md). Many
people don’t find the names intuitive and find it hard to remember which
direction corresponds to spreading and which to gathering. It also seems
surprisingly hard to remember the arguments to these functions, meaning
that many people (including me!) have to consult the documentation every
time.

There are two important new features inspired by other R packages that
have been advancing reshaping in R:

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  can work with multiple value variables that may have different types,
  inspired by the enhanced `melt()` and `dcast()` functions provided by
  the [data.table](https://github.com/Rdatatable/data.table/wiki)
  package by Matt Dowle and Arun Srinivasan.

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  and
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  can take a data frame that specifies precisely how metadata stored in
  column names becomes data variables (and vice versa), inspired by the
  [cdata](https://winvector.github.io/cdata/) package by John Mount and
  Nina Zumel.

In this vignette, you’ll learn the key ideas behind
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
as you see them used to solve a variety of data reshaping challenges
ranging from simple to complex.

To begin we’ll load some needed packages. In real analysis code, I’d
imagine you’d do with the
[`library(tidyverse)`](https://tidyverse.tidyverse.org), but I can’t do
that here since this vignette is embedded in a package.

``` r
library(tidyr)
library(dplyr)
library(readr)
```

## Longer

[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
makes datasets **longer** by increasing the number of rows and
decreasing the number of columns. I don’t believe it makes sense to
describe a dataset as being in “long form”. Length is a relative term,
and you can only say (e.g.) that dataset A is longer than dataset B.

[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
is commonly needed to tidy wild-caught datasets as they often optimise
for ease of data entry or ease of comparison rather than ease of
analysis. The following sections show how to use
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
for a wide range of realistic datasets.

### String data in column names

The `relig_income` dataset stores counts based on a survey which (among
other things) asked people about their religion and annual income:

``` r
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
#> # ℹ 8 more rows
#> # ℹ 4 more variables: `$75-100k` <dbl>, `$100-150k` <dbl>,
#> #   `>150k` <dbl>, `Don't know/refused` <dbl>
```

This dataset contains three variables:

- `religion`, stored in the rows,
- `income` spread across the column names, and
- `count` stored in the cell values.

To tidy it we use
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md):

``` r
relig_income |>
  pivot_longer(
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

- The first argument is the dataset to reshape, `relig_income`.

- `cols` describes which columns need to be reshaped. In this case, it’s
  every column apart from `religion`.

- `names_to` gives the name of the variable that will be created from
  the data stored in the column names, i.e. `income`.

- `values_to` gives the name of the variable that will be created from
  the data stored in the cell value, i.e. `count`.

Neither the `names_to` nor the `values_to` column exists in
`relig_income`, so we provide them as strings surrounded by quotes.

### Numeric data in column names

The `billboard` dataset records the billboard rank of songs in the year
2000. It has a form similar to the `relig_income` data, but the data
encoded in the column names is really a number, not a string.

``` r
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
```

We can start with the same basic specification as for the `relig_income`
dataset. Here we want the names to become a variable called `week`, and
the values to become a variable called `rank`. I also use
`values_drop_na` to drop rows that correspond to missing values. Not
every song stays in the charts for all 76 weeks, so the structure of the
input data force the creation of unnecessary explicit `NA`s.

``` r
billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  )
#> # A tibble: 5,307 × 5
#>    artist  track                   date.entered week   rank
#>    <chr>   <chr>                   <date>       <chr> <dbl>
#>  1 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk1      87
#>  2 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk2      82
#>  3 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk3      72
#>  4 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk4      77
#>  5 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk5      87
#>  6 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk6      94
#>  7 2 Pac   Baby Don't Cry (Keep... 2000-02-26   wk7      99
#>  8 2Ge+her The Hardest Part Of ... 2000-09-02   wk1      91
#>  9 2Ge+her The Hardest Part Of ... 2000-09-02   wk2      87
#> 10 2Ge+her The Hardest Part Of ... 2000-09-02   wk3      92
#> # ℹ 5,297 more rows
```

It would be nice to easily determine how long each song stayed in the
charts, but to do that, we’ll need to convert the `week` variable to an
integer. We can do that by using two additional arguments:
`names_prefix` strips off the `wk` prefix, and `names_transform`
converts `week` into an integer:

``` r
billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    names_transform = as.integer,
    values_to = "rank",
    values_drop_na = TRUE,
  )
```

Alternatively, you could do this with a single argument by using
[`readr::parse_number()`](https://readr.tidyverse.org/reference/parse_number.html)
which automatically strips non-numeric components:

``` r
billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_transform = readr::parse_number,
    values_to = "rank",
    values_drop_na = TRUE,
  )
```

### Many variables in column names

A more challenging situation occurs when you have multiple variables
crammed into the column names. For example, take the `who` dataset:

``` r
who
#> # A tibble: 7,240 × 60
#>    country     iso2  iso3   year new_sp_m014 new_sp_m1524 new_sp_m2534
#>    <chr>       <chr> <chr> <dbl>       <dbl>        <dbl>        <dbl>
#>  1 Afghanistan AF    AFG    1980          NA           NA           NA
#>  2 Afghanistan AF    AFG    1981          NA           NA           NA
#>  3 Afghanistan AF    AFG    1982          NA           NA           NA
#>  4 Afghanistan AF    AFG    1983          NA           NA           NA
#>  5 Afghanistan AF    AFG    1984          NA           NA           NA
#>  6 Afghanistan AF    AFG    1985          NA           NA           NA
#>  7 Afghanistan AF    AFG    1986          NA           NA           NA
#>  8 Afghanistan AF    AFG    1987          NA           NA           NA
#>  9 Afghanistan AF    AFG    1988          NA           NA           NA
#> 10 Afghanistan AF    AFG    1989          NA           NA           NA
#> # ℹ 7,230 more rows
#> # ℹ 53 more variables: new_sp_m3544 <dbl>, new_sp_m4554 <dbl>,
#> #   new_sp_m5564 <dbl>, new_sp_m65 <dbl>, new_sp_f014 <dbl>,
#> #   new_sp_f1524 <dbl>, new_sp_f2534 <dbl>, new_sp_f3544 <dbl>,
#> #   new_sp_f4554 <dbl>, new_sp_f5564 <dbl>, new_sp_f65 <dbl>,
#> #   new_sn_m014 <dbl>, new_sn_m1524 <dbl>, new_sn_m2534 <dbl>,
#> #   new_sn_m3544 <dbl>, new_sn_m4554 <dbl>, new_sn_m5564 <dbl>, …
```

`country`, `iso2`, `iso3`, and `year` are already variables, so they can
be left as is. But the columns from `new_sp_m014` to `newrel_f65` encode
four variables in their names:

- The `new_`/`new` prefix indicates these are counts of new cases. This
  dataset only contains new cases, so we’ll ignore it here because it’s
  constant.

- `sp`/`rel`/`ep` describe how the case was diagnosed.

- `m`/`f` gives the gender.

- `014`/`1524`/`2535`/`3544`/`4554`/`65` supplies the age range.

We can break these variables up by specifying multiple column names in
`names_to`, and then either providing `names_sep` or `names_pattern`.
Here `names_pattern` is the most natural fit. It has a similar interface
to `extract`: you give it a regular expression containing groups
(defined by `()`) and it puts each group in a column.

``` r
who |>
  pivot_longer(
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
```

We could go one step further use readr functions to convert the gender
and age to factors. I think this is good practice when you have
categorical variables with a known set of values.

``` r
who |>
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = c("diagnosis", "gender", "age"),
    names_pattern = "new_?(.*)_(.)(.*)",
    names_transform = list(
      gender = ~ readr::parse_factor(.x, levels = c("f", "m")),
      age = ~ readr::parse_factor(
        .x,
        levels = c("014", "1524", "2534", "3544", "4554", "5564", "65"),
        ordered = TRUE
      )
    ),
    values_to = "count",
)
```

Doing it this way is a little more efficient than doing a mutate after
the fact,
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
only has to transform one occurrence of each name where a
[`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html) would
need to transform many repetitions.

### Multiple observations per row

So far, we have been working with data frames that have one observation
per row, but many important pivoting problems involve multiple
observations per row. You can usually recognise this case because name
of the column that you want to appear in the output is part of the
column name in the input. In this section, you’ll learn how to pivot
this sort of data.

The following example is adapted from the [data.table
vignette](https://CRAN.R-project.org/package=data.table/vignettes/datatable-reshape.html),
as inspiration for tidyr’s solution to this problem.

``` r
household
#> # A tibble: 5 × 5
#>   family dob_child1 dob_child2 name_child1 name_child2
#>    <int> <date>     <date>     <chr>       <chr>      
#> 1      1 1998-11-26 2000-01-29 Susan       Jose       
#> 2      2 1996-06-22 NA         Mark        NA         
#> 3      3 2002-07-11 2004-04-05 Sam         Seth       
#> 4      4 2004-10-10 2009-08-27 Craig       Khai       
#> 5      5 2000-12-05 2005-02-28 Parker      Gracie
```

Note that we have two pieces of information (or values) for each child:
their `name` and their `dob` (date of birth). These need to go into
separate columns in the result. Again we supply multiple variables to
`names_to`, using `names_sep` to split up each variable name. Note the
special name `.value`: this tells
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
that that part of the column name specifies the “value” being measured
(which will become a variable in the output).

``` r
household |>
  pivot_longer(
    cols = !family,
    names_to = c(".value", "child"),
    names_sep = "_",
    values_drop_na = TRUE
  )
#> # A tibble: 9 × 4
#>   family child  dob        name  
#>    <int> <chr>  <date>     <chr> 
#> 1      1 child1 1998-11-26 Susan 
#> 2      1 child2 2000-01-29 Jose  
#> 3      2 child1 1996-06-22 Mark  
#> 4      3 child1 2002-07-11 Sam   
#> 5      3 child2 2004-04-05 Seth  
#> 6      4 child1 2004-10-10 Craig 
#> 7      4 child2 2009-08-27 Khai  
#> 8      5 child1 2000-12-05 Parker
#> 9      5 child2 2005-02-28 Gracie
```

Note the use of `values_drop_na = TRUE`: the input shape forces the
creation of explicit missing variables for observations that don’t
exist.

A similar problem problem also exists in the `anscombe` dataset built in
to base R:

``` r
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
```

This dataset contains four pairs of variables (`x1` and `y1`, `x2` and
`y2`, etc) that underlie Anscombe’s quartet, a collection of four
datasets that have the same summary statistics (mean, sd, correlation
etc), but have quite different data. We want to produce a dataset with
columns `set`, `x` and `y`.

``` r
anscombe |>
  pivot_longer(
    cols = everything(),
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

Setting `cols_vary` to `"slowest"` groups the values from columns `x1`
and `y1` together in the rows of the output before moving on to `x2` and
`y2`. This argument often produces more intuitively ordered output when
you are pivoting every column in your dataset.

A similar situation can arise with panel data. For example, take this
example dataset provided by [Thomas
Leeper](https://github.com/gesistsa/rio/issues/193). We can tidy it
using the same approach as for `anscombe`:

``` r
pnl <- tibble(
  x = 1:4,
  a = c(1, 1,0, 0),
  b = c(0, 1, 1, 1),
  y1 = rnorm(4),
  y2 = rnorm(4),
  z1 = rep(3, 4),
  z2 = rep(-2, 4),
)

pnl |>
  pivot_longer(
    cols = !c(x, a, b),
    names_to = c(".value", "time"),
    names_pattern = "(.)(.)"
  )
#> # A tibble: 8 × 6
#>       x     a     b time         y     z
#>   <int> <dbl> <dbl> <chr>    <dbl> <dbl>
#> 1     1     1     0 1     -1.40        3
#> 2     1     1     0 2      0.622      -2
#> 3     2     1     1 1      0.255       3
#> 4     2     1     1 2      1.15       -2
#> 5     3     0     1 1     -2.44        3
#> 6     3     0     1 2     -1.82       -2
#> 7     4     0     1 1     -0.00557     3
#> 8     4     0     1 2     -0.247      -2
```

## Wider

[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
is the opposite of
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md):
it makes a dataset **wider** by increasing the number of columns and
decreasing the number of rows. It’s relatively rare to need
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
to make tidy data, but it’s often useful for creating summary tables for
presentation, or data in a format needed by other tools.

### Capture-recapture data

The `fish_encounters` dataset, contributed by [Myfanwy
Johnston](https://fishsciences.github.io/post/visualizing-fish-encounter-histories/),
describes when fish swimming down a river are detected by automatic
monitoring stations:

``` r
fish_encounters
#> # A tibble: 114 × 3
#>    fish  station  seen
#>    <fct> <fct>   <int>
#>  1 4842  Release     1
#>  2 4842  I80_1       1
#>  3 4842  Lisbon      1
#>  4 4842  Rstr        1
#>  5 4842  Base_TD     1
#>  6 4842  BCE         1
#>  7 4842  BCW         1
#>  8 4842  BCE2        1
#>  9 4842  BCW2        1
#> 10 4842  MAE         1
#> # ℹ 104 more rows
```

Many tools used to analyse this data need it in a form where each
station is a column:

``` r
fish_encounters |>
  pivot_wider(
    names_from = station,
    values_from = seen
  )
#> # A tibble: 19 × 12
#>    fish  Release I80_1 Lisbon  Rstr Base_TD   BCE   BCW  BCE2  BCW2
#>    <fct>   <int> <int>  <int> <int>   <int> <int> <int> <int> <int>
#>  1 4842        1     1      1     1       1     1     1     1     1
#>  2 4843        1     1      1     1       1     1     1     1     1
#>  3 4844        1     1      1     1       1     1     1     1     1
#>  4 4845        1     1      1     1       1    NA    NA    NA    NA
#>  5 4847        1     1      1    NA      NA    NA    NA    NA    NA
#>  6 4848        1     1      1     1      NA    NA    NA    NA    NA
#>  7 4849        1     1     NA    NA      NA    NA    NA    NA    NA
#>  8 4850        1     1     NA     1       1     1     1    NA    NA
#>  9 4851        1     1     NA    NA      NA    NA    NA    NA    NA
#> 10 4854        1     1     NA    NA      NA    NA    NA    NA    NA
#> # ℹ 9 more rows
#> # ℹ 2 more variables: MAE <int>, MAW <int>
```

This dataset only records when a fish was detected by the station - it
doesn’t record when it wasn’t detected (this is common with this type of
data). That means the output data is filled with `NA`s. However, in this
case we know that the absence of a record means that the fish was not
`seen`, so we can ask
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
to fill these missing values in with zeros:

``` r
fish_encounters |>
  pivot_wider(
    names_from = station,
    values_from = seen,
    values_fill = 0
  )
#> # A tibble: 19 × 12
#>    fish  Release I80_1 Lisbon  Rstr Base_TD   BCE   BCW  BCE2  BCW2
#>    <fct>   <int> <int>  <int> <int>   <int> <int> <int> <int> <int>
#>  1 4842        1     1      1     1       1     1     1     1     1
#>  2 4843        1     1      1     1       1     1     1     1     1
#>  3 4844        1     1      1     1       1     1     1     1     1
#>  4 4845        1     1      1     1       1     0     0     0     0
#>  5 4847        1     1      1     0       0     0     0     0     0
#>  6 4848        1     1      1     1       0     0     0     0     0
#>  7 4849        1     1      0     0       0     0     0     0     0
#>  8 4850        1     1      0     1       1     1     1     0     0
#>  9 4851        1     1      0     0       0     0     0     0     0
#> 10 4854        1     1      0     0       0     0     0     0     0
#> # ℹ 9 more rows
#> # ℹ 2 more variables: MAE <int>, MAW <int>
```

### Aggregation

You can also use
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
to perform simple aggregation. For example, take the `warpbreaks`
dataset built in to base R (converted to a tibble for the better print
method):

``` r
warpbreaks <- warpbreaks |>
  as_tibble() |>
  select(wool, tension, breaks)
warpbreaks
#> # A tibble: 54 × 3
#>    wool  tension breaks
#>    <fct> <fct>    <dbl>
#>  1 A     L           26
#>  2 A     L           30
#>  3 A     L           54
#>  4 A     L           25
#>  5 A     L           70
#>  6 A     L           52
#>  7 A     L           51
#>  8 A     L           26
#>  9 A     L           67
#> 10 A     M           18
#> # ℹ 44 more rows
```

This is a designed experiment with nine replicates for every combination
of `wool` (`A` and `B`) and `tension` (`L`, `M`, `H`):

``` r
warpbreaks |>
  count(wool, tension)
#> # A tibble: 6 × 3
#>   wool  tension     n
#>   <fct> <fct>   <int>
#> 1 A     L           9
#> 2 A     M           9
#> 3 A     H           9
#> 4 B     L           9
#> 5 B     M           9
#> 6 B     H           9
```

What happens if we attempt to pivot the levels of `wool` into the
columns?

``` r
warpbreaks |>
  pivot_wider(
    names_from = wool,
    values_from = breaks
  )
#> Warning: Values from `breaks` are not uniquely identified; output will contain
#> list-cols.
#> • Use `values_fn = list` to suppress this warning.
#> • Use `values_fn = {summary_fun}` to summarise duplicates.
#> • Use the following dplyr code to identify duplicates.
#>   {data} |>
#>   dplyr::summarise(n = dplyr::n(), .by = c(tension, wool)) |>
#>   dplyr::filter(n > 1L)
#> # A tibble: 3 × 3
#>   tension A         B        
#>   <fct>   <list>    <list>   
#> 1 L       <dbl [9]> <dbl [9]>
#> 2 M       <dbl [9]> <dbl [9]>
#> 3 H       <dbl [9]> <dbl [9]>
```

We get a warning that each cell in the output corresponds to multiple
cells in the input. The default behaviour produces list-columns, which
contain all the individual values. A more useful output would be summary
statistics, e.g. `mean` breaks for each combination of wool and tension:

``` r
warpbreaks |>
  pivot_wider(
    names_from = wool,
    values_from = breaks,
    values_fn = mean
  )
#> # A tibble: 3 × 3
#>   tension     A     B
#>   <fct>   <dbl> <dbl>
#> 1 L        44.6  28.2
#> 2 M        24    28.8
#> 3 H        24.6  18.8
```

For more complex summary operations, I recommend summarising before
reshaping, but for simple cases it’s often convenient to summarise
within
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md).

### Generate column name from multiple variables

Imagine, as in <https://stackoverflow.com/questions/24929954>, that we
have information containing the combination of product, country, and
year. In tidy form it might look like this:

``` r
production <-
  expand_grid(
    product = c("A", "B"),
    country = c("AI", "EI"),
    year = 2000:2014
  ) |>
  filter((product == "A" & country == "AI") | product == "B") |>
  mutate(production = rnorm(n()))
production
#> # A tibble: 45 × 4
#>    product country  year production
#>    <chr>   <chr>   <int>      <dbl>
#>  1 A       AI       2000    -0.244 
#>  2 A       AI       2001    -0.283 
#>  3 A       AI       2002    -0.554 
#>  4 A       AI       2003     0.629 
#>  5 A       AI       2004     2.07  
#>  6 A       AI       2005    -1.63  
#>  7 A       AI       2006     0.512 
#>  8 A       AI       2007    -1.86  
#>  9 A       AI       2008    -0.522 
#> 10 A       AI       2009    -0.0526
#> # ℹ 35 more rows
```

We want to widen the data so we have one column for each combination of
`product` and `country`. The key is to specify multiple variables for
`names_from`:

``` r
production |>
  pivot_wider(
    names_from = c(product, country),
    values_from = production
  )
#> # A tibble: 15 × 4
#>     year    A_AI    B_AI    B_EI
#>    <int>   <dbl>   <dbl>   <dbl>
#>  1  2000 -0.244   0.738  -0.313 
#>  2  2001 -0.283   1.89    1.07  
#>  3  2002 -0.554  -0.0974  0.0700
#>  4  2003  0.629  -0.936  -0.639 
#>  5  2004  2.07   -0.0160 -0.0500
#>  6  2005 -1.63   -0.827  -0.251 
#>  7  2006  0.512  -1.51    0.445 
#>  8  2007 -1.86    0.935   2.76  
#>  9  2008 -0.522   0.176   0.0465
#> 10  2009 -0.0526  0.244   0.578 
#> # ℹ 5 more rows
```

When either `names_from` or `values_from` select multiple variables, you
can control how the column names in the output constructed with
`names_sep` and `names_prefix`, or the workhorse `names_glue`:

``` r
production |>
  pivot_wider(
    names_from = c(product, country),
    values_from = production,
    names_sep = ".",
    names_prefix = "prod."
  )
#> # A tibble: 15 × 4
#>     year prod.A.AI prod.B.AI prod.B.EI
#>    <int>     <dbl>     <dbl>     <dbl>
#>  1  2000   -0.244     0.738    -0.313 
#>  2  2001   -0.283     1.89      1.07  
#>  3  2002   -0.554    -0.0974    0.0700
#>  4  2003    0.629    -0.936    -0.639 
#>  5  2004    2.07     -0.0160   -0.0500
#>  6  2005   -1.63     -0.827    -0.251 
#>  7  2006    0.512    -1.51      0.445 
#>  8  2007   -1.86      0.935     2.76  
#>  9  2008   -0.522     0.176     0.0465
#> 10  2009   -0.0526    0.244     0.578 
#> # ℹ 5 more rows

production |>
  pivot_wider(
    names_from = c(product, country),
    values_from = production,
    names_glue = "prod_{product}_{country}"
  )
#> # A tibble: 15 × 4
#>     year prod_A_AI prod_B_AI prod_B_EI
#>    <int>     <dbl>     <dbl>     <dbl>
#>  1  2000   -0.244     0.738    -0.313 
#>  2  2001   -0.283     1.89      1.07  
#>  3  2002   -0.554    -0.0974    0.0700
#>  4  2003    0.629    -0.936    -0.639 
#>  5  2004    2.07     -0.0160   -0.0500
#>  6  2005   -1.63     -0.827    -0.251 
#>  7  2006    0.512    -1.51      0.445 
#>  8  2007   -1.86      0.935     2.76  
#>  9  2008   -0.522     0.176     0.0465
#> 10  2009   -0.0526    0.244     0.578 
#> # ℹ 5 more rows
```

### Tidy census

The `us_rent_income` dataset contains information about median income
and rent for each state in the US for 2017 (from the American Community
Survey, retrieved with the
[tidycensus](https://walker-data.com/tidycensus/) package).

``` r
us_rent_income
#> # A tibble: 104 × 5
#>    GEOID NAME       variable estimate   moe
#>    <chr> <chr>      <chr>       <dbl> <dbl>
#>  1 01    Alabama    income      24476   136
#>  2 01    Alabama    rent          747     3
#>  3 02    Alaska     income      32940   508
#>  4 02    Alaska     rent         1200    13
#>  5 04    Arizona    income      27517   148
#>  6 04    Arizona    rent          972     4
#>  7 05    Arkansas   income      23789   165
#>  8 05    Arkansas   rent          709     5
#>  9 06    California income      29454   109
#> 10 06    California rent         1358     3
#> # ℹ 94 more rows
```

Here both `estimate` and `moe` are values columns, so we can supply them
to `values_from`:

``` r
us_rent_income |>
  pivot_wider(
    names_from = variable,
    values_from = c(estimate, moe)
  )
#> # A tibble: 52 × 6
#>    GEOID NAME         estimate_income estimate_rent moe_income moe_rent
#>    <chr> <chr>                  <dbl>         <dbl>      <dbl>    <dbl>
#>  1 01    Alabama                24476           747        136        3
#>  2 02    Alaska                 32940          1200        508       13
#>  3 04    Arizona                27517           972        148        4
#>  4 05    Arkansas               23789           709        165        5
#>  5 06    California             29454          1358        109        3
#>  6 08    Colorado               32401          1125        109        5
#>  7 09    Connecticut            35326          1123        195        5
#>  8 10    Delaware               31560          1076        247       10
#>  9 11    District of…           43198          1424        681       17
#> 10 12    Florida                25952          1077         70        3
#> # ℹ 42 more rows
```

Note that the name of the variable is automatically appended to the
output columns.

### Implicit missing values

Occasionally, you’ll come across data where your names variable is
encoded as a factor, but not all of the data will be represented.

``` r
weekdays <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

daily <- tibble(
  day = factor(c("Tue", "Thu", "Fri", "Mon"), levels = weekdays),
  value = c(2, 3, 1, 5)
)

daily
#> # A tibble: 4 × 2
#>   day   value
#>   <fct> <dbl>
#> 1 Tue       2
#> 2 Thu       3
#> 3 Fri       1
#> 4 Mon       5
```

[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
defaults to generating columns from the values that are actually
represented in the data, but you might want to include a column for each
possible level in case the data changes in the future.

``` r
daily |>
  pivot_wider(
    names_from = day,
    values_from = value
  )
#> # A tibble: 1 × 4
#>     Tue   Thu   Fri   Mon
#>   <dbl> <dbl> <dbl> <dbl>
#> 1     2     3     1     5
```

The `names_expand` argument will turn implicit factor levels into
explicit ones, forcing them to be represented in the result. It also
sorts the column names using the level order, which produces more
intuitive results in this case.

``` r
daily |>
  pivot_wider(
    names_from = day,
    values_from = value,
    names_expand = TRUE
  )
#> # A tibble: 1 × 7
#>     Mon   Tue   Wed   Thu   Fri   Sat   Sun
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1     5     2    NA     3     1    NA    NA
```

If multiple `names_from` columns are provided, `names_expand` will
generate a Cartesian product of all possible combinations of the
`names_from` values. Notice that the following data has omitted some
rows where the percentage value would be `0`. `names_expand` allows us
to make those explicit during the pivot.

``` r
percentages <- tibble(
  year = c(2018, 2019, 2020, 2020),
  type = factor(c("A", "B", "A", "B"), levels = c("A", "B")),
  percentage = c(100, 100, 40, 60)
)

percentages
#> # A tibble: 4 × 3
#>    year type  percentage
#>   <dbl> <fct>      <dbl>
#> 1  2018 A            100
#> 2  2019 B            100
#> 3  2020 A             40
#> 4  2020 B             60

percentages |>
  pivot_wider(
    names_from = c(year, type),
    values_from = percentage,
    names_expand = TRUE,
    values_fill = 0
  )
#> # A tibble: 1 × 6
#>   `2018_A` `2018_B` `2019_A` `2019_B` `2020_A` `2020_B`
#>      <dbl>    <dbl>    <dbl>    <dbl>    <dbl>    <dbl>
#> 1      100        0        0      100       40       60
```

A related problem can occur when there are implicit missing factor
levels or combinations in the `id_cols`. In this case, there are missing
rows (rather than columns) that you’d like to explicitly represent. For
this example, we’ll modify our `daily` data with a `type` column, and
pivot on that instead, keeping `day` as an id column.

``` r
daily <- mutate(daily, type = factor(c("A", "B", "B", "A")))
daily
#> # A tibble: 4 × 3
#>   day   value type 
#>   <fct> <dbl> <fct>
#> 1 Tue       2 A    
#> 2 Thu       3 B    
#> 3 Fri       1 B    
#> 4 Mon       5 A
```

All of our `type` levels are represented in the columns, but we are
missing some rows related to the unrepresented `day` factor levels.

``` r
daily |>
  pivot_wider(
    names_from = type,
    values_from = value,
    values_fill = 0
  )
#> # A tibble: 4 × 3
#>   day       A     B
#>   <fct> <dbl> <dbl>
#> 1 Tue       2     0
#> 2 Thu       0     3
#> 3 Fri       0     1
#> 4 Mon       5     0
```

We can use `id_expand` in the same way that we used `names_expand`,
which will expand out (and sort) the implicit missing rows in the
`id_cols`.

``` r
daily |>
  pivot_wider(
    names_from = type,
    values_from = value,
    values_fill = 0,
    id_expand = TRUE
  )
#> # A tibble: 7 × 3
#>   day       A     B
#>   <fct> <dbl> <dbl>
#> 1 Mon       5     0
#> 2 Tue       2     0
#> 3 Wed       0     0
#> 4 Thu       0     3
#> 5 Fri       0     1
#> 6 Sat       0     0
#> 7 Sun       0     0
```

### Unused columns

Imagine you’ve found yourself in a situation where you have columns in
your data that are completely unrelated to the pivoting process, but
you’d still like to retain their information somehow. For example, in
`updates` we’d like to pivot on the `system` column to create one row
summaries of each county’s system updates.

``` r
updates <- tibble(
  county = c("Wake", "Wake", "Wake", "Guilford", "Guilford"),
  date = c(as.Date("2020-01-01") + 0:2, as.Date("2020-01-03") + 0:1),
  system = c("A", "B", "C", "A", "C"),
  value = c(3.2, 4, 5.5, 2, 1.2)
)

updates
#> # A tibble: 5 × 4
#>   county   date       system value
#>   <chr>    <date>     <chr>  <dbl>
#> 1 Wake     2020-01-01 A        3.2
#> 2 Wake     2020-01-02 B        4  
#> 3 Wake     2020-01-03 C        5.5
#> 4 Guilford 2020-01-03 A        2  
#> 5 Guilford 2020-01-04 C        1.2
```

We could do that with a typical
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
call, but we completely lose all information about the `date` column.

``` r
updates |>
  pivot_wider(
    id_cols = county,
    names_from = system,
    values_from = value
  )
#> # A tibble: 2 × 4
#>   county       A     B     C
#>   <chr>    <dbl> <dbl> <dbl>
#> 1 Wake       3.2     4   5.5
#> 2 Guilford   2      NA   1.2
```

For this example, we’d like to retain the most recent update date across
all systems in a particular county. To accomplish that we can use the
`unused_fn` argument, which allows us to summarize values from the
columns not utilized in the pivoting process.

``` r
updates |>
  pivot_wider(
    id_cols = county,
    names_from = system,
    values_from = value,
    unused_fn = list(date = max)
  )
#> # A tibble: 2 × 5
#>   county       A     B     C date      
#>   <chr>    <dbl> <dbl> <dbl> <date>    
#> 1 Wake       3.2     4   5.5 2020-01-03
#> 2 Guilford   2      NA   1.2 2020-01-04
```

You can also retain the data but delay the aggregation entirely by using
[`list()`](https://rdrr.io/r/base/list.html) as the summary function.

``` r
updates |>
  pivot_wider(
    id_cols = county,
    names_from = system,
    values_from = value,
    unused_fn = list(date = list)
  )
#> # A tibble: 2 × 5
#>   county       A     B     C date      
#>   <chr>    <dbl> <dbl> <dbl> <list>    
#> 1 Wake       3.2     4   5.5 <date [3]>
#> 2 Guilford   2      NA   1.2 <date [2]>
```

### Contact list

A final challenge is inspired by [Jiena
Gu](https://github.com/jienagu/tidyverse_examples/blob/master/example_long_wide.R).
Imagine you have a contact list that you’ve copied and pasted from a
website:

``` r
contacts <- tribble(
  ~field, ~value,
  "name", "Jiena McLellan",
  "company", "Toyota",
  "name", "John Smith",
  "company", "google",
  "email", "john@google.com",
  "name", "Huxley Ratcliffe"
)
```

This is challenging because there’s no variable that identifies which
observations belong together. We can fix this by noting that every
contact starts with a name, so we can create a unique id by counting
every time we see “name” as the `field`:

``` r
contacts <- contacts |>
  mutate(
    person_id = cumsum(field == "name")
  )
contacts
#> # A tibble: 6 × 3
#>   field   value            person_id
#>   <chr>   <chr>                <int>
#> 1 name    Jiena McLellan           1
#> 2 company Toyota                   1
#> 3 name    John Smith               2
#> 4 company google                   2
#> 5 email   john@google.com          2
#> 6 name    Huxley Ratcliffe         3
```

Now that we have a unique identifier for each person, we can pivot
`field` and `value` into the columns:

``` r
contacts |>
  pivot_wider(
    names_from = field,
    values_from = value
  )
#> # A tibble: 3 × 4
#>   person_id name             company email          
#>       <int> <chr>            <chr>   <chr>          
#> 1         1 Jiena McLellan   Toyota  NA             
#> 2         2 John Smith       google  john@google.com
#> 3         3 Huxley Ratcliffe NA      NA
```

## Longer, then wider

Some problems can’t be solved by pivoting in a single direction. The
examples in this section show how you might combine
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
to solve more complex problems.

### World bank

`world_bank_pop` contains data from the World Bank about population per
country from 2000 to 2018.

``` r
world_bank_pop
#> # A tibble: 1,064 × 20
#>    country indicator     `2000`  `2001`  `2002`  `2003`  `2004`  `2005`
#>    <chr>   <chr>          <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#>  1 ABW     SP.URB.TOTL   4.16e4 4.20e+4 4.22e+4 4.23e+4 4.23e+4 4.24e+4
#>  2 ABW     SP.URB.GROW   1.66e0 9.56e-1 4.01e-1 1.97e-1 9.46e-2 1.94e-1
#>  3 ABW     SP.POP.TOTL   8.91e4 9.07e+4 9.18e+4 9.27e+4 9.35e+4 9.45e+4
#>  4 ABW     SP.POP.GROW   2.54e0 1.77e+0 1.19e+0 9.97e-1 9.01e-1 1.00e+0
#>  5 AFE     SP.URB.TOTL   1.16e8 1.20e+8 1.24e+8 1.29e+8 1.34e+8 1.39e+8
#>  6 AFE     SP.URB.GROW   3.60e0 3.66e+0 3.72e+0 3.71e+0 3.74e+0 3.81e+0
#>  7 AFE     SP.POP.TOTL   4.02e8 4.12e+8 4.23e+8 4.34e+8 4.45e+8 4.57e+8
#>  8 AFE     SP.POP.GROW   2.58e0 2.59e+0 2.61e+0 2.62e+0 2.64e+0 2.67e+0
#>  9 AFG     SP.URB.TOTL   4.31e6 4.36e+6 4.67e+6 5.06e+6 5.30e+6 5.54e+6
#> 10 AFG     SP.URB.GROW   1.86e0 1.15e+0 6.86e+0 7.95e+0 4.59e+0 4.47e+0
#> # ℹ 1,054 more rows
#> # ℹ 12 more variables: `2006` <dbl>, `2007` <dbl>, `2008` <dbl>,
#> #   `2009` <dbl>, `2010` <dbl>, `2011` <dbl>, `2012` <dbl>,
#> #   `2013` <dbl>, `2014` <dbl>, `2015` <dbl>, `2016` <dbl>,
#> #   `2017` <dbl>
```

My goal is to produce a tidy dataset where each variable is in a column.
It’s not obvious exactly what steps are needed yet, but I’ll start with
the most obvious problem: year is spread across multiple columns.

``` r
pop2 <- world_bank_pop |>
  pivot_longer(
    cols = `2000`:`2017`,
    names_to = "year",
    values_to = "value"
  )
pop2
#> # A tibble: 19,152 × 4
#>    country indicator   year  value
#>    <chr>   <chr>       <chr> <dbl>
#>  1 ABW     SP.URB.TOTL 2000  41625
#>  2 ABW     SP.URB.TOTL 2001  42025
#>  3 ABW     SP.URB.TOTL 2002  42194
#>  4 ABW     SP.URB.TOTL 2003  42277
#>  5 ABW     SP.URB.TOTL 2004  42317
#>  6 ABW     SP.URB.TOTL 2005  42399
#>  7 ABW     SP.URB.TOTL 2006  42555
#>  8 ABW     SP.URB.TOTL 2007  42729
#>  9 ABW     SP.URB.TOTL 2008  42906
#> 10 ABW     SP.URB.TOTL 2009  43079
#> # ℹ 19,142 more rows
```

Next we need to consider the `indicator` variable:

``` r
pop2 |>
  count(indicator)
#> # A tibble: 4 × 2
#>   indicator       n
#>   <chr>       <int>
#> 1 SP.POP.GROW  4788
#> 2 SP.POP.TOTL  4788
#> 3 SP.URB.GROW  4788
#> 4 SP.URB.TOTL  4788
```

Here `SP.POP.GROW` is population growth, `SP.POP.TOTL` is total
population, and `SP.URB.*` are the same but only for urban areas. Let’s
split this up into two variables: `area` (total or urban) and the actual
variable (population or growth):

``` r
pop3 <- pop2 |>
  separate(indicator, c(NA, "area", "variable"))
pop3
#> # A tibble: 19,152 × 5
#>    country area  variable year  value
#>    <chr>   <chr> <chr>    <chr> <dbl>
#>  1 ABW     URB   TOTL     2000  41625
#>  2 ABW     URB   TOTL     2001  42025
#>  3 ABW     URB   TOTL     2002  42194
#>  4 ABW     URB   TOTL     2003  42277
#>  5 ABW     URB   TOTL     2004  42317
#>  6 ABW     URB   TOTL     2005  42399
#>  7 ABW     URB   TOTL     2006  42555
#>  8 ABW     URB   TOTL     2007  42729
#>  9 ABW     URB   TOTL     2008  42906
#> 10 ABW     URB   TOTL     2009  43079
#> # ℹ 19,142 more rows
```

Now we can complete the tidying by pivoting `variable` and `value` to
make `TOTL` and `GROW` columns:

``` r
pop3 |>
  pivot_wider(
    names_from = variable,
    values_from = value
  )
#> # A tibble: 9,576 × 5
#>    country area  year   TOTL   GROW
#>    <chr>   <chr> <chr> <dbl>  <dbl>
#>  1 ABW     URB   2000  41625 1.66  
#>  2 ABW     URB   2001  42025 0.956 
#>  3 ABW     URB   2002  42194 0.401 
#>  4 ABW     URB   2003  42277 0.197 
#>  5 ABW     URB   2004  42317 0.0946
#>  6 ABW     URB   2005  42399 0.194 
#>  7 ABW     URB   2006  42555 0.367 
#>  8 ABW     URB   2007  42729 0.408 
#>  9 ABW     URB   2008  42906 0.413 
#> 10 ABW     URB   2009  43079 0.402 
#> # ℹ 9,566 more rows
```

### Multi-choice

Based on a suggestion by [Maxime Wack](https://github.com/MaximeWack),
<https://github.com/tidyverse/tidyr/issues/384>), the final example
shows how to deal with a common way of recording multiple choice data.
Often you will get such data as follows:

``` r
multi <- tribble(
  ~id, ~choice1, ~choice2, ~choice3,
  1, "A", "B", "C",
  2, "C", "B",  NA,
  3, "D",  NA,  NA,
  4, "B", "D",  NA
)
```

But the actual order isn’t important, and you’d prefer to have the
individual questions in the columns. You can achieve the desired
transformation in two steps. First, you make the data longer,
eliminating the explicit `NA`s, and adding a column to indicate that
this choice was chosen:

``` r
multi2 <- multi |>
  pivot_longer(
    cols = !id,
    values_drop_na = TRUE
  ) |>
  mutate(checked = TRUE)
multi2
#> # A tibble: 8 × 4
#>      id name    value checked
#>   <dbl> <chr>   <chr> <lgl>  
#> 1     1 choice1 A     TRUE   
#> 2     1 choice2 B     TRUE   
#> 3     1 choice3 C     TRUE   
#> 4     2 choice1 C     TRUE   
#> 5     2 choice2 B     TRUE   
#> 6     3 choice1 D     TRUE   
#> 7     4 choice1 B     TRUE   
#> 8     4 choice2 D     TRUE
```

Then you make the data wider, filling in the missing observations with
`FALSE`:

``` r
multi2 |>
  pivot_wider(
    id_cols = id,
    names_from = value,
    values_from = checked,
    values_fill = FALSE
  )
#> # A tibble: 4 × 5
#>      id A     B     C     D    
#>   <dbl> <lgl> <lgl> <lgl> <lgl>
#> 1     1 TRUE  TRUE  TRUE  FALSE
#> 2     2 FALSE TRUE  TRUE  FALSE
#> 3     3 FALSE FALSE FALSE TRUE 
#> 4     4 FALSE TRUE  FALSE TRUE
```

## Manual specs

The arguments to
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
allow you to pivot a wide range of datasets. But the creativity that
people apply to their data structures is seemingly endless, so it’s
quite possible that you will encounter a dataset that you can’t
immediately see how to reshape with
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md).
To gain more control over pivoting, you can instead create a “spec” data
frame that describes exactly how data stored in the column names becomes
variables (and vice versa). This section introduces you to the spec data
structure, and show you how to use it when
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
are insufficient.

### Longer

To see how this works, lets return to the simplest case of pivoting
applied to the `relig_income` dataset. Now pivoting happens in two
steps: we first create a spec object (using
[`build_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md))
then use that to describe the pivoting operation:

``` r
spec <- relig_income |>
  build_longer_spec(
    cols = !religion,
    names_to = "income",
    values_to = "count"
  )
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
```

(This gives the same result as before, just with more code. There’s no
need to use it here, it is presented as a simple example for using
`spec`.)

What does `spec` look like? It’s a data frame with one row for each
column in the wide format version of the data that is not present in the
long format, and two special columns that start with `.`:

- `.name` gives the name of the column.
- `.value` gives the name of the column that the values in the cells
  will go into.

There is also one column in `spec` for each column present in the long
format of the data that is not present in the wide format of the data.
This corresponds to the `names_to` argument in
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`build_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md)
and the `names_from` argument in
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
and
[`build_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md).
In this example, the income column is a character vector of the names of
columns being pivoted.

``` r
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
```

### Wider

Below we widen `us_rent_income` with
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md).
The result is ok, but I think it could be improved:

``` r
us_rent_income |>
  pivot_wider(
    names_from = variable,
    values_from = c(estimate, moe)
  )
#> # A tibble: 52 × 6
#>    GEOID NAME         estimate_income estimate_rent moe_income moe_rent
#>    <chr> <chr>                  <dbl>         <dbl>      <dbl>    <dbl>
#>  1 01    Alabama                24476           747        136        3
#>  2 02    Alaska                 32940          1200        508       13
#>  3 04    Arizona                27517           972        148        4
#>  4 05    Arkansas               23789           709        165        5
#>  5 06    California             29454          1358        109        3
#>  6 08    Colorado               32401          1125        109        5
#>  7 09    Connecticut            35326          1123        195        5
#>  8 10    Delaware               31560          1076        247       10
#>  9 11    District of…           43198          1424        681       17
#> 10 12    Florida                25952          1077         70        3
#> # ℹ 42 more rows
```

I think it would be better to have columns `income`, `rent`,
`income_moe`, and `rent_moe`, which we can achieve with a manual spec.
The current spec looks like this:

``` r
spec1 <- us_rent_income |>
  build_wider_spec(
    names_from = variable,
    values_from = c(estimate, moe)
  )
spec1
#> # A tibble: 4 × 3
#>   .name           .value   variable
#>   <chr>           <chr>    <chr>   
#> 1 estimate_income estimate income  
#> 2 estimate_rent   estimate rent    
#> 3 moe_income      moe      income  
#> 4 moe_rent        moe      rent
```

For this case, we mutate `spec` to carefully construct the column names:

``` r
spec2 <- spec1 |>
  mutate(
    .name = paste0(variable, ifelse(.value == "moe", "_moe", ""))
  )
spec2
#> # A tibble: 4 × 3
#>   .name      .value   variable
#>   <chr>      <chr>    <chr>   
#> 1 income     estimate income  
#> 2 rent       estimate rent    
#> 3 income_moe moe      income  
#> 4 rent_moe   moe      rent
```

Supplying this spec to
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
gives us the result we’re looking for:

``` r
us_rent_income |>
  pivot_wider_spec(spec2)
#> # A tibble: 52 × 6
#>    GEOID NAME                 income  rent income_moe rent_moe
#>    <chr> <chr>                 <dbl> <dbl>      <dbl>    <dbl>
#>  1 01    Alabama               24476   747        136        3
#>  2 02    Alaska                32940  1200        508       13
#>  3 04    Arizona               27517   972        148        4
#>  4 05    Arkansas              23789   709        165        5
#>  5 06    California            29454  1358        109        3
#>  6 08    Colorado              32401  1125        109        5
#>  7 09    Connecticut           35326  1123        195        5
#>  8 10    Delaware              31560  1076        247       10
#>  9 11    District of Columbia  43198  1424        681       17
#> 10 12    Florida               25952  1077         70        3
#> # ℹ 42 more rows
```

### By hand

Sometimes it’s not possible (or not convenient) to compute the spec, and
instead it’s more convenient to construct the spec “by hand”. For
example, take this `construction` data, which is lightly modified from
Table 5 “completions” found at
<https://www.census.gov/construction/nrc/index.html>:

``` r
construction
#> # A tibble: 9 × 9
#>    Year Month     `1 unit` `2 to 4 units` `5 units or more` Northeast
#>   <dbl> <chr>        <dbl> <lgl>                      <dbl>     <dbl>
#> 1  2018 January        859 NA                           348       114
#> 2  2018 February       882 NA                           400       138
#> 3  2018 March          862 NA                           356       150
#> 4  2018 April          797 NA                           447       144
#> 5  2018 May            875 NA                           364        90
#> 6  2018 June           867 NA                           342        76
#> 7  2018 July           829 NA                           360       108
#> 8  2018 August         939 NA                           286        90
#> 9  2018 September      835 NA                           304       117
#> # ℹ 3 more variables: Midwest <dbl>, South <dbl>, West <dbl>
```

This sort of data is not uncommon from government agencies: the column
names actually belong to different variables, and here we have summaries
for number of units (1, 2-4, 5+) and regions of the country (NE, NW,
midwest, S, W). We can most easily describe that with a tibble:

``` r
spec <- tribble(
  ~.name,            ~.value, ~units,  ~region,
  "1 unit",          "n",     "1",     NA,
  "2 to 4 units",    "n",     "2-4",   NA,
  "5 units or more", "n",     "5+",    NA,
  "Northeast",       "n",     NA,      "Northeast",
  "Midwest",         "n",     NA,      "Midwest",
  "South",           "n",     NA,      "South",
  "West",            "n",     NA,      "West",
)
```

Which yields the following longer form:

``` r
construction |> pivot_longer_spec(spec)
#> # A tibble: 63 × 5
#>     Year Month    units region        n
#>    <dbl> <chr>    <chr> <chr>     <dbl>
#>  1  2018 January  1     NA          859
#>  2  2018 January  2-4   NA           NA
#>  3  2018 January  5+    NA          348
#>  4  2018 January  NA    Northeast   114
#>  5  2018 January  NA    Midwest     169
#>  6  2018 January  NA    South       596
#>  7  2018 January  NA    West        339
#>  8  2018 February 1     NA          882
#>  9  2018 February 2-4   NA           NA
#> 10  2018 February 5+    NA          400
#> # ℹ 53 more rows
```

Note that there is no overlap between the `units` and `region`
variables; here the data would really be most naturally described in two
independent tables.

### Theory

One neat property of the `spec` is that you need the same spec for
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md).
This makes it very clear that the two operations are symmetric:

``` r
construction |>
  pivot_longer_spec(spec) |>
  pivot_wider_spec(spec)
#> # A tibble: 9 × 9
#>    Year Month     `1 unit` `2 to 4 units` `5 units or more` Northeast
#>   <dbl> <chr>        <dbl>          <dbl>             <dbl>     <dbl>
#> 1  2018 January        859             NA               348       114
#> 2  2018 February       882             NA               400       138
#> 3  2018 March          862             NA               356       150
#> 4  2018 April          797             NA               447       144
#> 5  2018 May            875             NA               364        90
#> 6  2018 June           867             NA               342        76
#> 7  2018 July           829             NA               360       108
#> 8  2018 August         939             NA               286        90
#> 9  2018 September      835             NA               304       117
#> # ℹ 3 more variables: Midwest <dbl>, South <dbl>, West <dbl>
```

The pivoting spec allows us to be more precise about exactly how
`pivot_longer(df, spec = spec)` changes the shape of `df`: it will have
`nrow(df) * nrow(spec)` rows, and
`ncol(df) - nrow(spec) + ncol(spec) - 2` columns.
