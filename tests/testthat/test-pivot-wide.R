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

  expect_snapshot(
    (expect_error(pivot_wider(df, names_from = key, values_from = val)))
  )

  expect_snapshot(
    out <- pivot_wider(df, names_from = key, values_from = val, names_repair = "unique")
  )
  expect_named(out, c("a...1", "a...2", "b"))
})

test_that("`names_repair` happens after spec column reorganization (#1107)", {
  df <- tibble(
    test = c("a", "b"),
    name = c("test", "test2"),
    value = c(1, 2)
  )

  out <- pivot_wider(df, names_repair = ~ make.unique(.x))

  expect_identical(out$test, c("a", "b"))
  expect_identical(out$test.1, c(1, NA))
  expect_identical(out$test2, c(NA, 2))
})

test_that("minimal `names_repair` doesn't overwrite a value column that collides with key column (#1107)", {
  df <- tibble(
    test = c("a", "b"),
    name = c("test", "test2"),
    value = c(1, 2)
  )

  out <- pivot_wider(df, names_repair = "minimal")

  expect_identical(out[[1]], c("a", "b"))
  expect_identical(out[[2]], c(1, NA))
  expect_identical(out[[3]], c(NA, 2))
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

test_that("works with data.table and empty key_vars", {
  dt <- data.table::data.table(n = "a", v = 1)
  expect_equal(
    pivot_wider(dt, names_from = n, values_from = v),
    tibble(a = 1)
  )
})

test_that("`names_from` must be supplied if `name` isn't in `data` (#1240)", {
  df <- tibble(key = "x", val = 1)
  expect_snapshot((expect_error(pivot_wider(df, values_from = val))))
})

test_that("`values_from` must be supplied if `value` isn't in `data` (#1240)", {
  df <- tibble(key = "x", val = 1)
  expect_snapshot((expect_error(pivot_wider(df, names_from = key))))
})

test_that("`names_from` must identify at least 1 column (#1240)", {
  df <- tibble(key = "x", val = 1)
  expect_snapshot(
    (expect_error(pivot_wider(df, names_from = starts_with("foo"), values_from = val)))
  )
})

test_that("`values_from` must identify at least 1 column (#1240)", {
  df <- tibble(key = "x", val = 1)
  expect_snapshot(
    (expect_error(pivot_wider(df, names_from = key, values_from = starts_with("foo"))))
  )
})

test_that("`values_fn` emits an informative error when it doesn't result in unique values (#1238)", {
  df <- tibble(name = c("a", "a"), value = c(1, 2))
  expect_snapshot(
    (expect_error(pivot_wider(df, values_fn = list(value = ~.x))))
  )
})

test_that("can pivot a manual spec with spec columns that don't identify any rows (#1250)", {
  # Looking for `x = 1L`
  spec <- tibble(.name = "name", .value = "value", x = 1L)

  # But that doesn't exist here...
  df <- tibble(key = "a", value = 1L, x = 2L)
  expect_identical(
    pivot_wider_spec(df, spec, id_cols = key),
    tibble(key = "a", name = NA_integer_)
  )

  # ...or here
  df <- tibble(key = character(), value = integer(), x = integer())
  expect_identical(
    pivot_wider_spec(df, spec, id_cols = key),
    tibble(key = character(), name = integer())
  )
})

test_that("pivoting with a manual spec and zero rows results in zero rows (#1252)", {
  spec <- tibble(.name = "name", .value = "value", x = 1L)

  df <- tibble(value = integer(), x = integer())
  expect_identical(pivot_wider_spec(df, spec), tibble(name = integer()))
})

test_that("can use `names_expand` to get sorted and expanded column names (#770)", {
  name1 <- factor(c(NA, "x"), levels = c("x", "y"))
  df <- tibble(name1 = name1, name2 = c("c", "d"), value = c(1, 2))

  na <- NA_real_

  expect_identical(
    pivot_wider(df, names_from = c(name1, name2), names_expand = TRUE),
    tibble(x_c = na, x_d = 2, y_c = na, y_d = na, NA_c = 1, NA_d = na)
  )
})

test_that("can fill only implicit missings from `names_expand`", {
  name1 <- factor(c(NA, "x"), levels = c("x", "y"))
  df <- tibble(name1 = name1, name2 = c("c", "d"), value = c(1, NA))

  res <- pivot_wider(
    data = df,
    names_from = c(name1, name2),
    names_expand = TRUE,
    values_fill = list(value = 0)
  )

  # But not the explicit missing!
  expect_identical(
    res,
    tibble(x_c = 0, x_d = NA_real_, y_c = 0, y_d = 0, NA_c = 1, NA_d = 0)
  )
})

test_that("expansion with `id_expand` and `names_expand` works with zero row data frames", {
  df <- tibble(
    id = factor(levels = c("b", "a")),
    name = factor(levels = c("a", "b")),
    value = integer()
  )

  res <- pivot_wider(df, names_expand = TRUE, id_expand = TRUE)

  expect_identical(res$id, factor(c("b", "a"), levels = c("b", "a")))
  expect_identical(res$a, c(NA_integer_, NA_integer_))
  expect_identical(res$b, c(NA_integer_, NA_integer_))
})

# column names -------------------------------------------------------------

test_that("names_glue affects output names", {
  df <- tibble(
    x = c("X", "Y"),
    y = 1:2,
    a = 1:2,
    b = 1:2
  )

  spec <- build_wider_spec(df, x:y, a:b, names_glue = "{x}{y}_{.value}")
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

test_that("can vary `names_from` values slowest (#839)", {
  df <- tibble(
    name = c("name1", "name2"),
    value1 = c(1, 2),
    value2 = c(4, 5)
  )

  spec <- build_wider_spec(df, names_from = name, values_from = c(value1, value2))

  expect_identical(
    spec$.name,
    c("value1_name1", "value1_name2", "value2_name1", "value2_name2")
  )

  spec <- build_wider_spec(df, names_from = name, values_from = c(value1, value2), names_vary = "slowest")

  expect_identical(
    spec$.name,
    c("value1_name1", "value2_name1", "value1_name2", "value2_name2")
  )
})

test_that("`names_vary` is validated", {
  df <- tibble(name = c("a", "b"), value = c(1, 2))

  expect_snapshot({
    (expect_error(build_wider_spec(df, names_vary = 1)))
    (expect_error(build_wider_spec(df, names_vary = "x")))
  })
})

test_that("`names_expand` generates sorted column names even if no expansion is done", {
  df <- tibble(name = c(2, 1), value = c(1, 2))
  spec <- build_wider_spec(df, names_expand = TRUE)
  expect_identical(spec$.name, c("1", "2"))
})

test_that("`names_expand` does a cartesian expansion of `names_from` columns (#770)", {
  df <- tibble(name1 = c("a", "b"), name2 = c("c", "d"), value = c(1, 2))
  spec <- build_wider_spec(df, names_from = c(name1, name2), names_expand = TRUE)
  expect_identical(spec$.name, c("a_c", "a_d", "b_c", "b_d"))
})

test_that("`names_expand` expands all levels of a factor `names_from` column (#770)", {
  name1 <- factor(c(NA, "x"), levels = c("x", "y"))
  df <- tibble(name1 = name1, name2 = c("c", "d"), value = c(1, 2))
  spec <- build_wider_spec(df, names_from = c(name1, name2), names_expand = TRUE)
  expect_identical(spec$.name, c("x_c", "x_d", "y_c", "y_d", "NA_c", "NA_d"))
})

test_that("`names_expand` is validated", {
  df <- tibble(name = c("a", "b"), value = c(1, 2))

  expect_snapshot({
    (expect_error(build_wider_spec(df, names_expand = 1)))
    (expect_error(build_wider_spec(df, names_expand = "x")))
  })
})

# keys ---------------------------------------------------------

test_that("can override default keys", {
  df <- tribble(
    ~row, ~name, ~var, ~value,
    1, "Sam", "age", 10,
    2, "Sam", "height", 1.5,
    3, "Bob", "age", 20,
  )

  pv <- df %>% pivot_wider(id_cols = name, names_from = var, values_from = value)
  expect_equal(nrow(pv), 2)
})

test_that("`id_cols = everything()` excludes `names_from` and `values_from`", {
  df <- tibble(key = "x", name = "a", value = 1L)

  expect_identical(
    pivot_wider(df, id_cols = everything()),
    tibble(key = "x", a = 1L)
  )

  spec <- build_wider_spec(df)

  expect_identical(
    pivot_wider_spec(df, spec, id_cols = everything()),
    tibble(key = "x", a = 1L)
  )
})

test_that("`id_cols` can't select columns from `names_from` or `values_from` (#1318)", {
  df <- tibble(name = c("x", "y"), value = c(1, 2))

  # And gives a nice error message!
  expect_snapshot({
    (expect_error(pivot_wider(df, id_cols = name, names_from = name, values_from = value)))
    (expect_error(pivot_wider(df, id_cols = value, names_from = name, values_from = value)))
  })
})

test_that("`id_cols` returns a tidyselect error if a column selection is OOB (#1318)", {
  df <- tibble(name = c("x", "y"), value = c(1, 2))

  expect_snapshot(
    (expect_error(pivot_wider(df, id_cols = foo)))
  )
})

test_that("pivoting a zero row data frame drops `names_from` and `values_from` (#1249)", {
  df <- tibble(key = character(), name = character(), value = integer())

  expect_identical(
    pivot_wider(df, names_from = name, values_from = value),
    tibble(key = character())
  )
})

test_that("known bug - building a wider spec with a zero row data frame loses `values_from` info (#1249)", {
  # We can't currently change this behavior in `pivot_wider_spec()`,
  # for fear of breaking backwards compatibility

  df <- tibble(key = character(), name = character(), value = integer())

  # Building the spec loses the fact that `value` was specified as `values_from`,
  # which would normally be in the `spec$.value` column
  spec <- build_wider_spec(df, names_from = name, values_from = value)

  # So pivoting with this spec accidentally keeps `value` around
  expect_identical(
    pivot_wider_spec(df, spec),
    tibble(key = character(), value = integer())
  )

  # If you specify `id_cols` to be the `key` column, it works right
  expect_identical(
    pivot_wider_spec(df, spec, id_cols = key),
    tibble(key = character())
  )

  # But `id_cols = everything()` won't work as intended, because we can't know
  # to remove `value` from `names(data)` before computing the tidy-selection
  expect_identical(
    pivot_wider_spec(df, spec, id_cols = everything()),
    tibble(key = character(), value = integer())
  )
})

test_that("`id_expand` generates sorted rows even if no expansion is done", {
  df <- tibble(id = c(2, 1), name = c("a", "b"), value = c(1, 2))
  res <- pivot_wider(df, id_expand = TRUE)
  expect_identical(res$id, c(1, 2))
})

test_that("`id_expand` does a cartesian expansion of `id_cols` columns (#770)", {
  df <- tibble(id1 = c(1, 2), id2 = c(3, 4), name = c("a", "b"), value = c(1, 2))

  expect_identical(
    pivot_wider(df, id_expand = TRUE),
    tibble(
      id1 = c(1, 1, 2, 2),
      id2 = c(3, 4, 3, 4),
      a = c(1, NA, NA, NA),
      b = c(NA, NA, NA, 2),
    )
  )
})

test_that("`id_expand` expands all levels of a factor `id_cols` column (#770)", {
  id1 <- factor(c(NA, "x"), levels = c("x", "y"))
  df <- tibble(id1 = id1, id2 = c(1, 2), name = c("a", "b"), value = c(1, 2))

  res <- pivot_wider(df, id_expand = TRUE)

  expect_identical(res$id1, factor(c("x", "x", "y", "y", NA, NA)))
  expect_identical(res$id2, c(1, 2, 1, 2, 1, 2))
})

test_that("`id_expand` with `values_fill` only fills implicit missings", {
  id1 <- factor(c("x", "x"), levels = c("x", "y"))
  df <- tibble(id1 = id1, id2 = c(1, 2), name = c("a", "b"), value = c(1, NA))

  res <- pivot_wider(df, id_expand = TRUE, values_fill = 0)

  expect_identical(res$a, c(1, 0, 0, 0))
  expect_identical(res$b, c(0, NA, 0, 0))
})

test_that("`id_expand` with `values_fill` can't accidentally fill missings in `id_cols`", {
  id1 <- factor(c(NA, "x"), levels = c("x", "y"))
  df <- tibble(id1 = id1, id2 = c(1, 2), name = c("a", "b"), value = c(1, 2))

  res <- pivot_wider(df, id_expand = TRUE, values_fill = list(id1 = 0))

  # Still has NAs! Both implicit (new combination) and explicit (pre-existing combination)
  expect_identical(res$id1, factor(c("x", "x", "y", "y", NA, NA)))
})

test_that("`id_expand` is validated", {
  df <- tibble(name = c("a", "b"), value = c(1, 2))

  expect_snapshot({
    (expect_error(pivot_wider(df, id_expand = 1)))
    (expect_error(pivot_wider(df, id_expand = "x")))
  })
})

# non-unique keys ---------------------------------------------------------

test_that("duplicated keys produce list column with warning", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)

  expect_snapshot(pv <- pivot_wider(df, names_from = key, values_from = val))

  expect_equal(pv$a, c(1, 2))
  expect_equal(as.list(pv$x), list(c(1L, 2L), 3L))
})

test_that("duplicated key warning mentions every applicable column", {
  df <- tibble(
    key = c("x", "x"),
    a = c(1, 2),
    b = c(3, 4),
    c = c(5, 6)
  )

  expect_snapshot(
    pivot_wider(
      df,
      names_from = key,
      values_from = c(a, b, c)
    )
  )

  expect_snapshot(
    pivot_wider(
      df,
      names_from = key,
      values_from = c(a, b, c),
      values_fn = list(b = sum)
    )
  )
})

test_that("duplicated key warning backticks non-syntactic names", {
  df <- tibble(
    `a 1` = c(1, 1, 2),
    a2 = c(1, 1, 2),
    `the-key` = c("x", "x", "x"),
    val = 1:3
  )

  expect_snapshot(pv <- pivot_wider(df, names_from = `the-key`, values_from = val))
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

test_that("values_fn can be an anonymous function (#1114)", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = c(1, 10, 100))
  pv <- pivot_wider(df, names_from = key, values_from = val, values_fn = ~ sum(.x))
  expect_equal(pv$x, c(11, 100))
})

test_that("values_fn applied even when no-duplicates", {
  df <- tibble(a = c(1, 2), key = c("x", "x"), val = 1:2)
  pv <- pivot_wider(df,
    names_from = key,
    values_from = val,
    values_fn = list(val = list)
  )

  expect_equal(pv$a, c(1, 2))
  expect_equal(as.list(pv$x), list(1L, 2L))
})

test_that("values_fn is validated", {
  df <- tibble(name = "x", value = 1L)
  expect_snapshot(
    (expect_error(pivot_wider(df, values_fn = 1)))
  )
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
  out <- pivot_wider(df, names_from = names, values_from = value, values_fill = 0)
  expect_equal(out$y, c(0, NA))
})

test_that("values_fill works with data frame fill values", {
  df <- tibble(
    id = c(1L, 2L),
    name = c("x", "y"),
    value = tibble(a = 1:2, b = 2:3)
  )

  out <- pivot_wider(df, values_fill = tibble(a = 0L, b = 0L))

  expect_identical(out$x, tibble(a = c(1L, 0L), b = c(2L, 0L)))
  expect_identical(out$y, tibble(a = c(0L, 2L), b = c(0L, 3L)))
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
    ~hw, ~.value, ~.name,
    "hw1", "mark", "hw1_mark",
    "hw1", "pr", "hw1_pr",
    "hw2", "pr", "hw2_pr",
    "hw2", "mark", "hw2_mark",
  )

  pv <- pivot_wider_spec(df, sp)
  expect_named(pv, c("name", sp$.name))
})

# unused -------------------------------------------------------------------

test_that("`unused_fn` can summarize unused columns (#990)", {
  df <- tibble(
    id = c(1, 1, 2, 2),
    unused1 = c(1, 2, 4, 3),
    unused2 = c(1, 2, 4, 3),
    name = c("a", "b", "a", "b"),
    value = c(1, 2, 3, 4)
  )

  # By name
  res <- pivot_wider(df, id_cols = id, unused_fn = list(unused1 = max))
  expect_named(res, c("id", "a", "b", "unused1"))
  expect_identical(res$unused1, c(2, 4))

  # Globally
  res <- pivot_wider(df, id_cols = id, unused_fn = list)
  expect_named(res, c("id", "a", "b", "unused1", "unused2"))
  expect_identical(res$unused1, list(c(1, 2), c(4, 3)))
  expect_identical(res$unused2, list(c(1, 2), c(4, 3)))
})

test_that("`unused_fn` works with anonymous functions", {
  df <- tibble(
    id = c(1, 1, 2, 2),
    unused = c(1, NA, 4, 3),
    name = c("a", "b", "a", "b"),
    value = c(1, 2, 3, 4)
  )

  res <- pivot_wider(df, id_cols = id, unused_fn = ~ mean(.x, na.rm = TRUE))
  expect_identical(res$unused, c(1, 3.5))
})

test_that("`unused_fn` must result in single summary values", {
  df <- tibble(
    id = c(1, 1, 2, 2),
    unused = c(1, 2, 4, 3),
    name = c("a", "b", "a", "b"),
    value = c(1, 2, 3, 4)
  )

  expect_snapshot(
    (expect_error(pivot_wider(df, id_cols = id, unused_fn = identity)))
  )
})

test_that("`unused_fn` works with expanded key from `id_expand`", {
  df <- tibble(
    id = factor(c(1, 1, 2, 2), levels = 1:3),
    unused = c(1, 2, 4, 3),
    name = c("a", "b", "a", "b"),
    value = c(1, 2, 3, 4)
  )

  res <- pivot_wider(df, id_cols = id, id_expand = TRUE, unused_fn = max)
  expect_identical(res$id, factor(1:3))
  expect_identical(res$unused, c(2, 4, NA))

  res <- pivot_wider(df, id_cols = id, id_expand = TRUE, unused_fn = ~ sum(is.na(.x)))
  expect_identical(res$unused, c(0L, 0L, 1L))
})

test_that("can't fill implicit missings in unused column with `values_fill`", {
  # (in theory this would need `unused_fill`, but it would only be used when
  # `id_expand = TRUE`, which doesn't feel that useful)

  df <- tibble(
    id = factor(c(1, 1, 2, 2), levels = 1:3),
    unused = c(1, 2, 4, 3),
    name = c("a", "b", "a", "b"),
    value = c(1, 2, 3, 4)
  )

  res <- pivot_wider(
    data = df,
    id_cols = id,
    id_expand = TRUE,
    unused_fn = list,
    values_fill = 0
  )

  expect_identical(res$a, c(1, 3, 0))
  expect_identical(res$b, c(2, 4, 0))
  expect_identical(res$unused, list(c(1, 2), c(4, 3), NA_real_))

  res <- pivot_wider(
    data = df,
    id_cols = id,
    id_expand = TRUE,
    unused_fn = list,
    values_fill = list(unused = 0)
  )

  expect_identical(res$unused, list(c(1, 2), c(4, 3), NA_real_))
})

test_that("`unused_fn` is validated", {
  df <- tibble(id = 1, unused = 1, name = "a", value = 1)

  expect_snapshot(
    (expect_error(pivot_wider(df, id_cols = id, unused_fn = 1)))
  )
})
