# nested lists generate a cast error if they can't be cast to the ptype

    Code
      (expect_error(hoist(df, x, "b", .ptype = list(b = double()))))
    Output
      <error/vctrs_error_cast>
      Error in `col_simplify()`:
      ! Can't convert `..1` <list> to <double>.

# non-vectors generate a cast error if a ptype is supplied

    Code
      (expect_error(hoist(df, x, "b", .ptype = list(b = integer()))))
    Output
      <error/vctrs_error_scalar_type>
      Error in `col_simplify()`:
      ! `..1` must be a vector, not a symbol.

# input validation catches problems

    Code
      (expect_error(df %>% hoist(y)))
    Output
      <error/rlang_error>
      Error in `hoist()`:
      ! `.col` must identify a list-column.
    Code
      (expect_error(df %>% hoist(x, 1)))
    Output
      <error/rlang_error>
      Error in `check_pluckers()`:
      ! All elements of `...` must be named.
    Code
      (expect_error(df %>% hoist(x, a = "a", a = "b")))
    Output
      <error/rlang_error>
      Error in `check_pluckers()`:
      ! The names of `...` must be unique.

# can't hoist() from a data frame column

    Code
      (expect_error(hoist(df, a, xx = 1)))
    Output
      <error/rlang_error>
      Error in `hoist()`:
      ! `.col` must identify a list-column.

# hoist() input must be a data frame (#1224)

    Code
      (expect_error(hoist(1)))
    Output
      <error/rlang_error>
      Error in `hoist()`:
      ! `.data` must be a data frame.

