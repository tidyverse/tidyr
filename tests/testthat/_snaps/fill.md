# errors on named `...` inputs

    Code
      fill(df, fooy = x)
    Condition
      Error in `fill()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * fooy = x

# validates its inputs

    Code
      fill(df, x, .direction = "foo")
    Condition
      Error in `fill()`:
      ! `.direction` must be one of "down", "up", "downup", or "updown", not "foo".

# `.by` can't select columns that don't exist

    Code
      fill(df, y, .by = z)
    Condition
      Error in `dplyr::mutate()`:
      ! Can't select columns that don't exist.
      x Column `z` doesn't exist.

# `.by` can't be used on a grouped data frame

    Code
      fill(df, y, .by = x)
    Condition
      Error in `dplyr::mutate()`:
      ! Can't supply `.by` when `.data` is a grouped data frame.

