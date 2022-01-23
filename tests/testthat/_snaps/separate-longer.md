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
      df %>% separate_longer_fixed(x, width = 1.5)
    Error <rlang_error>
      `width` must be an integer

# separate_longer_group() validates its inputs

    Code
      df %>% separate_longer_group()
    Error <rlang_error>
      Argument `cols` is missing with no default
    Code
      df %>% separate_longer_group(x, 1)
    Error <rlang_error>
      `pattern` must be a string
    Code
      df %>% separate_longer_group(x, "x")
    Error <rlang_error>
      `pattern` must contain at least one () capturing group

