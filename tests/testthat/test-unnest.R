context("unnest")

test_that("unnesting combines atomic vectors", {
  df <- dplyr::data_frame(x = list(1, 2:3, 4:10))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("unnesting row binds data frames", {
  df <- dplyr::data_frame(x = list(
    data_frame(x = 1:5),
    data_frame(x = 6:10)
  ))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("elements must all be of same type", {
  df <- dplyr::data_frame(x = list(1, "a"))
  expect_error(unnest(df), "incompatible type")
})

test_that("multiple columns must be same length", {
  df <- dplyr::data_frame(x = list(1), y = list(1:2))
  expect_error(unnest(df), "same number of elements")

  df <- dplyr::data_frame(x = list(1), y = list(data_frame(x = 1:2)))
  expect_error(unnest(df), "same number of elements")
})
