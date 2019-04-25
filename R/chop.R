#' Chop and unchop
#'
#' Chopping and unchopping preserve the width of a data frame, changing its
#' length. `chop()` makes `df` shorter by converting rows within each group
#' into list-columns. `unchop()` makes `df` longer by expanding list-columns
#' so that each element of the list-column gets its own row in the output.
#'
#' Generally, unchopping is more useful than chopping because it simplifies
#' a complex data structure, and [nest()]ing is usually more appropriate
#' that `chop()`ing` since it better preserves the connections between
#' observations.
#'
#' @param df A data frame.
#' @param cols Column to chop or unchop (automatically quoted).
#'
#'   This should be a list-column containing generalised vectors (e.g.
#'   any mix of `NULL`s, atomic vector, S3 vectors, a lists, or data frames).
#' @param keep_empty By default, elements of `col` that have size zero will
#'   be ommitted from the output. Setting `keep_empty = TRUE` will ensure
#'   that they're preserved
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
#' df %>% nest(c(y, z))
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
#' df %>% unchop(y, keep_empty = FALSE)
chop <- function(df, cols) {
  if (missing(cols)) {
    return(df)
  }

  cols <- tidyselect::vars_select(names(df), !!enquo(cols))

  vals <- df[cols]
  keys <- df[setdiff(names(df), cols)]
  split <- vec_split(vals, keys)

  vals <- map(split$val, ~ new_data_frame(map(.x, list), n = 1L))

  vec_cbind(split$key, vec_rbind(!!!vals))
}

#' @export
#' @rdname chop
unchop <- function(df, cols, keep_empty = FALSE, ptype = NULL) {
  cols <- tidyselect::vars_select(names(df), !!enquo(cols))
  if (length(cols) == 0) {
    return(df)
  }

  if (keep_empty) {
    for (col in cols) {
      df[[col]][] <- map_if(df[[col]], is_empty, ~ vec_na(.x, 1) %||% unspecified(1))
    }
  }

  # https://github.com/tidyverse/tibble/issues/580
  x <- pmap(as.list(df)[cols], vec_recycle_common)
  x <- map(x, ~ as_tibble(purrr::compact(.x)))

  n <- map_int(x, vec_size)
  out <- vec_slice(df, rep(vec_seq_along(df), n))

  if (nrow(out) == 0) {
    out[cols] <- map(df[cols], ~ attr(.x, "ptype") %||% unspecified(0))
  } else {
    out[cols] <- vec_rbind(!!!x, .ptype = ptype)
  }

  out
}
