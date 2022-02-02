# all inputs must be named

    Code
      (expect_error(pack(df, a = c(a1, a2), c(b1, b2))))
    Output
      <error/rlang_error>
      Error in `pack()`:
      ! All elements of `...` must be named
    Code
      (expect_error(pack(df, c(a1, a2), c(b1, b2))))
    Output
      <error/rlang_error>
      Error in `pack()`:
      ! All elements of `...` must be named

