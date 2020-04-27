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

test_that("error when overwriting existing column", {
  df <- tibble(
    a = c(1, 1),
    key = c("a", "b"),
    val = c(1, 2)
  )
  expect_error(
    pivot_wider(df, names_from = key, values_from = val),
    "bad names"
  )
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, k = "x", v = 2)
  out <- df %>%
    dplyr::group_by(g) %>%
    pivot_wider(names_from = k, values_from = v)
  expect_equal(dplyr::group_vars(out), "g")
})

# https://github.com/tidyverse/tidyr/issues/804
test_that("column with `...j` name can be used as `names_from`", {
  df <- tibble(...8 = c("x", "y", "z"), val = 1:3)
  pv <- pivot_wider(df, names_from = ...8, values_from = val)
  expect_named(pv, c("x", "y", "z"))
  expect_equal(nrow(pv), 1)
})

test_that("data frame columns pivot correctly", {
  df <- tibble(
    i = c(1, 2, 1, 2),
    g = c("a", "a", "b", "b"),
    d = tibble(x = 1:4, y = 5:8)
  )

  out <- pivot_wider(df, names_from = g, values_from = d)
  expect_equal(out$a$x, 1:2)
  expect_equal(out$b$y, 7:8)
})


# column names -------------------------------------------------------------

test_that("names_glue affects output names", {
  df <- tibble(
    x = c("X", "Y"),
    y = 1:2,
    a = 1:2,
    b = 1:2
  )

  spec <- build_wider_spec(df, x:y, a:b, names_glue = '{x}{y}_{.value}')
  expect_equal(spec$.name, c("X1_a", "Y2_a", "X1_b", "Y2_b"))
})

test_that("can sort column names", {
  df <- tibble(
    int = c(1, 3, 2),
    fac = factor(int, levels = 1:3, labels = c("Mon", "Tue", "Wed")),
  )
  spec <- build_wider_spec(df,
    names_from = fac,
    values_from = int,
    names_sort = TRUE
  )
  expect_equal(spec$.name, levels(df$fac))
})

# keys ---------------------------------------------------------

test_that("can override default keys", {
  df <- tribble(
    ~row, ~name, ~var, ~value,
    1,    "Sam", "age", 10,
    2,    "Sam", "height", 1.5,
    3,    "Bob", "age", 20,
  )

  pv <- df %>% pivot_wider(id_cols = name, names_from = var, values_from = value)
  expect_equal(nrow(pv), 2)
})


# non-unqiue keys ---------------------------------------------------------

test_that("duplicated keys produce list column with warning", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)
  expect_warning(
    pv <- pivot_wider(df, names_from = key, values_from = val),
    "list-col"
  )

  expect_equal(pv$a, c(1, 2))
  expect_equal(as.list(pv$x), list(c(1L, 2L), 3L))
})

test_that("warning suppressed by supplying values_fn", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)
  expect_warning(
    pv <- pivot_wider(df,
      names_from = key,
      values_from = val,
      values_fn = list(val = list)
    ),
    NA
  )
  expect_equal(pv$a, c(1, 2))
  expect_equal(as.list(pv$x), list(c(1L, 2L), 3L))
})

test_that("values_fn can be a single function", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = c(1, 10, 100))
  pv <- pivot_wider(df, names_from = key, values_from = val, values_fn = sum)
  expect_equal(pv$x, c(11, 100))
})

test_that("values_summarize applied even when no-duplicates", {
  df <- tibble(a = c(1, 2), key = c("x", "x"), val = 1:2)
  pv <- pivot_wider(df,
    names_from = key,
    values_from = val,
    values_fn = list(val = list)
  )

  expect_equal(pv$a, c(1, 2))
  expect_equal(as.list(pv$x), list(1L, 2L))
})


# can fill missing cells --------------------------------------------------

test_that("can fill in missing cells", {
  df <- tibble(g = c(1, 2), var = c("x", "y"), val = c(1, 2))

  widen <- function(...) {
    df %>% pivot_wider(names_from = var, values_from = val, ...)
  }

  expect_equal(widen()$x, c(1, NA))
  expect_equal(widen(values_fill = 0)$x, c(1, 0))
  expect_equal(widen(values_fill = list(val = 0))$x, c(1, 0))
})

test_that("values_fill only affects missing cells", {
  df <- tibble(g = c(1, 2), names = c("x", "y"), value = c(1, NA))
  out <- pivot_wider(df, names_from = names, values_from = value, values_fill = 0 )
  expect_equal(out$y, c(0, NA))
})

# multiple values ----------------------------------------------------------

test_that("can pivot from multiple measure cols", {
  df <- tibble(row = 1, var = c("x", "y"), a = 1:2, b = 3:4)
  sp <- build_wider_spec(df, names_from = var, values_from = c(a, b))
  pv <- pivot_wider_spec(df, sp)

  expect_named(pv, c("row", "a_x", "a_y", "b_x", "b_y"))
  expect_equal(pv$a_x, 1)
  expect_equal(pv$b_y, 4)
})

test_that("can pivot from multiple measure cols using all keys", {
  df <- tibble(var = c("x", "y"), a = 1:2, b = 3:4)
  sp <- build_wider_spec(df, names_from = var, values_from = c(a, b))
  pv <- pivot_wider_spec(df, sp)

  expect_named(pv, c("a_x", "a_y", "b_x", "b_y"))
  expect_equal(pv$a_x, 1)
  expect_equal(pv$b_y, 4)
})

test_that("column order in output matches spec", {
  df <- tribble(
    ~hw,   ~name,  ~mark,   ~pr,
    "hw1", "anna",    95,  "ok",
    "hw2", "anna",    70, "meh",
  )

  # deliberately create weird order
  sp <- tribble(
    ~hw, ~.value,  ~.name,
    "hw1", "mark", "hw1_mark",
    "hw1", "pr",   "hw1_pr",
    "hw2", "pr",   "hw2_pr",
    "hw2", "mark", "hw2_mark",
  )

  pv <- pivot_wider_spec(df, sp)
  expect_named(pv, c("name", sp$.name))
})
