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

