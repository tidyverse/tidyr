# complete does not allow expansion on grouping variable (#1299)

    Code
      complete(gdf, g)
    Condition
      Error:
      ! Can't complete on a grouping column.
      i Column "g" is a grouping variable.
      i Use `dplyr::ungroup()` first, or complete on non-grouping columns.

# validates its inputs

    Code
      complete(mtcars, explicit = 1)
    Condition
      Error in `complete()`:
      ! `explicit` must be `TRUE` or `FALSE`, not the number 1.

