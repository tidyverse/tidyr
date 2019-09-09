#' Chop and unchop
#'
#' @description
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("maturing")}
#'
#' Chopping and unchopping preserve the width of a data frame, changing its
#' length. `chop()` makes `df` shorter by converting rows within each group
#' into list-columns. `unchop()` makes `df` longer by expanding list-columns
#' so that each element of the list-column gets its own row in the output.
#'
#' @details
#' Generally, unchopping is more useful than chopping because it simplifies
#' a complex data structure, and [nest()]ing is usually more appropriate
#' that `chop()`ing` since it better preserves the connections between
#' observations.
#'
#' @param data A data frame.
#' @param cols Column to chop or unchop (automatically quoted).
#'
#'   This should be a list-column containing generalised vectors (e.g.
#'   any mix of `NULL`s, atomic vector, S3 vectors, a lists, or data frames).
#' @param keep_empty By default, you get one row of output for each element
#'   of the list your unchopping/unnesting. This means that if there's a
#'   size-0 element (like `NULL` or an empty data frame), that entire row
#'   will be dropped from the output. If you want to preserve all rows,
#'   use `keep_empty = TRUE` to replace size-0 elements with a single row
#'   of missing values.
#' @param ptype Optionally, supply a data frame prototype for the output `cols`,
#'   overriding the default that will be guessed from the combination of
#'   individual values.
#' @export
#' @examples
#' # Chop ==============================================================
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% chop(c(y, z))
#' # cf nest
#' df %>% nest(data = c(y, z))
#'
#' # Unchop ============================================================
#' df <- tibble(x = 1:4, y = list(integer(), 1L, 1:2, 1:3))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = TRUE)
#'
#' # Incompatible types -------------------------------------------------
#' # If the list-col contains types that can not be natively
#' df <- tibble(x = 1:2, y = list("1", 1:3))
#' try(df %>% unchop(y))
#' df %>% unchop(y, ptype = tibble(y = integer()))
#' df %>% unchop(y, ptype = tibble(y = character()))
#' df %>% unchop(y, ptype = tibble(y = list()))
#'
#' # Unchopping data frames -----------------------------------------------------
#' # Unchopping a list-col of data frames must generate a df-col because
#' # unchop leaves the column names unchanged
#' df <- tibble(x = 1:3, y = list(NULL, tibble(x = 1), tibble(y = 1:2)))
#' df %>% unchop(y)
#' df %>% unchop(y, keep_empty = TRUE)
chop <- function(data, cols) {
  if (missing(cols)) {
    return(data)
  }

  cols <- tidyselect::vars_select(tbl_vars(data), !!enquo(cols))

  vals <- data[cols]
  keys <- data[setdiff(names(data), cols)]
  split <- vec_split(vals, keys)

  vals <- map(split$val, ~ new_data_frame(map(.x, list), n = 1L))

  out <- vec_cbind(split$key, vec_rbind(!!!vals))
  reconstruct_tibble(data, out)
}

#' @export
#' @rdname chop
unchop <- function(data, cols, keep_empty = FALSE, ptype = NULL) {
  cols <- tidyselect::vars_select(tbl_vars(data), !!enquo(cols))
  if (length(cols) == 0) {
    return(data)
  }

  if (keep_empty) {
    for (col in cols) {
      data[[col]][] <- map(data[[col]], init_col)
    }
  }

  # https://github.com/tidyverse/tibble/issues/580
  x <- pmap(as.list(data)[cols], vec_recycle_common)
  x <- map(x, ~ new_data_frame(drop_null(.x)))

  n <- map_int(x, vec_size)
  out <- vec_slice(data, rep(vec_seq_along(data), n))

  if (nrow(data) == 0) {
    new_cols <- map(data[cols], ~ attr(.x, "ptype") %||% unspecified(0))
  } else {
    new_cols <- vec_rbind(!!!x, .ptype = ptype)
  }

  out <- update_cols(out, new_cols)
  reconstruct_tibble(data, out)
}
