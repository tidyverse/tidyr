#' World Health Organization TB data
#'
#' @description
#' A subset of data from the World Health Organization Global Tuberculosis
#' Report, and accompanying global populations. `who` uses the original
#' codes from the World Health Organization. The column names for columns
#' 5 through 60 are made by combining `new_` with:
#'
#' * the method of diagnosis (`rel` = relapse, `sn` = negative pulmonary
#'   smear, `sp` = positive pulmonary smear, `ep` = extrapulmonary),
#' * gender (`f` = female, `m` = male), and
#' * age group (`014` = 0-14 yrs of age, `1524` = 15-24, `2534` = 25-34,
#'   `3544` = 35-44 years of age, `4554` = 45-54, `5564` = 55-64,
#'   `65` = 65 years or older).
#'
#' `who2` is a lightly modified version that makes teaching the basics
#' easier by tweaking the variables to be slightly more consistent and
#' dropping `iso2` and `iso3`. `newrel` is replaced by `new_rel`, and a
#' `_` is added after the gender.
#'
#' @format ## `who`
#' A data frame with 7,240 rows and 60 columns:
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso2, iso3}{2 & 3 letter ISO country codes}
#'   \item{year}{Year}
#'   \item{new_sp_m014 - new_rel_f65}{Counts of new TB cases recorded by group.
#'    Column names encode three variables that describe the group.}
#' }
#' @source <https://www.who.int/teams/global-tuberculosis-programme/data>
"who"

#' @rdname who
#' @format ## `who2`
#' A data frame with 7,240 rows and 58 columns.
"who2"

#' @rdname who
#' @format ## `population`
#' A data frame with 4,060 rows and three columns:
#' \describe{
#'   \item{country}{Country name}
#'   \item{year}{Year}
#'   \item{population}{Population}
#' }
"population"

#' Example tabular representations
#'
#' Data sets that demonstrate multiple ways to layout the same tabular data.
#'
#' `table1`, `table2`, `table3`, `table4a`, `table4b`,
#' and `table5` all display the number of TB cases documented by the World
#' Health Organization in Afghanistan, Brazil, and China between 1999 and 2000.
#' The data contains values associated with four variables (country, year,
#' cases, and population), but each table organizes the values in a different
#' layout.
#'
#' The data is a subset of the data contained in the World Health
#' Organization Global Tuberculosis Report
#'
#' @source <https://www.who.int/teams/global-tuberculosis-programme/data>
#' @format NULL
"table1"

#' @rdname table1
#' @format NULL
"table2"

#' @rdname table1
#' @format NULL
"table3"

#' @rdname table1
#' @format NULL
"table4a"

#' @rdname table1
#' @format NULL
"table4b"

#' @rdname table1
#' @format NULL
"table5"

#' Some data about the Smith family
#'
#' A small demo dataset describing John and Mary Smith.
#'
#' @format A data frame with 2 rows and 5 columns.
"smiths"

#' US rent and income data
#'
#' Captured from the 2017 American Community Survey using the tidycensus
#' package.
#'
#' @format A dataset with variables:
#' \describe{
#'   \item{GEOID}{FIP state identifier}
#'   \item{NAME}{Name of state}
#'   \item{variable}{Variable name: income = median yearly income,
#'      rent = median monthly rent}
#'   \item{estimate}{Estimated value}
#'   \item{moe}{90% margin of error}
#' }
"us_rent_income"

#' Fish encounters
#'
#' Information about fish swimming down a river: each station represents an
#' autonomous monitor that records if a tagged fish was seen at that location.
#' Fish travel in one direction (migrating downstream). Information about
#' misses is just as important as hits, but is not directly recorded in this
#' form of the data.
#'
#' @source
#' Dataset provided by Myfanwy Johnston; more details at
#' <https://fishsciences.github.io/post/visualizing-fish-encounter-histories/>
#'
#' @format A dataset with variables:
#' \describe{
#'   \item{fish}{Fish identifier}
#'   \item{station}{Measurement station}
#'   \item{seen}{Was the fish seen? (1 if yes, and true for all rows)}
#' }
"fish_encounters"

#' Population data from the World Bank
#'
#' Data about population from the World Bank.
#'
#' @source
#' Dataset from the World Bank data bank: <https://data.worldbank.org>
#'
#' @format A dataset with variables:
#' \describe{
#'   \item{country}{Three letter country code}
#'   \item{indicator}{Indicator name: `SP.POP.GROW` = population growth,
#'     `SP.POP.TOTL` = total population, `SP.URB.GROW` = urban population
#'     growth, `SP.URB.TOTL` = total urban population}
#'   \item{2000-2018}{Value for each year}
#' }
"world_bank_pop"

