# crossing checks for bad inputs

    Code
      (expect_error(crossing(x = 1:10, y = quote(a))))
    Output
      <error/vctrs_error_scalar_type>
      Error in `crossing()`:
      ! `..2` must be a vector, not a symbol.

# expand() respects `.name_repair`

    Code
      out <- df %>% expand(x = x, x = x, .name_repair = "unique")
    Message
      New names:
      * `x` -> `x...1`
      * `x` -> `x...2`

# crossing() / nesting() respect `.name_repair`

    Code
      out <- crossing(x = x, x = x, .name_repair = "unique")
    Message
      New names:
      * `x` -> `x...1`
      * `x` -> `x...2`

---

    Code
      out <- nesting(x = x, x = x, .name_repair = "unique")
    Message
      New names:
      * `x` -> `x...1`
      * `x` -> `x...2`

# expand_grid() can control name_repair

    Code
      (expect_error(expand_grid(x = x, x = x)))
    Output
      <error/vctrs_error_names_must_be_unique>
      Error in `expand_grid()`:
      ! Names must be unique.
      x These names are duplicated:
        * "x" at locations 1 and 2.
      i Use argument `.name_repair` to specify repair strategy.

---

    Code
      out <- expand_grid(x = x, x = x, .name_repair = "unique")
    Message
      New names:
      * `x` -> `x...1`
      * `x` -> `x...2`

# expand_grid() throws an error for invalid `.vary` parameter

    Code
      expand_grid(x = 1:2, y = 1:2, .vary = "invalid")
    Condition
      Error in `expand_grid()`:
      ! `.vary` must be one of "slowest" or "fastest", not "invalid".

# grid_dots() reject non-vector input

    Code
      (expect_error(grid_dots(lm(1 ~ 1))))
    Output
      <error/vctrs_error_scalar_type>
      Error:
      ! `..1` must be a vector, not a <lm> object.

