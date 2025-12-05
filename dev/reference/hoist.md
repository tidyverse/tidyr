# Hoist values out of list-columns

`hoist()` allows you to selectively pull components of a list-column
into their own top-level columns, using the same syntax as
[`purrr::pluck()`](https://purrr.tidyverse.org/reference/pluck.html).

Learn more in
[`vignette("rectangle")`](https://tidyr.tidyverse.org/dev/articles/rectangle.md).

## Usage

``` r
hoist(
  .data,
  .col,
  ...,
  .remove = TRUE,
  .simplify = TRUE,
  .ptype = NULL,
  .transform = NULL
)
```

## Arguments

- .data:

  A data frame.

- .col:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  List-column to extract components from.

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Components of `.col` to turn into columns in the form
  `col_name = "pluck_specification"`. You can pluck by name with a
  character vector, by position with an integer vector, or with a
  combination of the two with a list. See
  [`purrr::pluck()`](https://purrr.tidyverse.org/reference/pluck.html)
  for details.

  The column names must be unique in a call to `hoist()`, although
  existing columns with the same name will be overwritten. When plucking
  with a single string you can choose to omit the name, i.e.
  `hoist(df, col, "x")` is short-hand for `hoist(df, col, x = "x")`.

- .remove:

  If `TRUE`, the default, will remove extracted components from `.col`.
  This ensures that each value lives only in one place. If all
  components are removed from `.col`, then `.col` will be removed from
  the result entirely.

- .simplify:

  If `TRUE`, will attempt to simplify lists of length-1 vectors to an
  atomic vector. Can also be a named list containing `TRUE` or `FALSE`
  declaring whether or not to attempt to simplify a particular column.
  If a named list is provided, the default for any unspecified columns
  is `TRUE`.

- .ptype:

  Optionally, a named list of prototypes declaring the desired output
  type of each component. Alternatively, a single empty prototype can be
  supplied, which will be applied to all components. Use this argument
  if you want to check that each element has the type you expect when
  simplifying.

  If a `ptype` has been specified, but `simplify = FALSE` or
  simplification isn't possible, then a
  [list-of](https://vctrs.r-lib.org/reference/list_of.html) column will
  be returned and each element will have type `ptype`.

- .transform:

  Optionally, a named list of transformation functions applied to each
  component. Alternatively, a single function can be supplied, which
  will be applied to all components. Use this argument if you want to
  transform or parse individual elements as they are extracted.

  When both `ptype` and `transform` are supplied, the `transform` is
  applied before the `ptype`.

## See also

Other rectangling:
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)

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

# Extract only specified components
df |> hoist(metadata,
  "species",
  first_film = list("films", 1L),
  third_film = list("films", 3L)
)
#> # A tibble: 2 × 5
#>   character species   first_film               third_film  metadata    
#>   <chr>     <chr>     <chr>                    <chr>       <list>      
#> 1 Toothless dragon    How to Train Your Dragon How to Tra… <named list>
#> 2 Dory      blue tang Finding Nemo             NA          <named list>
```
