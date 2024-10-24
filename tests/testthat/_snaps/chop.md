# chop() validates its input `cols` (#1205)

    Code
      chop(df$x)
    Condition
      Error in `chop()`:
      ! `data` must be a data frame, not an integer vector.

---

    Code
      chop(df)
    Condition
      Error in `chop()`:
      ! `cols` is absent but must be supplied.

# incompatible ptype mentions the column (#1477)

    Code
      unnest(df, data, ptype = list(data = integer()))
    Condition
      Error in `unnest()`:
      ! Can't convert `data[[2]]` <character> to <integer>.

# incompatible sizes are caught

    Code
      unchop(df, c(x, y))
    Condition
      Error in `unchop()`:
      ! In row 1, can't recycle input of size 2 to size 3.

# empty typed inputs are considered in common size, but NULLs aren't

    Code
      unchop(df, c(x, y))
    Condition
      Error in `unchop()`:
      ! In row 1, can't recycle input of size 0 to size 2.

# unchop disallows renaming

    Code
      unchop(df, c(y = x))
    Condition
      Error in `unchop()`:
      ! Can't rename variables in this context.

# unchop validates its inputs

    Code
      unchop(1:10)
    Condition
      Error in `unchop()`:
      ! `data` must be a data frame, not an integer vector.

---

    Code
      unchop(df)
    Condition
      Error in `unchop()`:
      ! `cols` is absent but must be supplied.

---

    Code
      unchop(df, col, keep_empty = 1)
    Condition
      Error in `unchop()`:
      ! `keep_empty` must be `TRUE` or `FALSE`, not the number 1.

---

    Code
      unchop(df, col, ptype = 1)
    Condition
      Error in `unchop()`:
      ! `ptype` must be `NULL`, an empty ptype, or a named list of ptypes.

