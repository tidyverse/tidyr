context("drop_na")

test_that("empty call drops every row", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- tibble(x = c(1), y = c("a"))
  res <- tidyr::drop_na(df)
  expect_equal(res, exp)
})

test_that("specifying (a) variables considers only that variable(s)", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- tibble(x = c(1, 2), y = c("a", NA))
  res <- tidyr::drop_na(df, x)
  expect_equal(res, exp)
  exp <- tibble(x = c(1), y = c("a"))
  res <- tidyr::drop_na(df, x:y)
  expect_equal(res, exp)
})

test_that("groups are preserved", {
  df <- tibble(g = c("A", "A", "B"), x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- tibble(g = c("A", "B"), x = c(1, NA), y = c("a", "b"))

  gdf <- dplyr::group_by(df, "g")
  gexp <- dplyr::group_by(exp, "g")

  res <- tidyr::drop_na(gdf, y)
  expect_equal(res, gexp)
  expect_equal(dplyr::groups(res), dplyr::groups(gexp))
})

test_that("empty call drops every row", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  res <- tidyr::drop_na(df)
  expect_identical(res, tibble(x = 1, y = "a"))
})

test_that("errors are raised", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  expect_error(tidyr::drop_na(df, NULL), "must resolve to integer column positions")
  expect_error(tidyr::drop_na(df, "z"), "must match column names")
})
