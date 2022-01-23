test_that("separate_longer_delim() creates rows", {
  df <- data.frame(id = 1:2, x = c("x", "y,z"))
  out <- separate_longer_delim(df, x, delim = ",")
  expect_equal(out$id, c(1, 2, 2))
  expect_equal(out$x, c("x", "y", "z"))
})

test_that("separate_longer_delim() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_longer_delim()
    df %>% separate_longer_delim(x, delim = 1)
  })
})

test_that("separate_longer_fixed() creates rows", {
  df <- data.frame(id = 1:2, x = c("x", "yz"))
  out <- separate_longer_fixed(df, x, width = 1)
  expect_equal(out$id, c(1, 2, 2))
  expect_equal(out$x, c("x", "y", "z"))
})

test_that("separate_longer_fixed() can keep empty rows", {
  df <- data.frame(id = 1:2, x = c("", "x"))
  out <- separate_longer_fixed(df, x, width = 1)
  expect_equal(out$id, 2)
  expect_equal(out$x, "x")

  out <- separate_longer_fixed(df, x, width = 1, keep_empty = TRUE)
  expect_equal(out$id, c(1, 2))
  expect_equal(out$x, c(NA, "x"))
})

test_that("separate_longer_fixed() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_longer_fixed()
    df %>% separate_longer_fixed(x, width = 1.5)
  })
})

test_that("separate_longer_group() can extract repeated matches", {
  df <- data.frame(id = 1:2, x = c("x1 x2", "x3"))
  out <- df %>% separate_longer_group(x, "x(.)")
  expect_equal(out$id, c(1, 1, 2))
  expect_equal(out$x, c("1", "2", "3"))
})

test_that("separate_longer_group() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_longer_group()
    df %>% separate_longer_group(x, 1)
    df %>% separate_longer_group(x, "x")
  })
})
