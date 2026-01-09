# US rent and income data

Captured from the 2017 American Community Survey using the tidycensus
package.

## Usage

``` r
us_rent_income
```

## Format

A dataset with variables:

- GEOID:

  FIP state identifier

- NAME:

  Name of state

- variable:

  Variable name: income = median yearly income, rent = median monthly
  rent

- estimate:

  Estimated value

- moe:

  90% margin of error
