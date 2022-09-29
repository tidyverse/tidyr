# separate_by_wider() warns about too few/too many values

    Expected 2 pieces in each row.
    * 1 rows were too long: 3.
    * 1 rows were too short: 1.

# separate_by_wider() validates its inputs

    Code
      df %>% separate_by_wider()
    Condition
      Error in `separate_by_wider()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_by_wider(x, names = 1)
    Condition
      Error in `fun()`:
      ! `names` must be an unnamed character vector
    Code
      df %>% separate_by_wider(x, names = c(x = "x"))
    Condition
      Error in `fun()`:
      ! `names` must be an unnamed character vector
    Code
      df %>% separate_by_wider(x, names = "y", delim = 1)
    Condition
      Error in `fun()`:
      ! `delim` must be a string
    Code
      df %>% separate_by_wider(x, delim = "")
    Condition
      Error in `separate_by_wider()`:
      ! Must specify at least one of `names` or `names_sep`

# separate_at_wider() fills too short with NA

    Expected 2 pieces in each row.
    * 1 rows were too short: 1.

# separate_at_wider() validates its inputs

    Code
      df %>% separate_at_wider()
    Condition
      Error in `separate_at_wider()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_at_wider(x, widths = 1.5)
    Condition
      Error in `fun()`:
      ! `widths` must be a named integer vector
    Code
      df %>% separate_at_wider(x, widths = 1L)
    Condition
      Error in `fun()`:
      ! `widths` must be a named integer vector

# separate_group_wider() gives informative error if () used

    Code
      df %>% separate_group_wider(x, c(`_` = "(.)"))
    Condition
      Error in `fun()`:
      ! Invalid number of groups
      i Did you use () instead of (?:) inside a pattern?

# separate_group_widerp() requires complete match by default

    Failed to match 1 rows: 1

# separate_group_wider() validates its inputs

    Code
      df %>% separate_group_wider()
    Condition
      Error in `separate_group_wider()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_group_wider(x, patterns = ".")
    Condition
      Error in `fun()`:
      ! `patterns` must be a named character vector
    Code
      df %>% separate_group_wider(x, patterns = c(y = "."), match_complete = NA)
    Condition
      Error in `fun()`:
      ! `match_complete` must be TRUE or FALSE

