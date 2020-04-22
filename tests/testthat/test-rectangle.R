context("test-hoist")

# hoist -------------------------------------------------------------------

test_that("hoist extracts named elements", {
  df <- tibble(x = list(list(1, b = "b")))
  out <- df %>% hoist(x, a = 1, b = "b")

  expect_equal(out, tibble(a = 1, b = "b"))
})

test_that("can require specific type with ptype", {
  skip("restricted vec_cast")

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

test_that("doesn't simplify lists of lists", {
  df <- tibble(x = list(
    list(a = list(1)),
    list(a = list(2))
  ))

  out <- df %>% hoist(x, a = "a")
  expect_equal(out$a, list(list(1), list(2)))
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


# unnest_wider --------------------------------------------------------

test_that("number of rows is preserved", {
  df <- tibble(
    x = 1:3,
    y = list(NULL, c(a = 1), c(a = 1, b = 2))
  )
  out <- df %>% unnest_wider(y)
  expect_equal(nrow(out), 3)
})

test_that("simplifies length-1 lists", {
  df <- tibble(
    x = 1:2,
    y = list(
      list(a = 1, b = 2, c = c(1, 2)),
      list(a = 3)
    )
  )
  out <- df %>% unnest_wider(y)
  expect_equal(out$a, c(1, 3))
  expect_equal(out$b, c(2, NA))
  expect_equal(out$c, list(c(1, 2), NULL))

  # Works when casting too
  skip("restricted vec_cast")
  out <- df %>% unnest_wider(y,
    ptype = list(a = double(), b = double(), c = list())
  )
  expect_equal(out$a, c(1, 3))
  expect_equal(out$b, c(2, NA))
  expect_equal(out$c, list(c(1, 2), NULL))
})

test_that("can handle data frames consistently with vectors" , {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2, b = 2:3)))
  out <- df %>% unnest_wider(y)

  expect_named(out, c("x", "a", "b"))
  expect_equal(nrow(out), 2)
})

test_that("bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))
  expect_error(unnest_wider(df, y), "must be list of vectors")
})

test_that("list of 0-length vectors yields no new columns", {
  df <- tibble(x = 1:2, y = list(integer(), integer()))
  expect_named(unnest_wider(df, y), "x")

  # similarly when empty
  df <- tibble(x = integer(), y = list())
  expect_named(unnest_wider(df, y), "x")
})

test_that("list_of columns can be unnested", {
  df <- tibble(x = 1:2, y = list_of(c(a = 1L), c(a = 1L, b = 2L)))
  expect_named(unnest_wider(df, y), c("x", "a", "b"))

  df <- tibble(x = 1:2, y = list_of(c(a = 1L), c(b = 1:2)))
  expect_named(unnest_wider(df, y), c("x", "a", "b1", "b2"))
})

test_that("names_sep creates unique names", {
  df <- tibble(
    x = list("a", c("a", "b", "c")),
    y = list(c(a = 1), c(b = 2, a = 1))
  )
  expect_warning(out <- unnest_wider(df, x, names_sep = "_"), NA)
  expect_named(out, c("x_1", "x_2", "x_3", "y"))

  expect_warning(out <- unnest_wider(df, y, names_sep = "_"), NA)
  expect_named(out, c("x", "y_a", "y_b"))
  expect_equal(out$y_a, c(1, 1))
})

# unnest_longer -----------------------------------------------------------

test_that("uses input for default column names", {
  df <- tibble(x = 1:2, y = list(1, 1:2))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y"))
})

test_that("automatically adds id col if named", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(b = 2)))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y", "y_id"))
})

test_that("can force integer indexes", {
  df <- tibble(x = 1:2, y = list(1, 2))
  out <- df %>% unnest_longer(y, indices_include = TRUE)
  expect_named(out, c("x", "y", "y_id"))

  out <- df %>% unnest_longer(y, indices_to = "y2")
  expect_named(out, c("x", "y", "y2"))
})

test_that("preserves empty rows", {
  df <- tibble(
    x = 1:3,
    y = list(NULL, NULL, 1)
  )
  out <- df %>% unnest_longer(y)
  expect_equal(nrow(out), 3)
})

test_that("can handle data frames consistently with vectors" , {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2, b = 2:3)))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y"))
  expect_equal(nrow(out), 4)
})

test_that("bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))
  expect_error(unnest_longer(df, y), "must be list of vectors")
})

test_that("list_of columns can be unnested", {
  df <- tibble(x = 1:2, y = list_of(1L, 1:2))
  out <- unnest_longer(df, y)

  expect_named(out, c("x", "y"))
  expect_equal(nrow(out), 3)

  # With id column
  df <- tibble(x = 1:2, y = list_of(c(a = 1L), c(b = 1:2)))
  expect_named(unnest_longer(df, y), c("x", "y", "y_id"))
})

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

