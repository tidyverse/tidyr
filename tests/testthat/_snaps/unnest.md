# bad inputs generate errors

    Code
      (expect_error(unnest(df, y)))
    Output
      <error/vctrs_error_scalar_type>
      Error in `list_sizes()`:
      ! `x[[1]]` must be a vector, not a function.

# multiple columns must be same length

    Code
      (expect_error(unnest(df, c(x, y))))
    Output
      <error/rlang_error>
      Error in `unchop()`:
      ! In row 1, can't recycle input of size 2 to size 3.

---

    Code
      (expect_error(unnest(df, c(x, y))))
    Output
      <error/rlang_error>
      Error in `unchop()`:
      ! In row 1, can't recycle input of size 2 to size 3.

# unnesting column of mixed vector / data frame input is an error

    Code
      (expect_error(unnest(df, x)))
    Output
      <error/vctrs_error_ptype2>
      Error in `list_unchop()`:
      ! Can't combine `x[[1]]` <double> and `x[[2]]` <tbl_df>.

# cols must go in cols

    Code
      unnest(df, x, y)
    Condition
      Warning:
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
    Condition
      Warning:
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
    Condition
      Warning:
      The `.sep` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      i Use `names_sep = '_'` instead.

# unnest has mutate semantics

    Code
      out <- df %>% unnest(z = map(y, `+`, 1))
    Condition
      Warning:
      unnest() has a new interface. See ?unnest for details.
      Try `df %>% unnest(c(z))`, with `mutate()` if needed

# .drop and .preserve are deprecated

    Code
      df %>% unnest(x, .preserve = y)
    Condition
      Warning:
      The `.preserve` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      i All list-columns are now preserved
    Output
      # A tibble: 2 x 2
            x y        
        <dbl> <list>   
      1     3 <chr [1]>
      2     4 <chr [1]>

---

    Code
      df %>% unnest(x, .drop = FALSE)
    Condition
      Warning:
      The `.drop` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      i All list-columns are now preserved.
    Output
      # A tibble: 2 x 2
            x y        
        <dbl> <list>   
      1     3 <chr [1]>
      2     4 <chr [1]>

# .id creates vector of names for vector unnest

    Code
      out <- unnest(df, y, .id = "name")
    Condition
      Warning:
      The `.id` argument of `unnest()` is deprecated as of tidyr 1.0.0.
      i Manually create column of names instead.

