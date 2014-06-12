context("Extract")
library(dplyr, warn.conflicts = FALSE)

test_that("Error if match fails", {
  df <- data.frame(x = c("a", "b", " "))
  expect_error(df %>% extract(x, "A", "([[:alnum:]]+)"), "Regex didn't match at")
})

test_that("Error if not enough capture groups", {
  df <- data.frame(x = c("a", "b"))
  expect_error(df %>% extract(x, "A", "([[:alnum:]]+)\\.([[:alnum:]])"), "The number of capture groups must equal the length of 'into'")
})

test_that("Single capture works correctly", {
  one <- data.frame(x = c("ac", "bd"))
  two <- data.frame(A = c("a", "b"), stringsAsFactors = FALSE)
  expect_identical(one %>% extract(x, c("A"), "(.)"), two)
})

test_that("Multiple capture works correctly", {
  one <- data.frame(x = c("ac", "bd"))
  two <- data.frame(A = c("a", "b"), B = c("c", "d"), stringsAsFactors = FALSE)
  expect_identical(one %>% extract(x, c("A", "B"), "(.)(.)"), two)
})
