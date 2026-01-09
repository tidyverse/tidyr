# Package index

## Pivoting

**Pivoting** changes the representation of a rectangular dataset,
without changing the data inside of it. See
[`vignette("pivot")`](https://tidyr.tidyverse.org/articles/pivot.md) for
more details and examples.

- [`pivot_longer()`](https://tidyr.tidyverse.org/reference/pivot_longer.md)
  : Pivot data from wide to long
- [`pivot_wider()`](https://tidyr.tidyverse.org/reference/pivot_wider.md)
  : Pivot data from long to wide

## Rectangling

**Rectangling** turns deeply nested lists into tidy tibbles. See
[`vignette("rectangle")`](https://tidyr.tidyverse.org/articles/rectangle.md)
for more details and examples.

- [`unnest_longer()`](https://tidyr.tidyverse.org/reference/unnest_longer.md)
  : Unnest a list-column into rows
- [`unnest_wider()`](https://tidyr.tidyverse.org/reference/unnest_wider.md)
  : Unnest a list-column into columns
- [`unnest()`](https://tidyr.tidyverse.org/reference/unnest.md) : Unnest
  a list-column of data frames into rows and columns
- [`hoist()`](https://tidyr.tidyverse.org/reference/hoist.md) : Hoist
  values out of list-columns

## Character vectors

Multiple variables are sometimes pasted together into a single column,
and these tools help you separate back out into individual columns.

- [`separate_longer_delim()`](https://tidyr.tidyverse.org/reference/separate_longer_delim.md)
  [`separate_longer_position()`](https://tidyr.tidyverse.org/reference/separate_longer_delim.md)
  **\[experimental\]** : Split a string into rows
- [`separate_wider_delim()`](https://tidyr.tidyverse.org/reference/separate_wider_delim.md)
  [`separate_wider_position()`](https://tidyr.tidyverse.org/reference/separate_wider_delim.md)
  [`separate_wider_regex()`](https://tidyr.tidyverse.org/reference/separate_wider_delim.md)
  **\[experimental\]** : Split a string into columns
- [`unite()`](https://tidyr.tidyverse.org/reference/unite.md) : Unite
  multiple columns into one by pasting strings together

## Missing values

Tools for converting between implicit (absent rows) and explicit (`NA`)
missing values, and for handling explicit `NA`s.

- [`complete()`](https://tidyr.tidyverse.org/reference/complete.md) :
  Complete a data frame with missing combinations of data
- [`drop_na()`](https://tidyr.tidyverse.org/reference/drop_na.md) : Drop
  rows containing missing values
- [`expand()`](https://tidyr.tidyverse.org/reference/expand.md)
  [`crossing()`](https://tidyr.tidyverse.org/reference/expand.md)
  [`nesting()`](https://tidyr.tidyverse.org/reference/expand.md) :
  Expand data frame to include all possible combinations of values
- [`expand_grid()`](https://tidyr.tidyverse.org/reference/expand_grid.md)
  : Create a tibble from all combinations of inputs
- [`fill()`](https://tidyr.tidyverse.org/reference/fill.md) : Fill in
  missing values with previous or next value
- [`full_seq()`](https://tidyr.tidyverse.org/reference/full_seq.md) :
  Create the full sequence of values in a vector
- [`replace_na()`](https://tidyr.tidyverse.org/reference/replace_na.md)
  : Replace NAs with specified values

## Miscellanea

- [`chop()`](https://tidyr.tidyverse.org/reference/chop.md)
  [`unchop()`](https://tidyr.tidyverse.org/reference/chop.md) : Chop and
  unchop
- [`pack()`](https://tidyr.tidyverse.org/reference/pack.md)
  [`unpack()`](https://tidyr.tidyverse.org/reference/pack.md) : Pack and
  unpack
- [`uncount()`](https://tidyr.tidyverse.org/reference/uncount.md) :
  "Uncount" a data frame
- [`nest()`](https://tidyr.tidyverse.org/reference/nest.md) : Nest rows
  into a list-column of data frames

## Data

- [`billboard`](https://tidyr.tidyverse.org/reference/billboard.md) :
  Song rankings for Billboard top 100 in the year 2000
- [`cms_patient_experience`](https://tidyr.tidyverse.org/reference/cms_patient_experience.md)
  [`cms_patient_care`](https://tidyr.tidyverse.org/reference/cms_patient_experience.md)
  : Data from the Centers for Medicare & Medicaid Services
- [`construction`](https://tidyr.tidyverse.org/reference/construction.md)
  : Completed construction in the US in 2018
- [`fish_encounters`](https://tidyr.tidyverse.org/reference/fish_encounters.md)
  : Fish encounters
- [`household`](https://tidyr.tidyverse.org/reference/household.md) :
  Household data
- [`relig_income`](https://tidyr.tidyverse.org/reference/relig_income.md)
  : Pew religion and income survey
- [`smiths`](https://tidyr.tidyverse.org/reference/smiths.md) : Some
  data about the Smith family
- [`table1`](https://tidyr.tidyverse.org/reference/table1.md)
  [`table2`](https://tidyr.tidyverse.org/reference/table1.md)
  [`table3`](https://tidyr.tidyverse.org/reference/table1.md)
  [`table4a`](https://tidyr.tidyverse.org/reference/table1.md)
  [`table4b`](https://tidyr.tidyverse.org/reference/table1.md)
  [`table5`](https://tidyr.tidyverse.org/reference/table1.md) : Example
  tabular representations
- [`us_rent_income`](https://tidyr.tidyverse.org/reference/us_rent_income.md)
  : US rent and income data
- [`who`](https://tidyr.tidyverse.org/reference/who.md)
  [`who2`](https://tidyr.tidyverse.org/reference/who.md)
  [`population`](https://tidyr.tidyverse.org/reference/who.md) : World
  Health Organization TB data
- [`world_bank_pop`](https://tidyr.tidyverse.org/reference/world_bank_pop.md)
  : Population data from the World Bank

## Superseded

Superseded functions have been replaced by superior solutions, but due
to their widespread use will not go away. However, they will not get any
new features and will only receive critical bug fixes.

- [`extract()`](https://tidyr.tidyverse.org/reference/extract.md)
  **\[superseded\]** : Extract a character column into multiple columns
  using regular expression groups

- [`separate()`](https://tidyr.tidyverse.org/reference/separate.md)
  **\[superseded\]** : Separate a character column into multiple columns
  with a regular expression or numeric locations

- [`separate_rows()`](https://tidyr.tidyverse.org/reference/separate_rows.md)
  **\[superseded\]** : Separate a collapsed column into multiple rows

- [`spread()`](https://tidyr.tidyverse.org/reference/spread.md)
  **\[superseded\]** : Spread a key-value pair across multiple columns

- [`gather()`](https://tidyr.tidyverse.org/reference/gather.md)
  **\[superseded\]** : Gather columns into key-value pairs

- [`nest_legacy()`](https://tidyr.tidyverse.org/reference/nest_legacy.md)
  [`unnest_legacy()`](https://tidyr.tidyverse.org/reference/nest_legacy.md)
  **\[superseded\]** :

  Legacy versions of
  [`nest()`](https://tidyr.tidyverse.org/reference/nest.md) and
  [`unnest()`](https://tidyr.tidyverse.org/reference/unnest.md)
