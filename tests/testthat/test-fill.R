context("fill")

test_that("all missings left unchanged", {
  df <- dplyr::data_frame(
    lgl = c(NA, NA),
    int = c(NA_integer_, NA),
    dbl = c(NA_real_, NA),
    chr = c(NA_character_, NA)
  )

  out <- fill(df, lgl, int, dbl, chr)
  expect_identical(out, df)
})

test_that("missings filled from last non-missing", {
  df <- dplyr::data_frame(x = c(1, NA, NA))

  out <- fill(df, x)
  expect_equal(out$x, c(1, 1, 1))
})

test_that("missings filled for each atomic vector", {
  df <- dplyr::data_frame(
    lgl = c(T, NA),
    int = c(1L, NA),
    dbl = c(1, NA),
    chr = c("a", NA)
  )

  out <- fill(df, lgl, int, dbl, chr)
  expect_equal(out$lgl, c(TRUE, TRUE))
  expect_equal(out$int, c(1L, 1L))
  expect_equal(out$dbl, c(1, 1))
  expect_equal(out$chr, c("a", "a"))
})
