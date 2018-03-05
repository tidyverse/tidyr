context("chop")

test_that("chop splits by specified columns", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- chop(df, y)
  expect_length(out, 3)
  expect_identical(out[[1]], df[1,])
  expect_identical(out[[2]], df[2,])
  expect_identical(out[[3]], df[3,])

  out <- chop(df, x, y)
  expect_length(out, 3)
  expect_identical(out[[1]], df[1,])
  expect_identical(out[[2]], df[2,])
  expect_identical(out[[3]], df[3,])

  out <- chop(df, x)
  expect_length(out, 1)
  expect_identical(out[[1]], df)

  out <- chop(df)
  expect_length(out, 1)
  expect_identical(out[[1]], df)
})

test_that("chop splits by groups", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- df %>% dplyr::group_by(y) %>% chop()
  expect_length(out, 3)
  expect_identical(out[[1]], df[1,])
  expect_identical(out[[2]], df[2,])
  expect_identical(out[[3]], df[3,])

  out <- df %>% dplyr::group_by(x, y) %>% chop()
  expect_length(out, 3)
  expect_identical(out[[1]], df[1,])
  expect_identical(out[[2]], df[2,])
  expect_identical(out[[3]], df[3,])

  out <- df %>% dplyr::group_by(x) %>% chop()
  expect_length(out, 1)
  expect_identical(out[[1]], df)

  out <- df %>% chop()
  expect_length(out, 1)
  expect_identical(out[[1]], df)
})


test_that("explicit argument takes precedence over any groups on data frame", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- df %>% dplyr::group_by(x) %>% chop(y)
  expect_length(out, 3)
  expect_identical(out[[1]], df[1,])
  expect_identical(out[[2]], df[2,])
  expect_identical(out[[3]], df[3,])
})


test_that("chop includes all vars in nested data", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- df %>% dplyr::group_by(y) %>% chop()
  expect_true(all(out %>% map_lgl(~identical(names(.x), names(df)))))
})

test_that("chopping works for empty data frames", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))[0, ]

  out <- chop(df, x)
  expect_length(out, 1)
  expect_equal(names(out[[1]]), c('x', "y"))
  expect_equal(nrow(out[[1]]), 0)
  expect_equal(out[[1]], df)
})
