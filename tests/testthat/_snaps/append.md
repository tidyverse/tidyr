# after must be integer or character

    Code
      (expect_error(df_append(df1, df2, after = 1.5)))
    Output
      <error/rlang_error>
      Error in `df_append()`:
      ! `after` must be a whole number, not the number 1.5.
      i This is an internal error that was detected in the tidyr package.
        Please report it at <https://github.com/tidyverse/tidyr/issues> with a reprex (<https://tidyverse.org/help/>) and the full backtrace.

