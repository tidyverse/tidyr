#' Extract factor levels into logical columns
#'
#' Binarize takes multiple columns containing an overall set of levels
#' and turns them into as many logical columns as there are levels.
#' These columns take the names of the levels, including an optional prefix.
#'
#' @param data A data frame.
#' @param ... Specification of columns to binarize. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @param prefix An optional string to prefix the new variable names
#' @inheritParams binarize_
#' @seealso \code{\link{binarize_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' library(dplyr)
#' grades <- data.frame(
#'                 col1 = c("A", "A", "B", "C"),
#'                 col2 = c("D", "B", "A", "A"),
#'                 col3 = c(NA,  "C", "D", NA))
#'
#' binarize(grades, starts_with("col"), prefix = "grade_")
#' grades %>% binarize(starts_with("col"), prefix = "grade_")
#'
binarize <- function(data, ..., prefix = "") {
  if (n_dots(...) == 0) {
    cols <- colnames(data)
  } else {
    cols <- unname(dplyr::select_vars(colnames(data), ...))
  }

  binarize_(data, cols, prefix)
}

#' Binarize (stanndard-evaluation).n
#'
#' This is a S3 genericn.
#'
#' @param data A data frame.
#' @param cols Character vector giving column names to be binarized.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @param prefix An optional string to prefix the new variable names
#' @keywords internal
#' @export
binarize_ <- function(data, cols, prefix = "") {
  UseMethod("binarize_")
}

#' @export
binarize_.data.frame <- function(data, cols, prefix = "") {
  ## Return if we're not doing any gathering
  if (length(cols) == 0) {
    return(data)
  }

  idx <- match(cols, names(data))
  if (anyNA(idx)) {
    missing_cols <- paste(cols[is.na(idx)], collapse = ", ")
    stop("Unknown column names: ", missing_cols, call. = FALSE)
  }
  id_idx <- setdiff(seq_along(data), idx)

  ## Get the different levels and create corresponding vars
  data[idx] %>%
    lapply(as.character) %>%
    unlist %>%
    sort %>%
    unique -> lvls

  dplyr::bind_cols(data[id_idx],
                   lapply(lvls, function(lvl)
                          {
                            data[idx] %>%
                              apply(1, function(x)
                                    {
                                      lvl %in% x
                                    })
                          }) %>%
                   as.data.frame %>%
                   stats::setNames(paste0(prefix, lvls)))
}

#' @export
binarize_.tbl_df <- function(data, cols, prefix = "") {
  as_data_frame(NextMethod())
}

#' @export
binarize_.grouped_df <- function(data, cols, prefix = "") {
  regroup(NextMethod(), data, cols)
}
