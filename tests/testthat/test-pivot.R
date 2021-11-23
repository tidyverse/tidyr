test_that("basic sanity checks for spec occur", {
  expect_error(check_spec(1), "data.frame")
  expect_error(check_spec(mtcars), ".name")
})

test_that("`.name` column must be a character vector", {
  df <- tibble(.name = 1:2, .value = c("a", "b"))
  expect_snapshot((expect_error(check_spec(df))))
})

test_that("`.value` column must be a character vector", {
  df <- tibble(.name = c("x", "y"), .value = 1:2)
  expect_snapshot((expect_error(check_spec(df))))
})

test_that("`.name` column must be unique", {
  df <- tibble(.name = c("x", "x"), .value = c("a", "b"))
  expect_snapshot((expect_error(check_spec(df))))
})
