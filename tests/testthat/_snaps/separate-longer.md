# separate_longer_delim() validates its inputs

    Code
      df %>% separate_longer_delim()
    Condition
      Error in `separate_longer_delim()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_longer_delim(x, delim = 1)
    Condition
      Error in `separate_longer_delim()`:
      ! `delim` must be a string

# separate_longer_fixed() validates its inputs

    Code
      df %>% separate_longer_fixed()
    Condition
      Error in `separate_longer_fixed()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_longer_fixed(x, width = 1.5)
    Condition
      Error in `fun()`:
      ! `width` must be an integer

# separate_longer_group() validates its inputs

    Code
      df %>% separate_longer_group()
    Condition
      Error in `separate_longer_group()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_longer_group(x, 1)
    Condition
      Error in `fun()`:
      ! `pattern` must be a string
    Code
      df %>% separate_longer_group(x, "x")
    Condition
      Error in `fun()`:
      ! `pattern` must contain at least one () capturing group

