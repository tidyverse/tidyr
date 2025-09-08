# nested lists generate a cast error if they can't be cast to the ptype

    Code
      hoist(df, x, "b", .ptype = list(b = double()))
    Condition
      Error in `hoist()`:
      ! Can't convert `..1` <list> to <double>.

# non-vectors generate a cast error if a ptype is supplied

    Code
      hoist(df, x, "b", .ptype = list(b = integer()))
    Condition
      Error in `hoist()`:
      ! `..1` must be a vector, not a symbol.

# input validation catches problems

    Code
      hoist(df, y)
    Condition
      Error in `hoist()`:
      ! `.data[[.col]]` must be a list, not the number 1.

---

    Code
      hoist(df, x, 1)
    Condition
      Error in `hoist()`:
      ! All elements of `...` must be named.

---

    Code
      hoist(df, x, a = "a", a = "b")
    Condition
      Error in `hoist()`:
      ! The names of `...` must be unique.

# can't hoist() from a data frame column

    Code
      hoist(df, a, xx = 1)
    Condition
      Error in `hoist()`:
      ! `.data[[.col]]` must be a list, not a <tbl_df/tbl/data.frame> object.

# hoist() validates its inputs (#1224)

    Code
      hoist(1)
    Condition
      Error in `hoist()`:
      ! `.data` must be a data frame, not a number.

---

    Code
      hoist(df)
    Condition
      Error in `hoist()`:
      ! `.col` is absent but must be supplied.

---

    Code
      hoist(df, a, .remove = 1)
    Condition
      Error in `hoist()`:
      ! `.remove` must be `TRUE` or `FALSE`, not the number 1.

---

    Code
      hoist(df, a, .ptype = 1)
    Condition
      Error in `hoist()`:
      ! `.ptype` must be `NULL`, an empty ptype, or a named list of ptypes.

---

    Code
      hoist(df, a, .transform = 1)
    Condition
      Error in `hoist()`:
      ! `.transform` must be `NULL`, a function, or a named list of functions.

---

    Code
      hoist(df, a, .simplify = 1)
    Condition
      Error in `hoist()`:
      ! `.simplify` must be a list or a single `TRUE` or `FALSE`.

