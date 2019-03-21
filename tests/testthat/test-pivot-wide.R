context("test-pivot-wide")

test_that("can pivot all cols to wide", {
  df <- tibble(key = c("x", "y", "z"), val = 1:3)
  pv <- pivot_wider(df, names_from = key, values_from = val)

  expect_named(pv, c("x", "y", "z"))
  expect_equal(nrow(pv), 1)
})

test_that("non-pivoted cols are preserved", {
  df <- tibble(a = 1, key = c("x", "y"), val = 1:2)
  pv <- pivot_wider(df, names_from = key, values_from = val)

  expect_named(pv, c("a", "x", "y"))
  expect_equal(nrow(pv), 1)
})

test_that("implicit missings turn into explicit missings", {
  df <- tibble(a = 1:2, key = c("x", "y"), val = 1:2)
  pv <- pivot_wider(df, names_from = key, values_from = val)

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, c(1, NA))
  expect_equal(pv$y, c(NA, 2))
})

test_that("warn when overwriting existing column", {
  df <- tibble(
    a = c(1, 1),
    key = c("a", "b"),
    val = c(1, 2)
  )
  expect_message(
    pivot_wider(df, names_from = key, values_from = val),
    "New names"
  )
})

# keys ---------------------------------------------------------

test_that("can override default keys", {
  df <- tibble::tribble(
    ~row, ~name, ~var, ~value,
    1,    "Sam", "age", 10,
    2,    "Sam", "height", 1.5,
    3,    "Bob", "age", 20,
  )

  pv <- df %>% pivot_wider(keys = name, names_from = var, values_from = value)
  expect_equal(nrow(pv), 2)
})

test_that("duplicated keys produce list column", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)
  expect_warning(
    pv <- pivot_wider(df, names_from = key, values_from = val),
    "list-col"
  )

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, list_of(c(1L, 2L), 3L))
})

test_that("unless values_collapse is supplied", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)
  pv <- pivot_wider(df,
    names_from = key,
    values_from = val,
    values_collapse = list(val = length)
  )

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, c(2L, 1L))
})


# multiple values ----------------------------------------------------------

test_that("can pivot from multiple measure cols", {
  df <- tibble(row = 1, var = c("x", "y"), a = 1:2, b = 3:4)
  sp <- tibble::tribble(
    ~.name, ~.value, ~var,
    "x_a", "a", "x",
    "y_a", "a", "y",
    "x_b", "b", "x",
    "y_b", "b", "y",
  )
  pv <- pivot_wider(df, spec = sp)

  expect_named(pv, c("row", "x_a", "y_a", "x_b", "y_b"))
  expect_equal(pv$x_a, 1)
  expect_equal(pv$y_b, 4)
})

test_that("column order in output matches spec", {
  df <- tibble::tribble(
    ~hw,   ~name,  ~mark,   ~pr,
    "hw1", "anna",    95,  "ok",
    "hw2", "anna",    70, "meh",
  )

  # deliberately create weird order
  sp <- tibble::tribble(
    ~hw, ~.value,  ~.name,
    "hw1", "mark", "hw1_mark",
    "hw1", "pr",   "hw1_pr",
    "hw2", "pr",   "hw2_pr",
    "hw2", "mark", "hw2_mark",
  )

  pv <- pivot_wider(df, spec = sp)
  expect_named(pv, c("name", sp$.name))
})
