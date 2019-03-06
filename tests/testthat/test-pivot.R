context("test-pivot")

test_that("basic sanity checks for spec occur", {
  expect_error(check_spec(1), "data.frame")
  expect_error(check_spec(mtcars), ".name")
})
