# can't combine vectors and data frames

    Code
      (expect_error(unnest_legacy(df)))
    Output
      <error/rlang_error>
      Each column must either be a list of vectors or a list of data frames [x]

# multiple columns must be same length

    Code
      (expect_error(unnest_legacy(df)))
    Output
      <error/rlang_error>
      All nested columns must have the same number of elements.

---

    Code
      (expect_error(unnest_legacy(df)))
    Output
      <error/rlang_error>
      All nested columns must have the same number of elements.

