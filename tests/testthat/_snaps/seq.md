# full_seq errors if sequence isn't regular

    Code
      (expect_error(full_seq(c(1, 3, 4), 2)))
    Output
      <error/rlang_error>
      Error in `full_seq()`:
      ! `x` is not a regular sequence.
    Code
      (expect_error(full_seq(c(0, 10, 20), 11, tol = 1.8)))
    Output
      <error/rlang_error>
      Error in `full_seq()`:
      ! `x` is not a regular sequence.

# validates inputs

    Code
      full_seq(x, period = "a")
    Condition
      Error in `full_seq()`:
      ! `period` must be a number, not the string "a".
    Code
      full_seq(x, 1, tol = "a")
    Condition
      Error in `full_seq()`:
      ! `tol` must be a number, not the string "a".

