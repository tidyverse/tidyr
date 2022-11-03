# errors are raised

    Code
      (expect_error(drop_na(df, list())))
    Output
      <error/vctrs_error_subscript_type>
      Error in `drop_na()`:
      ! Can't subset columns with `list()`.
      x `list()` must be numeric or character, not an empty list.

---

    Code
      (expect_error(drop_na(df, "z")))
    Output
      <error/vctrs_error_subscript_oob>
      Error in `drop_na()`:
      ! Can't subset columns that don't exist.
      x Column `z` doesn't exist.

