# nest disallows renaming

    Code
      nest(df, data = c(a = x))
    Condition
      Error in `nest()`:
      ! Can't rename variables in this context.

---

    Code
      nest(df, .by = c(a = x))
    Condition
      Error in `nest()`:
      ! Can't rename variables in this context.

# catches when `...` overwrites an existing column

    Code
      nest(df, x = y)
    Condition
      Error in `nest()`:
      ! Names must be unique.
      x These names are duplicated:
        * "x" at locations 1 and 2.

# validates its inputs

    Code
      nest(df, y = ya:yb, .names_sep = 1)
    Condition
      Error in `nest()`:
      ! `.names_sep` must be a single string or `NULL`, not the number 1.

---

    Code
      nest(df, y = ya:yb, .key = 1)
    Condition
      Error in `nest()`:
      ! `.key` must be a single string, not the number 1.

# warns if `.key` is supplied alongside `...`

    Code
      out <- nest_info(df, data = 2, .key = "foo")
    Condition
      Warning:
      Can't supply both `.key` and `...`.
      i `.key` will be ignored.

---

    Code
      out <- nest(df, data = 2, .key = "foo")
    Condition
      Warning in `nest()`:
      Can't supply both `.key` and `...`.
      i `.key` will be ignored.

# `.by` isn't allowed for grouped data frames

    Code
      nest(df, .by = x)
    Condition
      Error in `nest()`:
      ! Can't supply `.by` when `.data` is a grouped data frame.

# errors on old style interface

    Code
      nest(df, y)
    Condition
      Error:
      ! Supplying `...` without names was deprecated in tidyr 1.0.0 and is now defunct.
      i Please specify a name for each selection.
      i Did you want `data = y`?

---

    Code
      nest(df, -y)
    Condition
      Error:
      ! Supplying `...` without names was deprecated in tidyr 1.0.0 and is now defunct.
      i Please specify a name for each selection.
      i Did you want `data = -y`?

# only mention unnamed inputs in our advice (#1175)

    Code
      nest(df, x, y, foo = z)
    Condition
      Error:
      ! Supplying `...` without names was deprecated in tidyr 1.0.0 and is now defunct.
      i Please specify a name for each selection.
      i Did you want `data = c(x, y)`?

# unnamed expressions are kept in the error message

    Code
      nest(df, x, starts_with("z"))
    Condition
      Error:
      ! Supplying `...` without names was deprecated in tidyr 1.0.0 and is now defunct.
      i Please specify a name for each selection.
      i Did you want `data = c(x, starts_with("z"))`?

# `.key` is mentioned in the error message

    Code
      nest(df, y, .key = "y")
    Condition
      Error:
      ! Supplying `...` without names was deprecated in tidyr 1.0.0 and is now defunct.
      i Please specify a name for each selection.
      i Did you want `y = y`?

# .key gets warning with new interface

    Code
      out <- nest(df, y = y, .key = "foo")
    Condition
      Warning in `nest()`:
      Can't supply both `.key` and `...`.
      i `.key` will be ignored.

