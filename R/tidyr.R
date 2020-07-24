#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom glue glue
#' @importFrom purrr accumulate discard every keep map map2 map2_chr
#'   map2_dbl map2_df map2_int map2_lgl map_at map_chr map_dbl map_df
#'   map_if map_int map_lgl pmap pmap_chr pmap_dbl pmap_df pmap_int
#'   pmap_lgl reduce some transpose
#' @importFrom dplyr tbl_vars
#' @importFrom utils type.convert
#' @importFrom lifecycle deprecated
#' @importFrom tidyselect any_of
#' @useDynLib tidyr, .registration = TRUE
"_PACKAGE"

globalVariables(".")

#' @importFrom tibble tribble
#' @export
tibble::tribble

#' @importFrom tibble tibble
#' @export
tibble::tibble

#' @importFrom tibble as_tibble
#' @export
tibble::as_tibble

# TODO: This is left just to minimize the breakage on a minor release, Remove
# this on a bigger release. (c.f. https://github.com/tidyverse/tidyr/pull/1009#discussion_r460013419)
#' @importFrom tidyselect starts_with
#' @export
tidyselect::starts_with
