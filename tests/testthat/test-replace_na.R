context("replace_na")

test_that("empty call does nothing", {
  df <- data_frame(x = c(1, NA))
  out <- replace_na(df)

  expect_equal(out, df)
})

test_that("missing values are replaced", {
  df <- data_frame(x = c(1, NA))
  out <- replace_na(df, list(x = 0))

  expect_equal(out$x, c(1, 0))

  out2 <- replace_na(df, x = 0)
  expect_equal(out2$x, c(1, 0))
})

test_that("columns can be replaced with other columns or expressions", {
  df <- dplyr::data_frame(x = c(1, 2, NA), y = c(3, NA, 4))

  out <- replace_na(df, x = y)
  expect_equal(out$x, c(1, 2, 4))
  expect_equal(df$y, out$y)

  out <- replace_na(df, y = x)
  expect_equal(out$y, c(3, 2, 4))
  expect_equal(df$x, out$x)

  out <- replace_na(df, x = y, y = x)
  expect_equal(out$x, c(1, 2, 4))
  expect_equal(out$y, c(3, 2, 4))
})

test_that("columns can be replaced with expressions", {
  df <- dplyr::data_frame(x = c(1, 2, NA), y = c(3, NA, 4))

  out <- replace_na(df, x = y * 2)
  expect_equal(out$x, c(1, 2, 8))
  expect_equal(df$y, out$y)
})
