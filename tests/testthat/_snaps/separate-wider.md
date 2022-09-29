# separate_wider_delim() validates its inputs

    Code
      df %>% separate_wider_delim()
    Condition
      Error in `separate_wider_delim()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_wider_delim(x, names = 1)
    Condition
      Error in `fun()`:
      ! `names` must be an unnamed character vector
    Code
      df %>% separate_wider_delim(x, names = c(x = "x"))
    Condition
      Error in `fun()`:
      ! `names` must be an unnamed character vector
    Code
      df %>% separate_wider_delim(x, names = "y", delim = 1)
    Condition
      Error in `fun()`:
      ! `delim` must be a string
    Code
      df %>% separate_wider_delim(x, delim = "")
    Condition
      Error in `separate_wider_delim()`:
      ! Must specify at least one of `names` or `names_sep`

# separate_wider_fixed() validates its inputs

    Code
      df %>% separate_wider_fixed()
    Condition
      Error in `separate_wider_fixed()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_wider_fixed(x, widths = 1.5)
    Condition
      Error in `fun()`:
      ! `widths` must be a named integer vector
    Code
      df %>% separate_wider_fixed(x, widths = 1L)
    Condition
      Error in `fun()`:
      ! `widths` must be a named integer vector

# separate_wider_regex() gives informative error if () used

    Code
      df %>% separate_wider_regex(x, c(`_` = "(.)"))
    Condition
      Error in `fun()`:
      ! Invalid number of groups
      i Did you use () instead of (?:) inside a pattern?

# separate_wider_regexp() requires complete match by default

    Failed to match 1 rows: 1

# separate_wider_regex() validates its inputs

    Code
      df %>% separate_wider_regex()
    Condition
      Error in `separate_wider_regex()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_wider_regex(x, patterns = ".")
    Condition
      Error in `fun()`:
      ! `patterns` must be a named character vector
    Code
      df %>% separate_wider_regex(x, patterns = c(y = "."), match_complete = NA)
    Condition
      Error in `fun()`:
      ! `match_complete` must be TRUE or FALSE

