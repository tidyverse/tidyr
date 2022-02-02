# basic sanity checks for spec occur

    Code
      (expect_error(check_pivot_spec(1)))
    Output
      <error/rlang_error>
      Error in `check_pivot_spec()`:
      ! `spec` must be a data frame.
    Code
      (expect_error(check_pivot_spec(mtcars)))
    Output
      <error/rlang_error>
      Error in `check_pivot_spec()`:
      ! `spec` must have `.name` and `.value` columns.

# `.name` column must be a character vector

    Code
      (expect_error(check_pivot_spec(df)))
    Output
      <error/rlang_error>
      Error in `check_pivot_spec()`:
      ! The `.name` column of `spec` must be a character vector.

# `.value` column must be a character vector

    Code
      (expect_error(check_pivot_spec(df)))
    Output
      <error/rlang_error>
      Error in `check_pivot_spec()`:
      ! The `.value` column of `spec` must be a character vector.

# `.name` column must be unique

    Code
      (expect_error(check_pivot_spec(df)))
    Output
      <error/rlang_error>
      Error in `check_pivot_spec()`:
      ! The `.name` column of `spec` must be unique.

