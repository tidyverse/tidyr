# tidyr 0.2.0.9000

* `expand()` now works with non-standard column names (#87).

* `spread()` gives a more informative error message if `key` or `value` don't
  exist in the input data (#36).

* New `complete()` provides a wrapper around `expand()`, `left_join()` and 
  `replace_na()` for a common task: completing a data frame with missing
  combinations of variables.

* New `replace_na()` makes it easy to replace missing values with something
  meaningful for your data.

* `expand()` now supports nesting and crossing (see examples for details).
  This comes at the expense of creating new variables inline (#46).

* `separate()` only displays the first 20 failures (#50). It has 
  finer control over what happens if there are two few matches:
  you can fill with missing values on either the "left" or the "right" (#49).
  `separate()` no longer throws an error if the number of pieces aren't
  as expected - instead it uses drops extra values and fills on the right
  and gives a warning.

* `extract()` is 10x faster because it now uses stringi instead of 
  base R regular expressions. It also returns NA instead of throwing
  an error if the regular expression doesn't match (#72).
  
* If the input is NA `separate()` and `extract()` both return silently
  return NA outputs, rather than throwing an error. (#77)

* `unnest()` can now work with multiple list-columns at the same time. 
  If you don't supply any columns names, it will unlist all 
  list-columns (#44). `unnest()` can also handle columns that are
  lists of data frames (#58).

* Experimental `unnest()` method for lists has been removed.

* `nest()` is the complement of `unnest()` (#3).

* `fill()` fills in missing values in a column with the last non-missing 
  value (#4).

* `%>%` is exported from magrittr.

* `expand_` does SE evaluation correctly so you can pass it a character vector
  of columns names (or list of formulas etc) (#70).

# tidyr 0.2.0

## New functions

* Experimental `expand()` function (#21).

* Experiment `unnest()` function for converting named lists into
  data frames. (#3, #22)

## Bug fixes and minor improvements

* `extract_numeric()` preserves negative signs (#20).

* `gather()` has better defaults if `key` and `value` are not supplied.
  If `...` is ommitted, `gather()` selects all columns (#28). Performance
  is now comparable to `reshape2::melt()` (#18).

* `separate()` gains `extra` argument which lets you control what happens
  to extra pieces. The default is to throw an "error", but you can also
  "merge" or "drop".

* `spread()` gains `drop` argument, which allows you to preserve missing
  factor levels (#25). It converts factor value variables to character vectors, 
  instead of embedding a matrix inside the data frame (#35).
