# separate_by_wider() errors about too few/too many values

    Code
      df %>% separate_by_wider(x, " ", names = c("a", "b"))
    Condition
      Error in `separate_by_wider()`:
      ! Expected 2 pieces in each element of `x`.
      ! 1 value was too short.
      i Use `align_short = "debug"` to diagnose the problem.
      i Use `align_short = "start"/"end"` to silence this message.
      ! 1 value was too long.
      i Use `align_long = "debug"` to diagnose the problem.
      i Use `align_long = "drop"/"merge"` to silence this message.

# separate_by_wider() validates its inputs

    Code
      df %>% separate_by_wider()
    Condition
      Error in `separate_by_wider()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_by_wider(x)
    Condition
      Error in `separate_by_wider()`:
      ! `sep` must be a single string, not absent.
    Code
      df %>% separate_by_wider(x, 1)
    Condition
      Error in `separate_by_wider()`:
      ! `sep` must be a single string, not the number 1.
    Code
      df %>% separate_by_wider(x, "")
    Condition
      Error in `separate_by_wider()`:
      ! Must specify at least one of `names` or `names_sep`.
    Code
      df %>% separate_by_wider(x, "", names = 1)
    Condition
      Error in `separate_by_wider()`:
      ! `names` must be a character vector or `NULL`, not the number 1.
    Code
      df %>% separate_by_wider(x, "", names = c(x = "x"))
    Condition
      Error in `separate_by_wider()`:
      ! `names` must be an unnamed character vector.
    Code
      df %>% separate_by_wider(x, "", names_sep = "_", align_long = "merge")
    Condition
      Error in `separate_by_wider()`:
      ! Must provide `names` when `align_long = "merge"`.

# separate_at_wider() errors if lengths are inconsistent

    Code
      df %>% separate_at_wider(x, widths = c(a = 2, b = 1))
    Condition
      Error in `separate_at_wider()`:
      ! Expected 3 characters in each element of `x`.
      ! 1 value was too short.
      i Use `align_short = "debug"` to diagnose the problem.
      i Use `align_short = "start"` to silence this message.
      ! 1 value was too long.
      i Use `align_long = "debug"` to diagnose the problem.
      i Use `align_long = "drop"` to silence this message.

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
      ! `widths` must be a named integer vector.
    Code
      df %>% separate_at_wider(x, widths = 1L)
    Condition
      Error in `separate_at_wider()`:
      ! `widths` must be a named integer vector.

# separate_regex_wider() errors if match fails

    Code
      df %>% separate_regex_wider(x, c(a = ".", "-", b = "\\d+"))
    Condition
      Error in `separate_regex_wider()`:
      ! Expected each value of `x` to match the pattern, the whole pattern, and nothing but the pattern.
      ! 1 value has problem.
      i Use `align_short = "debug"` to diagnose the problem.
      i Use `align_short = "start"` to silence this message.

# separate_regex_wider() gives informative error if () used

    Code
      df %>% separate_regex_wider(x, c(`_` = "(.)"))
    Condition
      Error in `separate_regex_wider()`:
      ! Invalid number of groups.
      i Did you use () instead of (?:) inside `patterns`?

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
      ! `patterns` must be a character vector, not absent.
    Code
      df %>% separate_regex_wider(x, patterns = ".")
    Condition
      Error in `separate_regex_wider()`:
      ! `patterns` must be a named character vector.

