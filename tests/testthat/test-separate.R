context("Separate")

test_that("missing values in input are missing in output", {
  df <- tibble(x = c(NA, "a b"))
  out <- separate(df, x, c("x", "y"))
  expect_equal(out$x, c(NA, "a"))
  expect_equal(out$y, c(NA, "b"))
})

test_that("positive integer values specific position between characters", {
  df <- tibble(x = c(NA, "ab", "cd"))
  out <- separate(df, x, c("x", "y"), 1)
  expect_equal(out$x, c(NA, "a", "c"))
  expect_equal(out$y, c(NA, "b", "d"))
})

test_that("negative integer values specific position between characters", {
  df <- tibble(x = c(NA, "ab", "cd"))
  out <- separate(df, x, c("x", "y"), -1)
  expect_equal(out$x, c(NA, "a", "c"))
  expect_equal(out$y, c(NA, "b", "d"))
})

test_that("extreme integer values handled sensibly", {
  df <- tibble(x = c(NA, "a", "bc", "def"))

  out <- separate(df, x, c("x", "y"), 3)
  expect_equal(out$x, c(NA, "a", "bc", "def"))
  expect_equal(out$y, c(NA, "", "", ""))

  out <- separate(df, x, c("x", "y"), -3)
  expect_equal(out$x, c(NA, "", "", ""))
  expect_equal(out$y, c(NA, "a", "bc", "def"))
})

test_that("convert produces integers etc", {
  df <- tibble(x = "1-1.5-FALSE")
  out <- separate(df, x, c("x", "y", "z"), "-", convert = TRUE)
  expect_equal(out$x, 1L)
  expect_equal(out$y, 1.5)
  expect_equal(out$z, FALSE)
})

test_that("convert keeps characters as character", {
  df <- tibble(x = "X-1")
  out <- separate(df, x, c("x", "y"), "-", convert = TRUE)
  expect_equal(out$x, "X")
  expect_equal(out$y, 1L)
})

test_that("too many pieces dealt with as requested", {
  df <- tibble(x = c("a b", "a b c"))

  expect_warning(separate(df, x, c("x", "y")), "Additional pieces discarded")

  merge <- separate(df, x, c("x", "y"), extra = "merge")
  expect_equal(merge[[1]], c("a", "a"))
  expect_equal(merge[[2]], c("b", "b c"))

  drop <- separate(df, x, c("x", "y"), extra = "drop")
  expect_equal(drop[[1]], c("a", "a"))
  expect_equal(drop[[2]], c("b", "b"))

  expect_warning(separate(df, x, c("x", "y"), extra = "error"), "deprecated")
})

test_that("too few pieces dealt with as requested", {
  df <- tibble(x = c("a b", "a b c"))

  expect_warning(separate(df, x, c("x", "y", "z")), "Missing pieces filled")

  left <- separate(df, x, c("x", "y", "z"), fill = "left")
  expect_equal(left$x, c(NA, "a"))
  expect_equal(left$y, c("a", "b"))
  expect_equal(left$z, c("b", "c"))

  right <- separate(df, x, c("x", "y", "z"), fill = "right")
  expect_equal(right$z, c(NA, "c"))
})

test_that("preserves grouping", {
  df <- tibble(g = 1, x = "a:b") %>% dplyr::group_by(g)
  rs <- df %>% separate(x, c("a", "b"))
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})

test_that("drops grouping when needed", {
  df <- tibble(x = "a:b") %>% dplyr::group_by(x)
  rs <- df %>% separate(x, c("a", "b"))
  expect_equal(rs$a, "a")
  expect_equal(dplyr::groups(rs), NULL)
})

test_that("overwrites existing columns", {
  df <- tibble(x = "a:b")
  rs <- df %>% separate(x, c("x", "y"))

  expect_named(rs, c("x", "y"))
  expect_equal(rs$x, "a")
})


test_that("checks type of `into` and `sep`", {
  df <- tibble(x = "a:b")
  expect_error(separate(df, x, "x", FALSE), "must be either numeric or character")
  expect_error(separate(df, x, FALSE), "must be a character vector")
})


test_that("list_indices truncates long warnings", {
  expect_equal(list_indices(letters, max = 3), "a, b, c, ...")
})
