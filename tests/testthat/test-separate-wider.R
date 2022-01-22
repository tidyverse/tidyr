test_that("separate_wider_delim() warns about too few/too many values", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  expect_snapshot_warning(
    out <- df %>% separate_wider_delim(x, c("a", "b"), delim = " ")
  )
  expect_equal(out[1, ], tibble(a = "x", b = NA_character_))
  expect_equal(out[3, ], tibble(a = "x", b = "y"))
})

test_that("separate_wider_delim() can control too few/too many values", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  out <- df %>% separate_wider_delim(x, c("a", "b"),
    delim = " ",
    extra = "merge",
    fill = "left"
  )
  expect_equal(out[1, ], tibble(a = NA_character_, b = "x"))
  expect_equal(out[3, ], tibble(a = "x", b = "y z"))

  out <- df %>% separate_wider_delim(x, c("a", "b"),
    delim = " ",
    extra = "drop",
    fill = "left"
  )
  expect_equal(out[3, ], tibble(a = "x", b = "y"))
})

test_that("separate_wider_delim() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_delim()
    df %>% separate_wider_delim(x, into = 1)
    df %>% separate_wider_delim(x, into = c(x = "x"))
    df %>% separate_wider_delim(x, into = "y", delim = 1)
  })
})

test_that("separate_wider_fixed() fills too short with NA", {
  # TODO: should these warn?
  df <- data.frame(x = c("ab", "abc", "abcd"))
  out <- df %>% separate_wider_fixed(x, widths = c("a" = 2, "b" = 1))
  expect_equal(out[1, ], tibble(a = "ab", b = NA_character_))
  expect_equal(out[2, ], tibble(a = "ab", b = "c"))
  expect_equal(out[3, ], tibble(a = "ab", b = "c"))
})

test_that("separate_wider_fixed() can drop values", {
  df <- data.frame(x = "a-b")
  out <- df %>% separate_wider_fixed(x, widths = c("a" = 1, 1, "b" = 1))
  expect_equal(out, tibble(a = "a", b = "b"))
})

test_that("separate_wider_fixed() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_fixed()
    df %>% separate_wider_fixed(x, widths = 1.5)
    df %>% separate_wider_fixed(x, widths = 1L)
  })
})

test_that("separate_wider_regex() can extract columns", {
  df <- data.frame(x = "a123")
  out <- df %>% separate_wider_regex(x, c("a" = ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_wider_regex() can drop values", {
  df <- data.frame(x = "ab123")
  out <- df %>% separate_wider_regex(x, c("a" = ".", ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_wider_regexp() requires complete match by default", {
  df <- data.frame(x = " a123 ")
  out <- df %>% separate_wider_regex(x, c("a" = ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = NA_character_, b = NA_character_))

  out <- df %>% separate_wider_regex(
    x, c("a" = ".", "b" = "\\d+"),
    match_complete = FALSE
  )
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_wider_regex() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_regex()
    df %>% separate_wider_regex(x, patterns = ".")
    df %>% separate_wider_regex(x, patterns = c(y = "."), match_complete = NA)
  })
})
