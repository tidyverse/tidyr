library(tidyverse)

# Doctors and Clinicians Quality Payment Program PY 2020 Group Public Reporting:
# Patient Experience

# https://data.cms.gov/provider-data/dataset/8c70-d353

csv_path <- "data-raw/cms_patient_experience.csv"
if (!file.exists(csv_path)) {
  url <- "https://data.cms.gov/provider-data/api/1/datastore/query/8c70-d353/0?offset=0&count=true&results=true&schema=true&keys=true&format=json&rowIds=false"

  json <- jsonlite::read_json(url)
  cms_patient_experience <- json$results |>
    map_df(as_tibble) |>
    select(org_pac_id, org_nm, measure_cd, measure_title, prf_rate) |>
    arrange(org_pac_id, stringi::stri_rank(measure_cd, list(numeric = TRUE))) |>
    mutate(prf_rate = as.numeric(prf_rate))

  write_csv(cms_patient_experience, csv_path)
} else {
  cms_patient_experience <- as_tibble(
    readr::read_csv(csv_path, col_types = list())
  )
}

usethis::use_data(cms_patient_experience, overwrite = TRUE)


# -------------------------------------------------------------------------

# Hospice - Provider Data
# A list of hospice agencies with data on the quality of patient care measures.
# https://data.cms.gov/provider-data/dataset/252m-zfp9

# Recommended by
# https://twitter.com/hunter_boost/status/1500212341463339008

csv_path <- "data-raw/cms_patient_care.csv"

if (!file.exists(csv_path)) {
  url <- "https://data.cms.gov/provider-data/api/1/datastore/query/252m-zfp9/0?limit=500&offset=0&count=true&results=true&schema=true&keys=true&format=json&rowIds=false"
  json <- jsonlite::read_json(url)

  abbr <- tribble(
    ~measure_name                                                 , ~measure_abbr,
    "Hospice and Palliative Care Treatment Preferences"           , "treat_pref",
    "Beliefs & Values Addressed (if desired by the patient)"      , "beliefs_addressed",
    "Hospice and Palliative Care Pain Screening"                  , "pain_screening",
    "Hospice and Palliative Care Pain Assessment"                 , "pain_assessment",
    "Hospice and Palliative Care Dyspnea Screening"               , "dyspnea_screening",
    "Hospice and Palliative Care Dyspnea Treatment"               , "dyspena_treatment",
    "Patient Treated with an Opioid Who Are Given a Bowel Regimen", "opioid_bowel",
    "Hospice and Palliative Care Composite Process Measure"       , "composite_process",
    "Hospice Visits When Death Is Imminent, Measure 1"            , "visits_imminent",
  )

  cms_patient_care <- json$results |>
    map_df(as_tibble) |>
    select(ccn = cms_certification_number_ccn, facility_name, measure_name, measure_code, score) |>
    mutate(measure_name = na_if(measure_name, "")) |>
    fill(measure_name, .direction = "up") |>
    filter(str_detect(measure_code, "^H")) |>
    mutate(score = as.numeric(na_if(score, "Not Available"))) |>
    mutate(
      type = str_to_lower(str_remove(measure_code, "H_\\d{3}_\\d{2}_")),
      measure_code = NULL
    ) |>
    left_join(abbr, by = "measure_name") |>
    select(ccn, facility_name, measure_abbr, score, type) |>
    arrange(ccn, measure_abbr, type)

  write_csv(cms_patient_care, csv_path)
} else {
  cms_patient_care <- as_tibble(
    readr::read_csv(csv_path, col_types = list())
  )
}

usethis::use_data(cms_patient_care, overwrite = TRUE)
