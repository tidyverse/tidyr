# Automatically call `unnest_wider()` or `unnest_longer()`

`unnest_auto()` picks between
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
or
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
by inspecting the inner names of the list-col:

- If all elements are unnamed, it uses
  `unnest_longer(indices_include = FALSE)`.

- If all elements are named, and there's at least one name in common
  across all components, it uses
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md).

- Otherwise, it falls back to `unnest_longer(indices_include = TRUE)`.

It's handy for very rapid interactive exploration but I don't recommend
using it in scripts, because it will succeed even if the underlying data
radically changes.

## Usage

``` r
unnest_auto(data, col)
```

## Arguments

- data:

  A data frame.

- col:

  \<[`tidy-select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md)\>
  List-column to unnest.
