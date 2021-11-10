# factors coerced to characters, not integers

    Code
      out <- gather(df, k, v)
    Warning <warning>
      attributes are not identical across measure variables;
      they will be dropped

# varying attributes are dropped with a warning

    Code
      gather(df, k, v)
    Warning <warning>
      attributes are not identical across measure variables;
      they will be dropped
    Output
            k          v
      1 date1 1636502400
      2 date2      18951

