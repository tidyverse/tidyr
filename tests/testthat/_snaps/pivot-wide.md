# error when overwriting existing column

    Code
      (expect_error(pivot_wider(df, names_from = key, values_from = val)))
    Output
      <error/vctrs_error_names_must_be_unique>
      Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

---

    Code
      out <- pivot_wider(df, names_from = key, values_from = val, names_repair = "unique")
    Message <simpleMessage>
      New names:
      * a -> a...1
      * a -> a...2

# `names_from` must be supplied if `name` isn't in `data` (#1240)

    Code
      (expect_error(pivot_wider(df, values_from = val)))
    Output
      <error/vctrs_error_subscript_oob>
      Can't subset columns that don't exist.
      x Column `name` doesn't exist.

# `values_from` must be supplied if `value` isn't in `data` (#1240)

    Code
      (expect_error(pivot_wider(df, names_from = key)))
    Output
      <error/vctrs_error_subscript_oob>
      Can't subset columns that don't exist.
      x Column `value` doesn't exist.

# `names_from` must identify at least 1 column (#1240)

    Code
      (expect_error(pivot_wider(df, names_from = starts_with("foo"), values_from = val))
      )
    Output
      <error/rlang_error>
      `names_from` must select at least one column.

# `values_from` must identify at least 1 column (#1240)

    Code
      (expect_error(pivot_wider(df, names_from = key, values_from = starts_with("foo")))
      )
    Output
      <error/rlang_error>
      `values_from` must select at least one column.

# `values_fn` emits an informative error when it doesn't result in unique values (#1238)

    Code
      (expect_error(pivot_wider(df, values_fn = list(value = ~.x))))
    Output
      <error/rlang_error>
      Applying `values_fn` to `value` must result in a single summary value per key.
      x Applying `values_fn` resulted in a value with length 2.

# duplicated keys produce list column with warning

    Code
      pv <- pivot_wider(df, names_from = key, values_from = val)
    Warning <warning>
      Values from `val` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = length` to identify where the duplicates arise.
      * Use `values_fn = {summary_fun}` to summarise duplicates.

# duplicated key warning occurs for each applicable column

    Code
      pivot_wider(df, names_from = key, values_from = c(a, b, c), values_fn = list(b = sum))
    Warning <warning>
      Values from `a` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = length` to identify where the duplicates arise.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      Values from `c` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = length` to identify where the duplicates arise.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
    Output
      # A tibble: 1 x 3
        a_x         b_x c_x      
        <list>    <dbl> <list>   
      1 <dbl [2]>     7 <dbl [2]>

# values_fn is validated

    Code
      (expect_error(pivot_wider(df, values_fn = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function

