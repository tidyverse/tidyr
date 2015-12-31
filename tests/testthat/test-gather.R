context("Gather")

test_that("gather all columns when ... is empty", {
  df <- data.frame(
    x = 1:5,
    y = 6:10
  )
  out <- gather(df, key, val)
  expect_equal(nrow(out), 10)
  expect_equal(names(out), c("key", "val"))
})

test_that("gather returns input if no columns gathered", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- gather(df, a, b, -x, -y)
  expect_equal(df, out)
})

test_that("if not supply, key and value default to key and value", {
  df <- data.frame(x = 1:2)
  out <- gather(df)
  expect_equal(nrow(out), 2)
  expect_equal(names(out), c("key", "value"))
})

test_that("Missing values removed when na.rm = TRUE", {
  df <- data.frame(x = c(1, NA))
  out <- gather(df, k, v)
  expect_equal(out$v, df$x)

  out <- gather(df, k, v, na.rm = TRUE)
  expect_equal(out$v, 1)
})

test_that("key converted to character by default", {
  df <- data.frame(y = 1, x = 2)
  out <- gather(df, k, v)
  expect_equal(out$k, c("y", "x"))
})

test_that("key preserves column ordering when factor_key = TRUE", {
  df <- data.frame(y = 1, x = 2)
  out <- gather(df, k, v, factor_key = TRUE)
  expect_equal(out$k, factor(c("y", "x"), levels = c("y", "x")))
})

test_that("preserve class of input", {
  dat <- data.frame(x = 1:2)
  dat %>% (dplyr::tbl_df) %>% gather %>% expect_is("tbl_df")

  skip_if_not_installed("data.table")
  dat %>% (dplyr::tbl_df) %>% gather %>% expect_is("tbl_df")
})

test_that("additional controls which columns to gather", {
  data <- dplyr::data_frame(a = 1, b1 = 1, b2 = 2, b3 = 3)
  out <- gather(data, key, val, b1:b3)

  expect_equal(names(out), c("a", "key", "val"))
  expect_equal(out$val, 1:3)
})

test_that("group_vars are kept where possible", {
  df <- dplyr::data_frame(x = 1, y = 1, z = 1)

  # Can't keep
  out <- df %>% dplyr::group_by(x) %>% gather(key, val, x:z)
  expect_equal(out, dplyr::data_frame(key = c("x", "y", "z"), val = 1))

  # Can keep
  out <- df %>% dplyr::group_by(x) %>% gather(key, val, y:z)
  expect_equal(dplyr::groups(out), list(quote(x)))
})

# Column types ------------------------------------------------------------

test_that("gather throws error for POSIXlt", {
  df <- data.frame(y = 1)
  df$x <- as.POSIXlt(Sys.time())

  expect_error(gather(df, key, val, -x), "a POSIXlt")
})

test_that("factors coerced to characters, not integers", {
  df <- data.frame(
    v1 = 1:3,
    v2 = factor(letters[1:3])
  )

  expect_warning(out <- gather(df, k, v),
    "attributes are not identical across measure variables")

  expect_equal(out$v, c(1:3, letters[1:3]))
})

test_that("attributes of id variables are preserved", {
  df <- data.frame(x = factor(1:3), y = 1:3, z = 3:1)
  out <- gather(df, key, val, -x)

  expect_equal(attributes(df$x), attributes(out$x))
})


test_that("common attributes are preserved", {
  df <- data.frame(date1 = Sys.Date(), date2 = Sys.Date() + 10)
  out <- gather(df, k, v)

  expect_is(out$v, "Date")
})

test_that("varying attributes are dropped with a warning", {
  df <- data.frame(
    date1 = as.POSIXct(Sys.Date()),
    date2 = Sys.Date() + 10
  )
  expect_warning(gather(df, k, v),
    "attributes are not identical across measure variables")
})

test_that("gather preserves OBJECT bit on e.g. POSIXct", {
  df <- data.frame(now = Sys.time())
  out <- gather(df, k, v)

  object_bit_set <- function(x) {
    grepl("\\[OBJ", capture.output(.Internal(inspect(x)))[1])
  }
  expect_true(object_bit_set(out$v))
})

test_that("can handle list-columns", {
  df <- dplyr::data_frame(x = 1:2, y = list("a", TRUE))
  out <- gather(df, k, v, -y)

  expect_identical(out$y, df$y)
})
