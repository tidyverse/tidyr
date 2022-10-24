# separate_longer_delim() validates its inputs

    Code
      df %>% separate_longer_delim()
    Condition
      Error in `separate_longer_delim()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_longer_delim(x, sep = 1)
    Condition
      Error in `separate_longer_delim()`:
      ! `delim` must be a single string, not absent.

# separate_longer_position() validates its inputs

    Code
      df %>% separate_longer_position()
    Condition
      Error in `separate_longer_position()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_longer_position(x, width = 1.5)
    Condition
      Error in `separate_longer_position()`:
      ! `width` must be an integer

