context("test-pack")


# pack --------------------------------------------------------------------

test_that("can pack multiple columns", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df %>% pack(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("a", "b"))
  expect_equal(out$a, df[c("a1", "a2")])
  expect_equal(out$b, df[c("b1", "b2")])
})

test_that("packing no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(pack(df), df)
})

test_that("all inputs must be named", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_error(pack(df, a = c(a1, a2), c(b1, b2)), "must be named")
  expect_error(pack(df, c(a1, a2), c(b1, b2)), "must be named")
})

# unpack ------------------------------------------------------------------

test_that("can't unpack atomic vectors", {
  df <- tibble(x = 1:2)
  expect_error(df %>% unpack(x), "must be a list or data frame")
})

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

test_that("df-cols are directly unpacked", {
  df <- tibble(x = 1:3, y = tibble(a = 1:3, b = 3:1))
  out <- df %>% unpack(y)
  expect_named(out, c("x", "a", "b"))
  expect_equal(out[c("a", "b")], df$y)
})
