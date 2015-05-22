context("unite")

test_that("unite pastes columns together & removes old col", {
  df <- dplyr::data_frame(x = "a", y = "b")
  out <- unite(df, z, x:y)

  expect_equal(names(out), "z")
  expect_equal(out$z, "a_b")
})
