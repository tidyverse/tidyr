# tidyr

tidyr is a reframing of reshape2 designed to accompany the [tidy data framework](vita.had.co.nz/papers/tidy-data.html). Just as reshape2 did less than reshape, tidy2 does less than reshape2. It's designed to be used specifically for tidying data, not the general reshaping that reshape2 does, or the general aggregation that reshape does. In particular, built-in methods only work for data frames, and it provides no margins or aggregation, and you can't spread multiple variables across the columns. tidyr is designed to work hand-in-hand with magrittr and dplyr to build a solid pipeline of data tidying and manipulation.

There are two fundamental verbs of data tidying: 

* `gather()` takes multiple columns, and gathers them into key-value pairs: it 
  makes "wide" data longer

* `spread()`. takes two columns (key & value) and spreads in to multiple 
  columns, it makes "long" data wider. 

These verbs have a number of synonyms:

| tidyr        | gather | spread  |
|--------------|--------|---------|
| reshape2     | melt   | cast    |
| spreadsheets | pivot  | unpivot | 
| databases    | fold   | unfold  |

tidyr also provides `separate()` function which makes it easier to turn a single character column into multiple columns breaking up either a regular expression, or by character positions.

## Installation

tidyr is not available from CRAN (yet!) but you can get it with:

```s
# install.packages("devtools")
devtools::install_github("hadley/tidyr")
```
