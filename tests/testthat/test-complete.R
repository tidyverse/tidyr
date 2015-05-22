context("complete")

test_that("basic invocation works", {
  df <- dplyr::data_frame(x = 1:2, y = 1:2, z = 3:4)
  out <- complete(df, x, y)

  expect_equal(nrow(out), 4)
  expect_equal(out$z, c(3, NA, NA, 4))

})
