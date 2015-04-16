context("expand")

test_that("can override column names", {
  df <- data.frame(x = 1:2, y = 1:2)

  expect_equal(names(expand(df, x, y)), c("x", "y"))
  expect_equal(names(expand(df, a = x, b = y)), c("a", "b"))
})

test_that("expand_ accepts character vectors", {
  df <- data.frame(x = 1:2, y = 1:2)

  expect_equal(names(expand_(df, c("x", "y"))), c("x", "y"))
  expect_equal(names(expand_(df, c(a = "x", b = "y"))), c("a", "b"))
})

test_that("expand_ accepts list of formulas", {
  df <- data.frame(x = 1:2, y = 1:2)
  expect_equal(names(expand_(df, c(~ x, ~y))), c("x", "y"))
})
