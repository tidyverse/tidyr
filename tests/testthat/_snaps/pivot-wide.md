# duplicated keys produce list column with warning

    Code
      (expect_warning(pv <- pivot_wider(df, names_from = key, values_from = val)))
    Output
      <warning: Values are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = length` to identify where the duplicates arise.
      * Use `values_fn = {summary_fun}` to summarise duplicates.>

