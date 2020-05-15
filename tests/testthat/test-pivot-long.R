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
  pv <- pivot_longer_spec(df, spec = sp)

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
  pv <- pivot_longer(df, x:y, values_drop_na = TRUE)

  expect_equal(pv$name, c("x", "y"))
  expect_equal(pv$value, c(1, 2))
})

test_that("can handle missing combinations", {
  df <- tribble(
    ~id, ~x_1, ~x_2, ~y_2,
    "A",    1,    2,  "a",
    "B",    3,    4,  "b",
  )
  pv <- pivot_longer(df, -id, names_to = c(".value", "n"), names_sep = "_")

  expect_named(pv, c("id", "n", "x", "y"))
  expect_equal(pv$x, 1:4)
  expect_equal(pv$y, c(NA, "a", NA, "b"))
})

test_that("mixed columns are automatically coerced", {
  df <- data.frame(x = factor("a"), y = factor("b"))
  pv <- pivot_longer(df, x:y)

  expect_equal(pv$value, factor(c("a", "b")))
})

test_that("can override default output column type", {
  df <- tibble(x = "x", y = 1L)
  pv <- pivot_longer(df, x:y, values_transform = list(value = as.list))
  expect_equal(pv$value, list("x", 1))
})

test_that("can pivot to multiple measure cols", {
  df <- tibble(x = "x", y = 1)
  sp <- tribble(
    ~.name, ~.value, ~row,
    "x", "X", 1,
    "y", "Y", 1,
  )
  pv <- pivot_longer_spec(df, sp)

  expect_named(pv, c("row", "X", "Y"))
  expect_equal(pv$X, "x")
  expect_equal(pv$Y, 1)
})

test_that("original col order is preserved", {
  df <- tribble(
    ~id, ~z_1, ~y_1, ~x_1, ~z_2,  ~y_2, ~x_2,
    "A",    1,    2,    3,     4,    5,    6,
    "B",    7,    8,    9,    10,   11,   12,
  )
  pv <- pivot_longer(df, -id, names_to = c(".value", "n"), names_sep = "_")
  expect_named(pv, c("id", "n", "z", "y", "x"))
})

test_that("handles duplicated column names", {
  df <- tibble(x = 1, a = 1, a = 2, b = 3, b = 4, .name_repair = "minimal")
  pv <- pivot_longer(df, -x)

  expect_named(pv, c("x", "name", "value"))
  expect_equal(pv$name, c("a", "a", "b", "b"))
  expect_equal(pv$value, 1:4)
})

test_that("can pivot duplicated names to .value", {
  df <- tibble(x = 1, a_1 = 1, a_2 = 2, b_1 = 3, b_2 = 4)
  pv1 <- pivot_longer(df, -x, names_to = c(".value", NA), names_sep = "_")
  pv2 <- pivot_longer(df, -x, names_to = c(".value", NA), names_pattern = "(.)_(.)")
  pv3 <- pivot_longer(df, -x, names_to = ".value", names_pattern = "(.)_.")

  expect_named(pv1, c("x", "a", "b"))
  expect_equal(pv1$a, c(1, 2))
  expect_equal(pv2, pv1)
  expect_equal(pv3, pv1)
})

test_that(".value can be at any position in `names_to`", {
  samp <- tibble(
    i = 1:4,
    y_t1 = rnorm(4),
    y_t2 = rnorm(4),
    z_t1 = rep(3, 4),
    z_t2 = rep(-2, 4),
  )

  value_first <- pivot_longer(samp, -i,
                              names_to = c(".value", "time"), names_sep = "_")

  samp2 <- dplyr::rename(samp, t1_y = y_t1,
                               t2_y = y_t2,
                               t1_z = z_t1,
                               t2_z = z_t2)

  value_second <- pivot_longer(samp2, -i,
                               names_to = c("time", ".value"), names_sep = "_")

  expect_identical(value_first, value_second)
})

test_that("type error message use variable names", {
  df <- data.frame(abc = 1, xyz = "b")
  err <- capture_error(pivot_longer(df, everything()))
  expect_s3_class(err, "vctrs_error_incompatible_type")
  expect_equal(err$x_arg, "abc")
  expect_equal(err$y_arg, "xyz")
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, x1 = 1, x2 = 2)
  out <- df %>%
    dplyr::group_by(g) %>%
    pivot_longer(x1:x2, names_to = "x", values_to = "v")
  expect_equal(dplyr::group_vars(out), "g")
})

# spec --------------------------------------------------------------------

test_that("validates inputs", {
  df <- tibble(x = 1)
  expect_error(build_longer_spec(df, x, values_to = letters[1:2]),
    class = "vctrs_error_assert"
  )
})

test_that("no names doesn't generate names", {
  df <- tibble(x = 1)
  expect_equal(
    colnames(build_longer_spec(df, x, names_to = character())),
    c(".name", ".value")
  )
})

test_that("multiple names requires names_sep/names_pattern", {
  df <- tibble(x_y = 1)
  expect_error(
    build_longer_spec(df, x_y, names_to = c("a", "b")),
    "multiple names"
  )

  expect_error(
    build_longer_spec(df, x_y,
      names_to = c("a", "b"),
      names_sep = "x",
      names_pattern = "x"
    ),
    "one of `names_sep` or `names_pattern"
  )
})

test_that("names_sep generates correct spec", {
  df <- tibble(x_y = 1)
  sp <- build_longer_spec(df, x_y, names_to = c("a", "b"), names_sep = "_")

  expect_equal(sp$a, "x")
  expect_equal(sp$b, "y")
})

test_that("names_sep fails with single name", {
  df <- tibble(x_y = 1)
  expect_error(build_longer_spec(df, x_y, names_to = "x", names_sep = "_"), "`names_sep`")
})

test_that("names_pattern generates correct spec", {
  df <- tibble(zx_y = 1)
  sp <- build_longer_spec(df, zx_y, names_to = c("a", "b"), names_pattern = "z(.)_(.)")
  expect_equal(sp$a, "x")
  expect_equal(sp$b, "y")

  sp <- build_longer_spec(df, zx_y, names_to = "a", names_pattern = "z(.)")
  expect_equal(sp$a, "x")
})

test_that("names_to can override value_to", {
  df <- tibble(x_y = 1)
  sp <- build_longer_spec(df, x_y, names_to = c("a", ".value"), names_sep = "_")

  expect_equal(sp$.value, "y")
})

test_that("names_prefix strips off from beginning", {
  df <- tibble(zzyz = 1)
  sp <- build_longer_spec(df, zzyz, names_prefix = "z")

  expect_equal(sp$name, "zyz")
})

test_that("can cast to custom type", {
  df <- tibble(w1 = 1)
  sp <- build_longer_spec(df, w1,
    names_prefix = "w",
    names_transform = list(name = as.integer)
  )

  expect_equal(sp$name, 1L)
})

test_that("Error if the `col` can't be selected.", {
  expect_error(pivot_longer(iris, matches("foo")), "select at least one")
})
