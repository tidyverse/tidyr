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
      df %>% separate_wider_delim(x, names = 1)
    Error <rlang_error>
      `names` must be an unnamed character vector
    Code
      df %>% separate_wider_delim(x, names = c(x = "x"))
    Error <rlang_error>
      `names` must be an unnamed character vector
    Code
      df %>% separate_wider_delim(x, names = "y", delim = 1)
    Error <rlang_error>
      `delim` must be a string
    Code
      df %>% separate_wider_delim(x, delim = "")
    Error <rlang_error>
      Must specify one of `names` or `names_sep`
    Code
      df %>% separate_wider_delim(x, names = "y", names_sep = "")
    Error <rlang_error>
      Must specify one of `names` or `names_sep`

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

