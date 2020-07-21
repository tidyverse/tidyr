context("test-pack")


# pack --------------------------------------------------------------------

test_that("can pack multiple columns", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df %>% pack(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("a", "b"))
  expect_equal(out$a, df[c("a1", "a2")])
  expect_equal(out$b, df[c("b1", "b2")])
})

test_that("packing no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(pack(df), df)
})

test_that("can strip outer names from inner names", {
  df <- tibble(ax = 1, ay = 2)
  out <- pack(df, a = c(ax, ay), .names_sep = "")
  expect_named(out$a, c("x", "y"))
})

test_that("all inputs must be named", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_error(pack(df, a = c(a1, a2), c(b1, b2)), "must be named")
  expect_error(pack(df, c(a1, a2), c(b1, b2)), "must be named")
})

test_that("grouping is preserved", {
  df <- tibble(g1 = 1, g2 = 1, g3 = 1)
  out <- df %>% dplyr::group_by(g1, g2) %>% pack(g = c(g2, g3))
  expect_equal(dplyr::group_vars(out), "g1")
})

# unpack ------------------------------------------------------------------

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = tibble(y = 1))
  out <- df %>% dplyr::group_by(g) %>% unpack(x)
  expect_equal(dplyr::group_vars(out), "g")
})

test_that("can't unpack atomic vectors", {
  df <- tibble(x = 1:2)
  expect_error(df %>% unpack(x), "must be a data frame column")
})

test_that("df-cols are directly unpacked", {
  df <- tibble(x = 1:3, y = tibble(a = 1:3, b = 3:1))
  out <- df %>% unpack(y)
  expect_named(out, c("x", "a", "b"))
  expect_equal(out[c("a", "b")], df$y)
})

test_that("can unpack 0-col dataframe", {
  df <- tibble(x = 1:3, y = tibble(.rows = 3))
  out <- df %>% unpack(y)
  expect_named(out, c("x"))
})

test_that("can unpack 0-row dataframe", {
  df <- tibble(x = integer(), y = tibble(a = integer()))
  out <- df %>% unpack(y)
  expect_named(out, c("x", "a"))
})

test_that("can choose to add separtor", {
  df <- tibble(x = 1, y = tibble(a = 2), z = tibble(a = 3))
  out <- df %>% unpack(c(y, z), names_sep = "_")
  expect_named(out, c("x", "y_a", "z_a"))
})
