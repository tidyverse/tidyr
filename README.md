
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidyr <a href='https:/tidyr.tidyverse.org'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/tidyr)](https://cran.r-project.org/package=tidyr)
[![Travis build
status](https://travis-ci.org/tidyverse/tidyr.svg?branch=master)](https://travis-ci.org/tidyverse/tidyr)
[![Codecov test
coverage](https://codecov.io/gh/tidyverse/tidyr/branch/master/graph/badge.svg)](https://codecov.io/gh/tidyverse/tidyr?branch=master)
<!-- badges: end -->

## Overview

The goal of tidyr is to help you create **tidy data**. Tidy data is data
where:

1.  Each variable is in a column.
2.  Each observation is a row.
3.  Each value is a cell.

Tidy data describes a standard way of storing data that is used wherever
possible throughout the [tidyverse](http://tidyverse.org). If you ensure
that your data is tidy, you’ll spend less time fighting with the tools
and more time working on your analysis.

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

<a href="https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf"><img src="https://raw.githubusercontent.com/rstudio/cheatsheets/master/pngs/thumbnails/data-import-cheatsheet-thumbs.png" width="630" height="252"/></a>

## Getting started

``` r
library(tidyr)
```

There are two fundamental verbs of data tidying:

  - `gather()` takes multiple columns, and gathers them into key-value
    pairs: it makes “wide” data longer.

  - `spread()` takes two columns (key & value), and spreads into
    multiple columns: it makes “long” data wider.

tidyr also provides `separate()` and `extract()` functions which makes
it easier to pull apart a column that represents multiple variables. The
complement to `separate()` is `unite()`.

To get started, read the tidy data vignette (`vignette("tidy-data")`)
and check out the demos (`demo(package = "tidyr")`).

## Related work

tidyr replaces reshape2 (2010-2014) and reshape (2005-2010). Somewhat
counterintuitively each iteration of the package has done less. tidyr is
designed specifically for tidying data, not general reshaping
(reshape2), or the general aggregation (reshape).

If you’d like to read more about data reshaping from a CS perspective,
I’d recommend the following three papers:

  - [Wrangler: Interactive visual specification of data transformation
    scripts](http://vis.stanford.edu/papers/wrangler)

  - [An interactive framework for data
    cleaning](https://www.eecs.berkeley.edu/Pubs/TechRpts/2000/CSD-00-1110.pdf)
    (Potter’s wheel)

  - [On efficiently implementing SchemaSQL on a SQL database
    system](http://www.vldb.org/conf/1999/P45.pdf)

To guide your reading, here’s a translation between the terminology used
in different places:

| tidyr        | gather  | spread |
| ------------ | ------- | ------ |
| reshape(2)   | melt    | cast   |
| spreadsheets | unpivot | pivot  |
| databases    | fold    | unfold |

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [github](https://github.com/tidyverse/tidyr/issues). For questions
and other discussion, please use
[community.rstudio.com](https://community.rstudio.com/).

-----

Please note that the tidyr project is released with a [Contributor Code
of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.
