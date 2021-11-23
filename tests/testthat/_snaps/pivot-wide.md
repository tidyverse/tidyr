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

# duplicated keys produce list column with warning

    Code
      pv <- pivot_wider(df, names_from = key, values_from = val)
    Warning <warning>
      Values are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = length` to identify where the duplicates arise.
      * Use `values_fn = {summary_fun}` to summarise duplicates.

# values_fn is validated

    Code
      (expect_error(pivot_wider(df, values_fn = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function

