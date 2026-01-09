# Fill in missing values with previous or next value

Fills missing values in selected columns using the next or previous
entry. This is useful in the common output format where values are not
repeated, and are only recorded when they change.

## Usage

``` r
fill(data, ..., .by = NULL, .direction = c("down", "up", "downup", "updown"))
```

## Arguments

- data:

  A data frame.

- ...:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to fill.

- .by:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Optionally, a selection of columns to group by for just this
  operation, functioning as an alternative to
  [`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html).

- .direction:

  Direction in which to fill missing values. Currently either "down"
  (the default), "up", "downup" (i.e. first down and then up) or
  "updown" (first up and then down).

## Details

Missing values are replaced in atomic vectors; `NULL`s are replaced in
lists.

## Grouped data frames

With grouped data frames created by
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html),
`fill()` will be applied *within* each group, meaning that it won't fill
across group boundaries. This can also be accomplished using the `.by`
argument to `fill()`, which creates a temporary grouping for just this
operation.

## Examples

``` r
# direction = "down" --------------------------------------------------------
# Value (year) is recorded only when it changes
sales <- tibble::tribble(
  ~quarter, ~year, ~sales,
  "Q1",    2000,    66013,
  "Q2",      NA,    69182,
  "Q3",      NA,    53175,
  "Q4",      NA,    21001,
  "Q1",    2001,    46036,
  "Q2",      NA,    58842,
  "Q3",      NA,    44568,
  "Q4",      NA,    50197,
  "Q1",    2002,    39113,
  "Q2",      NA,    41668,
  "Q3",      NA,    30144,
  "Q4",      NA,    52897,
  "Q1",    2004,    32129,
  "Q2",      NA,    67686,
  "Q3",      NA,    31768,
  "Q4",      NA,    49094
)
# `fill()` defaults to replacing missing data from top to bottom
sales |> fill(year)
#> # A tibble: 16 × 3
#>    quarter  year sales
#>    <chr>   <dbl> <dbl>
#>  1 Q1       2000 66013
#>  2 Q2       2000 69182
#>  3 Q3       2000 53175
#>  4 Q4       2000 21001
#>  5 Q1       2001 46036
#>  6 Q2       2001 58842
#>  7 Q3       2001 44568
#>  8 Q4       2001 50197
#>  9 Q1       2002 39113
#> 10 Q2       2002 41668
#> 11 Q3       2002 30144
#> 12 Q4       2002 52897
#> 13 Q1       2004 32129
#> 14 Q2       2004 67686
#> 15 Q3       2004 31768
#> 16 Q4       2004 49094

# direction = "up" ----------------------------------------------------------
# Value (pet_type) is missing above
tidy_pets <- tibble::tribble(
  ~rank, ~pet_type, ~breed,
  1L,        NA,    "Boston Terrier",
  2L,        NA,    "Retrievers (Labrador)",
  3L,        NA,    "Retrievers (Golden)",
  4L,        NA,    "French Bulldogs",
  5L,        NA,    "Bulldogs",
  6L,     "Dog",    "Beagles",
  1L,        NA,    "Persian",
  2L,        NA,    "Maine Coon",
  3L,        NA,    "Ragdoll",
  4L,        NA,    "Exotic",
  5L,        NA,    "Siamese",
  6L,     "Cat",    "American Short"
)

# For values that are missing above you can use `.direction = "up"`
tidy_pets |>
  fill(pet_type, .direction = "up")
#> # A tibble: 12 × 3
#>     rank pet_type breed                
#>    <int> <chr>    <chr>                
#>  1     1 Dog      Boston Terrier       
#>  2     2 Dog      Retrievers (Labrador)
#>  3     3 Dog      Retrievers (Golden)  
#>  4     4 Dog      French Bulldogs      
#>  5     5 Dog      Bulldogs             
#>  6     6 Dog      Beagles              
#>  7     1 Cat      Persian              
#>  8     2 Cat      Maine Coon           
#>  9     3 Cat      Ragdoll              
#> 10     4 Cat      Exotic               
#> 11     5 Cat      Siamese              
#> 12     6 Cat      American Short       

# direction = "downup" ------------------------------------------------------
# Value (n_squirrels) is missing above and below within a group
squirrels <- tibble::tribble(
  ~group,    ~name,     ~role,     ~n_squirrels,
  1,      "Sam",    "Observer",   NA,
  1,     "Mara", "Scorekeeper",    8,
  1,    "Jesse",    "Observer",   NA,
  1,      "Tom",    "Observer",   NA,
  2,     "Mike",    "Observer",   NA,
  2,  "Rachael",    "Observer",   NA,
  2,  "Sydekea", "Scorekeeper",   14,
  2, "Gabriela",    "Observer",   NA,
  3,  "Derrick",    "Observer",   NA,
  3,     "Kara", "Scorekeeper",    9,
  3,    "Emily",    "Observer",   NA,
  3, "Danielle",    "Observer",   NA
)

# The values are inconsistently missing by position within the `group`.
# Use `.direction = "downup"` to fill missing values in both directions
# and `.by = group` to apply the fill per group.
squirrels |>
  fill(n_squirrels, .direction = "downup", .by = group)
#> # A tibble: 12 × 4
#>    group name     role        n_squirrels
#>    <dbl> <chr>    <chr>             <dbl>
#>  1     1 Sam      Observer              8
#>  2     1 Mara     Scorekeeper           8
#>  3     1 Jesse    Observer              8
#>  4     1 Tom      Observer              8
#>  5     2 Mike     Observer             14
#>  6     2 Rachael  Observer             14
#>  7     2 Sydekea  Scorekeeper          14
#>  8     2 Gabriela Observer             14
#>  9     3 Derrick  Observer              9
#> 10     3 Kara     Scorekeeper           9
#> 11     3 Emily    Observer              9
#> 12     3 Danielle Observer              9

# If you want, you can also supply a data frame grouped with `group_by()`,
# but don't forget to `ungroup()`!
squirrels |>
  dplyr::group_by(group) |>
  fill(n_squirrels, .direction = "downup") |>
  dplyr::ungroup()
#> # A tibble: 12 × 4
#>    group name     role        n_squirrels
#>    <dbl> <chr>    <chr>             <dbl>
#>  1     1 Sam      Observer              8
#>  2     1 Mara     Scorekeeper           8
#>  3     1 Jesse    Observer              8
#>  4     1 Tom      Observer              8
#>  5     2 Mike     Observer             14
#>  6     2 Rachael  Observer             14
#>  7     2 Sydekea  Scorekeeper          14
#>  8     2 Gabriela Observer             14
#>  9     3 Derrick  Observer              9
#> 10     3 Kara     Scorekeeper           9
#> 11     3 Emily    Observer              9
#> 12     3 Danielle Observer              9
```
