context("expand")

test_that("expand completes all values", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, x, y)

  expect_equal(nrow(out), 4)
})

test_that("multiple variables in one arg doesn't expand", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, c(x, y))
  expect_equal(nrow(out), 2)
})

test_that("expand_ accepts character vectors (with deprecation warning)", {
  df <- data.frame(x = 1:2, y = 1:2)

  expect_warning(expect_equal(names(expand_(df, c("x", "y"))), c("x", "y")), "Text parsing is deprecated")
})

test_that("nesting doesn't expand values" ,{
  df <- data.frame(x = 1:2, y = 1:2)
  expect_equal(expand(df, nesting(x, y)), df)
})

test_that("expand_ accepts list of formulas (with deprecation warning)", {
  df <- data.frame(x = 1:2, y = 1:2)
  expect_warning(expect_equal(names(expand_(df, c(~ x, ~y))), c("x", "y")), "underscored versions are deprecated")
})

test_that("expand works with non-standard col names", {
  df <- data_frame(` x ` = 1:2, `/y` = 1:2)
  out <- expand(df, ` x `, `/y`)

  expect_equal(nrow(out), 4)
})

test_that("expand excepts expressions", {
  df <- expand(data.frame(), x = 1:3, y = 3:1)
  expect_equal(df, crossing(x = 1:3, y = 3:1))
})

test_that("expand respects groups", {
  df <- data_frame(
    a = c(1L, 1L, 2L),
    b = c(1L, 2L, 1L),
    c = c(2L, 1L, 1L)
  )
  out <- df %>% dplyr::group_by(a) %>% expand(b, c) %>% nest()

  expect_equal(out$data[[1]], crossing(b = 1:2, c = 1:2))
  expect_equal(out$data[[2]], data_frame(b = 1L, c = 1L))
})

test_that("preserves ordered factors", {
  df <- data_frame(a = ordered("a"))
  out <- expand(df, a)

  expect_equal(df$a, ordered("a"))
})


test_that("zero length inputs are automatically dropped", {
  tb <- tibble::tibble(x = 1:5)

  expect_equal(expand(tb, x, y = numeric()), tb)
  expect_equal(nesting(x = tb$x, y = numeric()), tb)
  expect_equal(crossing(x = tb$x, y = numeric()), tb)
})
