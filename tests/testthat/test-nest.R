context("nest")

test_that("nest turns grouped values into one list-df", {
  df <- dplyr::data_frame(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, y)
  expect_equal(out$x, 1)
  expect_equal(out$data, list(data.frame(y = 1:3)))
})
