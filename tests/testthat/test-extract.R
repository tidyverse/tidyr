context("Extract")
library(dplyr, warn.conflicts = FALSE)

test_that("default returns first alpha group", {
  df <- data.frame(x = c("a.b", "a.d", "b.c"))
  out <- df %>% extract(x, "A")
  expect_equal(out$A, c("a", "a", "b"))
})

test_that("can match multiple groups", {
  df <- data.frame(x = c("a.b", "a.d", "b.c"))
  out <- df %>% extract(x, c("A", "B"), "([[:alnum:]]+)\\.([[:alnum:]]+)")
  expect_equal(out$A, c("a", "a", "b"))
  expect_equal(out$B, c("b", "d", "c"))
})

test_that("informative error if match fails", {
  df <- data.frame(x = c("a.b", "a"))

  expect_error(df %>% extract(x, "a", "(b)"), "didn't match at 2")
})
