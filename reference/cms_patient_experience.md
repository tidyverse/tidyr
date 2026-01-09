# Data from the Centers for Medicare & Medicaid Services

Two datasets from public data provided the Centers for Medicare &
Medicaid Services, <https://data.cms.gov>.

- `cms_patient_experience` contains some lightly cleaned data from
  "Hospice - Provider Data", which provides a list of hospice agencies
  along with some data on quality of patient care,
  <https://data.cms.gov/provider-data/dataset/252m-zfp9>.

- `cms_patient_care` "Doctors and Clinicians Quality Payment Program PY
  2020 Virtual Group Public Reporting",
  <https://data.cms.gov/provider-data/dataset/8c70-d353>

## Usage

``` r
cms_patient_experience

cms_patient_care
```

## Format

`cms_patient_experience` is a data frame with 500 observations and five
variables:

- org_pac_id,org_nm:

  Organisation ID and name

- measure_cd,measure_title:

  Measure code and title

- prf_rate:

  Measure performance rate

`cms_patient_care` is a data frame with 252 observations and five
variables:

- ccn,facility_name:

  Facility ID and name

- measure_abbr:

  Abbreviated measurement title, suitable for use as variable name

- score:

  Measure score

- type:

  Whether score refers to the rating out of 100 ("observed"), or the
  maximum possible value of the raw score ("denominator")

## Examples

