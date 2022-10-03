# separate_by_wider() warns about too few/too many values

    Expected 2 pieces in each row.
    * 1 rows were too short: 1.
    * 1 rows were too long: 3.

# separate_by_wider() validates its inputs

    Code
      df %>% separate_by_wider()
    Condition
      Error in `separate_by_wider()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_by_wider(x)
    Condition
      Error in `is_string()`:
      ! argument "sep" is missing, with no default
    Code
      df %>% separate_by_wider(x, 1)
    Condition
      Error in `separate_by_wider()`:
      ! `sep` must be a string
    Code
      df %>% separate_by_wider(x, "")
    Condition
      Error in `separate_by_wider()`:
      ! Must specify at least one of `names` or `names_sep`
    Code
      df %>% separate_by_wider(x, "", names = 1)
    Condition
      Error in `separate_by_wider()`:
      ! `names` must be an unnamed character vector
    Code
      df %>% separate_by_wider(x, "", names = c(x = "x"))
    Condition
      Error in `separate_by_wider()`:
      ! `names` must be an unnamed character vector

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
      df %>% separate_at_wider(x)
    Condition
      Error in `is_integerish()`:
      ! argument "widths" is missing, with no default
    Code
      df %>% separate_at_wider(x, widths = 1.5)
    Condition
      Error in `separate_at_wider()`:
      ! `widths` must be a named integer vector
    Code
      df %>% separate_at_wider(x, widths = 1L)
    Condition
      Error in `separate_at_wider()`:
      ! `widths` must be a named integer vector

# separate_regex_wider() gives informative error if () used

    Code
      df %>% separate_regex_wider(x, c(`_` = "(.)"))
    Condition
      Error in `fun()`:
      ! Invalid number of groups
      i Did you use () instead of (?:) inside a pattern?

# separate_regex_widerp() requires complete match by default

    Failed to match 1 rows: 1

# separate_regex_wider() validates its inputs

    Code
      df %>% separate_regex_wider()
    Condition
      Error in `separate_regex_wider()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_regex_wider(x)
    Condition
      Error in `separate_regex_wider()`:
      ! argument "patterns" is missing, with no default
    Code
      df %>% separate_regex_wider(x, patterns = ".")
    Condition
      Error in `separate_regex_wider()`:
      ! `patterns` must be a named character vector
    Code
      df %>% separate_regex_wider(x, patterns = c(y = "."), match_complete = NA)
    Condition
      Error in `separate_regex_wider()`:
      ! `match_complete` must be TRUE or FALSE

