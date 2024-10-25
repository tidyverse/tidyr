test_that("columns in y replace those in x", {
  df1 <- data.frame(x = 1)
  df2 <- data.frame(x = 2)

  expect_equal(df_append(df1, df2), df2)
})

test_that("replaced columns retain the correct ordering (#1444)", {
  df1 <- data.frame(
    x = 1,
    y = 2,
    z = 3
  )
  df2 <- data.frame(x = 4)

  expect_identical(
    df_append(df1, df2, after = 0L),
    data.frame(x = 4, y = 2, z = 3)
  )
  expect_identical(
    df_append(df1, df2, after = 1L),
    data.frame(x = 4, y = 2, z = 3)
  )
  expect_identical(
    df_append(df1, df2, after = 2L),
    data.frame(y = 2, x = 4, z = 3)
  )
})

test_that("after must be integer or character", {
  df1 <- data.frame(x = 1)
  df2 <- data.frame(x = 2)

  expect_snapshot(df_append(df1, df2, after = 1.5), error = TRUE)
})

test_that("always returns a bare data frame", {
  df1 <- tibble(x = 1)
  df2 <- tibble(y = 2)

  expect_identical(df_append(df1, df2), data.frame(x = 1, y = 2))
})

test_that("retains row names of data.frame `x` (#1454)", {
  # These can't be restored by `reconstruct_tibble()`, so it is reasonable to
  # retain them. `dplyr:::dplyr_col_modify()` works similarly.
  df <- data.frame(x = 1:2, row.names = c("a", "b"))
  cols <- list(y = 3:4, z = 5:6)

  expect_identical(row.names(df_append(df, cols)), c("a", "b"))
  expect_identical(row.names(df_append(df, cols, after = 0)), c("a", "b"))
  expect_identical(row.names(df_append(df, cols, remove = TRUE)), c("a", "b"))
})

test_that("can append at any integer position", {
  df1 <- data.frame(x = 1, y = 2)
  df2 <- data.frame(a = 1)

  expect_named(df_append(df1, df2, 0L), c("a", "x", "y"))
  expect_named(df_append(df1, df2, 1L), c("x", "a", "y"))
  expect_named(df_append(df1, df2, 2L), c("x", "y", "a"))
})

test_that("can append at any character position", {
  df1 <- data.frame(x = 1, y = 2)
  df2 <- data.frame(a = 1)

  expect_named(df_append(df1, df2, "x"), c("x", "a", "y"))
  expect_named(df_append(df1, df2, "y"), c("x", "y", "a"))
})

test_that("can replace at any character position ", {
  df1 <- data.frame(x = 1, y = 2, z = 3)
  df2 <- data.frame(a = 1)

  expect_named(df_append(df1, df2, "x", remove = TRUE), c("a", "y", "z"))
  expect_named(df_append(df1, df2, "y", remove = TRUE), c("x", "a", "z"))
  expect_named(df_append(df1, df2, "z", remove = TRUE), c("x", "y", "a"))
})
