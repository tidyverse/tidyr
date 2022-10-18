# validates its inputs

    Code
      unite(df)
    Condition
      Error in `unite()`:
      ! `col` is absent but must be supplied.
    Code
      unite(df, "z", x:y, sep = 1)
    Condition
      Error in `unite()`:
      ! `sep` must be a single string, not the number 1.
    Code
      unite(df, "z", x:y, remove = 1)
    Condition
      Error in `unite()`:
      ! `remove` must be `TRUE` or `FALSE`, not the number 1.
    Code
      unite(df, "z", x:y, na.rm = 1)
    Condition
      Error in `unite()`:
      ! `na.rm` must be `TRUE` or `FALSE`, not the number 1.

