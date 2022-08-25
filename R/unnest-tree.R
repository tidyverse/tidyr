#' Unnest a recursive data frame
#'
#' @param data A data frame.
#' @param id_col <[`tidy-select`][tidyr_tidy_select]> A column that uniquely
#'   identifies each observation.
#' @param child_col <[`tidy-select`][tidyr_tidy_select]> Column containing the
#'   children of an observation. This must be a list where each element is either
#'   `NULL` or a data frame with the same columns as `data`.
#' @param level_to A string (`"level"` by default) specifying the new column to
#'   store the level of an observation. Use `NULL` if you don't need this
#'   information.
#' @param parent_to A string (`"parent"` by default) specifying the new column
#'   storing the parent id of an observation. Use `NULL` if you don't need this
#'   information.
#' @param ancestors_to A string (`NULL` by default) specifying the new column
#'   storing the ids of its ancestors. Use `NULL` if you don't need this
#'   information.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' df <- tibble(
#'   id = 1L,
#'   name = "a",
#'   children = list(
#'     tibble(
#'       id = 11:12,
#'       name = c("b", "c"),
#'       children = list(
#'         NULL,
#'         tibble(
#'           id = 121:122,
#'           name = c("d", "e")
#'         )
#'       )
#'     )
#'   )
#' )
#'
#' unnest_tree(
#'   df,
#'   id_col = "id",
#'   child_col = "children",
#'   level_to = "level",
#'   parent_to = "parent",
#'   ancestors_to = "ancestors"
#' )
unnest_tree <- function(data,
                        id_col,
                        child_col,
                        level_to = "level",
                        parent_to = "parent",
                        ancestors_to = NULL) {
  if (!is.data.frame(data)) {
    cli_abort("{.arg data} must be a data frame.")
  }

  id_col <- names(eval_pull(data, enquo(id_col), "id_col"))
  child_col <- names(eval_pull(data, enquo(child_col), "child_col"))
  check_arg_different(child_col, id_col)

  if (!is_null(level_to)) {
    level_to <- vctrs::vec_cast(level_to, character())
    vctrs::vec_assert(level_to, size = 1L)
  }

  if (!is_null(parent_to)) {
    parent_to <- vctrs::vec_cast(parent_to, character())
    vctrs::vec_assert(parent_to, size = 1L)
    check_arg_different(parent_to, level_to)
    check_col_new(data, parent_to)
  }
  if (!is_null(ancestors_to)) {
    ancestors_to <- vctrs::vec_cast(ancestors_to, character())
    vctrs::vec_assert(ancestors_to, size = 1L)
    check_arg_different(ancestors_to, level_to, parent_to)
    check_col_new(data, ancestors_to)
  }
  need_parents <- !is_null(parent_to) || !is_null(ancestors_to)

  call <- current_env()

  level_sizes <- list()
  level_parent_ids <- list()
  level_data <- list()

  level <- 1L
  parent_ids <- vctrs::vec_init(data[[id_col]])
  ns <- vctrs::vec_size(data)

  while (!is.null(data)) {
    # TODO check that `data` is a dataframe
    # TODO check that `data` has the `id_col`
    # TODO check type of `child_col`

    children <- data[[child_col]] %||% list()
    # TODO this could mention the path?
    vctrs::vec_check_list(children, arg = child_col)

    data[[child_col]] <- NULL
    level_data[[level]] <- data
    if (need_parents) {
      level_sizes[[level]] <- ns
      level_parent_ids[[level]] <- parent_ids
    }

    ns <- vctrs::list_sizes(children)
    parent_ids <- data[[id_col]]

    if (all(ns == 0)) {
      break
    }

    # unclass `list_of` to avoid performance hit
    children <- purrr::map(children, ~ unclass_list_of(.x, call = call))
    data <- vctrs::vec_unchop(children)

    level <- level + 1L
  }

  out <- vctrs::vec_rbind(!!!level_data)

  if (!is_null(level_to)) {
    times <- list_sizes(level_data)
    levels <- vctrs::vec_seq_along(level_data)
    out[[level_to]] <- vctrs::vec_rep_each(levels, times)
  }

  if (!is_null(parent_to)) {
    parent_ids <- vctrs::vec_c(!!!level_parent_ids)
    times <- vctrs::vec_c(!!!level_sizes)
    out[[parent_to]] <- vctrs::vec_rep_each(parent_ids, times)
  }

  if (!is_null(ancestors_to)) {
    ancestors <- list()
    ancestors[[1]] <- vctrs::vec_rep_each(list(NULL), level_sizes[[1]])

    for (i in seq2(2L, length(level_parent_ids))) {
      ancestors_simple <- purrr::map2(ancestors[[i - 1L]], vctrs::vec_chop(level_parent_ids[[i]]), c)
      ancestors[[i]] <- vctrs::vec_rep_each(ancestors_simple, level_sizes[[i]])
    }

    out[[ancestors_to]] <- vctrs::vec_unchop(ancestors)
  }

  check_id(out[[id_col]], id_col)
  out
}

