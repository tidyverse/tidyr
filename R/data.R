#' World Health Organization TB data
#'
#' A subset of data from the World Health Organization Global Tuberculosis
#' Report, and accompanying global populations.
#'
#' @format `who`: a data frame with 7,240 rows and the columns:
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso2, iso3}{2 & 3 letter ISO country codes}
#'   \item{year}{Year}
#'   \item{new_sp_m014 - new_rel_f65}{Counts of new TB cases recorded by group.
#'    Column names encode three variables that describe the group (see details).}
#' }
#' @details The data uses the original codes given by the World Health
#'   Organization. The column names for columns five through 60 are made by
#'   combining `new_` to a code for method of diagnosis (`rel` =
#'   relapse, `sn` = negative pulmonary smear, `sp` = positive
#'   pulmonary smear, `ep` = extrapulmonary) to a code for gender
#'   (`f` = female, `m` = male) to a code for age group (`014` =
#'   0-14 yrs of age, `1524` = 15-24 years of age, `2534` = 25 to
#'   34 years of age, `3544` = 35 to 44 years of age, `4554` = 45 to
#'   54 years of age, `5564` = 55 to 64 years of age, `65` = 65 years
#'   of age or older).
#'
#' @source <https://www.who.int/tb/country/data/download/en/>
"who"

#' @rdname who
#' @format `population`: a data frame with 4,060 rows and three columns:
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
#' @source <https://www.who.int/tb/country/data/download/en/>
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

#' Population data from the world bank
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
#' Downloaded from <https://www.pewforum.org/religious-landscape-study/>
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
