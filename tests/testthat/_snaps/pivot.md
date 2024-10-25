# basic sanity checks for spec occur

    Code
      check_pivot_spec(1)
    Condition
      Error:
      ! `spec` must be a data frame, not a number.
    Code
      check_pivot_spec(mtcars)
    Condition
      Error:
      ! `spec` must have `.name` and `.value` columns.

# `.name` column must be a character vector

    Code
      check_pivot_spec(df)
    Condition
      Error:
      ! `spec$.name` must be a character vector, not an integer vector.

# `.value` column must be a character vector

    Code
      check_pivot_spec(df)
    Condition
      Error:
      ! `spec$.value` must be a character vector, not an integer vector.

# `.name` column must be unique

    Code
      check_pivot_spec(df)
    Condition
      Error:
      ! `spec$.name` must be unique.

