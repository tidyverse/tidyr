# nesting no columns nests all inputs

    Code
      (expect_warning(out <- nest(df)))
    Output
      <warning: `...` must not be empty for ungrouped data frames.
      Did you want `data = everything()`?>

# bad inputs generate errors

    Code
      unnest(df, y)
    Error <vctrs_error_scalar_type>
      Input must be a vector, not a function.

# multiple columns must be same length

    Code
      unnest(df, c(x, y))
    Error <rlang_error>
      In row 1, can't recycle input of size 2 to size 3.

---

    Code
      unnest(df, c(x, y))
    Error <rlang_error>
      In row 1, can't recycle input of size 2 to size 3.

# unnesting column of mixed vector / data frame input is an error

    Code
      unnest(df, x)
    Error <vctrs_error_incompatible_type>
      Can't combine `..1` <double> and `..2` <tbl_df>.

# warn about old style interface

    Code
      (expect_warning(out <- nest(df, y)))
    Output
      <warning: All elements of `...` must be named.
      Did you want `data = c(y)`?>

# only warn about unnamed inputs (#1175)

    Code
      (expect_warning(out <- nest(df, x, y, foo = z)))
    Output
      <warning: All elements of `...` must be named.
      Did you want `data = c(x, y)`?>

# unnamed expressions are kept in the warning

    Code
      (expect_warning(out <- nest(df, x, starts_with("z"))))
    Output
      <warning: All elements of `...` must be named.
      Did you want `data = c(x, starts_with("z"))`?>

# can control output column name

    Code
      (expect_warning(out <- nest(df, y, .key = "y")))
    Output
      <warning: All elements of `...` must be named.
      Did you want `y = c(y)`?>

# can control output column name when nested

    Code
      (expect_warning(out <- nest(df, .key = "y")))
    Output
      <warning: `.key` is deprecated>

# .key gets warning with new interface

    Code
      (expect_warning(out <- nest(df, y = y, .key = "y")))
    Output
      <warning: `.key` is deprecated>

# cols must go in cols

    Code
      (expect_warning(unnest(df, x, y)))
    Output
      <warning: unnest() has a new interface. See ?unnest for details.
      Try `df %>% unnest(c(x, y))`, with `mutate()` if needed>

# need supply column names

    Code
      (expect_warning(unnest(df)))
    Output
      <warning: `cols` is now required when using unnest().
      Please use `cols = c(y)`>

# sep combines column names

    Code
      (expect_warning(out <- df %>% unnest(c(x, y), .sep = "_")))
    Output
      <deprecated>
      message: The `.sep` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      Use `names_sep = '_'` instead.
      Backtrace:
       1. testthat::expect_warning(out <- df %>% unnest(c(x, y), .sep = "_"))
       8. tidyr::unnest(., c(x, y), .sep = "_")

# unnest has mutate semantics

    Code
      (expect_warning(out <- df %>% unnest(z = map(y, `+`, 1))))
    Output
      <warning: unnest() has a new interface. See ?unnest for details.
      Try `df %>% unnest(c(z))`, with `mutate()` if needed>

# .drop and .preserve are deprecated

    Code
      (expect_warning(df %>% unnest(x, .preserve = y)))
    Output
      <deprecated>
      message: The `.preserve` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      All list-columns are now preserved
      Backtrace:
       1. testthat::expect_warning(df %>% unnest(x, .preserve = y))
       8. tidyr::unnest(., x, .preserve = y)

---

    Code
      (expect_warning(df %>% unnest(x, .drop = FALSE)))
    Output
      <deprecated>
      message: The `.drop` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      All list-columns are now preserved.
      Backtrace:
       1. testthat::expect_warning(df %>% unnest(x, .drop = FALSE))
       8. tidyr::unnest(., x, .drop = FALSE)

# .id creates vector of names for vector unnest

    Code
      (expect_warning(out <- unnest(df, y, .id = "name")))
    Output
      <deprecated>
      message: The `.id` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      Manually create column of names instead.
      Backtrace:
       1. testthat::expect_warning(out <- unnest(df, y, .id = "name"))
       7. tidyr::unnest(df, y, .id = "name")

