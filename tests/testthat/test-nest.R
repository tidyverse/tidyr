# nest --------------------------------------------------------------------

test_that("nest turns grouped values into one list-df", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, data = y)
  expect_equal(out$x, 1)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], tibble(y = 1:3))
})

test_that("nest uses grouping vars if present", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(dplyr::group_by(df, x))
  expect_s3_class(out, "grouped_df")
  expect_equal(out$data[[1]], tibble(y = 1:3))
})

test_that("provided grouping vars override grouped defaults", {
  df <- tibble(x = 1, y = 2, z = 3) %>% dplyr::group_by(x)
  out <- df %>% nest(data = y)
  expect_s3_class(out, "grouped_df")
  expect_named(out, c("x", "z", "data"))
  expect_named(out$data[[1]], "y")
})

test_that("puts data into the correct row", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, data = x) %>% dplyr::filter(y == "B")
  expect_equal(out$data[[1]]$x, 1)
})

test_that("nesting everything yields a simple data frame", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, data = c(x, y))
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("nest preserves order of data", {
  df <- tibble(x = c(1, 3, 2, 3, 2), y = 1:5)
  out <- nest(df, data = y)
  expect_equal(out$x, c(1, 3, 2))
})

test_that("can strip names", {
  df <- tibble(x = c(1, 1, 1), ya = 1:3, yb = 4:6)
  out <- nest(df, y = starts_with("y"), .names_sep = "")
  expect_named(out$y[[1]], c("a", "b"))
})

test_that("`.names_sep` is passed through with bare data.frames (#1174)", {
  df <- data.frame(x = c(1, 1, 1), ya = 1:3, yb = 4:6)
  out <- nest(df, y = starts_with("y"), .names_sep = "")
  expect_named(out$y[[1]], c("a", "b"))
})

test_that("empty factor levels don't affect nest", {
  df <- tibble(
    x = factor(c("z", "a"), levels = letters),
    y = 1:2
  )
  out <- nest(df, data = y)
  expect_equal(out$x, df$x)
})

test_that("nesting works for empty data frames", {
  df <- tibble(x = integer(), y = character())

  out <- nest(df, data = x)
  expect_named(out, c("y", "data"))
  expect_equal(nrow(out), 0L)

  out <- nest(df, data = c(x, y))
  expect_named(out, "data")
  expect_equal(nrow(out), 0L)
})

test_that("tibble conversion occurs in the `nest.data.frame()` method", {
  df <- data.frame(x = 1, y = 1:2)
  out <- df %>% nest(data = y)
  expect_s3_class(out, "tbl_df")
  expect_s3_class(out$data[[1L]], "tbl_df")
})

test_that("can nest multiple columns", {
  df <- tibble(x = 1, a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df %>% nest(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("x", "a", "b"))
  expect_equal(as.list(out$a), list(df[c("a1", "a2")]))
  expect_equal(as.list(out$b), list(df[c("b1", "b2")]))
})

test_that("nesting no columns nests all inputs", {
  # included only for backward compatibility
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_snapshot(out <- nest(df))
  expect_named(out, "data")
  expect_equal(out$data[[1]], df)
})

# unnest ------------------------------------------------------------------

test_that("can keep empty rows", {
  df <- tibble(x = 1:3, y = list(NULL, tibble(), tibble(a = 1)))
  out1 <- df %>% unnest(y)
  expect_equal(nrow(out1), 1)

  out2 <- df %>% unnest(y, keep_empty = TRUE)
  expect_equal(nrow(out2), 3)
  expect_equal(out2$a, c(NA, NA, 1))
})

test_that("empty rows still affect output type", {
  df <- tibble(
    x = 1:2,
    data = list(
      tibble(y = character(0)),
      tibble(z = integer(0))
    )
  )
  out <- unnest(df, data)
  expect_equal(out, tibble(x = integer(), y = character(), z = integer()))
})

test_that("bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))
  expect_snapshot((expect_error(unnest(df, y))))
})

test_that("unesting combines augmented vectors", {
  df <- tibble(x = as.list(as.factor(letters[1:3])))
  expect_equal(unnest(df, x)$x, factor(letters[1:3]))
})

