context("id")

test_that("drop preserves count of factor levels", {
  x <- factor(, levels = c("a", "b"))
  expect_equal(id_var(x), structure(integer(), n = 2))
  expect_equal(id(data.frame(x)), structure(integer(), n = 2))
})
