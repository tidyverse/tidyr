# errors are raised

    Code
      drop_na(df, list())
    Condition
      Error in `drop_na()`:
      ! Can't select columns with `list()`.
      x `list()` must be numeric or character, not an empty list.

---

    Code
      drop_na(df, "z")
    Condition
      Error in `drop_na()`:
      ! Can't select columns that don't exist.
      x Column `z` doesn't exist.

