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
  expect_error(df %>% unpack(x), "must be a data frame column")
})

test_that("df-cols are directly unpacked", {
  df <- tibble(x = 1:3, y = tibble(a = 1:3, b = 3:1))
  out <- df %>% unpack(y)
  expect_named(out, c("x", "a", "b"))
  expect_equal(out[c("a", "b")], df$y)
})
