context("test-nest2")


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
