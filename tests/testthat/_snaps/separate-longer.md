# separate_longer_delim() validates its inputs

    Code
      df %>% separate_longer_delim()
    Error <rlang_error>
      Argument `cols` is missing with no default
    Code
      df %>% separate_longer_delim(x, delim = 1)
    Error <rlang_error>
      `delim` must be a string

# separate_longer_fixed() validates its inputs

    Code
      df %>% separate_longer_fixed()
    Error <rlang_error>
      Argument `cols` is missing with no default
    Code
      df %>% separate_longer_fixed(y, width = 1.5)
    Error <rlang_error>
      `width` must be an integer

