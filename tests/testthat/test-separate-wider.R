# separate_by_wider --------------------------------------------------------

test_that("separate_by_wider() can create column names", {
  df <- data.frame(x = c("a b", "x y"))
  out <- df %>% separate_by_wider(x, " ", names_sep = "")
  expect_equal(out$x1, c("a", "x"))
  expect_equal(out$x2, c("b", "y"))
})

test_that("separate_by_wider() errors about too few/too many values", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  expect_snapshot(error = TRUE,
    df %>% separate_by_wider(x, " ", names = c("a", "b"))
  )
})

test_that("separate_by_wider() can ignore problems", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  out <- df %>% separate_by_wider(x, " ",
    names = c("a", "b"),
    align_short = "start",
    align_long = "drop",
  )
  expect_equal(out[1, ], tibble(a = "x", b = NA_character_))
  expect_equal(out[3, ], tibble(a = "x", b = "y"))

  out <- df %>% separate_by_wider(x,  " ",
    names = c("a", "b"),
    align_short = "end",
    align_long = "merge",
  )
  expect_equal(out[1, ], tibble(a = NA_character_, b = "x"))
  expect_equal(out[3, ], tibble(a = "x", b = "y z"))
})

test_that("separate_by_wider() can diagnose problems", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  out <- df %>% separate_by_wider(x, " ",
    names = c("a", "b"),
    align_short = "debug",
    align_long = "debug",
  )
  expect_equal(out$x, df$x)
  expect_equal(out$x_ok, c(FALSE, TRUE, FALSE))
  expect_equal(out$x_pieces, c(1, 2, 3))
  expect_equal(out$x_remainder, c("", "", " z"))

  # And can do so selectively
  out <- df %>% separate_by_wider(x, " ",
    names = c("a", "b"),
    align_short = "start",
    align_long = "debug",
  )
  expect_equal(out$x_ok, c(TRUE, TRUE, FALSE))
})

test_that("separate_by_wider() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_by_wider()
    df %>% separate_by_wider(x)
    df %>% separate_by_wider(x, 1)
    df %>% separate_by_wider(x, "")
    df %>% separate_by_wider(x, "", names = 1)
    df %>% separate_by_wider(x, "", names = c(x = "x"))
    df %>% separate_by_wider(x, "", names_sep = "_", align_long = "merge")
  })
})

# separate_at_wider -------------------------------------------------------

test_that("separate_at_wider() errors if lengths are inconsistent", {
  df <- data.frame(x = c("ab", "abc", "abcd"))
  expect_snapshot(error = TRUE,
    df %>% separate_at_wider(x, widths = c("a" = 2, "b" = 1))
  )
})

test_that("separate_at_wider() can ignore problems", {
  df <- data.frame(x = c("ab", "abc", "abcd"))

  out <- df %>% separate_at_wider(
    x,
    widths = c("a" = 2, "b" = 1),
    align_short = "start",
    align_long = "drop"
  )
  expect_equal(out[1, ], tibble(a = "ab", b = NA_character_))
  expect_equal(out[2, ], tibble(a = "ab", b = "c"))
  expect_equal(out[3, ], tibble(a = "ab", b = "c"))
})

test_that("separate_at_wider() can diagnose problems", {
  df <- data.frame(x = c("ab", "abc", "abcd"))

  out <- df %>% separate_at_wider(
    x,
    widths = c("a" = 2, "b" = 1),
    align_short = "debug",
    align_long = "debug"
  )
  expect_equal(out$x, df$x)
  expect_equal(out$x_ok, c(FALSE, TRUE, FALSE))
  expect_equal(out$x_width, c(2, 3, 4))
  expect_equal(out$x_remainder, c("", "", "d"))
})

test_that("separate_at_wider() can drop values", {
  df <- data.frame(x = "a-b")
  out <- df %>% separate_at_wider(x, widths = c("a" = 1, 1, "b" = 1))
  expect_equal(out, tibble(a = "a", b = "b"))
})

test_that("separate_at_wider() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_at_wider()
    df %>% separate_at_wider(x)
    df %>% separate_at_wider(x, widths = 1.5)
    df %>% separate_at_wider(x, widths = 1L)
  })
})

# separate_regex_wider ----------------------------------------------------

test_that("separate_regex_wider() can extract columns", {
  df <- data.frame(x = "a123")
  out <- df %>% separate_regex_wider(x, c("a" = ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_regex_wider() errors if match fails", {
  df <- data.frame(x = c("a-123", "b_123"))
  expect_snapshot(error = TRUE, {
    df %>% separate_regex_wider(x, c("a" = ".", "-", "b" = "\\d+"))
  })
})

test_that("separate_regex_wider() can silence errors", {
  df <- data.frame(x = c("a-123", "b_123"))
  out <- df %>% separate_regex_wider(
    x,
    c("a" = ".", "-", "b" = "\\d+"),
    align_short = "start"
  )
  expect_equal(out$a, c("a", "b"))
  expect_equal(out$b, c("123", NA))
})

test_that("separate_regex_wider() can diangose errors", {
  df <- data.frame(x = c("a-123", "b_123", "c-123x", "XXXX"))
  out <- df %>% separate_regex_wider(
    x,
    c("a" = "[a-z]", "-", "b" = "\\d+"),
    align_short = "debug"
  )
  expect_equal(out$x, df$x)
  expect_equal(out$x_ok, c(TRUE, FALSE, FALSE, FALSE))
  expect_equal(out$x_matches, c(3, 1, 3, 0))
  expect_equal(out$x_remainder, c("", "_123", "x", "XXXX"))
})

test_that("separate_regex_wider() can drop values", {
  df <- data.frame(x = "ab123")
  out <- df %>% separate_regex_wider(x, c("a" = ".", ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_regex_wider() can use odd names", {
  df <- data.frame(x = "ab123")
  out <- df %>% separate_regex_wider(x, c("_" = ".", ".", "." = "\\d+"))
  expect_equal(out, tibble(`_` = "a", `.` = "123"))
})

test_that("separate_regex_wider() gives informative error if () used", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_regex_wider(x, c("_" = "(.)"))
  })
})

test_that("separate_regex_wider() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_regex_wider()
    df %>% separate_regex_wider(x)
    df %>% separate_regex_wider(x, patterns = ".")
  })
})
