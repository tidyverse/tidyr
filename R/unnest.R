#' Unnest a list column.
#'
#' If you have a list-column, this makes each element of the list its own
#' row. `unnest()` can handle list-columns that contain atomic vectors, lists, or
#' data frames (but not a mixture of the different types).
#'
#' If you unnest multiple columns, parallel entries must have the same length
#' or number of rows (if a data frame).
#'
#' @inheritParams expand
#' @param ... Specification of columns to unnest. Use bare variable names or
#'   functions of variables. If omitted, defaults to all list-cols.
#' @param .drop Should additional list columns be dropped? By default,
#'   `unnest` will drop them if unnesting the specified columns requires
#'   the rows to be duplicated.
#' @param .preserve Optionally, list-columns to preserve in the output. These
#'   will be duplicated in the same way as atomic vectors. This has
#'   [dplyr::select] semantics so you can preserve multiple variables with
#'   `.preserve = c(x, y)` or `.preserve = starts_with("list")`.
#' @param .id Data frame identifier - if supplied, will create a new column
#'   with name `.id`, giving a unique identifier. This is most useful if
#'   the list column is named.
#' @param .sep If non-`NULL`, the names of unnested data frame columns
#'   will combine the name of the original list-col with the names from
#'   nested data frame, separated by `.sep`.
#' @seealso [nest()] for the inverse operation.
#' @export
#' @examples
#' library(dplyr)
#' df <- tibble(
#'   x = 1:3,
#'   y = c("a", "d,e,f", "g,h")
#' )
#' df %>%
#'   transform(y = strsplit(y, ",")) %>%
#'   unnest(y)
#'
#' # Or just
#' df %>%
#'   unnest(y = strsplit(y, ","))
#'
#' # It also works if you have a column that contains other data frames!
#' df <- tibble(
#'   x = 1:2,
#'   y = list(
#'    tibble(z = 1),
#'    tibble(z = 3:4)
#'  )
#' )
#' df %>% unnest(y)
#'
#' # You can also unnest multiple columns simultaneously
#' df <- tibble(
#'  a = list(c("a", "b"), "c"),
#'  b = list(1:2, 3),
#'  c = c(11, 22)
#' )
#' df %>% unnest(a, b)
#' # If you omit the column names, it'll unnest all list-cols
#' df %>% unnest()
#'
#' # You can also choose to preserve one or more list-cols
#' df %>% unnest(a, .preserve = b)
#'
#' # Nest and unnest are inverses
#' df <- data.frame(x = c(1, 1, 2), y = 3:1)
#' df %>% nest(y)
#' df %>% nest(y) %>% unnest()
#'
#' # If you have a named list-column, you may want to supply .id
#' df <- tibble(
#'   x = 1:2,
#'   y = list(a = 1, b = 3:4)
#' )
#' unnest(df, .id = "name")
unnest <- function(data, ..., .drop = NA, .id = NULL, .sep = NULL, .preserve = NULL) {
  UseMethod("unnest")
}

#' @export
unnest.data.frame <- function(data, ..., .drop = NA, .id = NULL,
                              .sep = NULL, .preserve = NULL) {

  preserve <- tidyselect::vars_select(names(data), !!enquo(.preserve))
  quos <- quos(...)
  if (is_empty(quos)) {
    list_cols <- names(data)[map_lgl(data, is_list)]
    list_cols <- setdiff(list_cols, preserve)

    quos <- syms(list_cols)
  }

  if (length(quos) == 0) {
    return(data)
  }

  nested <- dplyr::transmute(dplyr::ungroup(data), !!! quos)
  n <- map(nested, function(x) unname(map_int(x, NROW)))
  if (length(unique(n)) != 1) {
    abort("All nested columns must have the same number of elements.")
  }

  types <- map_chr(nested, list_col_type)
  nest_types <- split.default(nested, types)
  if (length(nest_types$mixed) > 0) {
    probs <- paste(names(nest_types$mixed), collapse = ",")
    abort(glue(
      "Each column must either be a list of vectors or a list of ",
      "data frames [{probs}]"
    ))
  }

  unnested_atomic <- imap(nest_types$atomic %||% list(), enframe, .id = .id)
  if (length(unnested_atomic) > 0) {
    unnested_atomic <- dplyr::bind_cols(unnested_atomic)
  }

  unnested_dataframe <- map(nest_types$dataframe %||% list(), function(.){
    if (length(.) == 0L) {
      attr(., "ptype") %||% data.frame()
    } else {
      dplyr::bind_rows(., .id = .id)
    }
  })
  if (!is_null(.sep)) {
    unnested_dataframe <- imap(
      unnested_dataframe,
      function(df, name) {
        set_names(df, paste(name, names(df), sep = .sep))
      }
    )
  }
  if (length(unnested_dataframe) > 0) {
    unnested_dataframe <- dplyr::bind_cols(unnested_dataframe)
  }

  # Keep list columns by default, only if the rows aren't expanded
  if (identical(.drop, NA)) {
    n_in <- nrow(data)
    if (length(unnested_atomic)) {
      n_out <- nrow(unnested_atomic)
    } else {
      n_out <- nrow(unnested_dataframe)
    }
    .drop <- n_out != n_in
  }
  if (.drop) {
    is_atomic <- map_lgl(data, is_atomic)
    group_vars <- names(data)[is_atomic]
  } else {
    group_vars <- names(data)
  }
  group_vars <- setdiff(group_vars, names(nested))

  # Add list columns to be preserved
  group_vars <- union(group_vars, preserve)

  rest <- data[rep(seq_nrow(data), n[[1]]), group_vars, drop = FALSE]
  out <- dplyr::bind_cols(rest, unnested_atomic, unnested_dataframe)

  reconstruct_tibble(data, out)
}

list_col_type <- function(x) {
  is_data_frame <- is.data.frame(attr(x, "ptype", exact = TRUE)) || (is.list(x) && all(map_lgl(x, ~ is.data.frame(.x) || is.null(.x))))
  is_atomic <- all(map_lgl(x, function(x) is_atomic(x) || (is_list(x) && !is.object(x)) || is_null(x)))

  if (is_data_frame) {
    "dataframe"
  } else if (is_atomic) {
    "atomic"
  } else {
    "mixed"
  }
}
enframe <- function(x, col_name, .id = NULL) {
  out <- tibble(dplyr::combine(x))
  names(out) <- col_name

  if (!is_null(.id)) {
    out[[.id]] <- id_col(x)
  }
  out
}
id_col <- function(x) {
  stopifnot(is_list(x))

  ids <- if (is_null(names(x))) seq_along(x) else names(x)
  lengths <- map_int(x, length)

  ids[rep(seq_along(ids), lengths)]
}

# unnest2 -----------------------------------------------------------------

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

