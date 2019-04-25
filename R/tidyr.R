#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom glue glue
#' @importFrom purrr accumulate discard every keep map map2 map2_chr
#'   map2_dbl map2_df map2_int map2_lgl map_at map_chr map_dbl map_df
#'   map_if map_int map_lgl pmap pmap_chr pmap_dbl pmap_df pmap_int
#'   pmap_lgl reduce some transpose
#' @importFrom utils type.convert
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


#' @aliases select_helpers
#' @importFrom tidyselect contains
#' @export
tidyselect::contains
#' @importFrom tidyselect ends_with
#' @export
tidyselect::ends_with
#' @importFrom tidyselect everything
#' @export
tidyselect::everything
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
#' @importFrom tidyselect last_col
#' @export
tidyselect::last_col
