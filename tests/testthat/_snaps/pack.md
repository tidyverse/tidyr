# pack validates its inputs

    Code
      pack(1)
    Condition
      Error in `pack()`:
      ! `.data` must be a data frame, not a number.
    Code
      pack(df, c(a1, a2), c(b1, b2))
    Condition
      Error in `pack()`:
      ! All elements of `...` must be named
    Code
      pack(df, a = c(a1, a2), c(b1, b2))
    Condition
      Error in `pack()`:
      ! All elements of `...` must be named
    Code
      pack(df, a = c(a1, a2), .names_sep = 1)
    Condition
      Error in `pack()`:
      ! `.names_sep` must be a single string or `NULL`, not the number 1.

# unpack() validates its inputs

    Code
      unpack(1)
    Condition
      Error in `unpack()`:
      ! `data` must be a data frame, not a number.
    Code
      unpack(df)
    Condition
      Error in `unpack()`:
      ! `cols` is absent but must be supplied.
    Code
      unpack(df, y, names_sep = 1)
    Condition
      Error in `unpack()`:
      ! `names_sep` must be a single string or `NULL`, not the number 1.

