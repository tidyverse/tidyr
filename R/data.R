#' World Health Organization TB data
#'
#' A subset of data from the World Health Organization Global Tuberculosis
#' Report, and accompanying global populations.
#'
#' @format A dataset with the variables
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso2,iso2}{2 & 3 letter ISO country codes}
#'   \item{new_sp_m014 - new_rel_f65}{Counts of new TB cases recorded by group.
#'    Column names encode three variables that describe the group (see details).}
#' }
#' @details The data uses the original codes given by the World Health
#'   Organization. The column names for columns five through 60 are made by
#'   combining \code{new_} to a code for method of diagnosis (\code{rel} =
#'   relapse, \code{sn} = negative pulmonary smear, \code{sp} = positive
#'   pulmonary smear, \code{ep} = extrapulmonary) to a code for gender
#'   (\code{f} = female, \code{m} = male) to a code for age group (\code{014} =
#'   0-14 yrs of age, \code{1524} = 15-24 years of age, \code{2534} = 25 to
#'   34 years of age, \code{3544} = 35 to 44 years of age, \code{4554} = 45 to
#'   54 years of age, \code{5564} = 55 to 64 years of age, \code{65} = 65 years
#'   of age or older).
#'
#' @source \url{http://www.who.int/tb/country/data/download/en/}
"who"

#' @rdname who
"population"

#' Example tabular representations
#'
#' Data sets that demonstrate multiple ways to layout the same tabular data.
#'
#' \code{table1}, \code{table2}, \code{table3}, \code{table4a}, \code{table4b},
#' and \code{table5} all display the number of TB cases documented by the World
#' Health Organization in Afghanistan, Brazil, and China between 1999 and 2000.
#' The data contains values associated with four variables (country, year,
#' cases, and population), but each table organizes the values in a different
#' layout.
#'
#' The data is a subset of the data contained in the World Health
#' Organization Global Tuberculosis Report
#'
#' @source \url{http://www.who.int/tb/country/data/download/en/}
"table1"

#' @rdname table1
"table2"

#' @rdname table1
"table3"

#' @rdname table1
"table4a"

#' @rdname table1
"table4b"

#' @rdname table1
"table5"

#' Some data about the Smith family.
#'
#' A small demo dataset describing John and Mary Smith.
#'
#' @format A data frame with 2 rows and 5 columns.
"smiths"
