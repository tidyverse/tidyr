context("nest")

test_that("nest turns grouped values into one list-df", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, data = y)
  expect_equal(out$x, 1)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], data.frame(y = 1:3))
})

test_that("nest uses grouping vars if present", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- df %>% dplyr::group_by(x) %>% nest()
  expect_equal(out$data[[1]], data.frame(y = 1:3))
})

test_that("provided grouping vars override grouped defaults", {
  df <- tibble(x = 1, y = 2, z = 3) %>% dplyr::group_by(x)
  out <- df %>% nest(data = y)
  expect_named(out, c("x", "z", "data"))
  expect_named(out$data[[1]], "y")
})

test_that("puts data into the correct row", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, data = x) %>% dplyr::filter(y == "B")
  expect_equal(out$data[[1]]$x, 1)
})

test_that("nesting everything yields a simple data frame", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, data = c(x, y))
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("nest preserves order of data", {
  df <- tibble(x = c(1, 3, 2, 3, 2), y = 1:5)
  out <- nest(df, data = y)
  expect_equal(out$x, c(1, 3, 2))
})

test_that("empty factor levels don't affect nest", {
  df <- tibble(
    x = factor(c("z", "a"), levels = letters),
    y = 1:2
  )
  out <- nest(df, data = y)
  expect_equal(out$x, df$x)
})

test_that("nesting works for empty data frames", {
  df <- tibble(x = integer(), y = character())

  out <- nest(df, data = x)
  expect_named(out, c("y", "data"))
  expect_equal(nrow(out), 0L)

  out <- nest(df, data = c(x, y))
  expect_named(out, "data")
  expect_equal(nrow(out), 0L)
})

test_that("tibble conversion occurs in the `nest.data.frame()` method", {
  df <- data.frame(x = 1, y = 1:2)
  out <- df %>% nest(data = y)
  expect_s3_class(out, "tbl_df")
  expect_s3_class(out$data[[1L]], "tbl_df")
})

test_that("can nest multiple columns", {
  df <- tibble(x = 1, a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df %>% nest(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("x", "a", "b"))
  expect_equal(out$a, list_of(df[c("a1", "a2")]))
  expect_equal(out$b, list_of(df[c("b1", "b2")]))
})

test_that("nesting no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(nest(df), df)
})

# deprecated --------------------------------------------------------------

test_that("warn about old style interface", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_warning(out <- nest(df, y), "data = c(y)", fixed = TRUE)
  expect_named(out, c("x", "data"))
})

test_that("can control output column name", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_warning(out <- nest(df, y, .key = y), "y = c(y)", fixed = TRUE)
  expect_named(out, c("x", "y"))
})

test_that(".key gets warning with new interface", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_warning(out <- nest(df, y = y, .key = y), ".key", fixed = TRUE)
})
