context("replace_na")

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
