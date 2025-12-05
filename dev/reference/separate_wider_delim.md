# Split a string into columns

**\[experimental\]**

Each of these functions takes a string column and splits it into
multiple new columns:

- `separate_wider_delim()` splits by delimiter.

- `separate_wider_position()` splits at fixed widths.

- `separate_wider_regex()` splits with regular expression matches.

These functions are equivalent to
[`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)
and [`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md),
but use [stringr](https://stringr.tidyverse.org/) as the underlying
string manipulation engine, and their interfaces reflect what we've
learned from
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
and
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md).

## Usage

``` r
separate_wider_delim(
  data,
  cols,
  delim,
  ...,
  names = NULL,
  names_sep = NULL,
  names_repair = "check_unique",
  too_few = c("error", "debug", "align_start", "align_end"),
  too_many = c("error", "debug", "drop", "merge"),
  cols_remove = TRUE
)

separate_wider_position(
  data,
  cols,
  widths,
  ...,
  names_sep = NULL,
  names_repair = "check_unique",
  too_few = c("error", "debug", "align_start"),
  too_many = c("error", "debug", "drop"),
  cols_remove = TRUE
)

separate_wider_regex(
  data,
  cols,
  patterns,
  ...,
  names_sep = NULL,
  names_repair = "check_unique",
  too_few = c("error", "debug", "align_start"),
  cols_remove = TRUE
)
```

## Arguments

- data:

  A data frame.

- cols:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  Columns to separate.

