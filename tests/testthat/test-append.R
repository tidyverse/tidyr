context("test-append.R")

test_that("columns in y replace those in x", {
  df1 <- data.frame(x = 1)
  df2 <- data.frame(x = 2)

  expect_equal(append_df(df1, df2), df2)
})

test_that("after must be integer or character", {
  df1 <- data.frame(x = 1)
  df2 <- data.frame(x = 2)

  expect_error(append_df(df1, df2, after = 1), "must be character or integer")
})


test_that("can append at any integer position", {
  df1 <- data.frame(x = 1, y = 2)
  df2 <- data.frame(a = 1)

  expect_named(append_df(df1, df2, 0L), c("a", "x", "y"))
  expect_named(append_df(df1, df2, 1L), c("x", "a", "y"))
  expect_named(append_df(df1, df2, 2L), c("x", "y", "a"))
})

test_that("can append at any character position", {
  df1 <- data.frame(x = 1, y = 2)
  df2 <- data.frame(a = 1)

  expect_named(append_df(df1, df2, "x"), c("x", "a", "y"))
  expect_named(append_df(df1, df2, "y"), c("x", "y", "a"))
})

test_that("can replace at any character position ", {
  df1 <- data.frame(x = 1, y = 2, z = 3)
  df2 <- data.frame(a = 1)

  expect_named(append_df(df1, df2, "x", remove = TRUE), c("a", "y", "z"))
  expect_named(append_df(df1, df2, "y", remove = TRUE), c("x", "a", "z"))
  expect_named(append_df(df1, df2, "z", remove = TRUE), c("x", "y", "a"))
})
