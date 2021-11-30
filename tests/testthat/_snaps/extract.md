# informative error message if wrong number of groups

    Code
      (expect_error(extract(df, x, "y", ".")))
    Output
      <simpleError: `regex` should define 1 groups; 0 found.>
    Code
      (expect_error(extract(df, x, c("y", "z"), ".")))
    Output
      <simpleError: `regex` should define 2 groups; 0 found.>

