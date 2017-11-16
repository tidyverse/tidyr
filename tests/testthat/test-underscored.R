context("Deprecated SE variants")

test_that("complete_()", {
  df <- tibble(x = 1:2, y = 1:2, z = 3:4)
  out <- complete_(df, list("x", ~y))
  expect_identical(nrow(out), 4L)
  expect_identical(out$z, c(3L, NA, NA, 4L))
})

test_that("drop_na_() ", {
  # Specifying (a) variable(s) considers only that variable(s)
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- tibble(x = c(1, 2), y = c("a", NA))
  res <- tidyr::drop_na_(df, "x")
  expect_identical(res, exp)

  exp <- tibble(x = c(1), y = c("a"))
  res <- tidyr::drop_na(df, c("x", "y"))
  expect_identical(res, exp)

  # Empty call drops every row
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  res <- tidyr::drop_na_(df, character())
  expect_identical(res, tibble(x = 1, y = "a"))
})

test_that("drop_na_() works with non-syntactic names", {
  df <- tibble(`non-syntactic` = 1)
  expect_identical(drop_na_(df, "non-syntactic"), drop_na(df, `non-syntactic`))
})

test_that("expand_()", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand_(df, list("x", ~y))
  expect_identical(names(out), c("x", "y"))
  expect_identical(nrow(out), 4L)
})

test_that("extract_()", {
  df <- data.frame(x = c("a.b", "a.d", "b.c"))
  out <- df %>% extract_("x", "A")
  expect_identical(out$A, c("a", "a", "b"))
})

test_that("fill_()", {
  df <- tibble(x = c(1, NA, NA))
  out <- fill_(df, "x")
  expect_identical(out$x, c(1, 1, 1))
})

test_that("fill_() works with non-syntactic names", {
  df <- tibble(`non-syntactic` = 1)
  expect_identical(fill_(df, "non-syntactic"), fill(df, `non-syntactic`))
})

test_that("gather_()", {
  df <- data.frame(x = 1:5, y = 6:10)
  out <- gather_(df, "key", "val", c("x", "y"))
  expect_identical(nrow(out), 10L)
  expect_identical(names(out), c("key", "val"))
})

test_that("gather_() works with non-syntactic names", {
  df <- tibble(`non-syntactic` = 1)
  expect_identical(
    gather(df, key, val, `non-syntactic`),
    gather_(df, "key", "val", "non-syntactic")
  )
  expect_identical(
    gather(df, `key space`, `val space`, `non-syntactic`),
    gather_(df, "key space", "val space", "non-syntactic")
  )
})

test_that("nest_()", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_identical(nest_(df, "y", "y"), nest(df, y, .key = y))
})

test_that("nest_() works with non-syntactic names", {
  df <- tibble(`x` = c(1, 1, 1), `non-syntactic` = 1:3)
  expect_identical(
    nest_(df, "non-syntactic", "non-syntactic"),
    nest(df, `non-syntactic`, .key = `non-syntactic`)
  )
})

test_that("separate_()", {
  df <- tibble(x = c(NA, "a b"))
  out <- separate_(df, "x", c("x", "y"))
  expect_identical(out$x, c(NA, "a"))
  expect_identical(out$y, c(NA, "b"))
})

test_that("separate() works with non-syntactic names", {
  df <- tibble(`non-syntactic` = "1,2")
  into <- c("non", "syntactic")
  expect_identical(separate_(df, "non-syntactic", into), separate(df, `non-syntactic`, into))
})

test_that("separate_rows() works with non-syntactic names", {
  df <- tibble(`non-syntactic` = 1)
  expect_identical(separate_rows_(df, "non-syntactic"), separate_rows(df, `non-syntactic`))
})

test_that("spread_()", {
  df1 <- data.frame(x = c("a", "b"), y = 1:2)
  df2 <- data.frame(x = c("b", "a"), y = 2:1)
  one <- spread_(df1, "x", "y")
  two <- spread_(df2, "x", "y") %>% select(a, b) %>% arrange(a, b)
  expect_identical(one, two)
})

test_that("spread_() works with non-syntactic names", {
  df <- tibble(`non-syntactic` = c("a", "b"), `non syntactic` = 1:2)
  expect_identical(
    spread(df, `non-syntactic`, `non syntactic`),
    spread_(df, "non-syntactic", "non syntactic")
  )
})

test_that("unite_()", {
  df <- tibble(x = "a", y = "b")
  out <- unite_(df, "z", c("x", "y"))
  expect_named(out, "z")
  expect_identical(out$z, "a_b")
})

test_that("unite_() works with non-syntactic names", {
  df <- tibble(x = 1, `non-syntactic` = 1)
  expect_identical(unite_(df, "x", "non-syntactic"), unite(df, x, `non-syntactic`))
})

test_that("unnest_()", {
  df <- tibble(x = list(1, 2:3, 4:10))
  expect_identical(unnest_(df)$x, dbl(1:10))
})
