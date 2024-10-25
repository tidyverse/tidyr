# `simplify` is validated

    Code
      df_simplify(data.frame(), simplify = 1)
    Condition
      Error:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      df_simplify(data.frame(), simplify = NA)
    Condition
      Error:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      df_simplify(data.frame(), simplify = c(TRUE, FALSE))
    Condition
      Error:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      df_simplify(data.frame(), simplify = list(1))
    Condition
      Error:
      ! All elements of `simplify` must be named.
    Code
      df_simplify(data.frame(), simplify = list(x = 1, x = 1))
    Condition
      Error:
      ! The names of `simplify` must be unique.

# `ptype` is validated

    Code
      df_simplify(data.frame(), ptype = 1)
    Condition
      Error:
      ! `ptype` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      df_simplify(data.frame(), ptype = list(1))
    Condition
      Error:
      ! All elements of `ptype` must be named.
    Code
      df_simplify(data.frame(), ptype = list(x = 1, x = 1))
    Condition
      Error:
      ! The names of `ptype` must be unique.

# `transform` is validated

    Code
      df_simplify(data.frame(), transform = list(~.x))
    Condition
      Error:
      ! All elements of `transform` must be named.
    Code
      df_simplify(data.frame(x = 1), transform = 1)
    Condition
      Error:
      ! `transform` must be `NULL`, a function, or a named list of functions.
    Code
      df_simplify(data.frame(), transform = list(x = 1))
    Condition
      Error:
      ! Can't convert `transform$x`, a double vector, to a function.
    Code
      df_simplify(data.frame(), transform = list(x = 1, x = 1))
    Condition
      Error:
      ! The names of `transform` must be unique.

# ptype is applied after transform

    Code
      col_simplify(list(1, 2, 3), ptype = integer(), transform = ~ .x + 1.5)
    Condition
      Error:
      ! Can't convert from `..1` <double> to <integer> due to loss of precision.
      * Locations: 1

