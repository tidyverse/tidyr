context("complete")

test_that("complete with no variables returns data as is", {
  expect_equal(complete(mtcars), mtcars)
})

test_that("basic invocation works", {
  df <- tibble(x = 1:2, y = 1:2, z = 3:4)
  out <- complete(df, x, y)
  expect_equal(nrow(out), 4)
  expect_equal(out$z, c(3, NA, NA, 4))
})

test_that("preserves grouping", {
  df <- tibble(x = 1:2, y = 1:2, z = 3:4) %>% dplyr::group_by(x)
  out <- complete(df, x, y)
  expect_s3_class(out, "grouped_df")
  expect_equal(dplyr::groups(out), dplyr::groups(df))
})

test_that("expands empty factors", {
  f <- factor(levels = c("a", "b", "c"))
  df <- tibble(one = f, two = f)

  expect_equal(nrow(complete(df, one, two)), 9)
  expect_equal(ncol(complete(df, one, two)), 2)
})

test_that("empty expansion returns original", {
  df <- tibble(x = character())
  rs <- complete(df, y = integer())
  expect_equal(rs, df)

  df <- tibble(x = 1:4)
  rs <- complete(df, y = integer())
  expect_equal(rs, df)
})
