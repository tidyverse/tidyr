context("complete")

test_that("basic invocation works", {
  df <- data_frame(x = 1:2, y = 1:2, z = 3:4)
  out <- complete(df, x, y)

  expect_equal(nrow(out), 4)
  expect_equal(out$z, c(3, NA, NA, 4))

})

test_that("preserves grouping", {
  df <- data_frame(x = 1:2, y = 1:2, z = 3:4) %>%
    dplyr::group_by(x)
  out <- complete(df, x, y)

  expect_s3_class(out, "grouped_df")
  expect_equal(dplyr::groups(out), dplyr::groups(df))
})
