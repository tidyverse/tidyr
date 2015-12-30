context("nest")

test_that("nest turns grouped values into one list-df", {
  df <- dplyr::data_frame(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, data, y)
  expect_equal(out$x, 1)
  expect_equal(out$data, list(data.frame(y = 1:3)))
})

test_that("nest doesn't include grouping vars in nested data", {
  out <- dplyr::data_frame(x = c(1, 1, 1), y = 1:3) %>%
    dplyr::group_by(x) %>%
    nest()

  expect_equal(out$data[[1]], data.frame(y = 1:3))
})

test_that("nest warns if you give nest cols for grouped_df", {
  df <- dplyr::data_frame(x = 1) %>% dplyr::group_by(x)
  expect_warning(df %>% nest(data, x), "`nest_cols` ignored")
})

