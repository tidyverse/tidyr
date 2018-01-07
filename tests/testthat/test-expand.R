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

test_that("nesting doesn't expand values", {
  df <- data.frame(x = 1:2, y = 1:2)
  expect_equal(expand(df, nesting(x, y)), df)
})

test_that("expand works with non-standard col names", {
  df <- tibble(` x ` = 1:2, `/y` = 1:2)
  out <- expand(df, ` x `, `/y`)
  expect_equal(nrow(out), 4)
})

test_that("expand excepts expressions", {
  df <- expand(data.frame(), x = 1:3, y = 3:1)
  expect_equal(df, crossing(x = 1:3, y = 3:1))
})

test_that("expand respects groups", {
  df <- tibble(
    a = c(1L, 1L, 2L),
    b = c(1L, 2L, 1L),
    c = c(2L, 1L, 1L)
  )
  out <- df %>% dplyr::group_by(a) %>% expand(b, c) %>% nest()

  expect_equal(out$data[[1]], crossing(b = 1:2, c = 1:2))
  expect_equal(out$data[[2]], tibble(b = 1L, c = 1L))
})

test_that("preserves ordered factors", {
  df <- tibble(a = ordered("a"))
  out <- expand(df, a)
  expect_equal(df$a, ordered("a"))
})

test_that("preserves NAs", {
  x <- c("A", "B", NA)
  expect_equal(crossing(x)$x, x)
  expect_equal(nesting(x)$x, x)
})

test_that("zero length numeric & character inputs are automatically dropped", {
  tb <- tibble(x = 1:5)
  expect_equal(expand(tb, x, y = numeric()), tb)
  expect_equal(nesting(x = tb$x, y = numeric()), tb)
  expect_equal(crossing(x = tb$x, y = numeric()), tb)

  expect_equal(expand(tb, x, y = character()), tb)
  expect_equal(nesting(x = tb$x, y = character()), tb)
  expect_equal(crossing(x = tb$x, y = character()), tb)
})

test_that("zero length input gives zero length output", {
  tb <- tibble(x = character())
  expect_equal(expand(tb, x), tibble())
  expect_equal(expand(tb, y = NULL), tibble())
})

test_that("zero length factor inputs are completed by expand & crossing, dropped by nesting", {
  tb <- tibble(x = 1:2)
  emptyfactor <- factor(levels = c("a", "b"))
  targettb <- tibble(x = as.integer(c(1, 1, 2, 2)), y = factor(c("a", "b", "a", "b"), levels = c("a", "b")))

  expect_equal(expand(tb, x, y = emptyfactor), targettb)
  expect_equal(nesting(x = tb$x, y = emptyfactor), tb)
  expect_equal(crossing(x = tb$x, y = emptyfactor), targettb)
})

test_that("expand() reconstructs input dots is empty", {
  expect_is(expand(mtcars), "data.frame")
  expect_is(expand(as_tibble(mtcars)), "tbl_df")
})

test_that("crossing checks for bad inputs", {
  expect_error(
    crossing(x = 1:10, y = quote(a)),
    "Problems: y"
  )
})
