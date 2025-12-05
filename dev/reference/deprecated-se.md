# Deprecated SE versions of main verbs

**\[deprecated\]**

tidyr used to offer twin versions of each verb suffixed with an
underscore. These versions had standard evaluation (SE) semantics:
rather than taking arguments by code, like NSE verbs, they took
arguments by value. Their purpose was to make it possible to program
with tidyr. However, tidyr now uses tidy evaluation semantics. NSE verbs
still capture their arguments, but you can now unquote parts of these
arguments. This offers full programmability with NSE verbs. Thus, the
underscored versions are now superfluous.

Unquoting triggers immediate evaluation of its operand and inlines the
result within the captured expression. This result can be a value or an
expression to be evaluated later with the rest of the argument. See
[`vignette("programming", "dplyr")`](https://dplyr.tidyverse.org/articles/programming.html)
for more information.

## Usage

``` r
complete_(data, cols, fill = list(), ...)

drop_na_(data, vars)

expand_(data, dots, ...)

crossing_(x)

nesting_(x)

extract_(
  data,
  col,
  into,
  regex = "([[:alnum:]]+)",
  remove = TRUE,
  convert = FALSE,
  ...
)

fill_(data, fill_cols, .direction = c("down", "up"))

gather_(
  data,
  key_col,
  value_col,
  gather_cols,
  na.rm = FALSE,
  convert = FALSE,
  factor_key = FALSE
)

nest_(...)

separate_rows_(data, cols, sep = "[^[:alnum:].]+", convert = FALSE)

separate_(
  data,
  col,
  into,
  sep = "[^[:alnum:]]+",
  remove = TRUE,
  convert = FALSE,
  extra = "warn",
  fill = "warn",
  ...
)

spread_(
  data,
  key_col,
  value_col,
  fill = NA,
  convert = FALSE,
  drop = TRUE,
  sep = NULL
)

unite_(data, col, from, sep = "_", remove = TRUE)

unnest_(...)
```

## Arguments

- data:

  A data frame

- fill:

  A named list that for each variable supplies a single value to use
  instead of `NA` for missing combinations.

- ...:

  \<[`data-masking`](https://tidyr.tidyverse.org/dev/reference/tidyr_data_masking.md)\>
  Specification of columns to expand or complete. Columns can be atomic
  vectors or lists.

  - To find all unique combinations of `x`, `y` and `z`, including those
    not present in the data, supply each variable as a separate
    argument: `expand(df, x, y, z)` or `complete(df, x, y, z)`.

  - To find only the combinations that occur in the data, use `nesting`:
    `expand(df, nesting(x, y, z))`.

  - You can combine the two forms. For example,
    `expand(df, nesting(school_id, student_id), date)` would produce a
    row for each present school-student combination for all possible
    dates.

  When used with factors,
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) and
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  use the full set of levels, not just those that appear in the data. If
  you want to use only the values seen in the data, use
  `forcats::fct_drop()`.

  When used with continuous variables, you may need to fill in values
  that do not appear in the data: to do so use expressions like
  `year = 2010:2020` or `year = full_seq(year,1)`.

- vars, cols, col:

  Name of columns.

- x:

  For `nesting_` and `crossing_` a list of variables.

- into:

  Names of new variables to create as character vector. Use `NA` to omit
  the variable in the output.

- regex:

  A string representing a regular expression used to extract the desired
  values. There should be one group (defined by `()`) for each element
  of `into`.

- remove:

  If `TRUE`, remove input column from output data frame.

- convert:

  If `TRUE`, will run
  [`type.convert()`](https://rdrr.io/r/utils/type.convert.html) with
  `as.is = TRUE` on new columns. This is useful if the component columns
  are integer, numeric or logical.

  NB: this will cause string `"NA"`s to be converted to `NA`s.

- fill_cols:

  Character vector of column names.

- .direction:

  Direction in which to fill missing values. Currently either "down"
  (the default), "up", "downup" (i.e. first down and then up) or
  "updown" (first up and then down).

- key_col, value_col:

  Strings giving names of key and value cols.

- gather_cols:

  Character vector giving column names to be gathered into pair of
  key-value columns.

- na.rm:

  If `TRUE`, will remove rows from output where the value column is
  `NA`.

- factor_key:

  If `FALSE`, the default, the key values will be stored as a character
  vector. If `TRUE`, will be stored as a factor, which preserves the
  original ordering of the columns.

- sep:

  Separator delimiting collapsed values.

- extra:

  If `sep` is a character vector, this controls what happens when there
  are too many pieces. There are three valid options:

  - `"warn"` (the default): emit a warning and drop extra values.

  - `"drop"`: drop any extra values without a warning.

  - `"merge"`: only splits at most `length(into)` times

- drop:

  If `FALSE`, will keep factor levels that don't appear in the data,
  filling in missing combinations with `fill`.

- from:

  Names of existing columns as character vector
