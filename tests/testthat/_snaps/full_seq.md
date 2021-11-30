# full_seq errors if sequence isn't regular

    Code
      (expect_error(full_seq(c(1, 3, 4), 2)))
    Output
      <simpleError: `x` is not a regular sequence.>
    Code
      (expect_error(full_seq(c(0, 10, 20), 11, tol = 1.8)))
    Output
      <simpleError: `x` is not a regular sequence.>

