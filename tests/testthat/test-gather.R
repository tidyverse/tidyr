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

test_that("if not supply, key and value default to key and value", {
  df <- data.frame(x = 1:2)
  out <- gather(df)
  expect_equal(nrow(out), 2)
  expect_equal(names(out), c("key", "value"))
})

test_that("preserve class of input", {
  dat <- data.frame(x = 1:2)
  dat %>% tbl_df %>% gather %>% expect_is("tbl_df")
  dat %>% tbl_df %>% gather %>% expect_is("tbl_df")
})
