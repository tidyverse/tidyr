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
  expect_equal(pv$x, list_of(c(1L, 2L), 3L))
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
  expect_equal(pv$x, list_of(c(1L, 2L), 3L))
})

test_that("values_summarize applied even when no-duplicates", {
  df <- tibble(a = c(1, 2), key = c("x", "x"), val = 1:2)
  pv <- pivot_wider(df,
    names_from = key,
    values_from = val,
    values_fn = list(val = list)
  )

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, list_of(1L, 2L))
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
