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

