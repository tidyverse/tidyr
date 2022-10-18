test_that("errors if sequence not regular", {
  x <- c(1, 2, 2.5, 4)
  expect_snapshot(error = TRUE, {
    full_seq(x, 1)
  })
})

test_that("validates inputs", {
  x <- 1:5
  expect_snapshot(error = TRUE, {
    full_seq(x, period = "a")
    full_seq(x, 1, tol = "a")
  })
})
