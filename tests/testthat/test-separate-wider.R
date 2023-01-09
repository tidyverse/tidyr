# separate_wider_delim --------------------------------------------------------

test_that("separate_wider_delim() can create column names", {
  df <- tibble(x = c("a b", "x y"))
  out <- df %>% separate_wider_delim(x, " ", names_sep = "")
  expect_equal(out$x1, c("a", "x"))
  expect_equal(out$x2, c("b", "y"))
})

test_that("separate_wider_delim() errors about too few/too many values", {
  df <- tibble(x = c("x", "x y", "x y z"))
  expect_snapshot(error = TRUE,
    df %>% separate_wider_delim(x, " ", names = c("a", "b"))
  )
})

test_that("separate_wider_delim() can ignore problems", {
  df <- tibble(x = c("x", "x y", "x y z"))
  out <- df %>% separate_wider_delim(x, " ",
    names = c("a", "b"),
    too_few = "align_start",
    too_many = "drop",
  )
  expect_equal(out[1, ], tibble(a = "x", b = NA_character_))
  expect_equal(out[3, ], tibble(a = "x", b = "y"))

  out <- df %>% separate_wider_delim(x,  " ",
    names = c("a", "b"),
    too_few = "align_end",
    too_many = "merge",
  )
  expect_equal(out[1, ], tibble(a = NA_character_, b = "x"))
  expect_equal(out[3, ], tibble(a = "x", b = "y z"))
})

test_that("separate_wider_delim() can diagnose problems", {
  df <- tibble(x = c(NA, "x", "x y", "x y z"))
  expect_snapshot(
    out <- df %>% separate_wider_delim(x, " ",
      names = c("a", "b"),
      too_few = "debug",
      too_many = "debug",
    )
  )
  expect_equal(out$x, df$x)
  expect_equal(out$x_ok, c(TRUE, FALSE, TRUE, FALSE))
  expect_equal(out$x_pieces, c(NA, 1, 2, 3))
  expect_equal(out$x_remainder, c(NA, "", "", " z"))

  # And can do so selectively
  suppressWarnings(
    out <- df %>% separate_wider_delim(x, " ",
      names = c("a", "b"),
      too_few = "align_start",
      too_many = "debug",
    )
  )
  expect_equal(out$x_ok, c(TRUE, TRUE, TRUE, FALSE))
})

test_that("separate_wider_delim() doesn't count NA input as problem", {
  df <- tibble(x = NA)
  expect_equal(
    df %>% separate_wider_delim(x, ",", names = c("a", "b")),
    tibble(a = NA_character_, b = NA_character_)
  )
})

test_that("separate_wider_delim() works with empty data frames", {
  df <- tibble(x = character())
  out <- separate_wider_delim(df, x, delim = ",", names = c("y", "z"))
  expect_equal(out, tibble(y = character(), z = character()))

  out <- separate_wider_delim(df, x, delim = ",", names_sep = "_")
  expect_equal(out, tibble())
})

test_that("separate_wider_delim() validates its inputs", {
  df <- tibble(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_delim()
    df %>% separate_wider_delim(x)
    df %>% separate_wider_delim(x, 1)
    df %>% separate_wider_delim(x, "")
    df %>% separate_wider_delim(x, "-")
    df %>% separate_wider_delim(x, "-", names = 1)
    df %>% separate_wider_delim(x, "-", names = c(x = "x"))
    df %>% separate_wider_delim(x, "-", names_sep = "_", too_many = "merge")
  })
})

# separate_wider_position -------------------------------------------------------

test_that("separate_wider_position() errors if lengths are inconsistent", {
  df <- tibble(x = c("ab", "abc", "abcd"))
  expect_snapshot(error = TRUE,
    df %>% separate_wider_position(x, widths = c("a" = 2, "b" = 1))
  )
})

test_that("separate_wider_position() can ignore problems", {
  df <- tibble(x = c("ab", "abc", "abcd"))

  out <- df %>% separate_wider_position(
    x,
    widths = c("a" = 2, "b" = 1),
    too_few = "align_start",
    too_many = "drop"
  )
  expect_equal(out[1, ], tibble(a = "ab", b = NA_character_))
  expect_equal(out[2, ], tibble(a = "ab", b = "c"))
  expect_equal(out[3, ], tibble(a = "ab", b = "c"))
})

test_that("separate_wider_position() can diagnose problems", {
  df <- tibble(x = c(NA, "ab", "abc", "abcd"))

  expect_snapshot(
    out <- df %>% separate_wider_position(
      x,
      widths = c("a" = 2, "b" = 1),
      too_few = "debug",
      too_many = "debug"
    )
  )
  expect_equal(out$x, df$x)
  expect_equal(out$x_ok, c(TRUE, FALSE, TRUE, FALSE))
  expect_equal(out$x_width, c(NA, 2, 3, 4))
  expect_equal(out$x_remainder, c(NA, "", "", "d"))
})

