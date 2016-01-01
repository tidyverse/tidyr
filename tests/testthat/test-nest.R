context("nest")

test_that("nest turns grouped values into one list-df", {
  df <- dplyr::data_frame(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, y)
  expect_equal(out$x, 1)
  expect_equal(out$data, list(data.frame(y = 1:3)))
})

test_that("can control output column name", {
  df <- dplyr::data_frame(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, y, .key = y)

  expect_equal(names(out), c("x", "y"))
})

test_that("nest doesn't include grouping vars in nested data", {
  out <- dplyr::data_frame(x = c(1, 1, 1), y = 1:3) %>%
    dplyr::group_by(x) %>%
    nest()

  expect_equal(out$data[[1]], data.frame(y = 1:3))
})

test_that("can restrict variables in grouped nest", {
  df <- dplyr::data_frame(x = 1, y = 2, z = 3) %>% dplyr::group_by(x)

  out <- df %>% nest(y)
  expect_equal(names(out$data[[1]]), "y")
})

