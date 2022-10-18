# after must be integer or character

    Code
      (expect_error(append_df(df1, df2, after = 1)))
    Output
      <error/rlang_error>
      Error in `append_df()`:
      ! `after` must be character or integer
      i This is an internal error that was detected in the tidyr package.
        Please report it at <https://github.com/tidyverse/tidyr/issues> with a reprex (<https://https://tidyverse.org/help/>) and the full backtrace.

