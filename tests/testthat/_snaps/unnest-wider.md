# unnest_wider - bad inputs generate errors

    Code
      unnest_wider(df, y)
    Condition
      Error in `unnest_wider()`:
      i In column: `y`.
      i In row: 1.
      Caused by error:
      ! List-column must only contain vectors.

# can't unnest unnamed elements without `names_sep` (#1367)

    Code
      unnest_wider(df, col)
    Condition
      Error in `unnest_wider()`:
      i In column: `col`.
      i In row: 1.
      Caused by error:
      ! Can't unnest elements with missing names.
      i Supply `names_sep` to generate automatic names.

---

    Code
      unnest_wider(df, col)
    Condition
      Error in `unnest_wider()`:
      i In column: `col`.
      i In row: 1.
      Caused by error:
      ! Can't unnest elements with missing names.
      i Supply `names_sep` to generate automatic names.

---

    Code
      unnest_wider(df, col)
    Condition
      Error in `unnest_wider()`:
      i In column: `col`.
      i In row: 1.
      Caused by error:
      ! Can't unnest elements with missing names.
      i Supply `names_sep` to generate automatic names.

---

    Code
      unnest_wider(df, col)
    Condition
      Error in `unnest_wider()`:
      i In column: `col`.
      i In row: 2.
      Caused by error:
      ! Can't unnest elements with missing names.
      i Supply `names_sep` to generate automatic names.

# catches duplicate inner names in the same vector

    Code
      unnest_wider(df, col)
    Condition
      Error in `unnest_wider()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

---

    Code
      out <- unnest_wider(df, col, names_repair = "unique")
    Message
      New names:
      * `a` -> `a...1`
      * `a` -> `a...2`

# unnest_wider() advises on outer / inner name duplication (#1367)

    Code
      unnest_wider(df, y)
    Condition
      Error in `unnest_wider()`:
      ! Can't duplicate names between the affected columns and the original data.
      x These names are duplicated:
        i `x`, from `y`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

# unnest_wider() advises on inner / inner name duplication (#1367)

    Code
      unnest_wider(df, c(y, z))
    Condition
      Error in `unnest_wider()`:
      ! Can't duplicate names within the affected columns.
      x These names are duplicated:
        i `a`, within `y` and `z`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

# unnest_wider() validates its inputs

    Code
      unnest_wider(1)
    Condition
      Error in `unnest_wider()`:
      ! `data` must be a data frame, not a number.

---

    Code
      unnest_wider(df)
    Condition
      Error in `unnest_wider()`:
      ! `col` is absent but must be supplied.

---

    Code
      unnest_wider(df, x, names_sep = 1)
    Condition
      Error in `unnest_wider()`:
      ! `names_sep` must be a single string or `NULL`, not the number 1.

---

    Code
      unnest_wider(df, x, strict = 1)
    Condition
      Error in `unnest_wider()`:
      ! `strict` must be `TRUE` or `FALSE`, not the number 1.

