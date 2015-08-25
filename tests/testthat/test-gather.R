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

test_that("gather throws error for POSIXlt", {
  df <- data.frame(y = 1)
  df$x <- as.POSIXlt(Sys.time())

  expect_error(gather(df, key, val, -x), "a POSIXlt")
})
