# nesting no columns nests all inputs

    Code
      out <- nest(df)
    Warning <warning>
      `...` must not be empty for ungrouped data frames.
      Did you want `data = everything()`?

# bad inputs generate errors

    Code
      (expect_error(unnest(df, y)))
    Output
      <error/vctrs_error_scalar_type>
      Input must be a vector, not a function.

# multiple columns must be same length

    Code
      (expect_error(unnest(df, c(x, y))))
    Output
      <error/rlang_error>
      In row 1, can't recycle input of size 2 to size 3.

---

    Code
      (expect_error(unnest(df, c(x, y))))
    Output
      <error/rlang_error>
      In row 1, can't recycle input of size 2 to size 3.

# unnesting column of mixed vector / data frame input is an error

    Code
      (expect_error(unnest(df, x)))
    Output
      <error/vctrs_error_incompatible_type>
      Can't combine `..1` <double> and `..2` <tbl_df>.

# warn about old style interface

    Code
      out <- nest(df, y)
    Warning <warning>
      All elements of `...` must be named.
      Did you want `data = y`?

---

    Code
      out <- nest(df, -y)
    Warning <warning>
      All elements of `...` must be named.
      Did you want `data = -y`?

# only warn about unnamed inputs (#1175)

    Code
      out <- nest(df, x, y, foo = z)
    Warning <warning>
      All elements of `...` must be named.
      Did you want `data = c(x, y)`?

# unnamed expressions are kept in the warning

    Code
      out <- nest(df, x, starts_with("z"))
    Warning <warning>
      All elements of `...` must be named.
      Did you want `data = c(x, starts_with("z"))`?

# can control output column name

    Code
      out <- nest(df, y, .key = "y")
    Warning <warning>
      All elements of `...` must be named.
      Did you want `y = y`?

# can control output column name when nested

    Code
      out <- nest(df, .key = "y")
    Warning <warning>
      `.key` is deprecated

# .key gets warning with new interface

    Code
      out <- nest(df, y = y, .key = "y")
    Warning <warning>
      `.key` is deprecated

# cols must go in cols

    Code
      unnest(df, x, y)
    Warning <warning>
      unnest() has a new interface. See ?unnest for details.
      Try `df %>% unnest(c(x, y))`, with `mutate()` if needed
    Output
      # A tibble: 2 x 2
            x y    
        <dbl> <chr>
      1     3 a    
      2     4 b    

# need supply column names

    Code
      unnest(df)
    Warning <warning>
      `cols` is now required when using unnest().
      Please use `cols = c(y)`
    Output
      # A tibble: 2 x 2
            x y    
        <int> <chr>
      1     1 a    
      2     2 b    

# sep combines column names

    Code
      out <- df %>% unnest(c(x, y), .sep = "_")
    Warning <lifecycle_warning_deprecated>
      The `.sep` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      Use `names_sep = '_'` instead.

# unnest has mutate semantics

    Code
      out <- df %>% unnest(z = map(y, `+`, 1))
    Warning <warning>
      unnest() has a new interface. See ?unnest for details.
      Try `df %>% unnest(c(z))`, with `mutate()` if needed

# .drop and .preserve are deprecated

    Code
      df %>% unnest(x, .preserve = y)
    Warning <lifecycle_warning_deprecated>
      The `.preserve` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      All list-columns are now preserved
    Output
      # A tibble: 2 x 2
            x y        
        <dbl> <list>   
      1     3 <chr [1]>
      2     4 <chr [1]>

---

    Code
      df %>% unnest(x, .drop = FALSE)
    Warning <lifecycle_warning_deprecated>
      The `.drop` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      All list-columns are now preserved.
    Output
      # A tibble: 2 x 2
            x y        
        <dbl> <list>   
      1     3 <chr [1]>
      2     4 <chr [1]>

# .id creates vector of names for vector unnest

    Code
      out <- unnest(df, y, .id = "name")
    Warning <lifecycle_warning_deprecated>
      The `.id` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      Manually create column of names instead.

