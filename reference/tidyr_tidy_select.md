# Argument type: tidy-select

This page describes the `<tidy-select>` argument modifier which
indicates that the argument uses **tidy selection**, a sub-type of tidy
evaluation. If you've never heard of tidy evaluation before, start with
the practical introduction in
<https://r4ds.hadley.nz/functions.html#data-frame-functions> then then
read more about the underlying theory in
<https://rlang.r-lib.org/reference/topic-data-mask.html>.

## Overview of selection features

tidyselect implements a DSL for selecting variables. It provides helpers
for selecting variables:

- `var1:var10`: variables lying between `var1` on the left and `var10`
  on the right.

&nbsp;

- [`starts_with("a")`](https://tidyselect.r-lib.org/reference/starts_with.html):
  names that start with `"a"`.

- [`ends_with("z")`](https://tidyselect.r-lib.org/reference/starts_with.html):
  names that end with `"z"`.

- [`contains("b")`](https://tidyselect.r-lib.org/reference/starts_with.html):
  names that contain `"b"`.

- [`matches("x.y")`](https://tidyselect.r-lib.org/reference/starts_with.html):
  names that match regular expression `x.y`.

- [`num_range(x, 1:4)`](https://tidyselect.r-lib.org/reference/starts_with.html):
  names following the pattern, `x1`, `x2`, ..., `x4`.

- [`all_of(vars)`](https://tidyselect.r-lib.org/reference/all_of.html)/[`any_of(vars)`](https://tidyselect.r-lib.org/reference/all_of.html):
  matches names stored in the character vector `vars`. `all_of(vars)`
  will error if the variables aren't present; `any_of(var)` will match
  just the variables that exist.

- [`everything()`](https://tidyselect.r-lib.org/reference/everything.html):
  all variables.

- [`last_col()`](https://tidyselect.r-lib.org/reference/everything.html):
  furthest column on the right.

- [`where(is.numeric)`](https://tidyselect.r-lib.org/reference/where.html):
  all variables where
  [`is.numeric()`](https://rdrr.io/r/base/numeric.html) returns `TRUE`.

As well as operators for combining those selections:

- `!selection`: only variables that don't match `selection`.

- `selection1 & selection2`: only variables included in both
  `selection1` and `selection2`.

- `selection1 | selection2`: all variables that match either
  `selection1` or `selection2`.

## Key techniques

- If you want the user to supply a tidyselect specification in a
  function argument, you need to tunnel the selection through the
  function argument. This is done by embracing the function argument
  `{{ }}`, e.g `unnest(df, {{ vars }})`.

- If you have a character vector of column names, use
  [`all_of()`](https://tidyselect.r-lib.org/reference/all_of.html) or
  [`any_of()`](https://tidyselect.r-lib.org/reference/all_of.html),
  depending on whether or not you want unknown variable names to cause
  an error, e.g `unnest(df, all_of(vars))`, `unnest(df, !any_of(vars))`.

- To suppress `R CMD check` `NOTE`s about unknown variables use `"var"`
  instead of `var`:

    # has NOTE
    df |> select(x, y, z)

    # no NOTE
    df |> select("x", "y", "z")
