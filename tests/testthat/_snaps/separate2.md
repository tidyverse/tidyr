# separate_wider_delim() warns about too few/too many values

    Expected 2 pieces in each row.
    * Dropped extra pieces in 1 rows: 3.
    * Filled in missing pieces in 1 rows: 1.

# separate_wider_delim() validates its inputs

    Code
      df %>% separate_wider_delim()
    Error <rlang_error>
      Argument `cols` is missing with no default
    Code
      df %>% separate_wider_delim(x, into = 1)
    Error <rlang_error>
      `into` must be an unnamed character vector
    Code
      df %>% separate_wider_delim(x, into = c(x = "x"))
    Error <rlang_error>
      `into` must be an unnamed character vector
    Code
      df %>% separate_wider_delim(x, into = "y", delim = 1)
    Error <rlang_error>
      `delim` must be a string

# separate_wider_fixed() validates its inputs

    Code
      df %>% separate_wider_fixed()
    Error <rlang_error>
      Argument `cols` is missing with no default
    Code
      df %>% separate_wider_fixed(x, widths = 1.5)
    Error <rlang_error>
      `widths` must be a named integer vector
    Code
      df %>% separate_wider_fixed(x, widths = 1L)
    Error <rlang_error>
      `widths` must be a named integer vector

# separate_wider_regex() validates its inputs

    Code
      df %>% separate_wider_regex()
    Error <rlang_error>
      Argument `cols` is missing with no default
    Code
      df %>% separate_wider_regex(x, patterns = ".")
    Error <rlang_error>
      `patterns` must be a named character vector
    Code
      df %>% separate_wider_regex(x, patterns = c(y = "."), match_complete = NA)
    Error <rlang_error>
      `match_complete` must be TRUE or FALSE

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

