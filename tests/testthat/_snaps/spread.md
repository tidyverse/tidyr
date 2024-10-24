# duplicate values for one key is an error

    Code
      spread(df, x, y)
    Condition
      Error in `spread()`:
      ! Each row of output must be identified by a unique combination of keys.
      i Keys are shared for 2 rows
      * 2, 3

