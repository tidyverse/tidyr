# `cols` is required (#1205)

    Code
      (expect_error(chop(df)))
    Output
      <error/rlang_error>
      Argument `cols` is missing with no default

# incompatible sizes are caught

    Code
      (expect_error(unchop(df, c(x, y))))
    Output
      <error/rlang_error>
      In row 1, can't recycle input of size 2 to size 3.

# empty typed inputs are considered in common size, but NULLs aren't

    Code
      (expect_error(unchop(df, c(x, y))))
    Output
      <error/rlang_error>
      In row 1, can't recycle input of size 0 to size 2.

