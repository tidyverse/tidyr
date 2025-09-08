# separate_longer_delim() validates its inputs

    Code
      separate_longer_delim(df)
    Condition
      Error in `separate_longer_delim()`:
      ! `cols` is absent but must be supplied.

---

    Code
      separate_longer_delim(df, x, sep = 1)
    Condition
      Error in `separate_longer_delim()`:
      ! `delim` must be a single string, not absent.

# separate_longer_position() validates its inputs

    Code
      separate_longer_position(df)
    Condition
      Error in `separate_longer_position()`:
      ! `cols` is absent but must be supplied.

---

    Code
      separate_longer_position(df, y, width = 1)
    Condition
      Error in `separate_longer_position()`:
      ! Can't select columns that don't exist.
      x Column `y` doesn't exist.

---

    Code
      separate_longer_position(df, x, width = 1.5)
    Condition
      Error in `separate_longer_position()`:
      ! `width` must be a whole number, not the number 1.5.

