context("test-chop")


# chop --------------------------------------------------------------------

test_that("can chop multiple columns", {
  df <- tibble(x = c(1, 1, 2), a = 1:3, b = 1:3)
  out <- df %>% chop(c(a, b))

  expect_named(out, c("x", "a", "b"))
  expect_equal(out$a, list(1:2, 3L))
  expect_equal(out$b, list(1:2, 3L))
})

test_that("chopping no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(chop(df), df)
})

# unchop ------------------------------------------------------------------

test_that("extends into rows", {
  df <- tibble(x = 1:2, y = list(NULL, 1:4))
  out <- df %>% unchop(y)
  expect_equal(out$x, rep(2, 4))
  expect_equal(out$y, 1:4)
})

test_that("optionally keep empty rows", {
  df <- tibble(x = 1:2, y = list(NULL, 1:2))
  out <- df %>% unchop(y, keep_empty = TRUE)
  expect_equal(out$x, c(1, 2, 2))
  expect_equal(out$y, c(NA, 1, 2))
})
