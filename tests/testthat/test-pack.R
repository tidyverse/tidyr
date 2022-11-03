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

test_that("grouping is preserved", {
  df <- tibble(g1 = 1, g2 = 1, g3 = 1)
  out <- df %>%
    dplyr::group_by(g1, g2) %>%
    pack(g = c(g2, g3))
  expect_equal(dplyr::group_vars(out), "g1")
})

test_that("pack validates its inputs", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)

  expect_snapshot(error = TRUE,{
    pack(1)
    pack(df, c(a1, a2), c(b1, b2))
    pack(df, a = c(a1, a2), c(b1, b2))
    pack(df, a = c(a1, a2), .names_sep = 1)
  })
})

# unpack ------------------------------------------------------------------

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = tibble(y = 1))
  out <- df %>%
    dplyr::group_by(g) %>%
    unpack(x)
  expect_equal(dplyr::group_vars(out), "g")
})

test_that("non-df-cols are skipped (#1153)", {
  df <- tibble(x = 1:2, y = tibble(a = 1:2, b = 1:2))

  expect_identical(unpack(df, x), df)
  expect_identical(unpack(df, everything()), unpack(df, y))
})

test_that("empty columns that aren't data frames aren't unpacked (#1191)", {
  df <- tibble(x = integer())
  expect_identical(unpack(df, x), df)
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

test_that("can unpack 1-row but 0-col dataframe (#1189)", {
  df <- tibble(x = tibble(.rows = 1))
  expect_identical(unpack(df, x), tibble::new_tibble(list(), nrow = 1L))
})

test_that("unpack() validates its inputs", {
  df <- tibble(x = 1:2, y = tibble(a = 1:2, b = 1:2))

  expect_snapshot(error = TRUE, {
    unpack(1)
    unpack(df)
    unpack(df, y, names_sep = 1)
  })
})
