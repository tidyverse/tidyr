# can't combine vectors and data frames

    Code
      (expect_error(unnest_legacy(df)))
    Output
      <error/rlang_error>
      Error in `unnest_legacy()`:
      ! Each column must either be a list of vectors or a list of data frames.
      i Problems in: `x`

# multiple columns must be same length

    Code
      (expect_error(unnest_legacy(df)))
    Output
      <error/rlang_error>
      Error in `unnest_legacy()`:
      ! All nested columns must have the same number of elements.

---

    Code
      (expect_error(unnest_legacy(df)))
    Output
      <error/rlang_error>
      Error in `unnest_legacy()`:
      ! All nested columns must have the same number of elements.

