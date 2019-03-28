context("test-chop")

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

test_that("optionally keep internal names", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(b = 2, c = 3)), z = 2:1)
  out <- df %>% unchop(y, id = "y_name")

  expect_named(out, c("x", "y", "y_name", "z"))
  expect_equal(out$y_name, c("a", "b", "c"))
})

test_that("if names missing get indices", {
  df <- tibble(x = 1:2, y = list(1, 2:3), z = 2:1)
  out <- df %>% unchop(y, id = "y_idx")

  expect_named(out, c("x", "y", "y_idx", "z"))
  expect_equal(out$y_idx, c(1, 1:2))
})
