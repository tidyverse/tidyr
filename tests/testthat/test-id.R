context("id")

test_that("drop preserves count of factor levels", {
  x <- factor(, levels = c("a", "b"))
  expect_equal(id_var(x), structure(integer(), n = 2))
  expect_equal(id(data.frame(x)), structure(integer(), n = 2))
})

test_that("id works with dimensions beyond integer range", {
  df <- data.frame(matrix(c(1, 2), nrow = 2, ncol = 32))
  expect_equal(id(df), structure(c(1, 2), n = 2 ^ 32))
})