test_that("vector unnest preserves names", {
  df <- tibble(x = list(1, 2:3), y = list("a", c("b", "c")))
  out <- unnest(df, x)
  expect_named(out, c("x", "y"))
})

test_that("rows and cols of nested-dfs are expanded", {
  df <- tibble(x = 1:2, y = list(tibble(a = 1), tibble(b = 1:2)))
  out <- df %>% unnest(y)

  expect_named(out, c("x", "a", "b"))
  expect_equal(nrow(out), 3)
})

test_that("can unnest nested lists", {
  df <- tibble(
    x = 1:2,
    y = list(list("a"), list("b"))
  )
  rs <- unnest(df, y)
  expect_identical(rs, tibble(x = 1:2, y = list("a", "b")))
})

test_that("can unnest mixture of name and unnamed lists of same length", {
  df <- tibble(
    x = c("a"),
    y = list(y = 1:2),
    z = list(1:2)
  )
  expect_identical(
    unnest(df, c(y, z)),
    tibble(x = c("a", "a"), y = c(1:2), z = c(1:2))
  )
})

test_that("can unnest list_of", {
  df <- tibble(
    x = 1:2,
    y = vctrs::list_of(1:3, 4:9)
  )
  expect_equal(
    unnest(df, y),
    tibble(x = rep(1:2, c(3, 6)), y = 1:9)
  )
})

test_that("can combine NULL with vectors or data frames", {
  df1 <- tibble(x = 1:2, y = list(NULL, tibble(z = 1)))
  out <- unnest(df1, y)
  expect_named(out, c("x", "z"))
  expect_equal(out$z, 1)

  df2 <- tibble(x = 1:2, y = list(NULL, 1))
  out <- unnest(df2, y)
  expect_named(out, c("x", "y"))
  expect_equal(out$y, 1)
})

test_that("vectors become columns", {
  df <- tibble(x = 1:2, y = list(1, 1:2))
  out <- unnest(df, y)
  expect_equal(out$y, c(1L, 1:2))
})

test_that("multiple columns must be same length", {
  df <- tibble(x = list(1:2), y = list(1:3))
  expect_snapshot((expect_error(unnest(df, c(x, y)))))

  df <- tibble(x = list(1:2), y = list(tibble(y = 1:3)))
  expect_snapshot((expect_error(unnest(df, c(x, y)))))
})

test_that("can use non-syntactic names", {
  out <- tibble("foo bar" = list(1:2, 3)) %>% unnest(`foo bar`)
  expect_named(out, "foo bar")
})

test_that("unpacks df-cols (#1112)", {
  df <- tibble(x = 1, y = tibble(a = 1, b = 2))
  expect_identical(unnest(df, y), tibble(x = 1, a = 1, b = 2))
})

test_that("unnesting column of mixed vector / data frame input is an error", {
  df <- tibble(x = list(1, tibble(a = 1)))
  expect_snapshot((expect_error(unnest(df, x))))
})

# other methods -----------------------------------------------------------------

test_that("rowwise_df becomes grouped_df", {
  skip_if_not_installed("dplyr", "0.8.99")

  df <- tibble(g = 1, x = list(1:3)) %>% dplyr::rowwise(g)
  rs <- df %>% unnest(x)

  expect_s3_class(rs, "grouped_df")
  expect_equal(dplyr::group_vars(rs), "g")
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = list(1:3)) %>% dplyr::group_by(g)
  rs <- df %>% unnest(x)

  expect_s3_class(rs, "grouped_df")
  expect_equal(dplyr::group_vars(rs), "g")
})

# Empty inputs ------------------------------------------------------------

test_that("can unnest empty data frame", {
  df <- tibble(x = integer(), y = list())
  out <- unnest(df, y)
  expect_equal(out, tibble(x = integer(), y = unspecified()))
})

test_that("unnesting bare lists of NULLs is equivalent to unnesting empty lists", {
  df <- tibble(x = 1L, y = list(NULL))
  out <- unnest(df, y)
  expect_identical(out, tibble(x = integer(), y = unspecified()))
})

test_that("unnest() preserves ptype", {
  tbl <- tibble(x = integer(), y = list_of(ptype = tibble(a = integer())))
  res <- unnest(tbl, y)
  expect_equal(res, tibble(x = integer(), a = integer()))
})