- delim:

  For `separate_wider_delim()`, a string giving the delimiter between
  values. By default, it is interpreted as a fixed string; use
  [`stringr::regex()`](https://stringr.tidyverse.org/reference/modifiers.html)
  and friends to split in other ways.

- ...:

  These dots are for future extensions and must be empty.

- names:

  For `separate_wider_delim()`, a character vector of output column
  names. Use `NA` if there are components that you don't want to appear
  in the output; the number of non-`NA` elements determines the number
  of new columns in the result.

- names_sep:

  If supplied, output names will be composed of the input column name
  followed by the separator followed by the new column name. Required
  when `cols` selects multiple columns.

  For `separate_wider_delim()` you can specify instead of `names`, in
  which case the names will be generated from the source column name,
  `names_sep`, and a numeric suffix.

- names_repair:

  Used to check that output data frame has valid names. Must be one of
  the following options:

  - `"minimal`": no name repair or checks, beyond basic existence,

  - `"unique`": make sure names are unique and not empty,

  - `"check_unique`": (the default), no name repair, but check they are
    unique,

  - `"universal`": make the names unique and syntactic

  - a function: apply custom name repair.

  - [tidyr_legacy](https://tidyr.tidyverse.org/dev/reference/tidyr_legacy.md):
    use the name repair from tidyr 0.8.

  - a formula: a purrr-style anonymous function (see
    [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html))

  See
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  for more details on these terms and the strategies used to enforce
  them.

- too_few:

  What should happen if a value separates into too few pieces?

  - `"error"`, the default, will throw an error.

  - `"debug"` adds additional columns to the output to help you locate
    and resolve the underlying problem. This option is intended to help
    you debug the issue and address and should not generally remain in
    your final code.

  - `"align_start"` aligns starts of short matches, adding `NA` on the
    end to pad to the correct length.

  - `"align_end"` (`separate_wider_delim()` only) aligns the ends of
    short matches, adding `NA` at the start to pad to the correct
    length.

- too_many:

  What should happen if a value separates into too many pieces?

  - `"error"`, the default, will throw an error.

  - `"debug"` will add additional columns to the output to help you
    locate and resolve the underlying problem.

  - `"drop"` will silently drop any extra pieces.

  - `"merge"` (`separate_wider_delim()` only) will merge together any
    additional pieces.

- cols_remove:

  Should the input `cols` be removed from the output? Always `FALSE` if
  `too_few` or `too_many` are set to `"debug"`.

- widths:

  A named numeric vector where the names become column names, and the
  values specify the column width. Unnamed components will match, but
  not be included in the output.

- patterns:

  A named character vector where the names become column names and the
  values are regular expressions that match the contents of the vector.
  Unnamed components will match, but not be included in the output.

## Value

A data frame based on `data`. It has the same rows, but different
columns:

- The primary purpose of the functions are to create new columns from
  components of the string. For `separate_wider_delim()` the names of
  new columns come from `names`. For `separate_wider_position()` the
  names come from the names of `widths`. For `separate_wider_regex()`
  the names come from the names of `patterns`.

- If `too_few` or `too_many` is `"debug"`, the output will contain
  additional columns useful for debugging:

  - `{col}_ok`: a logical vector which tells you if the input was ok or
    not. Use to quickly find the problematic rows.

  - `{col}_remainder`: any text remaining after separation.

  - `{col}_pieces`, `{col}_width`, `{col}_matches`: number of pieces,
    number of characters, and number of matches for
    `separate_wider_delim()`, `separate_wider_position()` and
    `separate_regexp_wider()` respectively.

- If `cols_remove = TRUE` (the default), the input `cols` will be
  removed from the output.

## Examples

``` r
df <- tibble(id = 1:3, x = c("m-123", "f-455", "f-123"))
# There are three basic ways to split up a string into pieces:
# 1. with a delimiter
df |> separate_wider_delim(x, delim = "-", names = c("gender", "unit"))
#> # A tibble: 3 × 3
#>      id gender unit 
#>   <int> <chr>  <chr>
#> 1     1 m      123  
#> 2     2 f      455  
#> 3     3 f      123  
# 2. by length
df |> separate_wider_position(x, c(gender = 1, 1, unit = 3))
#> # A tibble: 3 × 3
#>      id gender unit 
#>   <int> <chr>  <chr>
#> 1     1 m      123  
#> 2     2 f      455  
#> 3     3 f      123  
# 3. defining each component with a regular expression
df |> separate_wider_regex(x, c(gender = ".", ".", unit = "\\d+"))
#> # A tibble: 3 × 3
#>      id gender unit 
#>   <int> <chr>  <chr>
#> 1     1 m      123  
#> 2     2 f      455  
#> 3     3 f      123  

# Sometimes you split on the "last" delimiter
df <- tibble(var = c("race_1", "race_2", "age_bucket_1", "age_bucket_2"))
# _delim won't help because it always splits on the first delimiter
try(df |> separate_wider_delim(var, "_", names = c("var1", "var2")))
#> Error in separate_wider_delim(df, var, "_", names = c("var1", "var2")) : 
#>   Expected 2 pieces in each element of `var`.
#> ! 2 values were too long.
#> ℹ Use `too_many = "debug"` to diagnose the problem.
#> ℹ Use `too_many = "drop"/"merge"` to silence this message.
df |> separate_wider_delim(var, "_", names = c("var1", "var2"), too_many = "merge")
#> # A tibble: 4 × 2
#>   var1  var2    
#>   <chr> <chr>   
#> 1 race  1       
#> 2 race  2       
#> 3 age   bucket_1
#> 4 age   bucket_2
# Instead, you can use _regex
df |> separate_wider_regex(var, c(var1 = ".*", "_", var2 = ".*"))
#> # A tibble: 4 × 2
#>   var1       var2 
#>   <chr>      <chr>
#> 1 race       1    
#> 2 race       2    
#> 3 age_bucket 1    
#> 4 age_bucket 2    
# this works because * is greedy; you can mimic the _delim behaviour with .*?
df |> separate_wider_regex(var, c(var1 = ".*?", "_", var2 = ".*"))
#> # A tibble: 4 × 2
#>   var1  var2    
#>   <chr> <chr>   
#> 1 race  1       
#> 2 race  2       
#> 3 age   bucket_1
#> 4 age   bucket_2

# If the number of components varies, it's most natural to split into rows
df <- tibble(id = 1:4, x = c("x", "x y", "x y z", NA))
df |> separate_longer_delim(x, delim = " ")
#> # A tibble: 7 × 2
#>      id x    
#>   <int> <chr>
#> 1     1 x    
#> 2     2 x    
#> 3     2 y    
#> 4     3 x    
#> 5     3 y    
#> 6     3 z    
#> 7     4 NA   
# But separate_wider_delim() provides some tools to deal with the problem
# The default behaviour tells you that there's a problem
try(df |> separate_wider_delim(x, delim = " ", names = c("a", "b")))
#> Error in separate_wider_delim(df, x, delim = " ", names = c("a", "b")) : 
#>   Expected 2 pieces in each element of `x`.
#> ! 1 value was too short.
#> ℹ Use `too_few = "debug"` to diagnose the problem.
#> ℹ Use `too_few = "align_start"/"align_end"` to silence this message.
#> ! 1 value was too long.
#> ℹ Use `too_many = "debug"` to diagnose the problem.
#> ℹ Use `too_many = "drop"/"merge"` to silence this message.
# You can get additional insight by using the debug options
df |>
  separate_wider_delim(
    x,
    delim = " ",
    names = c("a", "b"),
    too_few = "debug",
    too_many = "debug"
  )
#> Warning: Debug mode activated: adding variables `x_ok`, `x_pieces`, and
#> `x_remainder`.
#> # A tibble: 4 × 7
#>      id a     b     x     x_ok  x_pieces x_remainder
#>   <int> <chr> <chr> <chr> <lgl>    <int> <chr>      
#> 1     1 x     NA    x     FALSE        1 ""         
#> 2     2 x     y     x y   TRUE         2 ""         
#> 3     3 x     y     x y z FALSE        3 " z"       
#> 4     4 NA    NA    NA    TRUE        NA  NA        

# But you can suppress the warnings
df |>
  separate_wider_delim(
    x,
    delim = " ",
    names = c("a", "b"),
    too_few = "align_start",
    too_many = "merge"
  )
#> # A tibble: 4 × 3
#>      id a     b    
#>   <int> <chr> <chr>
#> 1     1 x     NA   
#> 2     2 x     y    
#> 3     3 x     y z  
#> 4     4 NA    NA   

# Or choose to automatically name the columns, producing as many as needed
df |> separate_wider_delim(x, delim = " ", names_sep = "", too_few = "align_start")
#> # A tibble: 4 × 4
#>      id x1    x2    x3   
#>   <int> <chr> <chr> <chr>
#> 1     1 x     NA    NA   
#> 2     2 x     y     NA   
#> 3     3 x     y     z    
#> 4     4 NA    NA    NA   
```
