test_that("basic sanity checks for spec occur", {
  expect_snapshot(error = TRUE, {
    check_pivot_spec(1)
    check_pivot_spec(mtcars)
  })
})

test_that("`.name` column must be a character vector", {
  df <- tibble(.name = 1:2, .value = c("a", "b"))
  expect_snapshot(check_pivot_spec(df), error = TRUE)
})

test_that("`.value` column must be a character vector", {
  df <- tibble(.name = c("x", "y"), .value = 1:2)
  expect_snapshot(check_pivot_spec(df), error = TRUE)
})

test_that("`.name` column must be unique", {
  df <- tibble(.name = c("x", "x"), .value = c("a", "b"))
  expect_snapshot(check_pivot_spec(df), error = TRUE)
})
