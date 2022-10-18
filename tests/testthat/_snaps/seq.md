# errors if sequence not regular

    Code
      full_seq(x, 1)
    Condition
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

