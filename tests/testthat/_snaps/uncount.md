# validates inputs

    Code
      uncount(df, y)
    Condition
      Error in `uncount()`:
      ! Can't convert `weights` <character> to <integer>.
    Code
      uncount(df, w)
    Condition
      Error in `uncount()`:
      ! `weights` must be a vector of positive numbers. Location 1 is negative.
    Code
      uncount(df, x, .remove = 1)
    Condition
      Error in `uncount()`:
      ! `.remove` must be `TRUE` or `FALSE`, not the number 1.
    Code
      uncount(df, x, .id = "")
    Condition
      Error in `uncount()`:
      ! `.id` must be a valid name or `NULL`, not the empty string "".

