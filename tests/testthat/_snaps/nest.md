# nesting no columns nests all inputs

    Code
      out <- nest(df)
    Condition
      Warning:
      `...` must not be empty for ungrouped data frames.
      Did you want `data = everything()`?

# warn about old style interface

    Code
      out <- nest(df, y)
    Condition
      Warning:
      All elements of `...` must be named.
      Did you want `data = y`?

---

    Code
      out <- nest(df, -y)
    Condition
      Warning:
      All elements of `...` must be named.
      Did you want `data = -y`?

# only warn about unnamed inputs (#1175)

    Code
      out <- nest(df, x, y, foo = z)
    Condition
      Warning:
      All elements of `...` must be named.
      Did you want `data = c(x, y)`?

# unnamed expressions are kept in the warning

    Code
      out <- nest(df, x, starts_with("z"))
    Condition
      Warning:
      All elements of `...` must be named.
      Did you want `data = c(x, starts_with("z"))`?

# can control output column name

    Code
      out <- nest(df, y, .key = "y")
    Condition
      Warning:
      All elements of `...` must be named.
      Did you want `y = y`?

# can control output column name when nested

    Code
      out <- nest(df, .key = "y")
    Condition
      Warning:
      `.key` is deprecated

# .key gets warning with new interface

    Code
      out <- nest(df, y = y, .key = "y")
    Condition
      Warning:
      `.key` is deprecated

