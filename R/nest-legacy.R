#' Legacy versions of `nest()` and `unnest()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' tidyr 1.0.0 introduced a new syntax for [nest()] and [unnest()]. The majority
#' of existing usage should be automatically translated to the new syntax with a
#' warning. However, if you need to quickly roll back to the previous behaviour,
#' these functions provide the previous interface. To make old code work as is,
#' add the following code to the top of your script:
#'
#' ```
#' library(tidyr)
#' nest <- nest_legacy
#' unnest <- unnest_legacy
#' ```
#'
#' @param data A data frame.
#' @param .key The name of the new column, as a string or symbol. This argument
#'   is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings and
#'   symbols). The name is captured from the expression with [rlang::ensym()]
#'   (note that this kind of interface where symbols do not represent actual
#'   objects is now discouraged in the tidyverse; we support it here for
#'   backward compatibility).
#' @param ... Specification of columns to unnest. Use bare variable names or
#'   functions of variables. If omitted, defaults to all list-cols.
#' @param .drop Should additional list columns be dropped? By default,
#'   `unnest()` will drop them if unnesting the specified columns requires the
#'   rows to be duplicated.
#' @param .preserve Optionally, list-columns to preserve in the output. These
#'   will be duplicated in the same way as atomic vectors. This has
#'   [dplyr::select()] semantics so you can preserve multiple variables with
#'   `.preserve = c(x, y)` or `.preserve = starts_with("list")`.
#' @param .id Data frame identifier - if supplied, will create a new column with
#'   name `.id`, giving a unique identifier. This is most useful if the list
#'   column is named.
#' @param .sep If non-`NULL`, the names of unnested data frame columns will
#'   combine the name of the original list-col with the names from the nested
#'   data frame, separated by `.sep`.
#' @export
#' @examples
#' # Nest and unnest are inverses
#' df <- tibble(x = c(1, 1, 2), y = 3:1)
#' df |> nest_legacy(y)
#' df |> nest_legacy(y) |> unnest_legacy()
#'
#' # nesting -------------------------------------------------------------------
#' as_tibble(iris) |> nest_legacy(!Species)
#' as_tibble(chickwts) |> nest_legacy(weight)
#'
#' # unnesting -----------------------------------------------------------------
#' df <- tibble(
#'   x = 1:2,
#'   y = list(
#'     tibble(z = 1),
#'     tibble(z = 3:4)
#'   )
#' )
#' df |> unnest_legacy(y)
#'
#' # You can also unnest multiple columns simultaneously
#' df <- tibble(
#'   a = list(c("a", "b"), "c"),
#'   b = list(1:2, 3),
#'   c = c(11, 22)
#' )
#' df |> unnest_legacy(a, b)
#' # If you omit the column names, it'll unnest all list-cols
#' df |> unnest_legacy()
nest_legacy <- function(data, ..., .key = "data") {
  UseMethod("nest_legacy")
}

#' @importFrom utils packageVersion
#' @export
nest_legacy.tbl_df <- function(data, ..., .key = "data") {
  key_var <- as_string(ensym(.key))
  nest_vars <- unname(tidyselect::vars_select(names(data), ...))

  if (is_empty(nest_vars)) {
    nest_vars <- names(data)
  }

  if (dplyr::is_grouped_df(data)) {
    group_vars <- dplyr::group_vars(data)
  } else {
    group_vars <- setdiff(names(data), nest_vars)
  }
  nest_vars <- setdiff(nest_vars, group_vars)

  data <- dplyr::ungroup(data)
  if (is_empty(group_vars)) {
    return(tibble(!!key_var := list(data)))
  }

  out <- dplyr::select(data, !!!syms(group_vars))

  grouped_data <- dplyr::group_by(data, !!!syms(group_vars), .drop = TRUE)
  idx <- dplyr::group_indices(grouped_data)

  representatives <- which(!duplicated(idx))

  out <- dplyr::slice(out, representatives)
  out[[key_var]] <- unname(split(data[nest_vars], idx))[unique(idx)]
  out
}

#' @export
nest_legacy.data.frame <- function(data, ..., .key = "data") {
  .key <- enquo(.key)

  # Don't transform subclasses
  if (identical(class(data), "data.frame")) {
    data <- tibble::as_tibble(data)
  }

  nest_legacy.tbl_df(data, ..., .key = !!.key)
}

#' @export
#' @rdname nest_legacy
unnest_legacy <- function(
  data,
  ...,
  .drop = NA,
  .id = NULL,
  .sep = NULL,
  .preserve = NULL
) {
  UseMethod("unnest_legacy")
}
#' @export
unnest_legacy.data.frame <- function(
  data,
  ...,
  .drop = NA,
  .id = NULL,
  .sep = NULL,
  .preserve = NULL
) {
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

  nested <- dplyr::transmute(dplyr::ungroup(data), !!!quos)
  n <- map(nested, function(x) unname(map_int(x, NROW)))
  if (length(unique(n)) != 1) {
    cli::cli_abort("All nested columns must have the same number of elements.")
  }

  types <- map_chr(nested, list_col_type)
  nest_types <- split.default(nested, types)
  if (length(nest_types$mixed) > 0) {
    probs <- names(nest_types$mixed)
    cli::cli_abort(c(
      "Each column must either be a list of vectors or a list of data frames.",
      i = "Problems in: {.var {probs}}"
    ))
  }

  unnested_atomic <- imap(nest_types$atomic %||% list(), enframe, .id = .id)
  if (length(unnested_atomic) > 0) {
    unnested_atomic <- dplyr::bind_cols(unnested_atomic)
  }

  unnested_dataframe <- map(nest_types$dataframe %||% list(), function(.) {
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
  is_data_frame <- is.data.frame(attr(x, "ptype", exact = TRUE)) ||
    (is.list(x) && all(map_lgl(x, is.data.frame)))
  is_atomic <- all(map_lgl(x, function(x) {
    is_atomic(x) || (is_list(x) && !is.object(x))
  }))

  if (is_data_frame) {
    "dataframe"
  } else if (is_atomic) {
    "atomic"
  } else {
    "mixed"
  }
}
enframe <- function(x, col_name, .id = NULL) {
  if (!is_list(x)) {
    x <- list(x)
  }

  col <- unname(x)
  col <- list_unchop(col)

  out <- set_names(list(col), col_name)
  out <- as_tibble(out)

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
