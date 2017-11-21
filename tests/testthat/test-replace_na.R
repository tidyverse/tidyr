context("replace_na")


# vector ------------------------------------------------------------------

test_that("empty call does nothing", {
  x <- c(1, NA)
  expect_equal(replace_na(x), x)
})

test_that("missing values are replaced", {
  x <- c(1, NA)
  expect_equal(replace_na(x, 0), c(1, 0))
})

# data frame -------------------------------------------------------------

test_that("empty call does nothing", {
  df <- tibble(x = c(1, NA))
  out <- replace_na(df)
  expect_equal(out, df)
})

test_that("missing values are replaced", {
  df <- tibble(x = c(1, NA))
  out <- replace_na(df, list(x = 0))
  expect_equal(out$x, c(1, 0))
})

test_that("don't complain about variables that don't exist", {
  df <- tibble(a = c(1, NA))
  out <- replace_na(df, list(a = 100, b = 0))
  expect_equal(out, tibble(a = c(1, 100)))
})