test_that("separate_wider_posiion() doesn't count NA input as problem", {
  df <- tibble(x = NA)
  expect_equal(
    df %>% separate_wider_position(x, widths = c(a = 1, b = 2)),
    tibble(a = NA_character_, b = NA_character_)
  )
})

test_that("separate_wider_position() can drop values", {
  df <- tibble(x = "a-b")
  out <- df %>% separate_wider_position(x, widths = c("a" = 1, 1, "b" = 1))
  expect_equal(out, tibble(a = "a", b = "b"))
})

test_that("separate_wider_position() works with empty data frames", {
  df <- tibble(x = character())
  out <- separate_wider_position(df, x, widths = c(y = 1, z = 2))
  expect_equal(out, tibble(y = character(), z = character()))
})

test_that("separate_wider_position() validates its inputs", {
  df <- tibble(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_position()
    df %>% separate_wider_position(x)
    df %>% separate_wider_position(x, widths = 1.5)
    df %>% separate_wider_position(x, widths = 1L)
    df %>% separate_wider_position(x, widths = c(x = 0))
  })
})

# separate_wider_regex ----------------------------------------------------

test_that("separate_wider_regex() can extract columns", {
  df <- tibble(x = "a123")
  out <- df %>% separate_wider_regex(x, c("a" = ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_wider_regex() errors if match fails", {
  df <- tibble(x = c("a-123", "b_123"))
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_regex(x, c("a" = ".", "-", "b" = "\\d+"))
  })
})

test_that("separate_wider_regex() can silence errors", {
  df <- tibble(x = c("a-123", "b_123"))
  out <- df %>% separate_wider_regex(
    x,
    c("a" = ".", "-", "b" = "\\d+"),
    too_few = "align_start"
  )
  expect_equal(out$a, c("a", "b"))
  expect_equal(out$b, c("123", NA))
})

test_that("separate_wider_regex() can diagnose errors", {
  df <- tibble(x = c(NA, "a-123", "b_123", "c-123x", "XXXX"))
  expect_snapshot({
      out <- df %>% separate_wider_regex(
      x,
      c("a" = "[a-z]", "-", "b" = "\\d+"),
      too_few = "debug"
    )
  })
  expect_equal(out$x, df$x)
  expect_equal(out$x_ok, c(TRUE, TRUE, FALSE, FALSE, FALSE))
  expect_equal(out$x_matches, c(NA, 3, 1, 3, 0))
  expect_equal(out$x_remainder, c(NA, "", "_123", "x", "XXXX"))
})

test_that("separate_wider_regex() doesn't count NA input as problem", {
  df <- tibble(x = NA)
  expect_equal(
    df %>% separate_wider_regex(x, patterns = c(a = ".", b = ".")),
    tibble(a = NA_character_, b = NA_character_)
  )
})

test_that("separate_wider_regex() can drop values", {
  df <- tibble(x = "ab123")
  out <- df %>% separate_wider_regex(x, c("a" = ".", ".", "b" = "\\d+"))
  expect_equal(out, tibble(a = "a", b = "123"))
})

test_that("separate_wider_regex() can use odd names", {
  df <- tibble(x = "ab123")
  out <- df %>% separate_wider_regex(x, c("_" = ".", ".", "." = "\\d+"))
  expect_equal(out, tibble(`_` = "a", `.` = "123"))
})

test_that("separate_wider_regex() gives informative error if () used", {
  df <- tibble(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_regex(x, c("_" = "(.)"))
  })
})

test_that("separate_wider_regex() works with empty data frames", {
  df <- tibble(x = character())
  out <- separate_wider_regex(df, x, patterns = c(y = ".", z = "."))
  expect_equal(out, tibble(y = character(), z = character()))
})

test_that("separate_wider_regex() advises on outer / inner name duplication (#1425)", {
  df <- tibble(x = 1, y = "g1")

  expect_snapshot(error = TRUE, {
    separate_wider_regex(df, y, patterns = c(x = ".", value = "."))
  })
})

test_that("separate_wider_regex() advises on inner / inner name duplication (#1425)", {
  df <- tibble(x = "g1", y = "m2")

  expect_snapshot(error = TRUE, {
    separate_wider_regex(df, c(x, y), patterns = c(gender = ".", value = "."))
  })
})

test_that("separate_wider_regex() validates its inputs", {
  df <- tibble(x = "x")
  expect_snapshot(error = TRUE, {
    df %>% separate_wider_regex()
    df %>% separate_wider_regex(x)
    df %>% separate_wider_regex(y, patterns = c(x = "-"))
    df %>% separate_wider_regex(x, patterns = ".")
  })
})
