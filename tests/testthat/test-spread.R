context("Spread")
library(dplyr, warn.conflicts = FALSE)

test_that("order doesn't matter", {

  one <- data.frame(x = c("a", "b"), y = 1:2) %>% spread(x, y)
  two <- data.frame(x = c("b", "a"), y = 2:1) %>% spread(x, y) %>%
    select(a, b) %>% arrange(a, b)
  expect_equal(one, two)

  one <- data.frame(z = c("b", "a"), x = c("a", "b"), y = 1:2) %>%
    spread(x, y) %>% arrange(z)
  two <- data.frame(z = c("a", "b"), x = c("b", "a"), y = 2:1) %>%
    spread(x, y)
  expect_equal(one, two)
})

test_that("convert turns strings into integers", {
  df <- dplyr::data_frame(key = "a", value = "1")
  out <- spread(df, key, value, convert = TRUE)

  expect_is(out$a, "integer")
})

test_that("duplicate values for one key is an error", {
  df <- data.frame(x = c("a", "b", "b"), y = c(1, 2, 2), z = c(1, 2, 2))

  expect_error(df %>% spread(x, y), "Duplicate identifiers for rows (2, 3)",
    fixed = TRUE)
})

test_that("factors are spread into columns (#35)", {
  data <- data.frame(
    x = c("a", "a", "b", "b"),
    y = c("c", "d", "c", "d"),
    z = c("w", "x", "y", "z")
  )

  out <- data %>% spread(x, z)
  expect_equal(names(out), c("y", "a", "b"))
  expect_true(all(vapply(out, is.factor, logical(1))))
  expect_identical(levels(out$a), levels(data$z))
  expect_identical(levels(out$b), levels(data$z))

})

test_that("drop = FALSE keeps missing combinations (#25)", {
  df <- data.frame(
    x = factor("a", levels = c("a", "b")),
    y = factor("b", levels = c("a", "b")),
    z = 1
  )
  out <- df %>% spread(x, z, drop = FALSE)
  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 3)
  expect_equal(out$a[2], 1)
})

test_that("drop = FALSE keeps missing combinations of 0-length factors (#56)", {
  df <- data.frame(
    x = factor(, levels = c("a", "b")),
    y = factor(, levels = c("a", "b")),
    z = logical()
  )
  out <- df %>% spread(x, z, drop = FALSE)

  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 3)
  expect_equal(out$a, c(NA, NA))
  expect_equal(out$b, c(NA, NA))
})

test_that("preserve class of input", {
  dat <- data.frame(
    x = c("a", "a", "b", "b"),
    y = c("c", "d", "c", "d"),
    z = c("w", "x", "y", "z")
  )
  dat %>% (dplyr::tbl_df) %>% spread(x, z) %>% expect_is("tbl_df")

  skip_if_not_installed("data.table")
  dat %>% (dplyr::tbl_dt) %>% spread(x, z) %>% expect_is("tbl_dt")
})

test_that("dates are spread into columns (#62)", {
  df <- data.frame(id = c("a", "a", "b", "b"),
                   key = c("begin", "end", "begin", "end"),
                   date = Sys.Date() + 0:3,
                   stringsAsFactors=FALSE)
  out <- spread(df, key, date)
  expect_identical(names(out), c("id", "begin", "end"))
  expect_is(out$begin, "Date")
  expect_is(out$end, "Date")
})

test_that("spread can produce mixed variable types (#118)", {
  df <- data.frame(
    row = rep(1:2, 3),
    column = rep(1:3, each = 2),
    cell_contents = as.character(c(rep("Argentina", 2),
                                   62.485, 64.399,
                                   1952, 1957)),
    stringsAsFactors = FALSE
  )
  out <- spread(df, column, cell_contents, convert = TRUE)
  expect_equivalent(vapply(out, class, ""),
                    c("integer", "character", "numeric", "integer"))
})

test_that("factors can be used with convert = TRUE to produce mixed types", {
  df <- data.frame(row = c(1, 2, 1, 2, 1, 2),
                   column = c("f", "f", "g", "g", "h", "h"),
                   contents = c("aa", "bb", "1", "2", "TRUE", "FALSE"),
                   stringsAsFactors = FALSE)
  out <- df %>% spread(column, contents, convert = TRUE)
  expect_is(out$f, "character")
  expect_is(out$g, "integer")
  expect_is(out$h, "logical")
})

test_that("dates can be used with convert = TRUE", {
  df <- data.frame(id = c("a", "a", "b", "b"),
                   key = c("begin", "end", "begin", "end"),
                   date = Sys.Date() + 0:3,
                   stringsAsFactors=FALSE)
  out <- spread(df, key, date, convert = TRUE)
  expect_is(out$begin, "character")
  expect_is(out$end, "character")
})

test_that("vars that are all NA are logical if convert = TRUE (#118)", {
  df <- data.frame(row = c(1, 2, 1, 2), column = c("f", "f", "g", "g"),
                   contents = c("aa", "bb", NA, NA), stringsAsFactors = FALSE)
  out <- df %>% spread(column, contents, convert = TRUE)
  expect_is(out$g, "logical")
})

test_that("complex values are preserved  (#134)", {
  df <- expand.grid(id = 1:2, key = letters[1:2], stringsAsFactors = TRUE) %>%
    mutate(value = 1:4 + 1i)

  out1 <- spread(df, key, value, convert = FALSE)
  out2 <- spread(df, key, value, convert = TRUE)

  expect_equal(out1$a, 1:2 + 1i)
  expect_equal(out2$a, 1:2 + 1i)
  expect_equal(out1$b, 3:4 + 1i)
  expect_equal(out2$b, 3:4 + 1i)
})

test_that("spread gives one column when no existing non-spread vars", {
  df <- data_frame(
    key = c("a", "b", "c"),
    value = c(1, 2, 3)
  )
  expect_equal(df %>% spread(key, value), data.frame(a = 1, b = 2, c = 3))
})

test_that("grouping vars are kept where possible", {
  # Can keep
  df <- data.frame(x = 1:2, key = c("a", "b"), value = 1:2)
  out <- df %>% group_by(x) %>% spread(key, value)
  expect_equal(groups(out), list(quote(x)))

  # Can't keep
  df <- data.frame(key = c("a", "b"), value = 1:2)
  out <- df %>% group_by(key) %>% spread(key, value)
  expect_equal(out, data_frame(a = 1L, b = 2L))
})
