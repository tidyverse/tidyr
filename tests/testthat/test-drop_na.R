context("drop_na")

test_that("empty call drops every row", {
  df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- data_frame(x = c(1), y = c("a"))
  res <- tidyr::drop_na(df)
  expect_equal(res, exp)
})

test_that("specifying (a) variables considers only that variable(s)", {
  df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- data_frame(x = c(1, 2), y = c("a", NA))
  res <- tidyr::drop_na(df, x)
  expect_equal(res, exp)
  exp <- data_frame(x = c(1), y = c("a"))
  res <- tidyr::drop_na(df, dplyr::everything())
  expect_equal(res, exp)
})

test_that("empty call drops every row (NSE version)", {
  df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- data_frame(x = c(1), y = c("a"))
  res <- tidyr::drop_na_(df, character())
  expect_equal(res, exp)
  res <- tidyr::drop_na_(df, NULL)
  expect_equal(res, exp)
})

test_that("specifying (a) variable(s) considers only that variable(s) (NSE version)", {
  df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- data_frame(x = c(1, 2), y = c("a", NA))
  res <- tidyr::drop_na_(df, "x")
  expect_equal(res, exp)
  exp <- data_frame(x = c(1), y = c("a"))
  res <- tidyr::drop_na_(df, c("x", "y"))
  expect_equal(res, exp)
})
