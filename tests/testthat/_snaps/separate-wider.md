# separate_wider_delim() errors about too few/too many values

    Code
      df %>% separate_wider_delim(x, " ", names = c("a", "b"))
    Condition
      Error in `separate_wider_delim()`:
      ! Expected 2 pieces in each element of `x`.
      ! 1 value was too short.
      i Use `too_few = "debug"` to diagnose the problem.
      i Use `too_few = "align_start"/"align_end"` to silence this message.
      ! 1 value was too long.
      i Use `too_many = "debug"` to diagnose the problem.
      i Use `too_many = "drop"/"merge"` to silence this message.

# separate_wider_delim() can diagnose problems

    Code
      out <- df %>% separate_wider_delim(x, " ", names = c("a", "b"), too_few = "debug",
      too_many = "debug", )
    Condition
      Warning:
      Debug mode activated: adding variables `x_ok`, `x_pieces`, and `x_remainder`.

# separate_wider_delim() validates its inputs

    Code
      df %>% separate_wider_delim()
    Condition
      Error in `separate_wider_delim()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_wider_delim(x)
    Condition
      Error in `separate_wider_delim()`:
      ! `delim` must be a single string, not absent.
    Code
      df %>% separate_wider_delim(x, 1)
    Condition
      Error in `separate_wider_delim()`:
      ! `delim` must be a single string, not the number 1.
    Code
      df %>% separate_wider_delim(x, "")
    Condition
      Error in `separate_wider_delim()`:
      ! `delim` must be a single string, not the empty string "".
    Code
      df %>% separate_wider_delim(x, "-")
    Condition
      Error in `separate_wider_delim()`:
      ! Must specify at least one of `names` or `names_sep`.
    Code
      df %>% separate_wider_delim(x, "-", names = 1)
    Condition
      Error in `separate_wider_delim()`:
      ! `names` must be a character vector or `NULL`, not the number 1.
    Code
      df %>% separate_wider_delim(x, "-", names = c(x = "x"))
    Condition
      Error in `separate_wider_delim()`:
      ! `names` must be an unnamed character vector.
    Code
      df %>% separate_wider_delim(x, "-", names_sep = "_", too_many = "merge")
    Condition
      Error in `separate_wider_delim()`:
      ! Must provide `names` when `too_many = "merge"`.

# separate_wider_position() errors if lengths are inconsistent

    Code
      df %>% separate_wider_position(x, widths = c(a = 2, b = 1))
    Condition
      Error in `separate_wider_position()`:
      ! Expected 3 characters in each element of `x`.
      ! 1 value was too short.
      i Use `too_few = "debug"` to diagnose the problem.
      i Use `too_few = "start"` to silence this message.
      ! 1 value was too long.
      i Use `too_many = "debug"` to diagnose the problem.
      i Use `too_many = "drop"` to silence this message.

# separate_wider_position() can diagnose problems

    Code
      out <- df %>% separate_wider_position(x, widths = c(a = 2, b = 1), too_few = "debug",
      too_many = "debug")
    Condition
      Warning:
      Debug mode activated: adding variables `x_ok`, `x_width`, and `x_remainder`.

# separate_wider_position() validates its inputs

    Code
      df %>% separate_wider_position()
    Condition
      Error in `separate_wider_position()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_wider_position(x)
    Condition
      Error in `separate_wider_position()`:
      ! `widths` is absent but must be supplied.
    Code
      df %>% separate_wider_position(x, widths = 1.5)
    Condition
      Error in `separate_wider_position()`:
      ! `widths` must be a (partially) named integer vector.
    Code
      df %>% separate_wider_position(x, widths = 1L)
    Condition
      Error in `separate_wider_position()`:
      ! `widths` must be a (partially) named integer vector.
    Code
      df %>% separate_wider_position(x, widths = c(x = 0))
    Condition
      Error in `separate_wider_position()`:
      ! All values of `widths` must be positive.

# separate_wider_regex() errors if match fails

    Code
      df %>% separate_wider_regex(x, c(a = ".", "-", b = "\\d+"))
    Condition
      Error in `separate_wider_regex()`:
      ! Expected each value of `x` to match the pattern, the whole pattern, and nothing but the pattern.
      ! 1 value has problem.
      i Use `too_few = "debug"` to diagnose the problem.
      i Use `too_few = "start"` to silence this message.

# separate_wider_regex() can diagnose errors

    Code
      out <- df %>% separate_wider_regex(x, c(a = "[a-z]", "-", b = "\\d+"), too_few = "debug")
    Condition
      Warning:
      Debug mode activated: adding variables `x_ok`, `x_matches`, and `x_remainder`.

# separate_wider_regex() gives informative error if () used

    Code
      df %>% separate_wider_regex(x, c(`_` = "(.)"))
    Condition
      Error in `separate_wider_regex()`:
      ! Invalid number of groups.
      i Did you use "()" instead of "(?:)" inside `patterns`?

# separate_wider_regex() advises on outer / inner name duplication (#1425)

    Code
      separate_wider_regex(df, y, patterns = c(x = ".", value = "."))
    Condition
      Error in `separate_wider_regex()`:
      ! Can't duplicate names between the affected columns and the original data.
      x These names are duplicated:
        i `x`, from `y`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

# separate_wider_regex() advises on inner / inner name duplication (#1425)

    Code
      separate_wider_regex(df, c(x, y), patterns = c(gender = ".", value = "."))
    Condition
      Error in `separate_wider_regex()`:
      ! Can't duplicate names within the affected columns.
      x These names are duplicated:
        i `gender`, within `x` and `y`.
        i `value`, within `x` and `y`.
      i Use `names_sep` to disambiguate using the column name.
      i Or use `names_repair` to specify a repair strategy.

# separate_wider_regex() validates its inputs

    Code
      df %>% separate_wider_regex()
    Condition
      Error in `separate_wider_regex()`:
      ! `cols` is absent but must be supplied.
    Code
      df %>% separate_wider_regex(x)
    Condition
      Error in `separate_wider_regex()`:
      ! `patterns` must be a character vector, not absent.
    Code
      df %>% separate_wider_regex(y, patterns = c(x = "-"))
    Condition
      Error in `separate_wider_regex()`:
      ! Can't subset columns that don't exist.
      x Column `y` doesn't exist.
    Code
      df %>% separate_wider_regex(x, patterns = ".")
    Condition
      Error in `separate_wider_regex()`:
      ! `patterns` must be a named character vector.

