# gather throws error for POSIXlt

    Code
      gather(df, key, val, -x)
    Condition
      Error:
      ! 'x' is a POSIXlt. Please convert to POSIXct.

---

    Code
      gather(df, key, val, -y)
    Condition
      Error:
      ! Column 1 is a POSIXlt. Please convert to POSIXct.

# gather throws error for weird objects

    Code
      gather(df, key, val, -y)
    Condition
      Error:
      ! All columns be atomic vectors or lists (not expression)

---

    Code
      gather(df, key, val, -x)
    Condition
      Error:
      ! All columns must be atomic vectors or lists. Problem with 'x'

---

    Code
      gather(df, key, val, -y)
    Condition
      Error:
      ! All columns must be atomic vectors or lists. Problem with column 2.

# factors coerced to characters, not integers

    Code
      out <- gather(df, k, v)
    Condition
      Warning:
      attributes are not identical across measure variables; they will be dropped

# varying attributes are dropped with a warning

    Code
      gather(df, k, v)
    Condition
      Warning:
      attributes are not identical across measure variables; they will be dropped
    Output
            k          v
      1 date1 1546300800
      2 date2      17897

