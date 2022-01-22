
# wider -------------------------------------------------------------------

test_that("separate_wider_delim() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_delim()
    df %>% separate_wider_delim(x, into = 1)
    df %>% separate_wider_delim(x, into = c(x = "x"))
    df %>% separate_wider_delim(x, into = "y", delim = 1)
  })
})

test_that("separate_wider_fixed() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_fixed()
    df %>% separate_wider_fixed(x, widths = 1.5)
    df %>% separate_wider_fixed(x, widths = 1L)
  })
})

test_that("separate_wider_regex() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_regex()
    df %>% separate_wider_regex(x, patterns = ".")
    df %>% separate_wider_regex(x, patterns = c(y = "."), match_complete = NA)
  })
})


# longer ------------------------------------------------------------------

test_that("separate_longer_delim() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_longer_delim()
    df %>% separate_longer_delim(delim = 1)
  })
})

test_that("separate_longer_fixed() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_longer_fixed()
    df %>% separate_longer_fixed(y, width = 1.5)
  })
})
