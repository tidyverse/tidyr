test_that("separate_by_wider() can create column names", {
  df <- data.frame(x = c("a b", "x y"))
  out <- df %>% separate_by_wider(x, " ", names_sep = "")
  expect_equal(out$x1, c("a", "x"))
  expect_equal(out$x2, c("b", "y"))
})

test_that("separate_by_wider() warns about too few/too many values", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  expect_snapshot_warning(
    out <- df %>% separate_by_wider(x, " ", names = c("a", "b"))
  )
  expect_equal(out[1, ], tibble(a = "x", b = NA_character_))
  expect_equal(out[3, ], tibble(a = "x", b = "y"))
})

test_that("separate_by_wider() can control too few/too many values", {
  df <- data.frame(x = c("x", "x y", "x y z"))
  out <- df %>% separate_by_wider(x, " ",
    names = c("a", "b"),
    align_direction = "merge",
    align_warn = "none"
  )
  expect_equal(out[1, ], tibble(a = "x", b = NA_character_))
  expect_equal(out[3, ], tibble(a = "x", b = "y z"))

  out <- df %>% separate_by_wider(x,  " ",
    names = c("a", "b"),
    align_direction = "start",
    align_warn = "none"
  )
  expect_equal(out[3, ], tibble(a = "x", b = "y"))
})

test_that("separate_by_wider() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_by_wider()
    df %>% separate_by_wider(x, names = 1)
    df %>% separate_by_wider(x, names = c(x = "x"))
    df %>% separate_by_wider(x, names = "y", delim = 1)
    df %>% separate_by_wider(x, delim = "")
  })
})

test_that("separate_at_wider() fills too short with NA", {
  df <- data.frame(x = c("ab", "abc", "abcd"))
  expect_snapshot_warning(
    out <- df %>% separate_at_wider(x, widths = c("a" = 2, "b" = 1))
  )
  expect_equal(out[1, ], tibble(a = "ab", b = NA_character_))
  expect_equal(out[2, ], tibble(a = "ab", b = "c"))
  expect_equal(out[3, ], tibble(a = "ab", b = "c"))

  # And can override default
  out <- df %>% separate_at_wider(x,
    widths = c("a" = 2, "b" = 1),
    align_direction = "end",
    align_warn = "none"
  )
  expect_equal(out[1, ], tibble(a = NA_character_, b = "ab"))
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
    df %>% separate_at_wider(x, widths = 1.5)
    df %>% separate_at_wider(x, widths = 1L)
  })
})

test_that("separate_group_wider() can extract columns", {
  df <- data.frame(x = "a123")
  out <- df %>% separate_group_wider(x, c("a" = ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_group_wider() can drop values", {
  df <- data.frame(x = "ab123")
  out <- df %>% separate_group_wider(x, c("a" = ".", ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_group_wider() can use odd names", {
  df <- data.frame(x = "ab123")
  out <- df %>% separate_group_wider(x, c("_" = ".", ".", "." = "\\d+"))
  expect_equal(out, tibble(`_` = "a", `.` = "123"))
})

test_that("separate_group_wider() gives informative error if () used", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_group_wider(x, c("_" = "(.)"))
  })
})

test_that("separate_group_widerp() requires complete match by default", {
  df <- data.frame(x = " a123 ")
  expect_snapshot_warning(
    out <- df %>% separate_group_wider(x, c("a" = ".", "b" = "\\d+"))
  )
  expect_equal(out, tibble(a = NA_character_, b = NA_character_))

  out <- df %>% separate_group_wider(
    x, c("a" = ".", "b" = "\\d+"),
    match_complete = FALSE
  )
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_group_wider() validates its inputs", {
  df <- data.frame(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_group_wider()
    df %>% separate_group_wider(x, patterns = ".")
    df %>% separate_group_wider(x, patterns = c(y = "."), match_complete = NA)
  })
})
