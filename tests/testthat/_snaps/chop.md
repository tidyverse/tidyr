# `cols` is required (#1205)

    Code
      (expect_error(chop(df)))
    Output
      <error/rlang_error>
      Error in `check_present()`: Argument `cols` is missing with no default

# the ptype must be a list

    Code
      (expect_error(unchop(mtcars, mpg, ptype = 1)))
    Output
      <error/rlang_error>
      Error in `df_unchop()`: `ptype` must be a named list.

# incompatible sizes are caught

    Code
      (expect_error(unchop(df, c(x, y))))
    Output
      <error/rlang_error>
      Error in `fn()`: In row 1, can't recycle input of size 2 to size 3.

# empty typed inputs are considered in common size, but NULLs aren't

    Code
      (expect_error(unchop(df, c(x, y))))
    Output
      <error/rlang_error>
      Error in `fn()`: In row 1, can't recycle input of size 0 to size 2.

