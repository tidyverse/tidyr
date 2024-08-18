# validates its inputs

    Code
      df %>% fill(x, .direction = "foo")
    Condition
      Error in `fill()`:
      ! `.direction` must be one of "down", "up", "downup", or "updown", not "foo".

# fill works with .by

    Code
      df %>% fill(y, .by = z)
    Condition
      Error in `fill()`:
      ! Can't select columns that don't exist.
      x Column `z` doesn't exist.

