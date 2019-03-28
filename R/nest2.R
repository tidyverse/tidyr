#' Nesting and unnesting
#'
#' Nesting and unnesting change both the length and width of a data frame.
#' They primarily work with nested-dfs, list-cols of data frames. See [unchop()]
#' and [unpack()] for tools tailored for list-cols of 1d vectors.
#'
#' Learn more in `vignette("chop-pack-nest")`.
#'
#' @inheritParams unchop
#' @inheritParams unpack
#' @export
#' @examples
#' # nest =============================================================
#' df <- tibble(x = c(1, 1, 1, 2, 2, 3), y = 1:6, z = 6:1)
#' # Note that we get one row of output for each unique combination of
#' # non-chopped variables
#' df %>% nest(c(y, z))
#' # cf nest
#' df %>% chop(c(y, z))
#'
#' # unnest ===========================================================
#' df <- tibble(
#'   x = 1:3,
#'   y = list(
#'     NULL,
#'     tibble(a = 1, b = 2),
#'     tibble(a = 1:3, b = 3:1)
#'   )
#' )
#' df %>% unnest2(y)
#' df %>% unnest2(y, keep_empty = TRUE)
nest2 <- function(df, ...) {
  cols <- enquos(...)
  if (any(names2(cols) == "")) {
    abort("All elements of `...` must be named")
  }

  cols <- map(cols, ~ tidyselect::vars_select(names(df), !!.x))
  asis <- setdiff(names(df), unlist(cols))

  keys <- df[asis]
  u_keys <- vec_unique(keys)
  out <- map(cols, ~ vec_split(df[.x], keys)$val)

  vec_cbind(u_keys, new_data_frame(out, n = nrow(u_keys)))
}

#' @export
#' @rdname nest2
unnest2 <- function(df, col, id = NULL, keep_empty = FALSE, ptype = NULL) {
  col <- tidyselect::vars_pull(names(df), !!enquo(col))
  x <- df[[col]]
  stopifnot(is.list(x))

  x <- map(x, as_df, outer = col)

  n <- map_int(x, vec_size)
  ptype <- vec_type_common(!!!x, .ptype = ptype)

  # Fill empty elements to ensure original rows are preserved
  empty <- n == 0
  if (keep_empty && any(empty)) {
    vec_slice(x, empty) <- list(vec_na(ptype))
    n[empty] <- 1L
  }

  out <- vec_rbind(!!!x, .ptype = ptype)
  df <- vec_slice(df, rep(vec_seq_along(df), n))
  append_df(df, out, after = col, remove = TRUE)
}

as_df <- function(x, outer) {
  if (is.null(x)) {
    x
  } else if (is.data.frame(x)) {
    x
  } else {
    # Should this be a warning?I w
    tibble(!!outer := x)
  }
}

