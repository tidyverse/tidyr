# can only be length 0

    Code
      (expect_error(replace_na(1, 1:10)))
    Output
      <error/rlang_error>
      Error in `replace_na()`:
      ! Replacement for `data` must be length 1, not length 10.

# replacement must be castable to `data`

    Code
      (expect_error(replace_na(x, 1.5)))
    Output
      <error/vctrs_error_cast_lossy>
      Error in `vec_assign()`:
      ! Can't convert from `replace` <double> to `data` <integer> due to loss of precision.
      * Locations: 1

# replacement must be castable to corresponding column

    Code
      (expect_error(replace_na(df, list(a = 1.5))))
    Output
      <error/vctrs_error_cast_lossy>
      Error in `vec_assign()`:
      ! Can't convert from `replace$a` <double> to `data$a` <integer> due to loss of precision.
      * Locations: 1

# validates its inputs

    Code
      replace_na(df, replace = 1)
    Condition
      Error in `replace_na()`:
      ! `replace` must be a list, not a number.

