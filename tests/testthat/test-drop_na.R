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
  res <- tidyr::drop_na(df, x:y)
  expect_equal(res, exp)
})

test_that("groups are preserved", {
  df <- data_frame(g = c("A", "A", "B"), x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- data_frame(g = c("A", "B"), x = c(1, NA), y = c("a", "b"))

  gdf <- dplyr::group_by_(df, "g")
  gexp <- dplyr::group_by_(exp, "g")

  res <- tidyr::drop_na_(gdf, "y")
  expect_equal(res, gexp)
  expect_equal(dplyr::groups(res), dplyr::groups(gexp))
})

test_that("empty call drops every row (NSE version)", {
  df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- data_frame(x = c(1), y = c("a"))
  res <- tidyr::drop_na_(df, character())
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

test_that("errors are raised", {
  df <- data_frame(x = c(1, 2, NA), y = c("a", NA, "b"))
  expect_error(tidyr::drop_na_(df, NULL), "not a character vector")
  expect_error(tidyr::drop_na_(df, 1), "not a character vector")
  expect_error(tidyr::drop_na_(df, "z"), "Unknown column")
})
