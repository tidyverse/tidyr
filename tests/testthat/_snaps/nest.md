# nest disallows renaming

    Code
      nest(df, data = c(a = x))
    Condition
      Error in `nest()`:
      ! In expression named `data`:
      Caused by error:
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

# warn about old style interface

    Code
      out <- nest(df, y)
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `data = y`?

---

    Code
      out <- nest(df, -y)
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `data = -y`?

# can use `.by` with old style interface

    Code
      out <- nest(df, y, .by = x)
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `data = y`?

---

    Code
      out <- nest(df, y, .by = x, .key = "foo")
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `foo = y`?

# only warn about unnamed inputs (#1175)

    Code
      out <- nest(df, x, y, foo = z)
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `data = c(x, y)`?

# unnamed expressions are kept in the warning

    Code
      out <- nest(df, x, starts_with("z"))
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `data = c(x, starts_with("z"))`?

# can control output column name

    Code
      out <- nest(df, y, .key = "y")
    Condition
      Warning:
      Supplying `...` without names was deprecated in tidyr 1.0.0.
      i Please specify a name for each selection.
      i Did you want `y = y`?

# .key gets warning with new interface

    Code
      out <- nest(df, y = y, .key = "foo")
    Condition
      Warning in `nest()`:
      Can't supply both `.key` and `...`.
      i `.key` will be ignored.