unclass_list_of <- function(x, child_col, call = caller_env()) {
  if (is_null(x)) {
    return(NULL)
  }

  if (!inherits(x, "data.frame")) {
    # TODO mention path
    # TODO mention other type -> need rlang compat file
    msg <- "Each child must be NULL or a data frame."
    cli_abort(msg, call = call)
  }

  # unclass to avoid slow `[[.tbl_df` and `[[<-.tbl_df`
  x <- unclass(x)
  child_children <- x[[child_col]]
  if (inherits(child_children, "vctrs_list_of")) {
    x[[child_col]] <- unclass(child_children)
  }

  vctrs::new_data_frame(x)
}

eval_pull <- function(data, col, col_arg) {
  # TODO use `eval_pull()` once implemented
  # https://github.com/r-lib/tidyselect/issues/189
  col <- tidyselect::eval_select(col, data, allow_rename = FALSE)
  if (length(col) != 1L) {
    cli_abort("{.arg {col_arg}} must select 1 column, not {length(col)}.")
  }

  nm <- colnames(data)[[col]]
  set_names(col, nm)
}

check_col_new <- function(data,
                          col,
                          col_arg = caller_arg(col),
                          data_arg = "data",
                          call = caller_env()) {
  if (col %in% colnames(data)) {
    msg <- "{.arg {col_arg}} must not be a column in {.arg {data_arg}}."
    cli_abort(msg, call = call)
  }
}

check_arg_different <- function(arg,
                                ...,
                                arg_name = caller_arg(arg),
                                call = caller_env()) {
  other_args <- dots_list(..., .named = TRUE)

  for (i in seq_along(other_args)) {
    if (identical(arg, other_args[[i]])) {
      other_arg_nm <- names(other_args)[[i]]
      msg <- "{.arg {arg_name}} must be different from {.arg {other_arg_nm}}."
      cli_abort(msg, call = call)
    }
  }
}

check_id <- function(x, x_arg, call = caller_env()) {
  incomplete <- !vctrs::vec_detect_complete(x)
  if (any(incomplete)) {
    incomplete_loc <- which(incomplete)
    n <- length(incomplete_loc)
    msg <- c(
      "Each value of column {.field {x_arg}} must be non-missing.",
      i = "{qty(n)}Element{?s} {incomplete_loc} {qty(n)}{?is/are} missing."
    )
    cli_abort(msg, call = call)
  }

  if (vctrs::vec_duplicate_any(x)) {
    duplicated_flag <- vctrs::vec_duplicate_detect(x)
    duplicated_loc <- which(duplicated_flag)
    msg <- c(
      "Each value of column {.field {x_arg}} must be unique.",
      i = "The elements at locations {duplicated_loc} are duplicated."
    )
    cli_abort(msg, call = call)
  }
}
