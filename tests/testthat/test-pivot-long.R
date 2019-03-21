context("test-pivot-long")

test_that("can pivot all cols to long", {
  df <- tibble(x = 1:2, y = 3:4)
  pv <- pivot_longer(df, x:y)

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
  pv <- pivot_longer(df, 1:3)

  expect_equal(pv$value, c(1, 10, 100, 2, 20, 200))
})

test_that("can add multiple columns from spec", {
  df <- tibble(x = 1:2, y = 3:4)
  sp <- tibble(.name = c("x", "y"), .value = "v", a = 1, b = 2)
  pv <- pivot_longer(df, spec = sp)

  expect_named(pv, c("a", "b", "v"))
})

test_that("preserves original keys", {
  df <- tibble(x = 1:2, y = 2, z = 1:2)
  pv <- pivot_longer(df, y:z)

  expect_named(pv, c("x", "name", "value"))
  expect_equal(pv$x, rep(df$x, each = 2))
})

test_that("can drop missing values", {
  df <- data.frame(x = c(1, NA), y = c(NA, 2))
  pv <- pivot_longer(df, x:y, na.rm = TRUE)

  expect_equal(pv$name, c("x", "y"))
  expect_equal(pv$value, c(1, 2))
})

test_that("mixed columns are automatically coerced", {
  df <- data.frame(x = factor("a"), y = factor("b"))
  pv <- pivot_longer(df, x:y)

  expect_equal(pv$value, factor(c("a", "b")))
})

test_that("can override default output column type", {
  df <- tibble(x = "x", y = 1)
  pv <- pivot_longer(df, x:y, values_type = list(value = list()))

  expect_equal(pv$value, list("x", 1))
})

test_that("can pivot to multiple measure cols", {
  df <- tibble(x = "x", y = 1)
  sp <- tibble::tribble(
    ~.name, ~.value, ~row,
    "x", "X", 1,
    "y", "Y", 1,
  )
  pv <- pivot_longer(df, spec = sp)

  expect_named(pv, c("row", "X", "Y"))
  expect_equal(pv$X, "x")
  expect_equal(pv$Y, 1)
})

test_that("handles duplicated column names", {
  df <- tibble(x = 1, a = 1, a = 2, b = 3, b = 4, .name_repair = "minimal")
  expect_warning(pv <- pivot_longer(df, -x), "Duplicate column names")

  expect_named(pv, c("x", "name", ".copy", "value"))
  expect_equal(pv$.copy, rep(1:2, times = 2))
  expect_equal(pv$value, 1:4)
})
