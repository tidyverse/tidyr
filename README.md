
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidyr <a href='https://tidyr.tidyverse.org'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/tidyr)](https://cran.r-project.org/package=tidyr)
[![R build
status](https://github.com/tidyverse/tidyr/workflows/R-CMD-check/badge.svg)](https://github.com/tidyverse/tidyr/actions)
[![Codecov test
coverage](https://codecov.io/gh/tidyverse/tidyr/branch/master/graph/badge.svg)](https://codecov.io/gh/tidyverse/tidyr?branch=master)
<!-- badges: end -->

## Overview

The goal of tidyr is to help you create **tidy data**. Tidy data is data
where:

1.  Every column is variable.
2.  Every row is an observation.
3.  Every cell is a single value.

Tidy data describes a standard way of storing data that is used wherever
possible throughout the [tidyverse](https://www.tidyverse.org/). If you
ensure that your data is tidy, you’ll spend less time fighting with the
tools and more time working on your analysis. Learn more about tidy data
in `vignette("tidy-data")`.

## Installation

``` r
# The easiest way to get tidyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just tidyr:
install.packages("tidyr")

# Or the development version from GitHub:
# install.packages("devtools")
devtools::install_github("tidyverse/tidyr")
```

## Cheatsheet

<a href="https://github.com/rstudio/cheatsheets/blob/master/tidyr.pdf"><img src="https://raw.githubusercontent.com/rstudio/cheatsheets/master/pngs/thumbnails/tidyr-thumbs.png" width="630" height="252"/></a>

## Getting started

``` r
library(tidyr)
```

tidyr functions fall into five main categories:

-   “Pivotting” which converts between long and wide forms. tidyr 1.0.0
    introduces `pivot_longer()` and `pivot_wider()`, replacing the older
    `spread()` and `gather()` functions. See `vignette("pivot")` for
    more details.

-   “Rectangling”, which turns deeply nested lists (as from JSON) into
    tidy tibbles. See `unnest_longer()`, `unnest_wider()`, `hoist()`,
    and `vignette("rectangle")` for more details.

-   Nesting converts grouped data to a form where each group becomes a
    single row containing a nested data frame, and unnesting does the
    opposite. See `nest()`, `unnest()`, and `vignette("nest")` for more
    details.

-   Splitting and combining character columns. Use `separate()` and
    `extract()` to pull a single character column into multiple columns;
    use `unite()` to combine multiple columns into a single character
    column.

-   Make implicit missing values explicit with `complete()`; make
    explicit missing values implicit with `drop_na()`; replace missing
    values with next/previous value with `fill()`, or a known value with
    `replace_na()`.

## Related work

tidyr
[supersedes](https://lifecycle.r-lib.org/articles/stages.html#superseded)
reshape2 (2010-2014) and reshape (2005-2010). Somewhat
counterintuitively, each iteration of the package has done less. tidyr
is designed specifically for tidying data, not general reshaping
(reshape2), or the general aggregation (reshape).

[data.table](https://rdatatable.gitlab.io/data.table) provides
high-performance implementations of `melt()` and `dcast()`

If you’d like to read more about data reshaping from a CS perspective,
I’d recommend the following three papers:

-   [Wrangler: Interactive visual specification of data transformation
    scripts](http://vis.stanford.edu/papers/wrangler)

-   [An interactive framework for data
    cleaning](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2000/CSD-00-1110.pdf)
    (Potter’s wheel)

-   [On efficiently implementing SchemaSQL on a SQL database
    system](https://www.vldb.org/conf/1999/P45.pdf)

To guide your reading, here’s a translation between the terminology used
in different places:

| tidyr 1.0.0    | pivot longer | pivot wider |
|----------------|--------------|-------------|
| tidyr \< 1.0.0 | gather       | spread      |
| reshape(2)     | melt         | cast        |
| spreadsheets   | unpivot      | pivot       |
| databases      | fold         | unfold      |

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [github](https://github.com/tidyverse/tidyr/issues). For questions
and other discussion, please use
[community.rstudio.com](https://community.rstudio.com/).

------------------------------------------------------------------------

Please note that the tidyr project is released with a [Contributor Code
of Conduct](https://tidyr.tidyverse.org/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
