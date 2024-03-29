% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{cms_patient_experience}
\alias{cms_patient_experience}
\alias{cms_patient_care}
\title{Data from the Centers for Medicare & Medicaid Services}
\format{
\code{cms_patient_experience} is a data frame with 500 observations and
five variables:
\describe{
\item{org_pac_id,org_nm}{Organisation ID and name}
\item{measure_cd,measure_title}{Measure code and title}
\item{prf_rate}{Measure performance rate}
}

\code{cms_patient_care} is a data frame with 252 observations and
five variables:
\describe{
\item{ccn,facility_name}{Facility ID and name}
\item{measure_abbr}{Abbreviated measurement title, suitable for use as variable name}
\item{score}{Measure score}
\item{type}{Whether score refers to the rating out of 100 ("observed"), or
the maximum possible value of the raw score ("denominator")}
}
}
\usage{
cms_patient_experience

cms_patient_care
}
\description{
Two datasets from public data provided the Centers for Medicare & Medicaid
Services, \url{https://data.cms.gov}.
\itemize{
\item \code{cms_patient_experience} contains some lightly cleaned data from
"Hospice - Provider Data", which provides a list of hospice agencies
along with some data on quality of patient care,
\url{https://data.cms.gov/provider-data/dataset/252m-zfp9}.
\item \code{cms_patient_care} "Doctors and Clinicians Quality Payment Program PY 2020
Virtual Group Public Reporting",
\url{https://data.cms.gov/provider-data/dataset/8c70-d353}
}
}
\examples{
cms_patient_experience \%>\%
  dplyr::distinct(measure_cd, measure_title)

cms_patient_experience \%>\%
  pivot_wider(
    id_cols = starts_with("org"),
    names_from = measure_cd,
    values_from = prf_rate
 )

cms_patient_care \%>\%
  pivot_wider(
    names_from = type,
    values_from = score
  )

cms_patient_care \%>\%
  pivot_wider(
    names_from = measure_abbr,
    values_from = score
  )

cms_patient_care \%>\%
  pivot_wider(
    names_from = c(measure_abbr, type),
    values_from = score
  )
}
\keyword{datasets}
