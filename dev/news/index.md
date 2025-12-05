# Changelog

## tidyr (development version)

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) gains a
  `.by` argument as an alternative to
  [`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html)
  for applying the fill per group, similar to `nest(.by =)` and
  `dplyr::mutate(.by =)` ([@olivroy](https://github.com/olivroy),
  [\#1439](https://github.com/tidyverse/tidyr/issues/1439)).

- [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md)
  gains a new `.vary` argument, allowing users to control whether the
  first column varies fastest or slowest
  ([\#1543](https://github.com/tidyverse/tidyr/issues/1543),
  [@JamesHWade](https://github.com/JamesHWade)).

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  now places `indices_to` columns before value columns
  ([\#1486](https://github.com/tidyverse/tidyr/issues/1486),
  [@andrewshibata](https://github.com/andrewshibata)).

- [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md)
  produces a more helpful error message when columns cannot be cast to
  `ptype` ([@mgirlich](https://github.com/mgirlich),
  [\#1477](https://github.com/tidyverse/tidyr/issues/1477)).

- [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md) no
  longer errors if you provide a selection that doesn’t select any
  columns. Instead, it returns a column containing the empty string
  ([\#1548](https://github.com/tidyverse/tidyr/issues/1548),
  [@catalamarti](https://github.com/catalamarti)).

- [`pivot_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md)
  now throws a more informative error on non-data frame inputs
  ([@catalamarti](https://github.com/catalamarti),
  [\#1510](https://github.com/tidyverse/tidyr/issues/1510)).

- Fixed an internal error in
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  ([\#1609](https://github.com/tidyverse/tidyr/issues/1609),
  [@krlmlr](https://github.com/krlmlr)).

- R \>=4.1.0 is now required, in line with the [tidyverse
  standard](https://tidyverse.org/blog/2019/04/r-version-support/) of
  supporting the previous 5 minor releases of R
  ([\#1613](https://github.com/tidyverse/tidyr/issues/1613)).

- The base pipe is now used throughout the documentation
  ([\#1613](https://github.com/tidyverse/tidyr/issues/1613)).

- tidyr now requires dplyr \>=1.1.0
  ([\#1568](https://github.com/tidyverse/tidyr/issues/1568),
  [@catalamarti](https://github.com/catalamarti)).

- tidyr is now compliant with R’s C API
  ([\#1618](https://github.com/tidyverse/tidyr/issues/1618)).

## tidyr 1.3.1

CRAN release: 2024-01-24

- `pivot_wider` now uses `.by` and `|>` syntax for the dplyr helper
  message to identify duplicates ([@boshek](https://github.com/boshek),
  [\#1516](https://github.com/tidyverse/tidyr/issues/1516))

## tidyr 1.3.0

CRAN release: 2023-01-24

### New features

- New family of consistent string separating functions:
  [`separate_wider_delim()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md),
  [`separate_wider_position()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md),
  [`separate_wider_regex()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md),
  [`separate_longer_delim()`](https://tidyr.tidyverse.org/dev/reference/separate_longer_delim.md),
  and
  [`separate_longer_position()`](https://tidyr.tidyverse.org/dev/reference/separate_longer_delim.md).
  These functions are thorough refreshes of
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  and
  [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md),
  featuring improved performance, greater consistency, a polished API,
  and a new approach for handling problems. They use stringr and
  supersede
  [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md),
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md),
  and
  [`separate_rows()`](https://tidyr.tidyverse.org/dev/reference/separate_rows.md)
  ([\#1304](https://github.com/tidyverse/tidyr/issues/1304)).

  The named character vector interface used in
  [`separate_wider_regex()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md)
  is very similar to the [nc](https://github.com/tdhock/nc) package by
  Toby Dylan Hocking.

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) gains a
  `.by` argument which allows you to specify the columns to nest by
  (rather than the columns to nest, i.e. through `...`). Additionally,
  the `.key` argument is no longer deprecated, and is used whenever
  `...` isn’t specified
  ([\#1458](https://github.com/tidyverse/tidyr/issues/1458)).

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  gains a `keep_empty` argument like
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  ([\#1339](https://github.com/tidyverse/tidyr/issues/1339)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  gains a `cols_vary` argument for controlling the ordering of the
  output rows relative to their original row number
  ([\#1312](https://github.com/tidyverse/tidyr/issues/1312)).

- New datasets `who2`, `household`, `cms_patient_experience`, and
  `cms_patient_care` to demonstrate various tidying challenges
  ([\#1333](https://github.com/tidyverse/tidyr/issues/1333)).

### Breaking changes

- The `...` argument of both
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  and
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  has been moved to the front of the function signature, after the
  required arguments but before the optional ones. Additionally,
  [`pivot_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md),
  [`pivot_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md),
  [`build_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md),
  and
  [`build_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md)
  have all gained `...` arguments in a similar location. This change
  allows us to more easily add new features to the pivoting functions
  without breaking existing CRAN packages and user scripts.

  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  provides temporary backwards compatible support for the case of a
  single unnamed argument that previously was being positionally matched
  to `id_cols`. This one special case still works, but will throw a
  warning encouraging you to explicitly name the `id_cols` argument.

  To read more about this pattern, see
  <https://design.tidyverse.org/dots-after-required.html>
  ([\#1350](https://github.com/tidyverse/tidyr/issues/1350)).

### Lifecycle changes

- All functions deprecated in tidyr 1.0 and 1.2 (the old lazyeval
  functions ending in `_` and various arguments to
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)) now
  warn on every use. They will be made defunct in 2024
  ([\#1406](https://github.com/tidyverse/tidyr/issues/1406)).

### Rectangling

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  now consistently drops rows with either `NULL` or empty vectors (like
  [`integer()`](https://rdrr.io/r/base/integer.html)) by default. Set
  the new `keep_empty` argument to `TRUE` to retain them. Previously,
  `keep_empty = TRUE` was implicitly being used for `NULL`, while
  `keep_empty = FALSE` was being used for empty vectors, which was
  inconsistent with all other tidyr verbs with this argument
  ([\#1363](https://github.com/tidyverse/tidyr/issues/1363)).

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  now uses `""` in the index column for fully unnamed vectors. It also
  now consistently uses `NA` in the index column for empty vectors that
  are “kept” by `keep_empty = TRUE`
  ([\#1442](https://github.com/tidyverse/tidyr/issues/1442)).

- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  now errors if any values being unnested are unnamed and `names_sep` is
  not provided
  ([\#1367](https://github.com/tidyverse/tidyr/issues/1367)).

- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  now generates automatic names for *partially* unnamed vectors.
  Previously it only generated them for fully unnamed vectors, resulting
  in a strange mix of automatic names and name-repaired names
  ([\#1367](https://github.com/tidyverse/tidyr/issues/1367)).

### Bug fixes and minor improvements

#### General

- Most tidyr functions now consistently disallow renaming during
  tidy-selection. Renaming was never meaningful in these functions, and
  previously either had no effect or caused problems
  ([\#1449](https://github.com/tidyverse/tidyr/issues/1449),
  [\#1104](https://github.com/tidyverse/tidyr/issues/1104)).

- tidyr errors (including input validation) have been thoroughly
  reviewed and should generally be more likely to point you in the right
  direction ([\#1313](https://github.com/tidyverse/tidyr/issues/1313),
  [\#1400](https://github.com/tidyverse/tidyr/issues/1400)).

- [`uncount()`](https://tidyr.tidyverse.org/dev/reference/uncount.md) is
  now generic so implementations can be provided for objects other than
  data frames ([@mgirlich](https://github.com/mgirlich),
  [\#1358](https://github.com/tidyverse/tidyr/issues/1358)).

- [`uncount()`](https://tidyr.tidyverse.org/dev/reference/uncount.md)
  gains a `...` argument. It comes between the required and the optional
  arguments ([@mgirlich](https://github.com/mgirlich),
  [\#1358](https://github.com/tidyverse/tidyr/issues/1358)).

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md),
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md),
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md), and
  [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) now
  document their support for grouped data frames created by
  [`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html)
  ([\#952](https://github.com/tidyverse/tidyr/issues/952)).

- All built in datasets are now standard tibbles
  ([\#1459](https://github.com/tidyverse/tidyr/issues/1459)).

- R \>=3.4.0 is now required, in line with the tidyverse standard of
  supporting the previous 5 minor releases of R.

- rlang \>=1.0.4 and vctrs \>=0.5.2 are now required
  ([\#1344](https://github.com/tidyverse/tidyr/issues/1344),
  [\#1470](https://github.com/tidyverse/tidyr/issues/1470)).

- Removed dependency on ellipsis in favor of equivalent functions in
  rlang ([\#1314](https://github.com/tidyverse/tidyr/issues/1314)).

#### Nesting, packing, and chopping

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  better handle lists with additional classes
  ([\#1327](https://github.com/tidyverse/tidyr/issues/1327)).

- [`pack()`](https://tidyr.tidyverse.org/dev/reference/pack.md),
  [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md),
  [`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md), and
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) all
  gain an `error_call` argument, which in turn improves some of the
  error calls shown in
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and
  various
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  adjacent functions
  ([\#1446](https://github.com/tidyverse/tidyr/issues/1446)).

- [`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md),
  [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md), and
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) all
  gain `...`, which must be empty
  ([\#1447](https://github.com/tidyverse/tidyr/issues/1447)).

- [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) does a
  better job of reporting column name duplication issues and gives
  better advice about how to resolve them using `names_sep`. This also
  improves errors from functions that use
  [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md), like
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  ([\#1425](https://github.com/tidyverse/tidyr/issues/1425),
  [\#1367](https://github.com/tidyverse/tidyr/issues/1367)).

#### Pivoting

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  no longer supports interpreting `values_ptypes = list()` and
  `names_ptypes = list()` as `NULL`. An empty
  [`list()`](https://rdrr.io/r/base/list.html) is now interpreted as a
  `<list>` prototype to apply to all columns, which is consistent with
  how any other 0-length value is interpreted
  ([\#1296](https://github.com/tidyverse/tidyr/issues/1296)).

- `pivot_longer(values_drop_na = TRUE)` is faster when there aren’t any
  missing values to drop
  ([\#1392](https://github.com/tidyverse/tidyr/issues/1392),
  [@mgirlich](https://github.com/mgirlich)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  is now more memory efficient due to the usage of
  [`vctrs::vec_interleave()`](https://vctrs.r-lib.org/reference/vec_interleave.html)
  ([\#1310](https://github.com/tidyverse/tidyr/issues/1310),
  [@mgirlich](https://github.com/mgirlich)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  now throws a slightly better error message when `values_ptypes` or
  `names_ptypes` is provided and the coercion can’t be made
  ([\#1364](https://github.com/tidyverse/tidyr/issues/1364)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  now throws a better error message when a column selected by
  `names_from` or `values_from` is also selected by `id_cols`
  ([\#1318](https://github.com/tidyverse/tidyr/issues/1318)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  is now faster when `names_sep` is provided
  ([@mgirlich](https://github.com/mgirlich),
  [\#1426](https://github.com/tidyverse/tidyr/issues/1426)).

- [`pivot_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md),
  [`pivot_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md),
  [`build_longer_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer_spec.md),
  and
  [`build_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md)
  all gain an `error_call` argument, resulting in better error reporting
  in
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  and
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  ([\#1408](https://github.com/tidyverse/tidyr/issues/1408)).

#### Missing values

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) now
  works correctly when there is a column named `.direction` in `data`
  ([\#1319](https://github.com/tidyverse/tidyr/issues/1319),
  [@tjmahr](https://github.com/tjmahr)).

- [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  is faster when there aren’t any missing values to replace
  ([\#1392](https://github.com/tidyverse/tidyr/issues/1392),
  [@mgirlich](https://github.com/mgirlich)).

- The documentation of the `replace` argument of
  [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  now mentions that `replace` is always cast to the type of `data`
  ([\#1317](https://github.com/tidyverse/tidyr/issues/1317)).

## tidyr 1.2.1

CRAN release: 2022-09-08

- Hot patch release to resolve R CMD check failures.

## tidyr 1.2.0

CRAN release: 2022-02-01

### Breaking changes

- [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  and [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  no longer allow you to complete or expand on a grouping column. This
  was never well-defined since completion/expansion on a grouped data
  frame happens “within” each group and otherwise has the potential to
  produce erroneous results
  ([\#1299](https://github.com/tidyverse/tidyr/issues/1299)).

- [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  no longer allows the type of `data` to change when the replacement is
  applied. `replace` will now always be cast to the type of `data`
  before the replacement is made. For example, this means that using a
  replacement value of `1.5` on an integer column is no longer allowed.
  Similarly, replacing missing values in a list-column must now be done
  with `list("foo")` rather than just `"foo"`.

### Pivoting

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  gains new `names_expand` and `id_expand` arguments for turning
  implicit missing factor levels and variable combinations into explicit
  ones. This is similar to the `drop` argument from
  [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)
  ([\#770](https://github.com/tidyverse/tidyr/issues/770)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  gains a new `names_vary` argument for controlling the ordering when
  combining `names_from` values with `values_from` column names
  ([\#839](https://github.com/tidyverse/tidyr/issues/839)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  gains a new `unused_fn` argument for controlling how to summarize
  unused columns that aren’t involved in the pivoting process
  ([\#990](https://github.com/tidyverse/tidyr/issues/990), thanks to
  [@mgirlich](https://github.com/mgirlich) for an initial
  implementation).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)’s
  `names_transform` and `values_transform` arguments now accept a single
  function which will be applied to all of the columns
  ([\#1284](https://github.com/tidyverse/tidyr/issues/1284), thanks to
  [@smingerson](https://github.com/smingerson) for an initial
  implementation).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)’s
  `names_ptypes` and `values_ptypes` arguments now accept a single empty
  ptype which will be applied to all of the columns
  ([\#1284](https://github.com/tidyverse/tidyr/issues/1284)).

### Nesting

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) and
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md)’s
  `ptype` argument now accepts a single empty ptype which will be
  applied to all `cols`
  ([\#1284](https://github.com/tidyverse/tidyr/issues/1284)).

- [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) now
  silently skips over any non-data frame columns specified by `cols`.
  This matches the existing behavior of
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) and
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  ([\#1153](https://github.com/tidyverse/tidyr/issues/1153)).

### Rectangling

- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  and
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  can now unnest multiple columns at once
  ([\#740](https://github.com/tidyverse/tidyr/issues/740)).

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)’s
  `indices_to` and `values_to` arguments now accept a glue
  specification, which is useful when unnesting multiple columns.

- For [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md),
  if a `ptype` is supplied, but that column can’t be simplified, the
  result will be a list-of column where each element has type `ptype`
  ([\#998](https://github.com/tidyverse/tidyr/issues/998)).

- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  gains a new `strict` argument which controls whether or not strict
  vctrs typing rules should be applied. It defaults to `FALSE` for
  backwards compatibility, and because it is often more useful to be lax
  when unnesting JSON, which doesn’t always map one-to-one with R’s
  types ([\#1125](https://github.com/tidyverse/tidyr/issues/1125)).

- [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)’s
  `simplify` argument now accepts a named list of `TRUE` or `FALSE` to
  control simplification on a per column basis
  ([\#995](https://github.com/tidyverse/tidyr/issues/995)).

- [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)’s
  `transform` argument now accepts a single function which will be
  applied to all components
  ([\#1284](https://github.com/tidyverse/tidyr/issues/1284)).

- [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)’s
  `ptype` argument now accepts a single empty ptype which will be
  applied to all components
  ([\#1284](https://github.com/tidyverse/tidyr/issues/1284)).

### Grids

- [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  gains a new `explicit` argument for limiting `fill` to only implicit
  missing values. This is useful if you don’t want to fill in
  pre-existing missing values
  ([\#1270](https://github.com/tidyverse/tidyr/issues/1270)).

- [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  gains a grouped data frame method. This generates a more correct
  completed data frame when groups are involved
  ([\#396](https://github.com/tidyverse/tidyr/issues/396),
  [\#966](https://github.com/tidyverse/tidyr/issues/966)).

### Missing values

- [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md),
  [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md),
  and [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) have
  been updated to utilize vctrs. This means that you can use these
  functions on a wider variety of column types, including lubridate’s
  Period types
  ([\#1094](https://github.com/tidyverse/tidyr/issues/1094)), data frame
  columns, and the
  [rcrd](https://vctrs.r-lib.org/reference/new_rcrd.html) type from
  vctrs.

- [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  no longer replaces empty atomic elements in list-columns (like
  `integer(0)`). The only value that is replaced in a list-column is
  `NULL` ([\#1168](https://github.com/tidyverse/tidyr/issues/1168)).

- [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md) no
  longer drops empty atomic elements from list-columns (like
  `integer(0)`). The only value that is dropped in a list-column is
  `NULL` ([\#1228](https://github.com/tidyverse/tidyr/issues/1228)).

### Bug fixes and minor improvements

#### General

- [@mgirlich](https://github.com/mgirlich) is now a tidyr author in
  recognition of his significant and sustained contributions.

- All lazyeval variants of tidyr verbs have been soft-deprecated. Expect
  them to move to the defunct stage in the next minor release of tidyr
  ([\#1294](https://github.com/tidyverse/tidyr/issues/1294)).

- [`any_of()`](https://tidyselect.r-lib.org/reference/all_of.html) and
  [`all_of()`](https://tidyselect.r-lib.org/reference/all_of.html) from
  tidyselect are now re-exported
  ([\#1217](https://github.com/tidyverse/tidyr/issues/1217)).

- dplyr \>= 1.0.0 is now required.

#### Pivoting

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  now gives better advice about how to identify duplicates when values
  are not uniquely identified
  ([\#1113](https://github.com/tidyverse/tidyr/issues/1113)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  now throws a more informative error when `values_fn` doesn’t result in
  a single summary value
  ([\#1238](https://github.com/tidyverse/tidyr/issues/1238)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  and
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  now generate more informative errors related to name repair
  ([\#987](https://github.com/tidyverse/tidyr/issues/987)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  now works correctly when `values_fill` is a data frame.

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  no longer accidentally retains `values_from` when pivoting a zero row
  data frame ([\#1249](https://github.com/tidyverse/tidyr/issues/1249)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  now correctly handles the case where an id column name collides with a
  value from `names_from`
  ([\#1107](https://github.com/tidyverse/tidyr/issues/1107)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  and
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  now both check that the spec columns `.name` and `.value` are
  character vectors. Additionally, the `.name` column must be unique
  ([\#1107](https://github.com/tidyverse/tidyr/issues/1107)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)’s
  `names_from` and `values_from` arguments are now required if their
  default values of `name` and `value` don’t correspond to columns in
  `data`. Additionally, they must identify at least 1 column in `data`
  ([\#1240](https://github.com/tidyverse/tidyr/issues/1240)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)’s
  `values_fn` argument now correctly allows anonymous functions
  ([\#1114](https://github.com/tidyverse/tidyr/issues/1114)).

- [`pivot_wider_spec()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider_spec.md)
  now works correctly with a 0-row data frame and a `spec` that doesn’t
  identify any rows
  ([\#1250](https://github.com/tidyverse/tidyr/issues/1250),
  [\#1252](https://github.com/tidyverse/tidyr/issues/1252)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)’s
  `names_ptypes` argument is now applied after `names_transform` for
  consistency with the rectangling functions
  (i.e. [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md))
  ([\#1233](https://github.com/tidyverse/tidyr/issues/1233)).

- [`check_pivot_spec()`](https://tidyr.tidyverse.org/dev/reference/check_pivot_spec.md)
  is a new developer facing function for validating a pivot `spec`
  argument. This is only useful if you are extending
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  or
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  with new S3 methods
  ([\#1087](https://github.com/tidyverse/tidyr/issues/1087)).

#### Nesting

- The [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md)
  generic now avoids computing on `.data`, making it more compatible
  with lazy tibbles
  ([\#1134](https://github.com/tidyverse/tidyr/issues/1134)).

- The `.names_sep` argument of the data.frame method for
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) is now
  actually used
  ([\#1174](https://github.com/tidyverse/tidyr/issues/1174)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)’s
  `ptype` argument now works as expected
  ([\#1158](https://github.com/tidyverse/tidyr/issues/1158)).

- [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) no
  longer drops empty columns specified through `cols`
  ([\#1191](https://github.com/tidyverse/tidyr/issues/1191)).

- [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) now
  works correctly with data frame columns containing 1 row but 0 columns
  ([\#1189](https://github.com/tidyverse/tidyr/issues/1189)).

- [`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) now
  works correctly with data frames with 0 rows
  ([\#1206](https://github.com/tidyverse/tidyr/issues/1206)).

- [`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md)’s `cols`
  argument is no longer optional. This matches the behavior of `cols`
  seen elsewhere in tidyr
  ([\#1205](https://github.com/tidyverse/tidyr/issues/1205)).

- [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) now
  respects `ptype` when unnesting a non-list column
  ([\#1211](https://github.com/tidyverse/tidyr/issues/1211)).

#### Rectangling

- [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md) no
  longer accidentally removes elements that have duplicated names
  ([\#1259](https://github.com/tidyverse/tidyr/issues/1259)).

#### Grids

- The grouped data frame methods for
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  and [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now move the group columns to the front of the result (in addition to
  the columns you completed on or expanded, which were already moved to
  the front). This should make more intuitive sense, as you are
  completing or expanding “within” each group, so the group columns
  should be the first thing you see
  ([\#1289](https://github.com/tidyverse/tidyr/issues/1289)).

- [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  now applies `fill` even when no columns to complete are specified
  ([\#1272](https://github.com/tidyverse/tidyr/issues/1272)).

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now correctly retain `NA` values of factors
  ([\#1275](https://github.com/tidyverse/tidyr/issues/1275)).

- [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now silently apply name repair to automatically named inputs. This
  avoids a number of issues resulting from duplicate truncated names
  ([\#1116](https://github.com/tidyverse/tidyr/issues/1116),
  [\#1221](https://github.com/tidyverse/tidyr/issues/1221),
  [\#1092](https://github.com/tidyverse/tidyr/issues/1092),
  [\#1037](https://github.com/tidyverse/tidyr/issues/1037),
  [\#992](https://github.com/tidyverse/tidyr/issues/992)).

- [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now allow columns from unnamed data frames to be used in expressions
  after that data frame was specified, like
  `expand_grid(tibble(x = 1), y = x)`. This is more consistent with how
  [`tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
  behaves.

- [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now work correctly with data frames containing 0 columns but \>0 rows
  ([\#1189](https://github.com/tidyverse/tidyr/issues/1189)).

- [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now return a 1 row data frame when no inputs are supplied, which is
  more consistent with `prod() == 1L` and the idea that computations
  involving the number of combinations computed from an empty set should
  return 1 ([\#1258](https://github.com/tidyverse/tidyr/issues/1258)).

#### Missing values

- [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md) no
  longer drops missing values from all columns when a tidyselect
  expression that results in 0 columns being selected is used
  ([\#1227](https://github.com/tidyverse/tidyr/issues/1227)).

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) now
  treats `NaN` like any other missing value
  ([\#982](https://github.com/tidyverse/tidyr/issues/982)).

## tidyr 1.1.4

CRAN release: 2021-09-27

- [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md)
  is now about twice as fast and
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  is a bit faster ([@mgirlich](https://github.com/mgirlich),
  [\#1130](https://github.com/tidyverse/tidyr/issues/1130)).

- [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) is now
  much faster, which propagates through to various functions, such as
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md),
  and
  [`separate_rows()`](https://tidyr.tidyverse.org/dev/reference/separate_rows.md)
  ([@mgirlich](https://github.com/mgirlich),
  [@DavisVaughan](https://github.com/DavisVaughan),
  [\#1127](https://github.com/tidyverse/tidyr/issues/1127)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) is
  now much faster ([@mgirlich](https://github.com/mgirlich),
  [@DavisVaughan](https://github.com/DavisVaughan),
  [\#1127](https://github.com/tidyverse/tidyr/issues/1127)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) no
  longer allows unnesting a list-col containing a mix of vector and data
  frame elements. Previously, this only worked by accident, and is
  considered an off-label usage of
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) that
  has now become an error.

## tidyr 1.1.3

CRAN release: 2021-03-03

- tidyr verbs no longer have “default” methods for lazyeval fallbacks.
  This means that you’ll get clearer error messages
  ([\#1036](https://github.com/tidyverse/tidyr/issues/1036)).

- [`uncount()`](https://tidyr.tidyverse.org/dev/reference/uncount.md)
  error for non-integer weights and gives a clearer error message for
  negative weights ([@mgirlich](https://github.com/mgirlich),
  [\#1069](https://github.com/tidyverse/tidyr/issues/1069)).

- You can once again unnest dates
  ([\#1021](https://github.com/tidyverse/tidyr/issues/1021),
  [\#1089](https://github.com/tidyverse/tidyr/issues/1089)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  works with data.table and empty key variables
  ([@mgirlich](https://github.com/mgirlich),
  [\#1066](https://github.com/tidyverse/tidyr/issues/1066)).

- [`separate_rows()`](https://tidyr.tidyverse.org/dev/reference/separate_rows.md)
  works for factor columns ([@mgirlich](https://github.com/mgirlich),
  [\#1058](https://github.com/tidyverse/tidyr/issues/1058)).

## tidyr 1.1.2

CRAN release: 2020-08-27

- [`separate_rows()`](https://tidyr.tidyverse.org/dev/reference/separate_rows.md)
  returns to 1.1.0 behaviour for empty strings
  ([@rjpatm](https://github.com/rjpatm),
  [\#1014](https://github.com/tidyverse/tidyr/issues/1014)).

## tidyr 1.1.1

CRAN release: 2020-07-31

- New tidyr logo!

- stringi dependency has been removed; this was a substantial dependency
  that make tidyr hard to compile in resource constrained environments
  ([@rjpat](https://github.com/rjpat),
  [\#936](https://github.com/tidyverse/tidyr/issues/936)).

- Replace Rcpp with cpp11. See
  <https://cpp11.r-lib.org/articles/motivations.html> for reasons why.

## tidyr 1.1.0

CRAN release: 2020-05-20

### General features

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md),
  [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md),
  and
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  gain new `transform` arguments; these allow you to transform values
  “in flight”. They are partly needed because vctrs coercion rules have
  become stricter, but they give you greater flexibility than was
  available previously
  ([\#921](https://github.com/tidyverse/tidyr/issues/921)).

- Arguments that use tidy selection syntax are now clearly documented
  and have been updated to use tidyselect 1.1.0
  ([\#872](https://github.com/tidyverse/tidyr/issues/872)).

### Pivoting improvements

- Both
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  and
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  are considerably more performant, thanks largely to improvements in
  the underlying vctrs code
  ([\#790](https://github.com/tidyverse/tidyr/issues/790),
  [@DavisVaughan](https://github.com/DavisVaughan)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  now supports `names_to = character()` which prevents the name column
  from being created
  ([\#961](https://github.com/tidyverse/tidyr/issues/961)).

  `{r} df <- tibble(id = 1:3, x_1 = 1:3, x_2 = 4:6) df %>% pivot_longer(-id, names_to = character())`

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  no longer creates a `.copy` variable in the presence of duplicate
  column names. This makes it more consistent with the handling of
  non-unique specs.

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  automatically disambiguates non-unique ouputs, which can occur when
  the input variables include some additional component that you don’t
  care about and want to discard
  ([\#792](https://github.com/tidyverse/tidyr/issues/792),
  [\#793](https://github.com/tidyverse/tidyr/issues/793)).

  `{r} df <- tibble(id = 1:3, x_1 = 1:3, x_2 = 4:6) df %>% pivot_longer(-id, names_pattern = "(.)_.") df %>% pivot_longer(-id, names_sep = "_", names_to = c("name", NA)) df %>% pivot_longer(-id, names_sep = "_", names_to = c(".value", NA))`

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  gains a `names_sort` argument which allows you to sort column names in
  order. The default, `FALSE`, orders columns by their first appearance
  ([\#839](https://github.com/tidyverse/tidyr/issues/839)). In a future
  version, I’ll consider changing the default to `TRUE`.

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  gains a `names_glue` argument that allows you to construct output
  column names with a glue specification.

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  arguments `values_fn` and `values_fill` can now be single values; you
  now only need to use a named list if you want to use different values
  for different value columns
  ([\#739](https://github.com/tidyverse/tidyr/issues/739),
  [\#746](https://github.com/tidyverse/tidyr/issues/746)). They also get
  improved errors if they’re not of the expected type.

### Rectangling

- [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md) now
  automatically names pluckers that are a single string
  ([\#837](https://github.com/tidyverse/tidyr/issues/837)). It error if
  you use duplicated column names
  ([@mgirlich](https://github.com/mgirlich),
  [\#834](https://github.com/tidyverse/tidyr/issues/834)), and now uses
  [`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html)
  behind the scenes (which means that you can now use `!!!` and `:=`)
  ([\#801](https://github.com/tidyverse/tidyr/issues/801)).

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md),
  and [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md) do
  a better job simplifying list-cols. They no longer add unneeded
  `unspecified()` when the result is still a list
  ([\#806](https://github.com/tidyverse/tidyr/issues/806)), and work
  when the list contains non-vectors
  ([\#810](https://github.com/tidyverse/tidyr/issues/810),
  [\#848](https://github.com/tidyverse/tidyr/issues/848)).

- `unnest_wider(names_sep = "")` now provides default names for unnamed
  inputs, suppressing the many previous name repair messages
  ([\#742](https://github.com/tidyverse/tidyr/issues/742)).

### Nesting

- [`pack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) and
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) gains a
  `.names_sep` argument allows you to strip outer names from inner
  names, in symmetrical way to how the same argument to
  [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) and
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  combines inner and outer names
  ([\#795](https://github.com/tidyverse/tidyr/issues/795),
  [\#797](https://github.com/tidyverse/tidyr/issues/797)).

- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  and
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  can now unnest `list_of` columns. This is important for unnesting
  columns created from
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and with
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md),
  which will create `list_of` columns if the id columns are non-unique
  ([\#741](https://github.com/tidyverse/tidyr/issues/741)).

### Bug fixes and minor improvements

- [`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) now
  creates list-columns of class
  [`vctrs::list_of()`](https://vctrs.r-lib.org/reference/list_of.html).
  This helps keep track of the type in case the chopped data frame is
  empty, allowing
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) to
  reconstitute a data frame with the correct number and types of column
  even when there are no observations.

- [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md)
  now preserves attributes of unclassed vectors
  ([\#905](https://github.com/tidyverse/tidyr/issues/905)).

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  once again evaluate their inputs iteratively, so you can refer to
  freshly created columns, e.g. `crossing(x = seq(-2, 2), y = x)`
  ([\#820](https://github.com/tidyverse/tidyr/issues/820)).

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  gain a `.name_repair` giving you control over their name repair
  strategy ([@jeffreypullin](https://github.com/jeffreypullin),
  [\#798](https://github.com/tidyverse/tidyr/issues/798)).

- [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  lets you use `NA` in `into`, as documented
  ([\#793](https://github.com/tidyverse/tidyr/issues/793)).

- [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md),
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md),
  [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  and
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  give a better error message if `col` is missing
  ([\#805](https://github.com/tidyverse/tidyr/issues/805)).

- [`pack()`](https://tidyr.tidyverse.org/dev/reference/pack.md)’s first
  argument is now `.data` instead of `data`
  ([\#759](https://github.com/tidyverse/tidyr/issues/759)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  now errors if `values_to` is not a length-1 character vector
  ([\#949](https://github.com/tidyverse/tidyr/issues/949)).

- [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  and
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  are now generic so implementations can be provided for objects other
  than data frames
  ([\#800](https://github.com/tidyverse/tidyr/issues/800)).

- [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
  can now pivot data frame columns
  ([\#926](https://github.com/tidyverse/tidyr/issues/926))

- `unite(na.rm = TRUE)` now works for all types of variable, not just
  character vectors
  ([\#765](https://github.com/tidyverse/tidyr/issues/765)).

- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  gives a better error message if you attempt to unnest multiple columns
  ([\#740](https://github.com/tidyverse/tidyr/issues/740)).

- [`unnest_auto()`](https://tidyr.tidyverse.org/dev/reference/unnest_auto.md)
  works when the input data contains a column called `col`
  ([\#959](https://github.com/tidyverse/tidyr/issues/959)).

## tidyr 1.0.2

CRAN release: 2020-01-24

- Minor fixes for dev versions of rlang, tidyselect, and tibble.

## tidyr 1.0.1

- Did not exist since I accidentally released v1.0.2

## tidyr 1.0.0

CRAN release: 2019-09-11

### Breaking changes

See
[`vignette("in-packages")`](https://tidyr.tidyverse.org/dev/articles/in-packages.md)
for a detailed transition guide.

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) have
  new syntax. The majority of existing usage should be automatically
  translated to the new syntax with a warning. If that doesn’t work, put
  this in your script to use the old versions until you can take a
  closer look and update your code:

  ``` r
  library(tidyr)
  nest <- nest_legacy
  unnest <- unnest_legacy
  ```

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) now
  preserves grouping, which has implications for downstream calls to
  group-aware functions, such as
  [`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
  and [`filter()`](https://dplyr.tidyverse.org/reference/filter.html).

- The first argument of
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) has
  changed from `data` to `.data`.

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) uses
  the [emerging tidyverse
  standard](https://tidyverse.org/blog/2019/01/tibble-2.0.1/) to
  disambiguate unique names. Use `names_repair = tidyr_legacy` to
  request the previous approach.

- [`unnest_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md)/[`nest_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md)
  and the lazyeval methods for
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)/[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md)
  are now defunct. They have been deprecated for some time, and, since
  the interface has changed, package authors will need to update to
  avoid deprecation warnings. I think one clean break should be less
  work for everyone.

  All other lazyeval functions have been formally deprecated, and will
  be made defunct in the next major release. (See [lifecycle
  vignette](https://lifecycle.r-lib.org/articles/stages.html) for
  details on deprecation stages).

- [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now return 0-row outputs if any input is a length-0 vector. If you
  want to preserve the previous behaviour which silently dropped these
  inputs, you should convert empty vectors to `NULL`. (More discussion
  on this general pattern at
  <https://github.com/tidyverse/principles/issues/24>)

### Pivoting

New
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
and
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
provide modern alternatives to
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) and
[`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md). They
have been carefully redesigned to be easier to learn and remember, and
include many new features. Learn more in
[`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md).

These functions resolve multiple existing issues with
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)/[`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md).
Both functions now handle mulitple value columns
([\#149](https://github.com/tidyverse/tidyr/issues/149)/#150), support
more vector types
([\#333](https://github.com/tidyverse/tidyr/issues/333)), use tidyverse
conventions for duplicated column names
([\#496](https://github.com/tidyverse/tidyr/issues/496),
[\#478](https://github.com/tidyverse/tidyr/issues/478)), and are
symmetric ([\#453](https://github.com/tidyverse/tidyr/issues/453)).
[`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
gracefully handles duplicated column names
([\#472](https://github.com/tidyverse/tidyr/issues/472)), and can
directly split column names into multiple variables.
[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md)
can now aggregate
([\#474](https://github.com/tidyverse/tidyr/issues/474)), select keys
([\#572](https://github.com/tidyverse/tidyr/issues/572)), and has
control over generated column names
([\#208](https://github.com/tidyverse/tidyr/issues/208)).

To demonstrate how these functions work in practice, tidyr has gained
several new datasets: `relig_income`, `construction`, `billboard`,
`us_rent_income`, `fish_encounters` and `world_bank_pop`.

Finally, tidyr demos have been removed. They are dated, and have been
superseded by
[`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md).

### Rectangling

tidyr contains four new functions to support **rectangling**, turning a
deeply nested list into a tidy tibble:
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md),
[`unnest_auto()`](https://tidyr.tidyverse.org/dev/reference/unnest_auto.md),
and [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md).
They are documented in a new vignette:
[`vignette("rectangle")`](https://tidyr.tidyverse.org/dev/articles/rectangle.md).

[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
and
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
make it easier to unnest list-columns of vectors into either rows or
columns ([\#418](https://github.com/tidyverse/tidyr/issues/418)).
[`unnest_auto()`](https://tidyr.tidyverse.org/dev/reference/unnest_auto.md)
automatically picks between `_longer()` and `_wider()` using heuristics
based on the presence of common names.

New [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md)
provides a convenient way of plucking components of a list-column out
into their own top-level columns
([\#341](https://github.com/tidyverse/tidyr/issues/341)). This is
particularly useful when you are working with deeply nested JSON,
because it provides a convenient shortcut for the
[`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html) +
[`map()`](https://purrr.tidyverse.org/reference/map.html) pattern:

`{r} df %>% hoist(metadata, name = "name") # shortcut for df %>% mutate(name = map_chr(metadata, "name"))`

### Nesting

[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) have
been updated with new interfaces that are more closely aligned to
evolving tidyverse conventions. They use the theory developed in
[vctrs](https://vctrs.r-lib.org) to more consistently handle mixtures of
input types, and their arguments have been overhauled based on the last
few years of experience. They are supported by a new
[`vignette("nest")`](https://tidyr.tidyverse.org/dev/articles/nest.md),
which outlines some of the main ideas of nested data (it’s still very
rough, but will get better over time).

The biggest change is to their operation with multiple columns:
`df %>% unnest(x, y, z)` becomes `df %>% unnest(c(x, y, z))` and
`df %>% nest(x, y, z)` becomes `df %>% nest(data = c(x, y, z))`.

I have done my best to ensure that common uses of
[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) will
continue to work, generating an informative warning telling you
precisely how you need to update your code. Please [file an
issue](https://github.com/tidyverse/tidyr/issues/new) if I’ve missed an
important use case.

[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) has
been overhauled:

- New `keep_empty` parameter ensures that every row in the input gets at
  least one row in the output, inserting missing values as needed
  ([\#358](https://github.com/tidyverse/tidyr/issues/358)).

- Provides `names_sep` argument to control how inner and outer column
  names are combined.

- Uses standard tidyverse name-repair rules, so by default you will get
  an error if the output would contain multiple columns with the same
  name. You can override by using `name_repair`
  ([\#514](https://github.com/tidyverse/tidyr/issues/514)).

- Now supports `NULL` entries
  ([\#436](https://github.com/tidyverse/tidyr/issues/436)).

### Packing and chopping

Under the hood,
[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) are
implemented with
[`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md),
[`pack()`](https://tidyr.tidyverse.org/dev/reference/pack.md),
[`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md), and
[`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md):

- [`pack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) and
  [`unpack()`](https://tidyr.tidyverse.org/dev/reference/pack.md) allow
  you to pack and unpack columns into data frame columns
  ([\#523](https://github.com/tidyverse/tidyr/issues/523)).

- [`chop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) and
  [`unchop()`](https://tidyr.tidyverse.org/dev/reference/chop.md) chop
  up rows into sets of list-columns.

Packing and chopping are interesting primarily because they are the
atomic operations underlying nesting (and similarly, unchop and
unpacking underlie unnesting), and I don’t expect them to be used
directly very often.

### New features

- New
  [`expand_grid()`](https://tidyr.tidyverse.org/dev/reference/expand_grid.md),
  a tidy version of
  [`expand.grid()`](https://rdrr.io/r/base/expand.grid.html), is
  lower-level than the existing
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) and
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  functions, as it takes individual vectors, and does not sort or
  uniquify them.

- [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  have been rewritten to use the vctrs package. This should not affect
  much existing code, but considerably simplifies the implementation and
  ensures that these functions work consistently across all generalised
  vectors ([\#557](https://github.com/tidyverse/tidyr/issues/557)). As
  part of this alignment, these functions now only drop `NULL` inputs,
  not any 0-length vector.

### Bug fixes and minor improvements

- [`full_seq()`](https://tidyr.tidyverse.org/dev/reference/full_seq.md)
  now also works when gaps between observations are shorter than the
  given `period`, but are within the tolerance given by `tol`.
  Previously, gaps between consecutive observations had to be in the
  range \[`period`, `period + tol`\]; gaps can now be in the range
  \[`period - tol`, `period + tol`\]
  ([@ha0ye](https://github.com/ha0ye),
  [\#657](https://github.com/tidyverse/tidyr/issues/657)).

- tidyr now re-exports
  [`tibble()`](https://tibble.tidyverse.org/reference/tibble.html),
  [`as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.html),
  and
  [`tribble()`](https://tibble.tidyverse.org/reference/tribble.html), as
  well as the tidyselect helpers
  ([`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  …). This makes generating documentation, reprexes, and tests easier,
  and makes tidyr easier to use without also attaching dplyr.

- All functions that take `...` have been instrumented with functions
  from the [ellipsis](https://github.com/r-lib/ellipsis/) package to
  warn if you’ve supplied arguments that are ignored (typically because
  you’ve misspelled an argument name)
  ([\#573](https://github.com/tidyverse/tidyr/issues/573)).

- [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  now uses
  [`full_join()`](https://dplyr.tidyverse.org/reference/mutate-joins.html)
  so that all levels are preserved even when not all levels are
  specified ([@Ryo-N7](https://github.com/Ryo-N7),
  [\#493](https://github.com/tidyverse/tidyr/issues/493)).

- [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now takes the unique values of data frame inputs, not just vector
  inputs ([\#490](https://github.com/tidyverse/tidyr/issues/490)).

- [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md)
  throws an error if a column is a data frame
  ([\#553](https://github.com/tidyverse/tidyr/issues/553)).

- [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  (and hence
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md))
  can extract multiple input values into a single output column
  ([\#619](https://github.com/tidyverse/tidyr/issues/619)).

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) is now
  implemented using
  [`dplyr::mutate_at()`](https://dplyr.tidyverse.org/reference/mutate_all.html).
  This radically simplifies the implementation and considerably improves
  performance when working with grouped data
  ([\#520](https://github.com/tidyverse/tidyr/issues/520)).

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) now
  accepts `downup` and `updown` as fill directions
  ([@coolbutuseless](https://github.com/coolbutuseless),
  [\#505](https://github.com/tidyverse/tidyr/issues/505)).

- [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md) gains
  `na.rm` argument, making it easier to remove missing values prior to
  uniting values together
  ([\#203](https://github.com/tidyverse/tidyr/issues/203))

## tidyr 0.8.3

CRAN release: 2019-03-01

- [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  preserves factor levels
  ([\#410](https://github.com/tidyverse/tidyr/issues/410)), now works
  with list-columns
  ([\#446](https://github.com/tidyverse/tidyr/issues/446),
  [@SamanthaToet](https://github.com/SamanthaToet)). (These also help
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  which is built on top of
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md))

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) is
  compatible with dplyr 0.8.0.

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)
  works when the id variable has names
  ([\#525](https://github.com/tidyverse/tidyr/issues/525)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  preserves column being unnested when input is zero-length
  ([\#483](https://github.com/tidyverse/tidyr/issues/483)), using
  `list_of()` attribute to correctly restore columns, where possible.

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) will
  run with named and unnamed list-columns of same length
  ([@hlendway](https://github.com/hlendway),
  [\#460](https://github.com/tidyverse/tidyr/issues/460)).

## tidyr 0.8.2

CRAN release: 2018-10-28

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  now accepts `NA` as a column name in the `into` argument to denote
  columns which are omitted from the result.
  ([@markdly](https://github.com/markdly),
  [\#397](https://github.com/tidyverse/tidyr/issues/397)).

- Minor updates to ensure compatibility with dependencies.

## tidyr 0.8.1

CRAN release: 2018-05-18

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  weakens test of “atomicity” to restore previous behaviour when
  unnesting factors and dates
  ([\#407](https://github.com/tidyverse/tidyr/issues/407)).

## tidyr 0.8.0

CRAN release: 2018-01-29

### Breaking changes

- There are no deliberate breaking changes in this release. However, a
  number of packages are failing with errors related to numbers of
  elements in columns, and row names. It is possible that these are
  accidental API changes or new bugs. If you see such an error in your
  package, I would sincerely appreciate a minimal reprex.

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  now correctly uses -1 to refer to the far right position, instead of
  -2. If you depended on this behaviour, you’ll need to switch on
  `packageVersion("tidyr") > "0.7.2"`

### New features

- Increased test coverage from 84% to 99%.

- [`uncount()`](https://tidyr.tidyverse.org/dev/reference/uncount.md)
  performs the inverse operation of
  [`dplyr::count()`](https://dplyr.tidyverse.org/reference/count.html)
  ([\#279](https://github.com/tidyverse/tidyr/issues/279))

### Bug fixes and minor improvements

- `complete(data)` now returns `data` rather than throwing an error
  ([\#390](https://github.com/tidyverse/tidyr/issues/390)).
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  with zero-length completions returns original input
  ([\#331](https://github.com/tidyverse/tidyr/issues/331)).

- [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  preserves `NA`s
  ([\#364](https://github.com/tidyverse/tidyr/issues/364)).

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) with
  empty input gives empty data frame instead of `NULL`
  ([\#331](https://github.com/tidyverse/tidyr/issues/331)).

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  now complete empty factors instead of dropping them
  ([\#270](https://github.com/tidyverse/tidyr/issues/270),
  [\#285](https://github.com/tidyverse/tidyr/issues/285))

- [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  has a better error message if `regex` does not contain the expected
  number of groups
  ([\#313](https://github.com/tidyverse/tidyr/issues/313)).

- [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md) no
  longer drops columns ([@jennybryan](https://github.com/jennybryan),
  [\#245](https://github.com/tidyverse/tidyr/issues/245)), and works
  with list-cols
  ([\#280](https://github.com/tidyverse/tidyr/issues/280)). Equivalent
  of `NA` in a list column is any empty (length 0) data structure.

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) is now
  faster, especially when a long data frame is collapsed into a nested
  data frame with few rows.

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) on a
  zero-row data frame works as expected
  ([\#320](https://github.com/tidyverse/tidyr/issues/320)).

- [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  no longer complains if you try and replace missing values in variables
  not present in the data
  ([\#356](https://github.com/tidyverse/tidyr/issues/356)).

- [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  now also works with vectors
  ([\#342](https://github.com/tidyverse/tidyr/issues/342),
  [@flying-sheep](https://github.com/flying-sheep)), and can replace
  `NULL` in list-columns. It throws a better error message if you
  attempt to replace with something other than length 1.

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  no longer checks that `...` is empty, allowing methods to make use of
  it. This check was added in tidyr 0.4.0 (2016-02-02) to deprecate
  previous behaviour where `...` was passed to
  [`strsplit()`](https://rdrr.io/r/base/strsplit.html).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  and
  [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  now insert columns in correct position when `drop = TRUE`
  ([\#394](https://github.com/tidyverse/tidyr/issues/394)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  now works correctly counts from RHS when using negative integer `sep`
  values ([@markdly](https://github.com/markdly),
  [\#315](https://github.com/tidyverse/tidyr/issues/315)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  gets improved warning message when pieces aren’t as expected
  ([\#375](https://github.com/tidyverse/tidyr/issues/375)).

- [`separate_rows()`](https://tidyr.tidyverse.org/dev/reference/separate_rows.md)
  supports list columns
  ([\#321](https://github.com/tidyverse/tidyr/issues/321)), and works
  with empty tibbles.

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) now
  consistently returns 0 row outputs for 0 row inputs
  ([\#269](https://github.com/tidyverse/tidyr/issues/269)).

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) now
  works when `key` column includes `NA` and `drop` is `FALSE`
  ([\#254](https://github.com/tidyverse/tidyr/issues/254)).

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) no
  longer returns tibbles with row names
  ([\#322](https://github.com/tidyverse/tidyr/issues/322)).

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md),
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md),
  [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  ([\#255](https://github.com/tidyverse/tidyr/issues/255)), and
  [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md)
  ([\#347](https://github.com/tidyverse/tidyr/issues/347)) now replace
  existing variables rather than creating an invalid data frame with
  duplicated variable names (matching the semantics of mutate).

- [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md) now
  works (as documented) if you don’t supply any variables
  ([\#355](https://github.com/tidyverse/tidyr/issues/355)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  gains `preserve` argument which allows you to preserve list columns
  without unnesting them
  ([\#328](https://github.com/tidyverse/tidyr/issues/328)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) can
  unnested list-columns contains lists of lists
  ([\#278](https://github.com/tidyverse/tidyr/issues/278)).

- `unnest(df)` now works if `df` contains no list-cols
  ([\#344](https://github.com/tidyverse/tidyr/issues/344))

## tidyr 0.7.2

CRAN release: 2017-10-16

- The SE variants
  [`gather_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md),
  [`spread_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md)
  and
  [`nest_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md)
  now treat non-syntactic names in the same way as pre tidy eval
  versions of tidyr
  ([\#361](https://github.com/tidyverse/tidyr/issues/361)).

- Fix tidyr bug revealed by R-devel.

## tidyr 0.7.1

CRAN release: 2017-09-01

This is a hotfix release to account for some tidyselect changes in the
unit tests.

Note that the upcoming version of tidyselect backtracks on some of the
changes announced for 0.7.0. The special evaluation semantics for
selection have been changed back to the old behaviour because the new
rules were causing too much trouble and confusion. From now on data
expressions (symbols and calls to `:` and
[`c()`](https://rdrr.io/r/base/c.html)) can refer to both registered
variables and to objects from the context.

However the semantics for context expressions (any calls other than to
`:` and [`c()`](https://rdrr.io/r/base/c.html)) remain the same. Those
expressions are evaluated in the context only and cannot refer to
registered variables. If you’re writing functions and refer to
contextual objects, it is still a good idea to avoid data expressions by
following the advice of the 0.7.0 release notes.

## tidyr 0.7.0

CRAN release: 2017-08-16

This release includes important changes to tidyr internals. Tidyr now
supports the new tidy evaluation framework for quoting (NSE) functions.
It also uses the new tidyselect package as selecting backend.

### Breaking changes

- If you see error messages about objects or functions not found, it is
  likely because the selecting functions are now stricter in their
  arguments An example of selecting function is
  [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) and
  its `...` argument. This change makes the code more robust by
  disallowing ambiguous scoping. Consider the following code:

      x <- 3
      df <- tibble(w = 1, x = 2, y = 3)
      gather(df, "variable", "value", 1:x)

  Does it select the first three columns (using the `x` defined in the
  global environment), or does it select the first two columns (using
  the column named `x`)?

  To solve this ambiguity, we now make a strict distinction between data
  and context expressions. A data expression is either a bare name or an
  expression like `x:y` or `c(x, y)`. In a data expression, you can only
  refer to columns from the data frame. Everything else is a context
  expression in which you can only refer to objects that you have
  defined with `<-`.

  In practice this means that you can no longer refer to contextual
  objects like this:

      mtcars %>% gather(var, value, 1:ncol(mtcars))

      x <- 3
      mtcars %>% gather(var, value, 1:x)
      mtcars %>% gather(var, value, -(1:x))

  You now have to be explicit about where to find objects. To do so, you
  can use the quasiquotation operator `!!` which will evaluate its
  argument early and inline the result:

  `{r} mtcars %>% gather(var, value, !! 1:ncol(mtcars)) mtcars %>% gather(var, value, !! 1:x) mtcars %>% gather(var, value, !! -(1:x))`

  An alternative is to turn your data expression into a context
  expression by using [`seq()`](https://rdrr.io/r/base/seq.html) or
  [`seq_len()`](https://rdrr.io/r/base/seq.html) instead of `:`. See the
  section on tidyselect for more information about these semantics.

- Following the switch to tidy evaluation, you might see warnings about
  the “variable context not set”. This is most likely caused by
  supplying helpers like
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  to underscored versions of tidyr verbs. Helpers should be always be
  evaluated lazily. To fix this, just quote the helper with a formula:
  `drop_na(df, ~everything())`.

- The selecting functions are now stricter when you supply integer
  positions. If you see an error along the lines of

      `-0.949999999999999`, `-0.940000000000001`, ... must resolve to
      integer column positions, not a double vector

  please round the positions before supplying them to tidyr. Double
  vectors are fine as long as they are rounded.

### Switch to tidy evaluation

tidyr is now a tidy evaluation grammar. See the [programming
vignette](https://dplyr.tidyverse.org/articles/programming.html) in
dplyr for practical information about tidy evaluation.

The tidyr port is a bit special. While the philosophy of tidy evaluation
is that R code should refer to real objects (from the data frame or from
the context), we had to make some exceptions to this rule for tidyr. The
reason is that several functions accept bare symbols to specify the
names of *new* columns to create
([`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) being
a prime example). This is not tidy because the symbol do not represent
any actual object. Our workaround is to capture these arguments using
[`rlang::quo_name()`](https://rlang.r-lib.org/reference/quo_label.html)
(so they still support quasiquotation and you can unquote symbols or
strings). This type of NSE is now discouraged in the tidyverse: symbols
in R code should represent real objects.

Following the switch to tidy eval the underscored variants are softly
deprecated. However they will remain around for some time and without
warning for backward compatibility.

### Switch to the tidyselect backend

The selecting backend of dplyr has been extracted in a standalone
package tidyselect which tidyr now uses for selecting variables. It is
used for selecting multiple variables (in
[`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md)) as
well as single variables (the `col` argument of
[`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md) and
[`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md),
and the `key` and `value` arguments of
[`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)). This
implies the following changes:

- The arguments for selecting a single variable now support all features
  from
  [`dplyr::pull()`](https://dplyr.tidyverse.org/reference/pull.html).
  You can supply a name or a position, including negative positions.

- Multiple variables are now selected a bit differently. We now make a
  strict distinction between data and context expressions. A data
  expression is either a bare name of an expression like `x:y` or
  `c(x, y)`. In a data expression, you can only refer to columns from
  the data frame. Everything else is a context expression in which you
  can only refer to objects that you have defined with `<-`.

  You can still refer to contextual objects in a data expression by
  being explicit. One way of being explicit is to unquote a variable
  from the environment with the tidy eval operator `!!`:

  ``` r
  x <- 2
  drop_na(df, 2)     # Works fine
  drop_na(df, x)     # Object 'x' not found
  drop_na(df, !! x)  # Works as if you had supplied 2
  ```

  On the other hand, select helpers like `start_with()` are context
  expressions. It is therefore easy to refer to objects and they will
  never be ambiguous with data columns:

  `{r} x <- "d" drop_na(df, starts_with(x))`

  While these special rules is in contrast to most dplyr and tidyr verbs
  (where both the data and the context are in scope) they make sense for
  selecting functions and should provide more robust and helpful
  semantics.

## tidyr 0.6.3

CRAN release: 2017-05-15

- Patch tests to be compatible with dev tibble

## tidyr 0.6.2

CRAN release: 2017-05-04

- Register C functions

- Added package docs

- Patch tests to be compatible with dev dplyr.

## tidyr 0.6.1

CRAN release: 2017-01-10

- Patch test to be compatible with dev tibble

- Changed deprecation message of
  [`extract_numeric()`](https://tidyr.tidyverse.org/dev/reference/extract_numeric.md)
  to point to
  [`readr::parse_number()`](https://readr.tidyverse.org/reference/parse_number.html)
  rather than `readr::parse_numeric()`

## tidyr 0.6.0

CRAN release: 2016-08-12

### API changes

- [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md)
  removes observations which have `NA` in the given variables. If no
  variables are given, all variables are considered
  ([\#194](https://github.com/tidyverse/tidyr/issues/194),
  [@janschulz](https://github.com/janschulz)).

- [`extract_numeric()`](https://tidyr.tidyverse.org/dev/reference/extract_numeric.md)
  has been deprecated
  ([\#213](https://github.com/tidyverse/tidyr/issues/213)).

- Renamed `table4` and `table5` to `table4a` and `table4b` to make their
  connection more clear. The `key` and `value` variables in `table2`
  have been renamed to `type` and `count`.

### Bug fixes and minor improvements

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  now silently drop zero-length inputs.

- [`crossing_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md)
  and
  [`nesting_()`](https://tidyr.tidyverse.org/dev/reference/deprecated-se.md)
  are versions of
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  that take a list as input.

- [`full_seq()`](https://tidyr.tidyverse.org/dev/reference/full_seq.md)
  works correctly for dates and date/times.

## tidyr 0.5.1

CRAN release: 2016-06-14

- Restored compatibility with R \< 3.3.0 by avoiding
  `getS3method(envir = )`
  ([\#205](https://github.com/tidyverse/tidyr/issues/205),
  [@krlmlr](https://github.com/krlmlr)).

## tidyr 0.5.0

CRAN release: 2016-06-12

### New functions

- [`separate_rows()`](https://tidyr.tidyverse.org/dev/reference/separate_rows.md)
  separates observations with multiple delimited values into separate
  rows ([\#69](https://github.com/tidyverse/tidyr/issues/69),
  [@aaronwolen](https://github.com/aaronwolen)).

### Bug fixes and minor improvements

- [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  preserves grouping created by dplyr
  ([\#168](https://github.com/tidyverse/tidyr/issues/168)).

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) (and
  hence
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md))
  preserves the ordered attribute of factors
  ([\#165](https://github.com/tidyverse/tidyr/issues/165)).

- [`full_seq()`](https://tidyr.tidyverse.org/dev/reference/full_seq.md)
  preserve attributes for dates and date/times
  ([\#156](https://github.com/tidyverse/tidyr/issues/156)), and
  sequences no longer need to start at 0.

- [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) can
  now gather together list columns
  ([\#175](https://github.com/tidyverse/tidyr/issues/175)), and
  `gather_.data.frame(na.rm = TRUE)` now only removes missing values if
  they’re actually present
  ([\#173](https://github.com/tidyverse/tidyr/issues/173)).

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) returns
  correct output if every variable is nested
  ([\#186](https://github.com/tidyverse/tidyr/issues/186)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  fills from right-to-left (not left-to-right!) when fill = “left”
  ([\#170](https://github.com/tidyverse/tidyr/issues/170),
  [@dgrtwo](https://github.com/dgrtwo)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  and [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md)
  now automatically drop removed variables from grouping
  ([\#159](https://github.com/tidyverse/tidyr/issues/159),
  [\#177](https://github.com/tidyverse/tidyr/issues/177)).

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)
  gains a `sep` argument. If not-null, this will name columns as
  “keyvalue”. Additionally, if sep is `NULL` missing values will be
  converted to `<NA>`
  ([\#68](https://github.com/tidyverse/tidyr/issues/68)).

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)
  works in the presence of list-columns
  ([\#199](https://github.com/tidyverse/tidyr/issues/199))

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  works with non-syntactic names
  ([\#190](https://github.com/tidyverse/tidyr/issues/190)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  gains a `sep` argument. If non-null, this will rename the columns of
  nested data frames to include both the original column name, and the
  nested column name, separated by `.sep`
  ([\#184](https://github.com/tidyverse/tidyr/issues/184)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  gains `.id` argument that works the same way as
  [`bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html).
  This is useful if you have a named list of data frames or vectors
  ([\#125](https://github.com/tidyverse/tidyr/issues/125)).

- Moved in useful sample datasets from the DSR package.

- Made compatible with both dplyr 0.4 and 0.5.

- tidyr functions that create new columns are more aggressive about
  re-encoding the column names as UTF-8.

## tidyr 0.4.1

CRAN release: 2016-02-05

- Fixed bug in
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) where
  nested data was ending up in the wrong row
  ([\#158](https://github.com/tidyverse/tidyr/issues/158)).

## tidyr 0.4.0

CRAN release: 2016-01-18

### Nested data frames

[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) and
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) have
been overhauled to support a useful way of structuring data frames: the
**nested** data frame. In a grouped data frame, you have one row per
observation, and additional metadata define the groups. In a nested data
frame, you have one **row** per group, and the individual observations
are stored in a column that is a list of data frames. This is a useful
structure when you have lists of other objects (like models) with one
element per group.

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) now
  produces a single list of data frames called “data” rather than a list
  column for each variable. Nesting variables are not included in nested
  data frames. It also works with grouped data frames made by
  [`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html).
  You can override the default column name with `.key`.

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  gains a `.drop` argument which controls what happens to other list
  columns. By default, they’re kept if the output doesn’t require row
  duplication; otherwise they’re dropped.

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) now
  has [`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
  semantics for `...` - this allows you to unnest transformed columns
  more easily. (Previously it used select semantics).

### Expanding

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) once
  again allows you to evaluate arbitrary expressions like
  `full_seq(year)`. If you were previously using
  [`c()`](https://rdrr.io/r/base/c.html) to created nested combinations,
  you’ll now need to use
  [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  ([\#85](https://github.com/tidyverse/tidyr/issues/85),
  [\#121](https://github.com/tidyverse/tidyr/issues/121)).

- [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md) and
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  allow you to create nested and crossed data frames from individual
  vectors.
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md) is
  similar to
  [`base::expand.grid()`](https://rdrr.io/r/base/expand.grid.html)

- `full_seq(x, period)` creates the full sequence of values from
  `min(x)` to `max(x)` every `period` values.

### Minor bug fixes and improvements

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) fills in
  `NULL`s in list-columns.

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) gains a
  direction argument so that it can fill either upwards or downwards
  ([\#114](https://github.com/tidyverse/tidyr/issues/114)).

- [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) now
  stores the key column as character, by default. To revert to the
  previous behaviour of using a factor (which allows you to preserve the
  ordering of the columns), use `key_factor = TRUE`
  ([\#96](https://github.com/tidyverse/tidyr/issues/96)).

- All tidyr verbs do the right thing for grouped data frames created by
  [`group_by()`](https://dplyr.tidyverse.org/reference/group_by.html)
  ([\#122](https://github.com/tidyverse/tidyr/issues/122),
  [\#129](https://github.com/tidyverse/tidyr/issues/129),
  [\#81](https://github.com/tidyverse/tidyr/issues/81)).

- `seq_range()` has been removed. It was never used or announced.

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) once
  again creates columns of mixed type when `convert = TRUE`
  ([\#118](https://github.com/tidyverse/tidyr/issues/118),
  [@jennybc](https://github.com/jennybc)).
  [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) with
  `drop = FALSE` handles zero-length factors
  ([\#56](https://github.com/tidyverse/tidyr/issues/56)).
  [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)ing a
  data frame with only key and value columns creates a one row output
  ([\#41](https://github.com/tidyverse/tidyr/issues/41)).

- [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md) now
  removes old columns before adding new
  ([\#89](https://github.com/tidyverse/tidyr/issues/89),
  [@krlmlr](https://github.com/krlmlr)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  now warns if defunct … argument is used
  ([\#151](https://github.com/tidyverse/tidyr/issues/151),
  [@krlmlr](https://github.com/krlmlr)).

## tidyr 0.3.1

CRAN release: 2015-09-10

- Fixed bug where attributes of non-gather columns were lost
  ([\#104](https://github.com/tidyverse/tidyr/issues/104))

## tidyr 0.3.0

CRAN release: 2015-09-08

### New features

- New
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md)
  provides a wrapper around
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`left_join()`](https://dplyr.tidyverse.org/reference/mutate-joins.html)
  and
  [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  for a common task: completing a data frame with missing combinations
  of variables.

- [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md) fills in
  missing values in a column with the last non-missing value
  ([\#4](https://github.com/tidyverse/tidyr/issues/4)).

- New
  [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md)
  makes it easy to replace missing values with something meaningful for
  your data.

- [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) is the
  complement of
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  ([\#3](https://github.com/tidyverse/tidyr/issues/3)).

- [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) can
  now work with multiple list-columns at the same time. If you don’t
  supply any columns names, it will unlist all list-columns
  ([\#44](https://github.com/tidyverse/tidyr/issues/44)).
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md) can
  also handle columns that are lists of data frames
  ([\#58](https://github.com/tidyverse/tidyr/issues/58)).

### Bug fixes and minor improvements

- tidyr no longer depends on reshape2. This should fix issues if you
  also try to load reshape
  ([\#88](https://github.com/tidyverse/tidyr/issues/88)).

- `%>%` is re-exported from magrittr.

- [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md) now
  supports nesting and crossing (see examples for details). This comes
  at the expense of creating new variables inline
  ([\#46](https://github.com/tidyverse/tidyr/issues/46)).

- `expand_` does SE evaluation correctly so you can pass it a character
  vector of columns names (or list of formulas etc)
  ([\#70](https://github.com/tidyverse/tidyr/issues/70)).

- [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md) is
  10x faster because it now uses stringi instead of base R regular
  expressions. It also returns NA instead of throwing an error if the
  regular expression doesn’t match
  ([\#72](https://github.com/tidyverse/tidyr/issues/72)).

- [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  and
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  preserve character vectors when `convert` is TRUE
  ([\#99](https://github.com/tidyverse/tidyr/issues/99)).

- The internals of
  [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) have
  been rewritten, and now preserve all attributes of the input `value`
  column. This means that you can now spread date
  ([\#62](https://github.com/tidyverse/tidyr/issues/62)) and factor
  ([\#35](https://github.com/tidyverse/tidyr/issues/35)) inputs.

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)
  gives a more informative error message if `key` or `value` don’t exist
  in the input data
  ([\#36](https://github.com/tidyverse/tidyr/issues/36)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  only displays the first 20 failures
  ([\#50](https://github.com/tidyverse/tidyr/issues/50)). It has finer
  control over what happens if there are two few matches: you can fill
  with missing values on either the “left” or the “right”
  ([\#49](https://github.com/tidyverse/tidyr/issues/49)).
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  no longer throws an error if the number of pieces aren’t as expected -
  instead it uses drops extra values and fills on the right and gives a
  warning.

- If the input is NA
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  and
  [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md)
  both return silently return NA outputs, rather than throwing an error.
  ([\#77](https://github.com/tidyverse/tidyr/issues/77))

- Experimental
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  method for lists has been removed.

## tidyr 0.2.0

CRAN release: 2014-12-05

### New functions

- Experimental
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  function ([\#21](https://github.com/tidyverse/tidyr/issues/21)).

- Experiment
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)
  function for converting named lists into data frames.
  ([\#3](https://github.com/tidyverse/tidyr/issues/3),
  [\#22](https://github.com/tidyverse/tidyr/issues/22))

### Bug fixes and minor improvements

- [`extract_numeric()`](https://tidyr.tidyverse.org/dev/reference/extract_numeric.md)
  preserves negative signs
  ([\#20](https://github.com/tidyverse/tidyr/issues/20)).

- [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md) has
  better defaults if `key` and `value` are not supplied. If `...` is
  omitted,
  [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md)
  selects all columns
  ([\#28](https://github.com/tidyverse/tidyr/issues/28)). Performance is
  now comparable to `reshape2::melt()`
  ([\#18](https://github.com/tidyverse/tidyr/issues/18)).

- [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
  gains `extra` argument which lets you control what happens to extra
  pieces. The default is to throw an “error”, but you can also “merge”
  or “drop”.

- [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md)
  gains `drop` argument, which allows you to preserve missing factor
  levels ([\#25](https://github.com/tidyverse/tidyr/issues/25)). It
  converts factor value variables to character vectors, instead of
  embedding a matrix inside the data frame
  ([\#35](https://github.com/tidyverse/tidyr/issues/35)).
