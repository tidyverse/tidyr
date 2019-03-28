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
#' Learn more in `vignette("chop-pack-nest")`.
#'
#' @param df A data frame.
#' @param col,cols Column to unchop (automatically quoted).
#'
#'   This should be a list-column containing generalised vectors (e.g.
#'   any mix of `NULL`s, atomic vector, S3 vectors, a lists, or data frames).
#'
#' @param id A string specifying giving the name of a new column which will
#'   contain the inner names of `col`. If unnamed, `col` will instead contain
#'   numeric indices.
#' @param keep_empty By default, elements of `col` that have size zero will
#'   be ommitted from the output. Setting `keep_empty = TRUE` will ensure
#'   that they're preserved
#' @param ptype Optionally, supply a prototype for the output `col`, overriding
#'   the default that will be guessed from the combination of individual
#'   values.
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
#' df %>% unchop(y, keep_empty = FALSE)
#'
#' # Preserving names --------------------------------------------------
#' df <- tibble(
#'   x = 1:3,
#'   y = list(A = c(a = 1L), B = c(b1 = 1, b2 = 2), C = c(c = 3))
#' )
#' df %>% unchop(y)
#' df %>% unchop(y, id = "y_name")
#'
#' # Incompatible types -------------------------------------------------
#' # If the list-col contains types that can not be natively
#' df <- tibble(x = 1:2, y = list("1", 1:3))
#' try(df %>% unchop(y))
#' df %>% unchop(y, ptype = integer())
#' df %>% unchop(y, ptype = character())
#' df %>% unchop(y, ptype = list())
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
unchop <- function(df, col, id = NULL, keep_empty = FALSE, ptype = NULL) {
  col <- tidyselect::vars_pull(names(df), !!enquo(col))
  x <- df[[col]]
  stopifnot(is.list(x))

  n <- map_int(x, vec_size)
  ptype <- vec_type_common(!!!x, .ptype = ptype)

  # Fill empty elements to ensure original rows are preserved
  empty <- n == 0
  if (keep_empty && any(empty)) {
    vec_slice(x, empty) <- list(vec_na(ptype))
    n[empty] <- 1L
  }

  # Somewhat inefficient to duplicate out[[col]] when we're just about
  # to remove it, but otherwise need to put back in the correct place
  out <- vec_slice(df, rep(vec_seq_along(df), n))
  # https://github.com/r-lib/vctrs/issues/232
  out[[col]] <- vec_c(!!!x, .ptype = ptype)

  if (!is.null(id)) {
    # What happens if it's a mix of named and unnamed?
    idx <- map(x, index)
    idx[empty] <- NA
    out <- append_col(out, vec_c(!!!idx), id, after = col)
  }

  out
}


index <- function(x) {
  names(x) %||% seq_along(x)
}
