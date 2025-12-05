# tidyr

## Overview

The goal of tidyr is to help you create **tidy data**. Tidy data is data
where:

1.  Each variable is a column; each column is a variable.
2.  Each observation is a row; each row is an observation.
3.  Each value is a cell; each cell is a single value.

Tidy data describes a standard way of storing data that is used wherever
possible throughout the [tidyverse](https://tidyverse.org/). If you
ensure that your data is tidy, you’ll spend less time fighting with the
tools and more time working on your analysis. Learn more about tidy data
in
[`vignette("tidy-data")`](https://tidyr.tidyverse.org/dev/articles/tidy-data.md).

## Installation

``` r
# The easiest way to get tidyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just tidyr:
install.packages("tidyr")

# Or the development version from GitHub:
# install.packages("pak")
pak::pak("tidyverse/tidyr")
```

## Cheatsheet

[![](https://raw.githubusercontent.com/rstudio/cheatsheets/master/pngs/thumbnails/tidyr-thumbs.png)](https://github.com/rstudio/cheatsheets/blob/master/tidyr.pdf)

## Getting started

``` r
library(tidyr)
```

tidyr functions fall into five main categories:

- “Pivoting” which converts between long and wide forms. tidyr 1.0.0
  introduces
  [`pivot_longer()`](https://tidyr.tidyverse.org/dev/reference/pivot_longer.md)
  and
  [`pivot_wider()`](https://tidyr.tidyverse.org/dev/reference/pivot_wider.md),
  replacing the older
  [`spread()`](https://tidyr.tidyverse.org/dev/reference/spread.md) and
  [`gather()`](https://tidyr.tidyverse.org/dev/reference/gather.md)
  functions. See
  [`vignette("pivot")`](https://tidyr.tidyverse.org/dev/articles/pivot.md)
  for more details.

- “Rectangling”, which turns deeply nested lists (as from JSON) into
  tidy tibbles. See
  [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md),
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md),
  [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md), and
  [`vignette("rectangle")`](https://tidyr.tidyverse.org/dev/articles/rectangle.md)
  for more details.

- Nesting converts grouped data to a form where each group becomes a
  single row containing a nested data frame, and unnesting does the
  opposite. See
  [`nest()`](https://tidyr.tidyverse.org/dev/reference/nest.md),
  [`unnest()`](https://tidyr.tidyverse.org/dev/reference/unnest.md), and
  [`vignette("nest")`](https://tidyr.tidyverse.org/dev/articles/nest.md)
  for more details.

- Splitting and combining character columns. Use
  [`separate_wider_delim()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md),
  [`separate_wider_position()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md),
  and
  [`separate_wider_regex()`](https://tidyr.tidyverse.org/dev/reference/separate_wider_delim.md)
  to pull a single character column into multiple columns; use
  [`unite()`](https://tidyr.tidyverse.org/dev/reference/unite.md) to
  combine multiple columns into a single character column.

- Make implicit missing values explicit with
  [`complete()`](https://tidyr.tidyverse.org/dev/reference/complete.md);
  make explicit missing values implicit with
  [`drop_na()`](https://tidyr.tidyverse.org/dev/reference/drop_na.md);
  replace missing values with next/previous value with
  [`fill()`](https://tidyr.tidyverse.org/dev/reference/fill.md), or a
  known value with
  [`replace_na()`](https://tidyr.tidyverse.org/dev/reference/replace_na.md).

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

- [Wrangler: Interactive visual specification of data transformation
  scripts](http://vis.stanford.edu/papers/wrangler)

- [An interactive framework for data
  cleaning](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2000/CSD-00-1110.pdf)
  (Potter’s wheel)

- [On efficiently implementing SchemaSQL on a SQL database
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
[forum.posit.co](https://forum.posit.co/).

------------------------------------------------------------------------

Please note that the tidyr project is released with a [Contributor Code
of Conduct](https://tidyr.tidyverse.org/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