``` r
cms_patient_experience |>
  dplyr::distinct(measure_cd, measure_title)
#> # A tibble: 6 × 2
#>   measure_cd   measure_title                                           
#>   <chr>        <chr>                                                   
#> 1 CAHPS_GRP_1  CAHPS for MIPS SSM: Getting Timely Care, Appointments, …
#> 2 CAHPS_GRP_2  CAHPS for MIPS SSM: How Well Providers Communicate      
#> 3 CAHPS_GRP_3  CAHPS for MIPS SSM: Patient's Rating of Provider        
#> 4 CAHPS_GRP_5  CAHPS for MIPS SSM: Health Promotion and Education      
#> 5 CAHPS_GRP_8  CAHPS for MIPS SSM: Courteous and Helpful Office Staff  
#> 6 CAHPS_GRP_12 CAHPS for MIPS SSM: Stewardship of Patient Resources    

cms_patient_experience |>
  pivot_wider(
    id_cols = starts_with("org"),
    names_from = measure_cd,
    values_from = prf_rate
 )
#> # A tibble: 95 × 8
#>    org_pac_id org_nm    CAHPS_GRP_1 CAHPS_GRP_2 CAHPS_GRP_3 CAHPS_GRP_5
#>    <chr>      <chr>           <dbl>       <dbl>       <dbl>       <dbl>
#>  1 0446157747 USC CARE…          63          87          86          57
#>  2 0446162697 ASSOCIAT…          59          85          83          63
#>  3 0547164295 BEAVER M…          49          NA          75          44
#>  4 0749333730 CAPE PHY…          67          84          85          65
#>  5 0840104360 ALLIANCE…          66          87          87          64
#>  6 0840109864 REX HOSP…          73          87          84          67
#>  7 0840513552 SCL HEAL…          58          83          76          58
#>  8 0941545784 GRITMAN …          46          86          81          54
#>  9 1052612785 COMMUNIT…          65          84          80          58
#> 10 1254237779 OUR LADY…          61          NA          NA          65
#> # ℹ 85 more rows
#> # ℹ 2 more variables: CAHPS_GRP_8 <dbl>, CAHPS_GRP_12 <dbl>

cms_patient_care |>
  pivot_wider(
    names_from = type,
    values_from = score
  )
#> # A tibble: 126 × 5
#>    ccn    facility_name               measure_abbr denominator observed
#>    <chr>  <chr>                       <chr>              <dbl>    <dbl>
#>  1 011500 BAPTIST HOSPICE             beliefs_add…         202    100  
#>  2 011500 BAPTIST HOSPICE             composite_p…         202     88.1
#>  3 011500 BAPTIST HOSPICE             dyspena_tre…         110     99.1
#>  4 011500 BAPTIST HOSPICE             dyspnea_scr…         202    100  
#>  5 011500 BAPTIST HOSPICE             opioid_bowel          61    100  
#>  6 011500 BAPTIST HOSPICE             pain_assess…         107    100  
#>  7 011500 BAPTIST HOSPICE             pain_screen…         202     88.6
#>  8 011500 BAPTIST HOSPICE             treat_pref           202    100  
#>  9 011500 BAPTIST HOSPICE             visits_immi…         232     96.1
#> 10 011501 SOUTHERNCARE NEW BEACON N.… beliefs_add…         525    100  
#> # ℹ 116 more rows

cms_patient_care |>
  pivot_wider(
    names_from = measure_abbr,
    values_from = score
  )
#> # A tibble: 28 × 12
#>    ccn    facility_name       type  beliefs_addressed composite_process
#>    <chr>  <chr>               <chr>             <dbl>             <dbl>
#>  1 011500 BAPTIST HOSPICE     deno…             202               202  
#>  2 011500 BAPTIST HOSPICE     obse…             100                88.1
#>  3 011501 SOUTHERNCARE NEW B… deno…             525               525  
#>  4 011501 SOUTHERNCARE NEW B… obse…             100               100  
#>  5 011502 COMFORT CARE COAST… deno…             295               295  
#>  6 011502 COMFORT CARE COAST… obse…             100                99.3
#>  7 011503 SAAD HOSPICE SERVI… deno…             694               694  
#>  8 011503 SAAD HOSPICE SERVI… obse…              99.9              96  
#>  9 011505 HOSPICE FAMILY CARE deno…             600               600  
#> 10 011505 HOSPICE FAMILY CARE obse…              97.8              92  
#> # ℹ 18 more rows
#> # ℹ 7 more variables: dyspena_treatment <dbl>,
#> #   dyspnea_screening <dbl>, opioid_bowel <dbl>,
#> #   pain_assessment <dbl>, pain_screening <dbl>, treat_pref <dbl>,
#> #   visits_imminent <dbl>

cms_patient_care |>
  pivot_wider(
    names_from = c(measure_abbr, type),
    values_from = score
  )
#> # A tibble: 14 × 20
#>    ccn    facility_name   beliefs_addressed_de…¹ beliefs_addressed_ob…²
#>    <chr>  <chr>                            <dbl>                  <dbl>
#>  1 011500 BAPTIST HOSPICE                    202                  100  
#>  2 011501 SOUTHERNCARE N…                    525                  100  
#>  3 011502 COMFORT CARE C…                    295                  100  
#>  4 011503 SAAD HOSPICE S…                    694                   99.9
#>  5 011505 HOSPICE FAMILY…                    600                   97.8
#>  6 011506 SOUTHERNCARE N…                    589                  100  
#>  7 011508 SOUTHERNCARE N…                    420                  100  
#>  8 011510 CULLMAN REGION…                     54                  100  
#>  9 011511 HOSPICE OF THE…                    179                  100  
#> 10 011512 SOUTHERNCARE N…                    396                  100  
#> 11 011513 SHEPHERD'S COV…                    335                   99.1
#> 12 011514 ST VINCENT'S H…                    210                  100  
#> 13 011516 HOSPICE OF LIM…                    103                  100  
#> 14 011517 HOSPICE OF WES…                    400                   99.8
#> # ℹ abbreviated names: ¹​beliefs_addressed_denominator,
#> #   ²​beliefs_addressed_observed
#> # ℹ 16 more variables: composite_process_denominator <dbl>,
#> #   composite_process_observed <dbl>,
#> #   dyspena_treatment_denominator <dbl>,
#> #   dyspena_treatment_observed <dbl>,
#> #   dyspnea_screening_denominator <dbl>, …
```
