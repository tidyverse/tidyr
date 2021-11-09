# factors coerced to characters, not integers

    Code
      (expect_warning(out <- gather(df, k, v)))
    Output
      <warning: attributes are not identical across measure variables;
      they will be dropped>

# varying attributes are dropped with a warning

    Code
      (expect_warning(gather(df, k, v)))
    Output
      <warning: attributes are not identical across measure variables;
      they will be dropped>

