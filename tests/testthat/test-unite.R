context("unite")

test_that("unite pastes columns together & removes old col", {
  df <- dplyr::data_frame(x = "a", y = "b")
  out <- unite(df, z, x:y)

  expect_equal(names(out), "z")
  expect_equal(out$z, "a_b")
})

test_that("unite does not remove new col in case of name clash", {
  df <- dplyr::data_frame(x = "a", y = "b")
  out <- unite(df, x, x:y)

  expect_equal(names(out), "x")
  expect_equal(out$x, "a_b")
})

test_that("unite preserves grouping", {
  df <- dplyr::data_frame(g = 1, x = "a") %>% dplyr::group_by(g)
  rs <- df %>% unite(x, x)


  expect_equal(df, rs)
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})
