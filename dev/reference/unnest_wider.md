# Unnest a list-column into columns

`unnest_wider()` turns each element of a list-column into a column. It
is most naturally suited to list-columns where every element is named,
and the names are consistent from row-to-row. `unnest_wider()` preserves
the rows of `x` while modifying the columns.

Learn more in
[`vignette("rectangle")`](https://tidyr.tidyverse.org/dev/articles/rectangle.md).

## Usage

``` r
unnest_wider(
  data,
  col,
  names_sep = NULL,
  simplify = TRUE,
  strict = FALSE,
  names_repair = "check_unique",
  ptype = NULL,
  transform = NULL
)
```

## Arguments

- data:

  A data frame.

- col:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  List-column(s) to unnest.

  When selecting multiple columns, values from the same row will be
  recycled to their common size.

- names_sep:

  If `NULL`, the default, the names will be left as is. If a string, the
  outer and inner names will be pasted together using `names_sep` as a
  separator.

  If any values being unnested are unnamed, then `names_sep` must be
  supplied, otherwise an error is thrown. When `names_sep` is supplied,
  names are automatically generated for unnamed values as an increasing
  sequence of integers.

- simplify:

  If `TRUE`, will attempt to simplify lists of length-1 vectors to an
  atomic vector. Can also be a named list containing `TRUE` or `FALSE`
  declaring whether or not to attempt to simplify a particular column.
  If a named list is provided, the default for any unspecified columns
  is `TRUE`.

- strict:

  A single logical specifying whether or not to apply strict vctrs
  typing rules. If `FALSE`, typed empty values (like
  [`list()`](https://rdrr.io/r/base/list.html) or
  [`integer()`](https://rdrr.io/r/base/integer.html)) nested within
  list-columns will be treated like `NULL` and will not contribute to
  the type of the unnested column. This is useful when working with
  JSON, where empty values tend to lose their type information and show
  up as [`list()`](https://rdrr.io/r/base/list.html).

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

- ptype:

  Optionally, a named list of prototypes declaring the desired output
  type of each component. Alternatively, a single empty prototype can be
  supplied, which will be applied to all components. Use this argument
  if you want to check that each element has the type you expect when
  simplifying.

  If a `ptype` has been specified, but `simplify = FALSE` or
  simplification isn't possible, then a
  [list-of](https://vctrs.r-lib.org/reference/list_of.html) column will
  be returned and each element will have type `ptype`.

- transform:

  Optionally, a named list of transformation functions applied to each
  component. Alternatively, a single function can be supplied, which
  will be applied to all components. Use this argument if you want to
  transform or parse individual elements as they are extracted.

  When both `ptype` and `transform` are supplied, the `transform` is
  applied before the `ptype`.

## See also

Other rectangling:
[`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md),
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)

## Examples

``` r
df <- tibble(
  character = c("Toothless", "Dory"),
  metadata = list(
    list(
      species = "dragon",
      color = "black",
      films = c(
        "How to Train Your Dragon",
        "How to Train Your Dragon 2",
        "How to Train Your Dragon: The Hidden World"
      )
    ),
    list(
      species = "blue tang",
      color = "blue",
      films = c("Finding Nemo", "Finding Dory")
    )
  )
)
df
#> # A tibble: 2 × 2
#>   character metadata        
#>   <chr>     <list>          
#> 1 Toothless <named list [3]>
#> 2 Dory      <named list [3]>

# Turn all components of metadata into columns
df |> unnest_wider(metadata)
#> # A tibble: 2 × 4
#>   character species   color films    
#>   <chr>     <chr>     <chr> <list>   
#> 1 Toothless dragon    black <chr [3]>
#> 2 Dory      blue tang blue  <chr [2]>

# Choose not to simplify list-cols of length-1 elements
df |> unnest_wider(metadata, simplify = FALSE)
#> # A tibble: 2 × 4
#>   character species   color     films    
#>   <chr>     <list>    <list>    <list>   
#> 1 Toothless <chr [1]> <chr [1]> <chr [3]>
#> 2 Dory      <chr [1]> <chr [1]> <chr [2]>
df |> unnest_wider(metadata, simplify = list(color = FALSE))
#> # A tibble: 2 × 4
#>   character species   color     films    
#>   <chr>     <chr>     <list>    <list>   
#> 1 Toothless dragon    <chr [1]> <chr [3]>
#> 2 Dory      blue tang <chr [1]> <chr [2]>

# You can also widen unnamed list-cols:
df <- tibble(
  x = 1:3,
  y = list(NULL, 1:3, 4:5)
)
# but you must supply `names_sep` to do so, which generates automatic names:
df |> unnest_wider(y, names_sep = "_")
#> # A tibble: 3 × 4
#>       x   y_1   y_2   y_3
#>   <int> <int> <int> <int>
#> 1     1    NA    NA    NA
#> 2     2     1     2     3
#> 3     3     4     5    NA

# 0-length elements ---------------------------------------------------------
# The defaults of `unnest_wider()` treat empty types (like `list()`) as `NULL`.
json <- list(
  list(x = 1:2, y = 1:2),
  list(x = list(), y = 3:4),
  list(x = 3L, y = list())
)

df <- tibble(json = json)
df |>
  unnest_wider(json)
#> # A tibble: 3 × 2
#>   x         y        
#>   <list>    <list>   
#> 1 <int [2]> <int [2]>
#> 2 <NULL>    <int [2]>
#> 3 <int [1]> <NULL>   

# To instead enforce strict vctrs typing rules, use `strict`
df |>
  unnest_wider(json, strict = TRUE)
#> # A tibble: 3 × 2
#>   x          y         
#>   <list>     <list>    
#> 1 <int [2]>  <int [2]> 
#> 2 <list [0]> <int [2]> 
#> 3 <int [1]>  <list [0]>
```
