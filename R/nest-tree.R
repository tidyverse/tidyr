#' Convert a data frame to a tree
#'
#' @param data A data frame.
#' @param id_col <[`tidy-select`][tidyr_tidy_select]> Id column. The values
#'   must be unique and non-missing.
#' @param parent_col <[`tidy-select`][tidyr_tidy_select]> Parent column. Each
#'   value must either be missing (for the root elements) or appear in the
#'   `id_col` column.
#' @param children_to Name of the column the children should be put.
#'
#' @return A tree like data frame.
#' @export
#'
#' @examples
#' df <- tibble::tibble(
#'   id = 1:5,
#'   x = letters[1:5],
#'   parent = c(NA, NA, 1L, 2L, 4L)
#' )
#' out <- nest_tree(df, id, parent, "children")
#' out
#'
#' out$children
#' out$children[[2]]$children
nest_tree <- function(data, id_col, parent_col, children_to) {
  if (!is.data.frame(data)) {
    cli_abort("{.arg data} must be a data frame.")
  }

  id_col <- eval_pull(data, enquo(id_col), "id_col")
  id_col_name <- colnames(data)[[id_col]]
  check_id_col(data, id_col)

  parent_col <- eval_pull(data, enquo(parent_col), "parent_col")
  parent_col_name <- colnames(data)[[parent_col]]
  data[[parent_col]] <- check_parent_col(data, parent_col, id_col)

  children_to <- check_children_to(children_to, id_col, parent_col)

  if (vctrs::vec_is_empty(data)) {
    data[[parent_col]] <- NULL
    data[[children_to]] <- list()

    return(data)
  }

  lvl_info <- nest_tree_lvl(data[[id_col]], data[[parent_col]], id_col_name)
  max_lvl <- lvl_info$max_lvl
  lvls <- lvl_info$lvls

  data[[children_to]] <- list(NULL)
  x_split <- vctrs::vec_split(data, lvls)
  children <- x_split$val[[max_lvl]]

  for (cur_lvl in seq(max_lvl - 1L, 1L)) {
    parent <- x_split$val[[cur_lvl]]
    child_parent_ids <- children[[parent_col]]
    children[[parent_col]] <- NULL

    children_split <- vctrs::vec_split(children, child_parent_ids)
    child_parent_match <- vctrs::vec_match(parent[[id_col]], children_split$key)
    parent[[children_to]] <- children_split$val[child_parent_match]
    children <- parent
  }

  parent[[parent_col]] <- NULL
  parent
}

nest_tree_lvl <- function(ids, parent_ids, id_col_name, call = caller_env()) {
  lvls <- NA_integer_

  child_idx <- is.na(parent_ids)
  lvls[child_idx] <- 1L
  cur_parent_ids <- ids[child_idx]

  cur_lvl <- 1L
  while (TRUE) {
    # TODO add `call` argument once available
    child_idx <- vctrs::vec_in(parent_ids, cur_parent_ids)

    if (!any(child_idx)) {
      break
    }

    cur_lvl <- cur_lvl + 1L
    lvls[child_idx] <- cur_lvl
    cur_parent_ids <- ids[child_idx]

    child_idx <- parent_ids %in% cur_parent_ids
  }

  check_lvls(lvls, call)

  list(
    lvls = lvls,
    max_lvl = cur_lvl
  )
}

check_lvls <- function(lvls, call) {
  na_lvls <- is.na(lvls)
  if (any(na_lvls)) {
    not_found_loc <- which(na_lvls)
    n <- length(not_found_loc)
    msg <- c(
      "Each element must be connected to a root element.",
      i = "The {qty(n)}element{?s} {not_found_loc} {qty(n)}{?is/are} not connected."
    )
    cli_abort(msg, call = call)
  }
}

data_field_name <- function(col) {
  paste0("data$", col)
}

# TODO same code as for `unnest_tree()` -> keep only one implementation
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

check_id_col <- function(data, id_col, call = caller_env()) {
  id_col_name <- colnames(data)[[id_col]]
  ids <- data[[id_col]]
  check_id(ids, id_col_name, call)
}

check_parent_col <- function(data, parent_col, id_col, call = caller_env()) {
  id_col_name <- colnames(data)[[id_col]]
  parent_col_name <- colnames(data)[[parent_col]]

  check_arg_different(parent_col, id_col)

  ids <- data[[id_col]]
  parent_ids <- data[[parent_col]]
  parent_ids <- vctrs::vec_cast(
    parent_ids,
    ids,
    x_arg = data_field_name(parent_col_name),
    to_arg = data_field_name(id_col_name)
  )

  self_reference <- vctrs::vec_equal(parent_ids, ids, na_equal = FALSE)
  if (any(self_reference, na.rm = TRUE)) {
    self_reference_loc <- which(self_reference)
    n <- length(self_reference_loc)
    msg <- c(
      "An element must not be its own parent",
      i = "{qty(n)}Element{?s} {self_reference_loc} {qty(n)}refer{?s/} to {?itself/themselves} as parent."
    )
    cli_abort(msg, call = call)
  }

  parent_na <- vctrs::vec_equal_na(parent_ids)
  if (!any(parent_na) && !vctrs::vec_is_empty(parent_ids)) {
    msg <- c(
      "There must be root elements.",
      i = "A root element is an elements whose parent id is missing."
    )
    cli_abort(msg, call = call)
  }

  missing_parents <- !vctrs::vec_in(parent_ids, ids) & !parent_na
  if (any(missing_parents)) {
    missing_parent_ids <- vctrs::vec_slice(parent_ids, missing_parents)
    n <- sum(missing_parents)
    msg <- c(
      "The parent of each element must be found.",
      i = "The parent {qty(n)} id{?s} {.value {missing_parent_ids}} {qty(n)}{?is/are} not found."
    )
    cli_abort(msg, call = call)
  }

  data[[parent_col]]
}

check_children_to <- function(children_to, id_col, parent_col, call = caller_env()) {
  children_to <- vctrs::vec_cast(children_to, character(), call = call)
  children_to <- vctrs::vec_assert(children_to, size = 1L, call = call)
  check_arg_different(
    children_to,
    id_col = names(id_col),
    parent_col = names(parent_col),
    call = call
  )

  children_to
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

# TODO same code as for `unnest_tree()` -> keep only one implementation
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
