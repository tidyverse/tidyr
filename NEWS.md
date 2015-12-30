# tidyr 0.3.1.9000

* `fill()` respects grouping from `group_by()` (#129).

* `fill()` fills in `NULL`s in list-columns.

* `fill()` gains a direction argument so that it can fill either upwards or 
  downwards (#114).

* `nest()` now produces a single list of data frames called "data" rather
  than a list column for each variable. Nesting variables are not included
  in nested data frames. It also works with grouped data frames made
  by `dplyr::group_by()`.

* `unnest()` gains a `.drop` argument which controls what happens to
  other list columns. By default, they're kept if the output doesn't require
  row duplication; otherwise they're dropped.
  
* `unnest()` now has `mutate()` semantics for `...` - this allows you to
  unnest transformed columns more easily. (Previously it used select semantics).

* `spread()` once again creates columns of mixed type when `convert = TRUE` (#118, @jennybc)

# tidyr 0.3.1

* Fixed bug where attributes of non-gather columns were lost (#104)

# tidyr 0.3.0

## New features

* New `complete()` provides a wrapper around `expand()`, `left_join()` and 
  `replace_na()` for a common task: completing a data frame with missing
  combinations of variables.

* `fill()` fills in missing values in a column with the last non-missing 
  value (#4).

* New `replace_na()` makes it easy to replace missing values with something
  meaningful for your data.

* `nest()` is the complement of `unnest()` (#3).

* `unnest()` can now work with multiple list-columns at the same time. 
  If you don't supply any columns names, it will unlist all 
  list-columns (#44). `unnest()` can also handle columns that are
  lists of data frames (#58).

## Bug fixes and minor improvements

* tidyr no longer depends on reshape2. This should fix issues if you also
  try to load reshape (#88).

* `%>%` is re-exported from magrittr.

* `expand()` now works with non-standard column names (#87).

* `expand()` now supports nesting and crossing (see examples for details).
  This comes at the expense of creating new variables inline (#46).

* `expand_` does SE evaluation correctly so you can pass it a character vector
  of columns names (or list of formulas etc) (#70).

* `extract()` is 10x faster because it now uses stringi instead of 
  base R regular expressions. It also returns NA instead of throwing
  an error if the regular expression doesn't match (#72).
  
* `extract()` and `separate()` preserve character vectors when
  `covert` is TRUE (#99).
  
* The internals of `spread()` have been rewritten, and now preserve all 
  attributes of the input `value` column. This means that you can now 
  spread date (#62) and factor (#35) inputs.

* `spread()` gives a more informative error message if `key` or `value` don't
  exist in the input data (#36).

* `separate()` only displays the first 20 failures (#50). It has 
  finer control over what happens if there are two few matches:
  you can fill with missing values on either the "left" or the "right" (#49).
  `separate()` no longer throws an error if the number of pieces aren't
  as expected - instead it uses drops extra values and fills on the right
  and gives a warning.

* If the input is NA `separate()` and `extract()` both return silently
  return NA outputs, rather than throwing an error. (#77)

* Experimental `unnest()` method for lists has been removed.

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
