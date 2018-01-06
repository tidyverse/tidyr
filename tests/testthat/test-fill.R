context("fill")

test_that("all missings left unchanged", {
  df <- tibble(
    lgl = c(NA, NA),
    int = c(NA_integer_, NA),
    dbl = c(NA_real_, NA),
    chr = c(NA_character_, NA)
  )

  down <- fill(df, lgl, int, dbl, chr)
  up <- fill(df, lgl, int, dbl, chr, .direction = "up")

  expect_identical(down, df)
  expect_identical(up, df)
})

test_that("missings filled down from last non-missing", {
  df <- tibble(x = c(1, NA, NA))
  out <- fill(df, x)
  expect_equal(out$x, c(1, 1, 1))
})

test_that("missings filled up from last non-missing", {
  df <- tibble(x = c(NA, NA, 1))
  out <- fill(df, x, .direction = "up")
  expect_equal(out$x, c(1, 1, 1))
})

test_that("missings filled down for each atomic vector", {
  df <- tibble(
    lgl = c(T, NA),
    int = c(1L, NA),
    dbl = c(1, NA),
    chr = c("a", NA),
    lst = list(1:5, NULL)
  )

  out <- fill(df, tidyselect::everything())
  expect_equal(out$lgl, c(TRUE, TRUE))
  expect_equal(out$int, c(1L, 1L))
  expect_equal(out$dbl, c(1, 1))
  expect_equal(out$chr, c("a", "a"))
  expect_equal(out$lst, list(1:5, 1:5))
})

test_that("missings filled up for each vector", {
  df <- tibble(
    lgl = c(NA, T),
    int = c(NA, 1L),
    dbl = c(NA, 1),
    chr = c(NA, "a"),
    lst = list(NULL, 1:5)
  )

  out <- fill(df, tidyselect::everything(), .direction = "up")
  expect_equal(out$lgl, c(TRUE, TRUE))
  expect_equal(out$int, c(1L, 1L))
  expect_equal(out$dbl, c(1, 1))
  expect_equal(out$chr, c("a", "a"))
  expect_equal(out$lst, list(1:5, 1:5))
})

test_that("fill preserves attributes", {
  df <- tibble(x = factor(c(NA, "a", NA)))

  out_d <- fill(df, x)
  out_u <- fill(df, x, .direction = "up")

  expect_equal(attributes(out_d$x), attributes(df$x))
  expect_equal(attributes(out_u$x), attributes(df$x))
})

test_that("fill respects grouping", {
  df <- tibble(x = c(1, 1, 2), y = c(1, NA, NA))
  out <- df %>% dplyr::group_by(x) %>% fill(y)
  expect_equal(out$y, c(1, 1, NA))
})
