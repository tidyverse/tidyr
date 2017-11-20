context("test-uncount.R")

test_that("symbols weights are dropped in output", {
  df <- tibble(x = 1, w = 1)
  expect_equal(uncount(df, w), tibble(x = 1))
})

test_that("can request to preserve symbols", {
  df <- tibble(x = 1, w = 1)
  expect_equal(uncount(df, w, .remove = FALSE), df)
})

test_that("unique identifiers created on request", {
  df <- tibble(w = 1:3)
  expect_equal(uncount(df, w, .id = "id"), tibble(id = c(1L, 1:2, 1:3)))
})

test_that("expands constants and expressions", {
  df <- tibble(x = 1, w = 2)

  expect_equal(uncount(df, 2), df[c(1, 1), ])
  expect_equal(uncount(df, 1 + 1), df[c(1, 1), ])
})

test_that("must evaluate to numeric", {
  df <- tibble(x = 1)
  expect_error(uncount(df, "W"), "must evaluate to a numeric vector")
})
