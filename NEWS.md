# tidyr 0.6.3

* Patch tests to be compatible with dev tibble

# tidyr 0.6.2

* Register C functions

* Added package docs

* Patch tests to be compatible with dev dplyr.

# tidyr 0.6.1

* Patch test to be compatible with dev tibble

* Changed deprecation message of `extract_numeric()` to point to 
  `readr::parse_number()` rather than `readr::parse_numeric()`

# tidyr 0.6.0

## API changes

* `drop_na()` removes observations which have `NA` in the given variables. If no
  variables are given, all variables are considered (#194, @janschulz).

* `extract_numeric()` has been deprecated (#213).

* Renamed `table4` and `table5` to `table4a` and `table4b` to make their
  connection more clear. The `key` and `value` variables in `table2` have 
  been renamed to `type` and `count`.

## Bug fixes and minor improvements

* `expand()`, `crossing()`, and `nesting()` now silently drop zero-length
  inputs.
  
* `crossing_()` and `nesting_()` are versions of `crossing()` and `nesting()`
  that take a list as input.

* `full_seq()` works correctly for dates and date/times.

# tidyr 0.5.1

* Restored compatibility with R < 3.3.0 by avoiding `getS3method(envir = )` (#205, @krlmlr).

# tidyr 0.5.0

## New functions

* `separate_rows()` separates observations with multiple delimited values into
  separate rows (#69, @aaronwolen).

## Bug fixes and minor improvements

* `complete()` preserves grouping created by dplyr (#168).

* `expand()` (and hence `complete()`) preserves the ordered attribute of 
  factors (#165).

* `full_seq()` preserve attributes for dates and date/times (#156),
  and sequences no longer need to start at 0.

* `gather()` can now gather together list columns (#175), and 
  `gather_.data.frame(na.rm = TRUE)` now only removes missing values
  if they're actually present (#173).

* `nest()` returns correct output if every variable is nested (#186).

* `separate()` fills from right-to-left (not left-to-right!) when fill = "left"
  (#170, @dgrtwo).
  
* `separate()` and `unite()` now automatically drop removed variables from
  grouping (#159, #177).

* `spread()` gains a `sep` argument. If not-null, this will name columns
  as "key<sep>value". Additionally, if sep is `NULL` missing values will be
  converted to `<NA>` (#68).

* `spread()` works in the presence of list-columns (#199)

* `unnest()` works with non-syntactic names (#190).

* `unnest()` gains a `sep` argument. If non-null, this will rename the 
  columns of nested data frames to include both the original column name,
  and the nested column name, separated by `.sep` (#184).

* `unnest()` gains `.id` argument that works the same way as `bind_rows()`.
  This is useful if you have a named list of data frames or vectors (#125).

* Moved in useful sample datasets from the DSR package.

* Made compatible with both dplyr 0.4 and 0.5.

* tidyr functions that create new columns are more aggresive about re-encoding
  the column names as UTF-8. 

# tidyr 0.4.1

* Fixed bug in `nest()` where nested data was ending up in the wrong row (#158).

# tidyr 0.4.0

## Nested data frames

`nest()` and `unnest()` have been overhauled to support a useful way of structuring data frames: the __nested__ data frame. In a grouped data frame, you have one row per observation, and additional metadata define the groups. In a nested data frame, you have one __row__ per group, and the individual observations are stored in a column that is a list of data frames. This is a useful structure when you have lists of other objects (like models) with one element per group.

* `nest()` now produces a single list of data frames called "data" rather
  than a list column for each variable. Nesting variables are not included
  in nested data frames. It also works with grouped data frames made
  by `dplyr::group_by()`. You can override the default column name with `.key`.

* `unnest()` gains a `.drop` argument which controls what happens to
  other list columns. By default, they're kept if the output doesn't require
  row duplication; otherwise they're dropped.
  
* `unnest()` now has `mutate()` semantics for `...` - this allows you to
  unnest transformed columns more easily. (Previously it used select semantics).

## Expanding

* `expand()` once again allows you to evaluate arbitrary expressions like
  `full_seq(year)`. If you were previously using `c()` to created nested 
  combinations, you'll now need to use `nesting()` (#85, #121).

* `nesting()` and `crossing()` allow you to create nested and crossed data
  frames from individual vectors. `crossing()` is similar to 
  `base::expand.grid()`

* `full_seq(x, period)` creates the full sequence of values from `min(x)` to
  `max(x)` every `period` values.

## Minor bug fixes and improvements

* `fill()` fills in `NULL`s in list-columns.

* `fill()` gains a direction argument so that it can fill either upwards or 
  downwards (#114).

* `gather()` now stores the key column as character, by default. To revert to
  the previous behaviour of using a factor (which allows you to preserve the
  ordering of the columns), use `key_factor = TRUE` (#96).

* All tidyr verbs do the right thing for grouped data frames created by 
  `group_by()` (#122, #129, #81).

* `seq_range()` has been removed. It was never used or announced.

* `spread()` once again creates columns of mixed type when `convert = TRUE` 
  (#118, @jennybc). `spread()` with `drop = FALSE`  handles zero-length 
  factors (#56). `spread()`ing a data frame with only key and value columns 
  creates a one row output (#41).

* `unite()` now removes old columns before adding new (#89, @krlmlr).

* `separate()` now warns if defunct ... argument is used (#151, @krlmlr).

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

* `expand()` now supports nesting and crossing (see examples for details).
  This comes at the expense of creating new variables inline (#46).

* `expand_` does SE evaluation correctly so you can pass it a character vector
  of columns names (or list of formulas etc) (#70).

* `extract()` is 10x faster because it now uses stringi instead of 
  base R regular expressions. It also returns NA instead of throwing
  an error if the regular expression doesn't match (#72).
  
* `extract()` and `separate()` preserve character vectors when
  `convert` is TRUE (#99).
  
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
