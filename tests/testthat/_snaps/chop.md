# incompatible sizes are caught

    Code
      unchop(df, c(x, y))
    Error <rlang_error>
      In row 1, can't recycle input of size 2 to size 3.

# empty typed inputs are considered in common size, but NULLs aren't

    Code
      unchop(df, c(x, y))
    Error <rlang_error>
      In row 1, can't recycle input of size 0 to size 2.

