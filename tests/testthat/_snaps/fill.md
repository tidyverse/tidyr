# validates its inputs

    Code
      df %>% fill(x, .direction = "foo")
    Condition
      Error in `fill()`:
      ! `.direction` must be one of "down", "up", "downup", or "updown", not "foo".

