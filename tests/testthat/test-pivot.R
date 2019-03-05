context("test-pivot")

# pivot -------------------------------------------------------------------

test_that("basic sanity checks for spec occur", {
  expect_error(check_spec(1), "data.frame")
  expect_error(check_spec(mtcars), "col_name")
})

# pivot_long --------------------------------------------------------------

test_that("can pivot all cols to long", {
  df <- tibble(x = 1:2, y = 3:4)
  pv <- pivot_long(df, x:y)

  expect_named(pv, c("name", "value"))
  expect_equal(pv$name, rep(names(df), 2))
  expect_equal(pv$value, c(1, 3, 2, 4))
})

test_that("values interleaved correctly", {
  df <- tibble(
    x = c(1, 2),
    y = c(10, 20),
    z = c(100, 200),
  )
  pv <- pivot_long(df, 1:3)

  expect_equal(pv$value, c(1, 10, 100, 2, 20, 200))
})

test_that("can add multiple columns from spec", {
  df <- tibble(x = 1:2, y = 3:4)
  sp <- tibble(col_name = c("x", "y"), measure = "v", a = 1, b = 2)
  pv <- pivot_long(df, spec = sp)

  expect_named(pv, c("a", "b", "v"))
})

test_that("preserves original keys", {
  df <- tibble(x = 1:2, y = 2, z = 1:2)
  pv <- pivot_long(df, y:z)

  expect_named(pv, c("x", "name", "value"))
  expect_equal(pv$x, rep(df$x, each = 2))
})

test_that("can drop missing values", {
  df <- data.frame(x = c(1, NA), y = c(NA, 2))
  pv <- pivot_long(df, x:y, na.rm = TRUE)

  expect_equal(pv$name, c("x", "y"))
  expect_equal(pv$value, c(1, 2))
})

test_that("mixed columns are automatically coerced", {
  df <- data.frame(x = factor("a"), y = factor("b"))
  pv <- pivot_long(df, x:y)

  expect_equal(pv$value, factor(c("a", "b")))
})

test_that("can override default output column type", {
  df <- tibble(x = "x", y = 1)
  pv <- pivot_long(df, x:y, ptype = list(value = list()))

  expect_equal(pv$value, list("x", 1))
})

test_that("can pivot to multiple measure cols", {
  df <- tibble(x = "x", y = 1)
  sp <- tibble::tribble(
    ~ col_name, ~measure, ~row,
    "x", "X", 1,
    "y", "Y", 1,
  )
  pv <- pivot_long(df, spec = sp)

  expect_named(pv, c("row", "X", "Y"))
  expect_equal(pv$X, "x")
  expect_equal(pv$Y, 1)
})

# pivot_wide --------------------------------------------------------------

test_that("can pivot all cols to wide", {
  df <- tibble(key = c("x", "y", "z"), val = 1:3)
  pv <- pivot_wide(df, key, val)

  expect_named(pv, c("x", "y", "z"))
  expect_equal(nrow(pv), 1)
})

test_that("non-pivoted cols are preserved", {
  df <- tibble(a = 1, key = c("x", "y"), val = 1:2)
  pv <- pivot_wide(df, key, val)

  expect_named(pv, c("a", "x", "y"))
  expect_equal(nrow(pv), 1)
})

test_that("implicit missings turn into explicit missings", {
  df <- tibble(a = 1:2, key = c("x", "y"), val = 1:2)
  pv <- pivot_wide(df, key, val)

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, c(1, NA))
  expect_equal(pv$y, c(NA, 2))
})

test_that("duplicated keys produce list column", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)
  expect_warning(pv <- pivot_wide(df, key, val), "list-col")

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, list(c(1, 2), 3))
})

test_that("can pivot from multiple measure cols", {
  df <- tibble(row = 1, var = c("x", "y"), a = 1:2, b = 3:4)
  sp <- tibble::tribble(
    ~ col_name, ~measure, ~var,
    "x_a", "a", "x",
    "y_a", "a", "y",
    "x_b", "b", "x",
    "y_b", "b", "y",
  )
  pv <- pivot_wide(df, spec = sp)

  expect_named(pv, c("row", "x_a", "y_a", "x_b", "y_b"))
  expect_equal(pv$x_a, 1)
  expect_equal(pv$y_b, 4)
})

test_that("warn when overwriting existing column", {
  df <- tibble(
    a = c(1, 1),
    key = c("a", "b"),
    val = c(1, 2)
  )
  expect_message(pv <- pivot_wide(df, key, val), "New names")
})
