# duplicate values for one key is an error

    Code
      (expect_error(spread(df, x, y)))
    Output
      <error/rlang_error>
      Each row of output must be identified by a unique combination of keys.
      Keys are shared for 2 rows:
      * 2, 3

