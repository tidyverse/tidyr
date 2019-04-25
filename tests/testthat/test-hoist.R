context("test-hoist")

test_that("hoist extracts named elements", {
  df <- tibble(x = list(list(1, b = "b")))
  out <- df %>% hoist(x, a = 1, b = "b")

  expect_equal(out, tibble(a = 1, b = "b"))
})

test_that("can require specific type with ptype", {
  df <- tibble(x = list(
    list(a = 1),
    list(a = "a")
  ))

  out <- df %>% hoist(x, a = "a", .ptype = list(a = character()))
  expect_equal(out, tibble(a = c("1", "a")))
})

test_that("doesn't simplify uneven lengths", {
  df <- tibble(x = list(
    list(a = 1),
    list(a = 2:3)
  ))

  out <- df %>% hoist(x, a = "a")
  expect_equal(out$a, list(1, 2:3))
})

test_that("input validation catches problems", {
  df <- tibble(x = list(list(1, b = "b")), y = 1)

  expect_error(df %>% hoist(y), "list-column")
  expect_error(df %>% hoist(x, "a"), "named")
})

# strike ------------------------------------------------------------------

test_that("strike can remove using a character vector", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, "a"), x[c("b", "c")])
  expect_equal(strike(x, "c"), x[c("a", "b")])

  deep <- strike(x, c("b", "b"))
  expect_equal(deep, list(a = list(), b = list(a = 1), c = "c"))
})

test_that("strike can remove using an integer vector", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, 1), x[c(2, 3)])
  expect_equal(strike(x, "c"), x[c("a", "b")])

  deep <- strike(x, c(2, 2))
  expect_equal(deep, list(a = list(), b = list(a = 1), c = "c"))
})

test_that("strike can remove using a list", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list(1)), x[c(2, 3)])
  expect_equal(strike(x, list("a")), x[c(2, 3)])

  deep <- strike(x, list("b", 2))
  expect_equal(deep, list(a = list(), b = list(a = 1), c = "c"))
})

test_that("strike returns input if idx not present", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, 4), x)
  expect_equal(strike(x, "d"), x)
  expect_equal(strike(x, list("b", 3)), x)
  expect_equal(strike(x, list("d", 3)), x)
  expect_equal(strike(x, list("b", "c")), x)
  expect_equal(strike(x, list(3, "b")), x)
  expect_equal(strike(x, list(4, "b")), x)
})

test_that("ignores weird inputs", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, NULL), x)
  expect_equal(strike(x, list()), x)
  expect_equal(strike(x, mean), x)
  expect_equal(strike(x, list(mean, mean)), x)
})
