# gather throws error for POSIXlt

    Code
      (expect_error(gather(df, key, val, -x)))
    Output
      <simpleError: 'x' is a POSIXlt. Please convert to POSIXct.>
    Code
      (expect_error(gather(df, key, val, -y)))
    Output
      <simpleError: Column 1 is a POSIXlt. Please convert to POSIXct.>

# gather throws error for weird objects

    Code
      (expect_error(gather(df, key, val, -x)))
    Output
      <simpleError: All columns must be atomic vectors or lists. Problem with 'x'>
    Code
      (expect_error(gather(df, key, val, -y)))
    Output
      <simpleError: All columns be atomic vectors or lists (not expression)>

---

    Code
      (expect_error(gather(df, key, val, -x)))
    Output
      <simpleError: All columns must be atomic vectors or lists. Problem with 'x'>
    Code
      (expect_error(gather(df, key, val, -y)))
    Output
      <simpleError: All columns must be atomic vectors or lists. Problem with column 2.>

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
      1 date1 1546300800
      2 date2      17897

