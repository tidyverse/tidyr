# pack disallows renaming

    Code
      pack(df, data = c(a = x))
    Condition
      Error in `pack()`:
      ! Can't rename variables in this context.

---

    Code
      pack(df, data1 = x, data2 = c(a = y))
    Condition
      Error in `pack()`:
      ! Can't rename variables in this context.

# pack validates its inputs

    Code
      pack(1)
    Condition
      Error in `pack()`:
      ! `.data` must be a data frame, not a number.
    Code
      pack(df, c(a1, a2), c(b1, b2))
    Condition
      Error in `pack()`:
      ! All elements of `...` must be named.
    Code
      pack(df, a = c(a1, a2), c(b1, b2))
    Condition
      Error in `pack()`:
      ! All elements of `...` must be named.
    Code
      pack(df, a = c(a1, a2), .names_sep = 1)
    Condition
      Error in `pack()`:
      ! `.names_sep` must be a single string or `NULL`, not the number 1.

# catches across inner name duplication (#1425)

    Code
      unpack(df, c(x, y))
    Condition
      Error in `unpack()`:
      ! Can't duplicate names within the affected columns.
      x These names are duplicated:
        i `b`, within `x` and `y`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

---

    Code
      unpack(df, c(x, y, z))
    Condition
      Error in `unpack()`:
      ! Can't duplicate names within the affected columns.
      x These names are duplicated:
        i `a`, within `x` and `z`.
        i `b`, within `x`, `y`, and `z`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

# catches outer / inner name duplication (#1367)

    Code
      unpack(df, d)
    Condition
      Error in `unpack()`:
      ! Can't duplicate names between the affected columns and the original data.
      x These names are duplicated:
        i `a`, from `d`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

---

    Code
      unpack(df, c(d, e, f))
    Condition
      Error in `unpack()`:
      ! Can't duplicate names between the affected columns and the original data.
      x These names are duplicated:
        i `a`, from `d`.
        i `b` and `c`, from `f`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

# duplication errors aren't triggered on duplicates within a single column you are unpacking

    Code
      unpack(df, x)
    Condition
      Error in `unpack()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

# unpack disallows renaming

    Code
      unpack(df, c(y = x))
    Condition
      Error in `unpack()`:
      ! Can't rename variables in this context.

# unpack() validates its inputs

    Code
      unpack(1)
    Condition
      Error in `unpack()`:
      ! `data` must be a data frame, not a number.
    Code
      unpack(df)
    Condition
      Error in `unpack()`:
      ! `cols` is absent but must be supplied.
    Code
      unpack(df, y, names_sep = 1)
    Condition
      Error in `unpack()`:
      ! `names_sep` must be a single string or `NULL`, not the number 1.

