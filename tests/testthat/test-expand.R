context("expand")

test_that("expand completes all values", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, x, y)

  expect_equal(nrow(out), 4)
})

test_that("multiple variables in one arg doesn't expand", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, c(x, y))
  expect_equal(nrow(out), 2)
})

test_that("expand_ accepts character vectors", {
  df <- data.frame(x = 1:2, y = 1:2)

  expect_equal(names(expand_(df, c("x", "y"))), c("x", "y"))
})

test_that("expand_ accepts list of formulas", {
  df <- data.frame(x = 1:2, y = 1:2)
  expect_equal(names(expand_(df, c(~ x, ~y))), c("x", "y"))
})

test_that("expand works with non-standard col names", {
  df <- dplyr::data_frame(` x ` = 1:2, `/y` = 1:2)
  out <- expand(df, ` x `, `/y`)

  expect_equal(nrow(out), 4)
})
