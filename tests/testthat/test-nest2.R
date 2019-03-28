context("test-nest2")

# nest2 -------------------------------------------------------------------

test_that("can nest multiple columns", {
  df <- tibble(x = 1, a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df %>% nest2(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("x", "a", "b"))
  expect_equal(out$a, list_of(df[c("a1", "a2")]))
  expect_equal(out$b, list_of(df[c("b1", "b2")]))
})

test_that("nesting no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(nest2(df), df)
})

test_that("all inputs must be named", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_error(nest2(df, a = c(a1, a2), c(b1, b2)), "must be named")
  expect_error(nest2(df, c(a1, a2), c(b1, b2)), "must be named")
})

# unnest2 -----------------------------------------------------------------

test_that("rows and cols of nested-dfs are expanded", {
  df <- tibble(x = 1:2, y = list(tibble(a = 1), tibble(b = 1:2)))
  out <- df %>% unnest2(y)

  expect_named(out, c("x", "a", "b"))
  expect_equal(nrow(out), 3)
})

test_that("can keep empty rows", {
  df <- tibble(x = 1:2, y = list(NULL, tibble(a = 1)))
  out1 <- df %>% unnest2(y)
  expect_equal(nrow(out1), 1)

  out2 <- df %>% unnest2(y, keep_empty = TRUE)
  expect_equal(nrow(out2), 2)
  expect_equal(out2$a, c(NA, 1))
})

test_that("vectors treated like unchop", {
  df <- tibble(x = 1:2, y = list(1, 1:2))
  out <- df %>% unnest2(y)

  expect_equal(out, unchop(df, y))
})
