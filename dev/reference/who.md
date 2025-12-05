# World Health Organization TB data

A subset of data from the World Health Organization Global Tuberculosis
Report, and accompanying global populations. `who` uses the original
codes from the World Health Organization. The column names for columns 5
through 60 are made by combining `new_` with:

- the method of diagnosis (`rel` = relapse, `sn` = negative pulmonary
  smear, `sp` = positive pulmonary smear, `ep` = extrapulmonary),

- gender (`f` = female, `m` = male), and

- age group (`014` = 0-14 yrs of age, `1524` = 15-24, `2534` = 25-34,
  `3544` = 35-44 years of age, `4554` = 45-54, `5564` = 55-64, `65` = 65
  years or older).

`who2` is a lightly modified version that makes teaching the basics
easier by tweaking the variables to be slightly more consistent and
dropping `iso2` and `iso3`. `newrel` is replaced by `new_rel`, and a `_`
is added after the gender.

## Usage

``` r
who

who2

population
```

## Format

### `who`

A data frame with 7,240 rows and 60 columns:

- country:

  Country name

- iso2, iso3:

  2 & 3 letter ISO country codes

- year:

  Year

- new_sp_m014 - new_rel_f65:

  Counts of new TB cases recorded by group. Column names encode three
  variables that describe the group.

### `who2`

A data frame with 7,240 rows and 58 columns.

### `population`

A data frame with 4,060 rows and three columns:

- country:

  Country name

- year:

  Year

- population:

  Population

## Source

<https://www.who.int/teams/global-tuberculosis-programme/data>
