revdep-downloads.R
================
jenny
2019-08-07

Look at the number of downloads in the past month of the packages
exhibiting problems in the tidyr revdep check. Useful for prioritizing
the investigation.

``` r
library(tidyverse)

new_problems_path <- here::here("revdep/problems.md")
md <- readLines(new_problems_path)
pkg <- md %>%
  str_subset("^#[^#]") %>%
  str_extract("[[:alnum:]]+")

dl <- cranlogs::cran_downloads(when = "last-month", packages = pkg)

dl_count <- dl %>%
  count(package, wt = count) %>%
  mutate(package = fct_reorder(package, n)) %>%
  arrange(desc(package))

dl_count %>%
  mutate(
    prop = n / sum(n),
    cum_prop = cumsum(prop)
  ) %>%
  print(n = 20)
#> # A tibble: 68 x 4
#>    package           n    prop cum_prop
#>    <fct>         <dbl>   <dbl>    <dbl>
#>  1 modelr       213523 0.397      0.397
#>  2 recipes       92174 0.171      0.568
#>  3 ggpubr        89239 0.166      0.734
#>  4 survminer     19592 0.0364     0.770
#>  5 d3r           18910 0.0351     0.805
#>  6 sunburstR     17281 0.0321     0.838
#>  7 sjstats       15138 0.0281     0.866
#>  8 sjPlot        12447 0.0231     0.889
#>  9 tidyquant      6471 0.0120     0.901
#> 10 gutenbergr     5001 0.00929    0.910
#> 11 tsibble        4173 0.00776    0.918
#> 12 widyr          3288 0.00611    0.924
#> 13 tibbletime     3231 0.00600    0.930
#> 14 bench          3221 0.00599    0.936
#> 15 fuzzyjoin      3118 0.00579    0.942
#> 16 ggstatsplot    2893 0.00538    0.947
#> 17 broomExtra     2441 0.00454    0.952
#> 18 ggalluvial     1890 0.00351    0.955
#> 19 groupedstats   1883 0.00350    0.959
#> 20 anomalize      1672 0.00311    0.962
#> # … with 48 more rows

ggplot(head(dl_count, 20), aes(package, n)) +
  geom_col() +
  coord_flip()
```

![](revdep-downloads_files/figure-gfm/body-1.png)<!-- -->
