# informative error message if wrong number of groups

    Code
      extract(df, x, "y", ".")
    Condition <rlang_error>
      Error in `extract()`:
      ! `regex` should define 1 groups; 0 found.
    Code
      extract(df, x, c("y", "z"), ".")
    Condition <rlang_error>
      Error in `extract()`:
      ! `regex` should define 2 groups; 0 found.

# informative error if using stringr modifier functions (#693)

    Code
      extract(df, x, "x", regex = regex)
    Condition <rlang_error>
      Error in `extract()`:
      ! `regex` can't use modifiers from stringr.

# validates its inputs

    Code
      df %>% extract()
    Condition
      Error in `extract()`:
      ! `col` is absent but must be supplied.
    Code
      df %>% extract(x, regex = 1)
    Condition
      Error in `extract()`:
      ! `regex` must be a single string, not the number 1.
    Code
      df %>% extract(x, into = 1:3)
    Condition
      Error in `extract()`:
      ! `into` must be a character vector, not an integer vector.
    Code
      df %>% extract(x, into = "x", convert = 1)
    Condition
      Error in `extract()`:
      ! `convert` must be `TRUE` or `FALSE`, not the number 1.

