#' Pipe operator
#'
#' See \code{\link[magrittr]{%>%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

# https://github.com/r-lib/vctrs/issues/211
reconstruct_tibble <- function(input, output, ungrouped_vars = character()) {
  if (inherits(input, "grouped_df")) {
    old_groups <- dplyr::group_vars(input)
    new_groups <- intersect(setdiff(old_groups, ungrouped_vars), names(output))
    dplyr::grouped_df(output, new_groups, drop = dplyr::group_by_drop_default(input))
  } else if (inherits(input, "tbl_df")) {
    # Assume name repair carried out elsewhere
    as_tibble(output, .name_repair = "minimal")
  } else {
    output
  }
}


imap <- function(.x, .f, ...) {
  map2(.x, names(.x) %||% character(0), .f, ...)
}

seq_nrow <- function(x) seq_len(nrow(x))
seq_ncol <- function(x) seq_len(ncol(x))

# Until https://github.com/r-lib/rlang/issues/675 is fixed
ensym2 <- function(arg) {
  arg <- ensym(arg)

  expr <- eval_bare(expr(enquo(!!arg)), caller_env())
  expr <- quo_get_expr(expr)

  if (is_string(expr)) {
    sym(expr)
  } else if (is_symbol(expr)) {
    expr
  } else {
    abort("Must supply a symbol or a string as argument")
  }
}

last <- function(x) x[[length(x)]]


#' Legacy name repair
#'
#' Ensures all column names are unique using the approach found in
#' tidyr 0.8.3 and earlier. Only use this function if you want to preserve
#' the naming strategy, otherwise you're better off adopting the new
#' tidyverse standard with `name_repair = "universal"`
#'
#' @param nm Character vector of names
#' @param prefix prefix Prefix to use for unnamed column
#' @param sep Separator to use between name and unique suffix
#' @keywords internal
#' @export
#' @examples
#' df <- tibble(x = 1:2, y = list(tibble(x = 3:5), tibble(x = 4:7)))
#'
#' # Doesn't work because it would produce a data frame with two
#' # columns called x
#' \dontrun{unnest(df, y)}
#'
#' # The new tidyverse standard:
#' unnest(df, y, names_repair = "universal")
#'
#' # The old tidyr approach
#' unnest(df, y, names_repair = tidyr_legacy)
tidyr_legacy <- function(nms, prefix = "V", sep = "") {
  if (length(nms) == 0) return(character())
  blank <- nms == ""
  nms[!blank] <- make.unique(nms[!blank], sep = sep)
  new_nms <- setdiff(paste(prefix, seq_along(nms), sep = sep), nms)
  nms[blank] <- new_nms[seq_len(sum(blank))]
  nms
}


tidyr_col_modify <- function(data, cols) {
  # Implement from first principles to avoid edge cases in
  # data frame methods for `[<-` and `[[<-`.
  # Assume each element of `cols` has the correct size.

  if (!is.data.frame(data)) {
    abort("Internal error: `data` must be a data frame.")
  }
  if (!is_list(cols)) {
    abort("Internal error: `cols` must be a list.")
  }

  size <- vec_size(data)
  data <- tidyr_new_list(data)

  names <- names(cols)

  for (i in seq_along(cols)) {
    name <- names[[i]]
    data[[name]] <- cols[[i]]
  }

  # Assume that we can return a bare data frame that will up restored to
  # a tibble / grouped df as needed elsewhere
  data <- new_data_frame(data, n = size)

  data
}

tidyr_new_list <- function(x) {
  if (!is_list(x)) {
    abort("Internal error: `x` must be a VECSXP.")
  }

  names <- names(x)

  if (is.null(names)) {
    attributes(x) <- NULL
  } else {
    attributes(x) <- list(names = names)
  }

  x
}

# What `vec_chop2()` would be.
# Equivalent to `vec_chop(x)`, but moves names of `x` to the result.
tidyr_chop2 <- function(x) {
  names <- vec_names(x)

  if (!is.null(names)) {
    x <- vec_set_names(x, NULL)
  }

  out <- vec_chop(x)

  if (!is.null(names)) {
    out <- vec_set_names(out, names)
  }

  out
}

list_of_ptype <- function(x) {
  ptype <- attr(x, "ptype", exact = TRUE)

  # ptypes should always be unnamed, but this isn't guaranteed right now.
  # See https://github.com/r-lib/vctrs/pull/1020#discussion_r411327472
  ptype <- vec_set_names(ptype, NULL)

  ptype
}

apply_names_sep <- function(outer, inner, names_sep) {
  as.character(glue("{outer}{names_sep}{inner}"))
}

check_present <- function(x) {
  arg <- ensym(x)
  if (missing(x)) {
    abort(paste0("Argument `", arg, "` is missing with no default"))
  }

}
