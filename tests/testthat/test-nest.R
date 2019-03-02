context("nest")

test_that("nest turns grouped values into one list-df", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, y)
  expect_equal(out$x, 1)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], data.frame(y = 1:3))
})

test_that("can control output column name", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, y, .key = y)
  expect_equal(names(out), c("x", "y"))
})

test_that("nest doesn't include grouping vars in nested data", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- df %>% dplyr::group_by(x) %>% nest()
  expect_equal(out$data[[1]], data.frame(y = 1:3))
})

test_that("can restrict variables in grouped nest", {
  df <- tibble(x = 1, y = 2, z = 3) %>% dplyr::group_by(x)
  out <- df %>% nest(y)
  expect_equal(names(out$data[[1]]), "y")
})

test_that("puts data into the correct row", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, x) %>% dplyr::filter(y == "B")
  expect_equal(out$data[[1]]$x, 1)
})

test_that("nesting everything yields a simple data frame", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, x, y)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("nest preserves order of data", {
  df <- tibble(x = c(1, 3, 2, 3, 2), y = 1:5)
  out <- nest(df, y)
  expect_equal(out$x, c(1, 3, 2))
})

test_that("empty factor levels don't affect nest", {
  df <- tibble(
    x = factor(c("z", "a"), levels = letters),
    y = 1:2
  )
  out <- nest(df, y)
  expect_equal(out$x, df$x)
})

test_that("nesting works for empty data frames", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))[0, ]

  out <- nest(df, x)
  expect_equal(names(out), c("y", "data"))

  expect_equal(nrow(out), 0L)
  expect_equal(length(out$data), 0L)

  out <- nest(df, x, y)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("tibble conversion occurs in the `nest.data.frame()` method", {
  tbl <- mtcars %>% nest(-am, -cyl)
  expect_s3_class(tbl, "tbl_df")
  expect_is(tbl$data[[1L]], "tbl_df")
})
