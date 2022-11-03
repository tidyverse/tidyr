# unnest_longer - bad inputs generate errors

    Code
      (expect_error(unnest_longer(df, y)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! List-column `y` must contain only vectors.

# can't mix `indices_to` with `indices_include = FALSE`

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = "x", indices_include = FALSE))
      )
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! Can't use `indices_include = FALSE` when `indices_to` is supplied.

# unnest_longer() validates its inputs

    Code
      unnest_longer(1)
    Condition
      Error in `unnest_longer()`:
      ! `data` must be a data frame, not a number.
    Code
      unnest_longer(df)
    Condition
      Error in `unnest_longer()`:
      ! `col` is absent but must be supplied.
    Code
      unnest_longer(df, x, indices_to = "")
    Condition
      Error in `unnest_longer()`:
      ! `indices_to` must be a valid name or `NULL`, not the empty string "".
    Code
      unnest_longer(df, x, indices_include = 1)
    Condition
      Error in `unnest_longer()`:
      ! `indices_include` must be `TRUE`, `FALSE`, or `NULL`, not the number 1.
    Code
      unnest_longer(df, x, values_to = "")
    Condition
      Error in `unnest_longer()`:
      ! `values_to` must be a valid name or `NULL`, not the empty string "".

# `values_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `values_to` must be a valid name or `NULL`, not the number 1.
    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `values_to` must be a valid name or `NULL`, not a character vector.

# `indices_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_to` must be a valid name or `NULL`, not the number 1.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_to` must be a valid name or `NULL`, not a character vector.

# `indices_include` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_include` must be `TRUE`, `FALSE`, or `NULL`, not the number 1.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_include` must be `TRUE`, `FALSE`, or `NULL`, not a logical vector.

