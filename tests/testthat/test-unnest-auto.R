
# unnest_auto -------------------------------------------------------------

test_that("unnamed becomes longer", {
  df <- tibble(x = 1:2, y = list(1, 2:3))
  expect_message(out <- df %>% unnest_auto(y), "unnest_longer")
  expect_equal(out$y, c(1, 2, 3))
})

test_that("common name becomes wider", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(a = 2)))
  expect_message(out <- df %>% unnest_auto(y), "unnest_wider")
  expect_named(out, c("x", "a"))
})

test_that("no common name falls back to longer with index", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(b = 2)))
  expect_message(out <- df %>% unnest_auto(y), "unnest_longer")
  expect_named(out, c("x", "y", "y_id"))
})

test_that("mix of named and unnamed becomes longer", {
  df <- tibble(x = 1:2, y = list(c(a = 1), 2))
  expect_message(out <- df %>% unnest_auto(y), "unnest_longer")
  expect_named(out, c("x", "y"))
})

# https://github.com/tidyverse/tidyr/issues/959
test_that("works with an input that has column named `col`", {
  df <- tibble(
    col = 1L,
    list_col = list(list(x = "a", y = "b"), list(x = "c", y = "d"))
  )
  expect_message(out <- df %>% unnest_auto(list_col), "unnest_wider")
  expect_named(out, c("col", "x", "y"))
})
