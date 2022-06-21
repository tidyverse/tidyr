# unnest_longer - bad inputs generate errors

    Code
      (expect_error(unnest_longer(df, y)))
    Output
      <error/rlang_error>
      Error in `elt_to_long()`:
      ! Column `y` must contain a list of vectors.

# can't mix `indices_to` with `indices_include = FALSE`

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = "x", indices_include = FALSE))
      )
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! Can't set `indices_include` to `FALSE` when `indices_to` is supplied.

# unnest_longer() input must be a data frame (#1224)

    Code
      (expect_error(unnest_longer(1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `data` must be a data frame.

# `values_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `values_to` must be a single string or `NULL`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `values_to` must be a single string or `NULL`.

# `indices_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_to` must be a single string or `NULL`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_to` must be a single string or `NULL`.

# `indices_include` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_include` must be `NULL` or a single `TRUE` or `FALSE`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_include` must be `NULL` or a single `TRUE` or `FALSE`.

