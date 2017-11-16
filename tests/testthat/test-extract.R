context("Extract")

test_that("default returns first alpha group", {
  df <- data.frame(x = c("a.b", "a.d", "b.c"))
  out <- df %>% extract(x, "A")
  expect_equal(out$A, c("a", "a", "b"))
})

test_that("can match multiple groups", {
  df <- data.frame(x = c("a.b", "a.d", "b.c"))
  out <- df %>% extract(x, c("A", "B"), "([[:alnum:]]+)\\.([[:alnum:]]+)")
  expect_equal(out$A, c("a", "a", "b"))
  expect_equal(out$B, c("b", "d", "c"))
})

test_that("match failures give NAs", {
  df <- data.frame(x = c("a.b", "a"))
  out <- df %>% extract(x, "a", "(b)")
  expect_equal(out$a, c("b", NA))
})

test_that("extract keeps characters as character", {
  df <- tibble(x = "X-1")
  out <- extract(df, x, c("x", "y"), "(.)-(.)", convert = TRUE)
  expect_equal(out$x, "X")
  expect_equal(out$y, 1L)
})

test_that("groups are preserved", {
  df <- tibble(g = 1, x = "X1") %>% dplyr::group_by(g)
  rs <- df %>% extract(x, c("x", "y"), "(.)(.)")
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})

test_that("informative error message if wrong number of groups", {
  df <- tibble(x = "a")
  expect_error(extract(df, x, "y", "."), "should define 1 groups")
  expect_error(extract(df, x, c("y", "z"), "."), "should define 2 groups")
})
