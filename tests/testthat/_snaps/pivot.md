# basic sanity checks for spec occur

    Code
      (expect_error(check_spec(1)))
    Output
      <simpleError: `spec` must be a data frame>
    Code
      (expect_error(check_spec(mtcars)))
    Output
      <simpleError: `spec` must have `.name` and `.value` columns>

# `.name` column must be a character vector

    Code
      (expect_error(check_spec(df)))
    Output
      <error/rlang_error>
      Error in `check_spec()`: The `.name` column must be a character vector.

# `.value` column must be a character vector

    Code
      (expect_error(check_spec(df)))
    Output
      <error/rlang_error>
      Error in `check_spec()`: The `.value` column must be a character vector.

# `.name` column must be unique

    Code
      (expect_error(check_spec(df)))
    Output
      <error/rlang_error>
      Error in `check_spec()`: The `.name` column must be unique.

