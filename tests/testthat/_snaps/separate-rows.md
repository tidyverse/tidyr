# it validates its inputs

    Code
      separate_rows(df, x, sep = 1)
    Condition
      Error in `separate_rows()`:
      ! `sep` must be a single string, not the number 1.

---

    Code
      separate_rows(df, x, convert = 1)
    Condition
      Error in `separate_rows()`:
      ! `convert` must be `TRUE` or `FALSE`, not the number 1.

