# errors are raised

    Code
      (expect_error(drop_na(df, list())))
    Output
      <error/vctrs_error_subscript_type>
      Must subset columns with a valid subscript vector.
      x Subscript has the wrong type `list`.
      i It must be numeric or character.

---

    Code
      (expect_error(drop_na(df, "z")))
    Output
      <error/vctrs_error_subscript_oob>
      Can't subset columns that don't exist.
      x Column `z` doesn't exist.

