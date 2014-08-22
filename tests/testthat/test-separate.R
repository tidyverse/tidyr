context("Separate")

test_that("too many pieces dealt with as requested", {
  x <- c("a b", "a b c")

  expect_error(str_split_fixed(x, " ", 2, "error"), "not split into")

  merge <- str_split_fixed(x, " ", 2, "merge")
  expect_equal(merge[[1]], c("a", "a"))
  expect_equal(merge[[2]], c("b", "b c"))

  drop <- str_split_fixed(x, " ", 2, "drop")
  expect_equal(drop[[1]], c("a", "a"))
  expect_equal(drop[[2]], c("b", "b"))
})


test_that("too few pieces dealt with as requested", {
  x <- c("a b", "a b c")

  expect_error(str_split_fixed(x, " ", 3, "error"), "not split into")

  merge <- str_split_fixed(x, " ", 3, "merge")
  expect_equal(merge[[3]], c(NA, "c"))

  drop <- str_split_fixed(x, " ", 3, "drop")
  expect_equal(drop[[3]], c(NA, "c"))
})