#' Pew religion and income survey
#'
#' @format A dataset with variables:
#' \describe{
#'   \item{religion}{Name of religion}
#'   \item{`<$10k`-`Don\'t know/refused`}{Number of respondees with
#'     income range in column name}
#' }
#' @source
#' Downloaded from <https://www.pewresearch.org/religious-landscape-study/database/>
#' (downloaded November 2009)
"relig_income"

#' Completed construction in the US in 2018
#'
#' @format A dataset with variables:
#' \describe{
#'   \item{Year,Month}{Record date}
#'   \item{`1 unit`, `2 to 4 units`, `5 units or mote`}{Number of completed
#'     units of each size}
#'   \item{Northeast,Midwest,South,West}{Number of completed units in each region}
#' }
#' @source
#' Completions of "New Residential Construction" found in Table 5 at
#' <https://www.census.gov/construction/nrc/xls/newresconst.xls>
#' (downloaded March 2019)
"construction"

#' Song rankings for Billboard top 100 in the year 2000
#'
#' @format A dataset with variables:
#' \describe{
#'   \item{artist}{Artist name}
#'   \item{track}{Song name}
#'   \item{date.enter}{Date the song entered the top 100}
#'   \item{wk1 -- wk76}{Rank of the song in each week after it entered}
#' }
#' @source
#' The "Whitburn" project, <https://waxy.org/2008/05/the_whitburn_project/>,
#' (downloaded April 2008)
"billboard"


#' Household data
#'
#' This dataset is based on an example in
#' `vignette("datatable-reshape", package = "data.table")`
#'
#' @format A data frame with 5 rows and 5 columns:
#' \describe{
#'   \item{family}{Family identifier}
#'   \item{dob_child1}{Date of birth of first child}
#'   \item{dob_child2}{Date of birth of second child}
#'   \item{name_child1}{Name of first child}?
#'   \item{name_child2}{Name of second child}
#' }
"household"

#' Data from the Centers for Medicare & Medicaid Services
#'
#' @description
#' Two datasets from public data provided the Centers for Medicare & Medicaid
#' Services, <https://data.cms.gov>.
#'
#' *  `cms_patient_experience` contains some lightly cleaned data from
#'    "Hospice - Provider Data", which provides a list of hospice agencies
#'    along with some data on quality of patient care,
#'    <https://data.cms.gov/provider-data/dataset/252m-zfp9>.
#'
#' * `cms_patient_care` "Doctors and Clinicians Quality Payment Program PY 2020
#'   Virtual Group Public Reporting",
#'   <https://data.cms.gov/provider-data/dataset/8c70-d353>
#'
#' @examples
#' cms_patient_experience %>%
#'   dplyr::distinct(measure_cd, measure_title)
#'
#' cms_patient_experience %>%
#'   pivot_wider(
#'     id_cols = starts_with("org"),
#'     names_from = measure_cd,
#'     values_from = prf_rate
#'  )
#'
#' cms_patient_care %>%
#'   pivot_wider(
#'     names_from = type,
#'     values_from = score
#'   )
#'
#' cms_patient_care %>%
#'   pivot_wider(
#'     names_from = measure_abbr,
#'     values_from = score
#'   )
#'
#' cms_patient_care %>%
#'   pivot_wider(
#'     names_from = c(measure_abbr, type),
#'     values_from = score
#'   )
#' @format `cms_patient_experience` is a data frame with 500 observations and
#'    five variables:
#' \describe{
#' \item{org_pac_id,org_nm}{Organisation ID and name}
#' \item{measure_cd,measure_title}{Measure code and title}
#' \item{prf_rate}{Measure performance rate}
#' }
"cms_patient_experience"

#' @format `cms_patient_care` is a data frame with 252 observations and
#'    five variables:
#' \describe{
#' \item{ccn,facility_name}{Facility ID and name}
#' \item{measure_abbr}{Abbreviated measurement title, suitable for use as variable name}
#' \item{score}{Measure score}
#' \item{type}{Whether score refers to the rating out of 100 ("observed"), or
#'   the maximum possible value of the raw score ("denominator")}
#' }
#' @rdname cms_patient_experience
"cms_patient_care"
