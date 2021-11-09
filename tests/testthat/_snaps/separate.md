# too many pieces dealt with as requested

    Code
      (expect_warning(separate(df, x, c("x", "y"))))
    Output
      <warning: Expected 2 pieces. Additional pieces discarded in 1 rows [2].>

---

    Code
      warn2 <- expect_warning(warn1 <- expect_warning(separate(df, x, c("x", "y"),
      extra = "error")))
      warn1
    Output
      <warning: `extra = "error"` is deprecated. Please use `extra = "warn"` instead>
    Code
      warn2
    Output
      <warning: Expected 2 pieces. Additional pieces discarded in 1 rows [2].>

# too few pieces dealt with as requested

    Code
      (expect_warning(separate(df, x, c("x", "y", "z"))))
    Output
      <warning: Expected 3 pieces. Missing pieces filled with `NA` in 1 rows [1].>

