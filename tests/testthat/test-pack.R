context("test-pack")

# unpack ------------------------------------------------------------------

test_that("new cols use names if present", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(a = 2)))
  out <- unpack(df, y)

  expect_named(out, c("x", "a"))
})

test_that("unnamed components gets names from input", {
  df <- tibble(x = 1, y = list(1:2))
  out <- unpack(df, y)

  expect_named(out, c("x", "y1", "y2"))
})

test_that("ragged columns expand with NA", {
  df <- tibble(x = 1:3, y = list(integer(), 1, 1:2))
  out <- unpack(df, y)

  expect_equal(out$y1, c(NA, 1, 1))
  expect_equal(out$y2, c(NA, NA, 2))
})

test_that("nested dfs turn into list cols", {
  df <- tibble(x = 1, y = list(tibble(a = 1:2, b = 1:2)))
  out <- unpack(df, y)

  expect_named(out, c("x", "a", "b"))
  expect_equal(nrow(out), 1)
  expect_equal(out$a, list(1:2))
})

test_that("column containing only zero length components goes away", {
  df <- tibble(x = 1:2, y = list(NULL, integer()))
  out <- unpack(df, y)

  expect_equal(out, tibble(x = 1:2))
})
