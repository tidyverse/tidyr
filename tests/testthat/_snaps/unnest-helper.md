# `simplify` is validated

    Code
      (expect_error(df_simplify(data.frame(), simplify = 1)))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = NA)))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = list(1))))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! All elements of `simplify` must be named.
    Code
      (expect_error(df_simplify(data.frame(), simplify = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! The names of `simplify` must be unique.

# `ptype` is validated

    Code
      (expect_error(df_simplify(data.frame(), ptype = 1)))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! `ptype` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(df_simplify(data.frame(), ptype = list(1))))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! All elements of `ptype` must be named.
    Code
      (expect_error(df_simplify(data.frame(), ptype = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! The names of `ptype` must be unique.

# `transform` is validated

    Code
      (expect_error(df_simplify(data.frame(), transform = list(~.x))))
    Output
      <error/rlang_error>
      Error in `check_list_of_functions()`:
      ! All elements of `transform` must be named.
    Code
      (expect_error(df_simplify(data.frame(x = 1), transform = 1)))
    Output
      <error/rlang_error>
      Error in `map()`:
      ! Can't convert `.x[[i]]`, a number, to a function.
    Code
      (expect_error(df_simplify(data.frame(), transform = list(x = 1))))
    Output
      <error/rlang_error>
      Error in `map()`:
      ! Can't convert `.x[[i]]`, a number, to a function.
    Code
      (expect_error(df_simplify(data.frame(), transform = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      Error in `check_list_of_functions()`:
      ! The names of `transform` must be unique.

# ptype is applied after transform

    Code
      (expect_error(col_simplify(list(1, 2, 3), ptype = integer(), transform = ~ .x +
        1.5)))
    Output
      <error/vctrs_error_cast_lossy>
      Error in `col_simplify()`:
      ! Can't convert from `..1` <double> to <integer> due to loss of precision.
      * Locations: 1

