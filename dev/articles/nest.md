# Nested data

``` r
library(tidyr)
library(dplyr)
library(purrr)
```

## Basics

A nested data frame is a data frame where one (or more) columns is a
list of data frames. You can create simple nested data frames by hand:

``` r
df1 <- tibble(
  g = c(1, 2, 3),
  data = list(
    tibble(x = 1, y = 2),
    tibble(x = 4:5, y = 6:7),
    tibble(x = 10)
  )
)

df1
#> # A tibble: 3 × 2
#>       g data            
#>   <dbl> <list>          
#> 1     1 <tibble [1 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 1]>
```

(It is possible to create list-columns in regular data frames, not just
in tibbles, but it’s considerably more work because the default
behaviour of [`data.frame()`](https://rdrr.io/r/base/data.frame.html) is
to treat lists as lists of columns.)

But more commonly you’ll create them with
[`tidyr::nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md):

``` r
df2 <- tribble(
  ~g, ~x, ~y,
   1,  1,  2,
   2,  4,  6,
   2,  5,  7,
   3, 10,  NA
)
df2 |> nest(data = c(x, y))
#> # A tibble: 3 × 2
#>       g data            
#>   <dbl> <list>          
#> 1     1 <tibble [1 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>
```

[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) specifies
which variables should be nested inside; an alternative is to use
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html)
to describe which variables should be kept outside.

``` r
df2 |> group_by(g) |> nest()
#> # A tibble: 3 × 2
#> # Groups:   g [3]
#>       g data            
#>   <dbl> <list>          
#> 1     1 <tibble [1 × 2]>
#> 2     2 <tibble [2 × 2]>
#> 3     3 <tibble [1 × 2]>
```

I think nesting is easiest to understand in connection to grouped data:
each row in the output corresponds to one *group* in the input. We’ll
see shortly this is particularly convenient when you have other
per-group objects.

The opposite of
[`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md) is
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md). You
give it the name of a list-column containing data frames, and it
row-binds the data frames together, repeating the outer columns the
right number of times to line up.

``` r
df1 |> unnest(data)
#> # A tibble: 4 × 3
#>       g     x     y
#>   <dbl> <dbl> <dbl>
#> 1     1     1     2
#> 2     2     4     6
#> 3     2     5     7
#> 4     3    10    NA
```

## Nested data and models

Nested data is a great fit for problems where you have one of
*something* for each group. A common place this arises is when you’re
fitting multiple models.

``` r
mtcars_nested <- mtcars |>
  group_by(cyl) |>
  nest()

mtcars_nested
#> # A tibble: 3 × 2
#> # Groups:   cyl [3]
#>     cyl data              
#>   <dbl> <list>            
#> 1     6 <tibble [7 × 10]> 
#> 2     4 <tibble [11 × 10]>
#> 3     8 <tibble [14 × 10]>
```

Once you have a list of data frames, it’s very natural to produce a list
of models:

``` r
mtcars_nested <- mtcars_nested |>
  mutate(model = map(data, function(df) lm(mpg ~ wt, data = df)))
mtcars_nested
#> # A tibble: 3 × 3
#> # Groups:   cyl [3]
#>     cyl data               model 
#>   <dbl> <list>             <list>
#> 1     6 <tibble [7 × 10]>  <lm>  
#> 2     4 <tibble [11 × 10]> <lm>  
#> 3     8 <tibble [14 × 10]> <lm>
```

And then you could even produce a list of predictions:

``` r
mtcars_nested <- mtcars_nested |>
  mutate(pred = map(model, predict))
mtcars_nested
#> # A tibble: 3 × 4
#> # Groups:   cyl [3]
#>     cyl data               model  pred      
#>   <dbl> <list>             <list> <list>    
#> 1     6 <tibble [7 × 10]>  <lm>   <dbl [7]> 
#> 2     4 <tibble [11 × 10]> <lm>   <dbl [11]>
#> 3     8 <tibble [14 × 10]> <lm>   <dbl [14]>
```

This workflow works particularly well in conjunction with
[broom](https://broom.tidymodels.org/), which makes it easy to turn
models into tidy data frames which can then be
[`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md)ed to
get back to flat data frames. You can see a bigger example in the [broom
and dplyr
vignette](https://broom.tidymodels.org/articles/broom_and_dplyr.html).
