
<!-- README.md is generated from README.Rmd. Please edit that file -->
tidyr <img src="logo.png" align="right" />
==========================================

[![Build Status](https://travis-ci.org/tidyverse/tidyr.svg?branch=master)](https://travis-ci.org/tidyverse/tidyr) [![codecov.io](http://codecov.io/github/tidyverse/tidyr/coverage.svg?branch=master)](http://codecov.io/github/tidyverse/tidyr?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tidyr)](https://cran.r-project.org/package=tidyr)

Overview
--------

The goal of tidyr is to help you create **tidy data**. Tidy data is data where:

1.  Each variable is in a column.
2.  Each observation is a row.
3.  Each value is a cell.

Tidy data describes a standard way of storing data that is used wherever possible throughout the [tidyverse](http://tidyverse.org). If you ensure that your data is tidy, you'll spend less timing fighting with the tools and more time working on your analysis.

Installation
------------

``` r
# The easiest way to get tidyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just tidyr:
install.packages("tidyr")

# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("tidyverse/tidyr")
```

Getting started
---------------

``` r
library(tidyr)
```

There are two fundamental verbs of data tidying:

-   `gather()` takes multiple columns, and gathers them into key-value pairs: it makes "wide" data longer.

-   `spread()`. takes two columns (key & value) and spreads in to multiple columns, it makes "long" data wider.

tidyr also provides `separate()` and `extract()` functions which makes it easier to pull apart a column that represents multiple variables. The complement to `separate()` is `unite()`.

To get started, read the tidy data vignette (`vignette("tidy-data")`) and check out the demos, `demo(package = "tidyr")`).

Related work
------------

tidyr replaces reshape2 (2010-2014) and reshape (2005-2010). Somewhat counterintuitively each iteration of the the package has done less. tidyr is designed specifically for tidying data, not general reshaping (reshape2), or the general aggregation (reshape).

If you'd like to read more about data reshaping from a CS perspective, I'd recommend the following three papers:

-   [Wrangler: Interactive visual specification of data transformation scripts](http://vis.stanford.edu/papers/wrangler)

-   [An interactive framework for data cleaning](https://www.eecs.berkeley.edu/Pubs/TechRpts/2000/CSD-00-1110.pdf) (Potter's wheel)

-   [On efficiently implementing SchemaSQL on a SQL database system](http://www.vldb.org/conf/1999/P45.pdf)

To guide your reading, here's translation between the terminology used in different places:

| tidyr        | gather  | spread |
|--------------|---------|--------|
| reshape(2)   | melt    | cast   |
| spreadsheets | unpivot | pivot  |
| databases    | fold    | unfold |
