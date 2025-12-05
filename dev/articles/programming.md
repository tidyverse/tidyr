# Programming with tidyr

## Introduction

Most tidyr verbs use **tidy evaluation** to make interactive data
exploration fast and fluid. Tidy evaluation is a special type of
non-standard evaluation used throughout the tidyverse. Here’s some
typical tidyr code:

``` r
library(tidyr)

iris |>
  nest(data = !Species)
#> # A tibble: 3 × 2
#>   Species    data             
#>   <fct>      <list>           
#> 1 setosa     <tibble [50 × 4]>
#> 2 versicolor <tibble [50 × 4]>
#> 3 virginica  <tibble [50 × 4]>
```

Tidy evaluation is why we can use `!Species` to say “all the columns
except `Species`”, without having to quote the column name (`"Species"`)
or refer to the enclosing data frame (`iris$Species`).

Two basic forms of tidy evaluation are used in tidyr:

- **Tidy selection**:
  [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md),
  [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md),
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)/[`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md),
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md)/[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md),
  [`separate()`](https://tidyr.tidyverse.org/dev/reference/separate.md)/[`extract()`](https://tidyr.tidyverse.org/dev/reference/extract.md),
  and [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md)
  let you select variables based on position, name, or type (e.g. `1:3`,
  `starts_with("x")`, or `is.numeric`). Literally, you can use all the
  same techniques as with
  [`dplyr::select()`](https://dplyr.tidyverse.org/reference/select.html).

- **Data masking**:
  [`expand()`](https://tidyr.tidyverse.org/dev/reference/expand.md),
  [`crossing()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  and [`nesting()`](https://tidyr.tidyverse.org/dev/reference/expand.md)
  let you refer to use data variables as if they were variables in the
  environment (i.e. you write `my_variable` not `df$my_variable`).

We focus on tidy selection here, since it’s the most common. You can
learn more about data masking in the equivalent vignette in dplyr:
<https://dplyr.tidyverse.org/dev/articles/programming.html>. For other
considerations when writing tidyr code in packages, please see
[`vignette("in-packages")`](https://tidyr.tidyverse.org/dev/articles/in-packages.md).

We’ve pointed out that tidyr’s tidy evaluation interface is optimized
for interactive exploration. The flip side is that this adds some
challenges to indirect use, i.e. when you’re working inside a `for` loop
or a function. This vignette shows you how to overcome those challenges.
We’ll first go over the basics of tidy selection and data masking, talk
about how to use them indirectly, and then show you a number of recipes
to solve common problems.

Before we go on, we reveal the version of tidyr we’re using and make a
small dataset to use in examples.

``` r
packageVersion("tidyr")
#> [1] '1.3.1.9000'

mini_iris <- as_tibble(iris)[c(1, 2, 51, 52, 101, 102), ]
mini_iris
#> # A tibble: 6 × 5
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species   
#>          <dbl>       <dbl>        <dbl>       <dbl> <fct>     
#> 1          5.1         3.5          1.4         0.2 setosa    
#> 2          4.9         3            1.4         0.2 setosa    
#> 3          7           3.2          4.7         1.4 versicolor
#> 4          6.4         3.2          4.5         1.5 versicolor
#> 5          6.3         3.3          6           2.5 virginica 
#> 6          5.8         2.7          5.1         1.9 virginica
```

## Tidy selection

Underneath all functions that use tidy selection is the
[tidyselect](https://tidyselect.r-lib.org/) package. It provides a
miniature domain specific language that makes it easy to select columns
by name, position, or type. For example:

- `select(df, 1)` selects the first column; `select(df, last_col())`
  selects the last column.

- `select(df, c(a, b, c))` selects columns `a`, `b`, and `c`.

- `select(df, starts_with("a"))` selects all columns whose name starts
  with “a”; `select(df, ends_with("z"))` selects all columns whose name
  ends with “z”.

- `select(df, where(is.numeric))` selects all numeric columns.

You can see more details in
[`?tidyr_tidy_select`](https://tidyr.tidyverse.org/dev/reference/tidyr_tidy_select.md).

### Indirection

Tidy selection makes a common task easier at the cost of making a less
common task harder. When you want to use tidy select indirectly with the
column specification stored in an intermediate variable, you’ll need to
learn some new tools. There are three main cases where this comes up:

- When you have the tidy-select specification in a function argument,
  you must **embrace** the argument by surrounding it in doubled braces.

  ``` r
  nest_egg <- function(df, cols) {
    nest(df, egg = {{ cols }})
  }

  nest_egg(mini_iris, !Species)
  #> # A tibble: 3 × 2
  #>   Species    egg             
  #>   <fct>      <list>          
  #> 1 setosa     <tibble [2 × 4]>
  #> 2 versicolor <tibble [2 × 4]>
  #> 3 virginica  <tibble [2 × 4]>
  ```

- When you have a character vector of variable names, you must use
  [`all_of()`](https://tidyselect.r-lib.org/reference/all_of.html) or
  [`any_of()`](https://tidyselect.r-lib.org/reference/all_of.html)
  depending on whether you want the function to error if a variable is
  not found. These functions allow you to write for loops or a function
  that takes variable names as a character vector.

  ``` r
  nest_egg <- function(df, cols) {
    nest(df, egg = all_of(cols))
  }

  vars <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
  nest_egg(mini_iris, vars)
  #> # A tibble: 3 × 2
  #>   Species    egg             
  #>   <fct>      <list>          
  #> 1 setosa     <tibble [2 × 4]>
  #> 2 versicolor <tibble [2 × 4]>
  #> 3 virginica  <tibble [2 × 4]>
  ```

- In more complicated cases, you might want to use tidyselect directly:

  ``` r
  sel_vars <- function(df, cols) {
    tidyselect::eval_select(rlang::enquo(cols), df)
  }
  sel_vars(mini_iris, !Species)
  #> Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
  #>            1            2            3            4
  ```

  Learn more in `vignette("tidyselect")`.

Note that many tidyr functions use `...` so you can easily select many
variables, e.g. `fill(df, x, y, z)`. I now believe that the
disadvantages of this approach outweigh the benefits, and that this
interface would have been better as `fill(df, c(x, y, z))`. For new
functions that select columns, please just use a single argument and not
`...`.
