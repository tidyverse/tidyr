context("Separate")

test_that("missing values in input are missing in output", {
  df <- tibble(x = c(NA, "a b"))
  out <- separate(df, x, c("x", "y"))
  expect_equal(out$x, c(NA, "a"))
  expect_equal(out$y, c(NA, "b"))
})

test_that("integer values specific position between characters", {
  df <- tibble(x = c(NA, "ab", "cd"))
  out <- separate(df, x, c("x", "y"), 1)
  expect_equal(out$x, c(NA, "a", "c"))
})

test_that("convert produces integers etc", {
  df <- tibble(x = "1-1.5-FALSE")
  out <- separate(df, x, c("x", "y", "z"), "-", convert = TRUE)
  expect_equal(out$x, 1L)
  expect_equal(out$y, 1.5)
  expect_equal(out$z, FALSE)
})

test_that("convert keeps characters as character", {
  df <- tibble(x = "X-1")
  out <- separate(df, x, c("x", "y"), "-", convert = TRUE)
  expect_equal(out$x, "X")
  expect_equal(out$y, 1L)
})

test_that("too many pieces dealt with as requested", {
  df <- tibble(x = c("a b", "a b c"))

  expect_warning(separate(df, x, c("x", "y")), "Too many")

  merge <- separate(df, x, c("x", "y"), extra = "merge")
  expect_equal(merge[[1]], c("a", "a"))
  expect_equal(merge[[2]], c("b", "b c"))

  drop <- separate(df, x, c("x", "y"), extra = "drop")
  expect_equal(drop[[1]], c("a", "a"))
  expect_equal(drop[[2]], c("b", "b"))
})

test_that("too few pieces dealt with as requested", {
  df <- tibble(x = c("a b", "a b c"))

  expect_warning(separate(df, x, c("x", "y", "z")), "Too few")

  left <- separate(df, x, c("x", "y", "z"), fill = "left")
  expect_equal(left$x, c(NA, "a"))
  expect_equal(left$y, c("a", "b"))
  expect_equal(left$z, c("b", "c"))

  right <- separate(df, x, c("x", "y", "z"), fill = "right")
  expect_equal(right$z, c(NA, "c"))
})

test_that("preserves grouping", {
  df <- tibble(g = 1, x = "a:b") %>% dplyr::group_by(g)
  rs <- df %>% separate(x, c("a", "b"))
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})

test_that("drops grouping when needed", {
  df <- tibble(x = "a:b") %>% dplyr::group_by(x)
  rs <- df %>% separate(x, c("a", "b"))
  expect_equal(rs$a, "a")
  expect_equal(dplyr::groups(rs), NULL)
})

# Separate rows -----------------------------------------------------------
context("Separate rows")

test_that("can handle collapsed rows", {
  df <- tibble(x = 1:3, y = c("a", "d,e,f", "g,h"))
  expect_equal(separate_rows(df, y)$y, unlist(strsplit(df$y, "\\,")))
})

test_that("default pattern does not split decimals in nested strings", {
  df <- dplyr::tibble(x = 1:3, y = c("1", "1.0,1.1", "2.1"))
  expect_equal(separate_rows(df, y)$y, unlist(strsplit(df$y, ",")))
})

test_that("preserves grouping", {
  df <- tibble(g = 1, x = "a:b") %>% dplyr::group_by(g)
  rs <- df %>% separate_rows(x)

  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})

test_that("drops grouping when needed", {
  df <- tibble(x = 1, y = "a:b") %>% dplyr::group_by(x, y)

  out <- df %>% separate_rows(y)
  expect_equal(out$y, c("a", "b"))
  expect_equal(dplyr::groups(out), list(as.name('x')))

  out <- df %>% dplyr::group_by(y) %>% separate_rows(y)
  expect_equal(dplyr::groups(out), NULL)
})

test_that("convert produces integers etc", {
  df <- tibble(x = "1,2,3", y = "T,F,T", z = "a,b,c")

  out <- separate_rows(df, x, y, z, convert = TRUE)
  expect_equal(class(out$x), "integer")
  expect_equal(class(out$y), "logical")
  expect_equal(class(out$z), "character")
})
