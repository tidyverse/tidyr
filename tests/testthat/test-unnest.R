context("unnest")

test_that("unnesting combines atomic vectors", {
  df <- dplyr::data_frame(x = list(1, 2:3, 4:10))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("unnesting row binds data frames", {
  df <- dplyr::data_frame(x = list(
    dplyr::data_frame(x = 1:5),
    dplyr::data_frame(x = 6:10)
  ))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("elements must all be of same type", {
  df <- dplyr::data_frame(x = list(1, "a"))
  expect_error(unnest(df), "incompatible type")
})

test_that("can't combine vectors and data frames", {
  df <- dplyr::data_frame(x = list(1, dplyr::data_frame(1)))
  expect_error(unnest(df), "a list of vectors or a list of data frames")
})

test_that("multiple columns must be same length", {
  df <- dplyr::data_frame(x = list(1), y = list(1:2))
  expect_error(unnest(df), "same number of elements")

  df <- dplyr::data_frame(x = list(1), y = list(dplyr::data_frame(x = 1:2)))
  expect_error(unnest(df), "same number of elements")
})

test_that("nested is split as a list (#84)", {
  df <- dplyr::data_frame(x = 1:3, y = list(1,2:3,4), z = list(5,6:7,8))
  expect_that(unnest(df), not(gives_warning("data length is not a multiple")))
})


