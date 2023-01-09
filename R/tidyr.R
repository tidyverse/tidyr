#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom glue glue
#' @importFrom purrr accumulate discard every keep map map2 map2_chr
#'   map2_dbl map2_df map2_int map2_lgl map_at map_chr map_dbl map_df
#'   map_if map_int map_lgl pmap pmap_chr pmap_dbl pmap_df pmap_int
#'   pmap_lgl imap reduce some transpose
#' @importFrom dplyr tbl_vars
#' @importFrom utils type.convert
#' @importFrom lifecycle deprecated
#' @useDynLib tidyr, .registration = TRUE
"_PACKAGE"

on_load(local_use_cli())

the <- new_environment()

globalVariables(c(".", "name", "value"))

#' @importFrom tibble tribble
#' @export
tibble::tribble

#' @importFrom tibble tibble
#' @export
tibble::tibble

#' @importFrom tibble as_tibble
#' @export
tibble::as_tibble


#' @aliases select_helpers
#' @importFrom tidyselect all_of
#' @export
tidyselect::all_of
#' @importFrom tidyselect any_of
#' @export
tidyselect::any_of
#' @importFrom tidyselect contains
#' @export
tidyselect::contains
#' @importFrom tidyselect ends_with
#' @export
tidyselect::ends_with
#' @importFrom tidyselect everything
#' @export
tidyselect::everything
#' @importFrom tidyselect last_col
#' @export
tidyselect::last_col
#' @importFrom tidyselect matches
#' @export
tidyselect::matches
#' @importFrom tidyselect num_range
#' @export
tidyselect::num_range
#' @importFrom tidyselect one_of
#' @export
tidyselect::one_of
#' @importFrom tidyselect starts_with
#' @export
tidyselect::starts_with
