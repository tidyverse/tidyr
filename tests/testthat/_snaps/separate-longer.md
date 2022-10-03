# separate_by_longer() validates its inputs

    Code
      df %>% separate_by_longer()
    Condition
      Error in `separate_by_longer()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_by_longer(x, sep = 1)
    Condition
      Error in `separate_by_longer()`:
      ! `sep` must be a string

# separate_at_longer() validates its inputs

    Code
      df %>% separate_at_longer()
    Condition
      Error in `separate_at_longer()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_at_longer(x, width = 1.5)
    Condition
      Error in `separate_at_longer()`:
      ! `width` must be an integer

