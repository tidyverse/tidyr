context("fill")

test_that("all missings left unchanged", {
  df <- data_frame(x = c(NA, NA, NA))

  out <- fill(df, x)
  expect_equal(out$x, c(NA, NA, NA))
})

test_that("missings filled from last non-missing", {
  df <- data_frame(x = c(1, NA, NA))

  out <- fill(df, x)
  expect_equal(out$x, c(1, 1, 1))
})
