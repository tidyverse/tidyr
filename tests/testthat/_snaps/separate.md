# too many pieces dealt with as requested

    Code
      separate(df, x, c("x", "y"))
    Condition
      Warning:
      Expected 2 pieces. Additional pieces discarded in 1 rows [2].
    Output
      # A tibble: 2 x 2
        x     y    
        <chr> <chr>
      1 a     b    
      2 a     b    

---

    Code
      separate(df, x, c("x", "y"), extra = "error")
    Condition
      Warning:
      `extra = "error"` is deprecated. Please use `extra = "warn"` instead
      Warning:
      Expected 2 pieces. Additional pieces discarded in 1 rows [2].
    Output
      # A tibble: 2 x 2
        x     y    
        <chr> <chr>
      1 a     b    
      2 a     b    

# too few pieces dealt with as requested

    Code
      separate(df, x, c("x", "y", "z"))
    Condition
      Warning:
      Expected 3 pieces. Missing pieces filled with `NA` in 1 rows [1].
    Output
      # A tibble: 2 x 3
        x     y     z    
        <chr> <chr> <chr>
      1 a     b     <NA> 
      2 a     b     c    

# checks type of `into` and `sep`

    Code
      (expect_error(separate(df, x, "x", FALSE)))
    Output
      <error/rlang_error>
      Error in `str_separate()`:
      ! `sep` must be either numeric or character
    Code
      (expect_error(separate(df, x, FALSE)))
    Output
      <error/rlang_error>
      Error in `str_separate()`:
      ! `into` must be a character vector

# informative error if using stringr modifier functions (#693)

    Code
      (expect_error(separate(df, x, sep = sep)))
    Output
      <error/rlang_error>
      Error in `check_not_stringr_pattern()`:
      ! `sep` can't use modifiers from stringr.