test_that("unnesting typed lists of NULLs retains ptype", {
  df <- tibble(x = 1L, y = list_of(NULL, .ptype = tibble(a = integer())))
  out <- unnest(df, y)
  expect_identical(out, tibble(x = integer(), a = integer()))
})

test_that("ptype can be overriden manually (#1158)", {
  df <- tibble(
    a = list("a", c("b", "c")),
    b = list(1, c(2, 3)),
  )

  ptype <- list(b = integer())

  out <- unnest(df, c(a, b), ptype = ptype)

  expect_type(out$b, "integer")
  expect_identical(out$b, c(1L, 2L, 3L))
})

test_that("ptype works with nested data frames", {
  df <- tibble(
    a = list("a", "b"),
    b = list(tibble(x = 1, y = 2L), tibble(x = 2, y = 3L)),
  )

  # x: double -> integer
  ptype <- list(b = tibble(x = integer(), y = integer()))

  out <- unnest(df, c(a, b), ptype = ptype)

  expect_identical(out$x, c(1L, 2L))
  expect_identical(out$y, c(2L, 3L))
})

test_that("skips over vector columns", {
  df <- tibble(x = integer(), y = list())
  expect_identical(unnest(df, x), df)
})

test_that("unnest keeps list cols", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest(y)

  expect_equal(names(out), c("x", "y", "z"))
})

# Deprecated behaviours ---------------------------------------------------

test_that("warn about old style interface", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)

  expect_snapshot(out <- nest(df, y))
  expect_named(out, c("x", "data"))

  expect_snapshot(out <- nest(df, -y))
  expect_named(out, c("y", "data"))
})

test_that("only warn about unnamed inputs (#1175)", {
  df <- tibble(x = 1:3, y = 1:3, z = 1:3)
  expect_snapshot(out <- nest(df, x, y, foo = z))
  expect_named(out, c("foo", "data"))
})

test_that("unnamed expressions are kept in the warning", {
  df <- tibble(x = 1:3, z = 1:3)
  expect_snapshot(out <- nest(df, x, starts_with("z")))
  expect_named(out, "data")
})

test_that("can control output column name", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_snapshot(out <- nest(df, y, .key = "y"))
  expect_named(out, c("x", "y"))
})

test_that("can control output column name when nested", {
  df <- dplyr::group_by(tibble(x = c(1, 1, 1), y = 1:3), x)
  expect_snapshot(out <- nest(df, .key = "y"))
  expect_named(out, c("x", "y"))
})

test_that(".key gets warning with new interface", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_snapshot(out <- nest(df, y = y, .key = "y"))
  expect_named(df, c("x", "y"))
})

test_that("cols must go in cols", {
  df <- tibble(x = list(3, 4), y = list("a", "b"))
  expect_snapshot(unnest(df, x, y))
})

test_that("need supply column names", {
  df <- tibble(x = 1:2, y = list("a", "b"))
  expect_snapshot(unnest(df))
})

test_that("sep combines column names", {
  local_options(lifecycle_verbosity = "warning")
  df <- tibble(x = list(tibble(x = 1)), y = list(tibble(x = 1)))
  expect_snapshot(out <- df %>% unnest(c(x, y), .sep = "_"))
  expect_named(out, c("x_x", "y_x"))
})

test_that("unnest has mutate semantics", {
  df <- tibble(x = 1:3, y = list(1, 2:3, 4))
  expect_snapshot(out <- df %>% unnest(z = map(y, `+`, 1)))
  expect_equal(out$z, 2:5)
})

test_that(".drop and .preserve are deprecated", {
  local_options(lifecycle_verbosity = "warning")

  df <- tibble(x = list(3, 4), y = list("a", "b"))
  expect_snapshot(df %>% unnest(x, .preserve = y))

  df <- tibble(x = list(3, 4), y = list("a", "b"))
  expect_snapshot(df %>% unnest(x, .drop = FALSE))
})

test_that(".id creates vector of names for vector unnest", {
  local_options(lifecycle_verbosity = "warning")

  df <- tibble(x = 1:2, y = list(a = 1, b = 1:2))
  expect_snapshot(out <- unnest(df, y, .id = "name"))

  expect_equal(out$name, c("a", "b", "b"))
})
