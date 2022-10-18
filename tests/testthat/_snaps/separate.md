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

# validates inputs

    Code
      separate(df)
    Condition
      Error in `separate()`:
      ! `col` is absent but must be supplied.
    Code
      separate(df, x, into = 1)
    Condition
      Error in `separate()`:
      ! `into` must be a character vector, not the number 1.
    Code
      separate(df, x, into = "x", sep = c("a", "b"))
    Condition
      Error in `separate()`:
      ! `sep` must be a string or numeric vector, not a character vector
    Code
      separate(df, x, into = "x", remove = 1)
    Condition
      Error in `separate()`:
      ! `remove` must be `TRUE` or `FALSE`, not the number 1.
    Code
      separate(df, x, into = "x", convert = 1)
    Condition
      Error in `separate()`:
      ! `convert` must be `TRUE` or `FALSE`, not the number 1.

# informative error if using stringr modifier functions (#693)

    Code
      (expect_error(separate(df, x, "x", sep = sep)))
    Output
      <error/rlang_error>
      Error in `separate()`:
      ! `sep` can't use modifiers from stringr.

