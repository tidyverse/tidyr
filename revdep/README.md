# Platform

|field    |value                        |
|:--------|:----------------------------|
|version  |R version 3.6.0 (2019-04-26) |
|os       |macOS Mojave 10.14.6         |
|system   |x86_64, darwin15.6.0         |
|ui       |X11                          |
|language |(EN)                         |
|collate  |en_US.UTF-8                  |
|ctype    |en_US.UTF-8                  |
|tz       |America/Chicago              |
|date     |2019-09-08                   |

# Dependencies

|package    |old      |new         |Δ  |
|:----------|:--------|:-----------|:--|
|tidyr      |0.8.3    |0.8.99.9000 |*  |
|assertthat |0.2.1    |0.2.1       |   |
|backports  |1.1.4    |1.1.4       |   |
|BH         |1.69.0-1 |1.69.0-1    |   |
|cli        |1.1.0    |1.1.0       |   |
|crayon     |1.3.4    |1.3.4       |   |
|digest     |0.6.20   |0.6.20      |   |
|dplyr      |0.8.3    |0.8.3       |   |
|ellipsis   |0.2.0.1  |0.2.0.1     |   |
|fansi      |0.4.0    |0.4.0       |   |
|glue       |1.3.1    |1.3.1       |   |
|lifecycle  |NA       |0.1.0       |*  |
|magrittr   |1.5      |1.5         |   |
|pillar     |1.4.2    |1.4.2       |   |
|pkgconfig  |2.0.2    |2.0.2       |   |
|plogr      |0.2.0    |0.2.0       |   |
|purrr      |0.3.2    |0.3.2       |   |
|R6         |2.4.0    |2.4.0       |   |
|Rcpp       |1.0.2    |1.0.2       |   |
|rlang      |0.4.0    |0.4.0       |   |
|stringi    |1.4.3    |1.4.3       |   |
|tibble     |2.1.3    |2.1.3       |   |
|tidyselect |0.2.5    |0.2.5       |   |
|utf8       |1.1.4    |1.1.4       |   |
|vctrs      |0.2.0    |0.2.0       |   |
|zeallot    |0.1.0    |0.1.0       |   |

# Revdeps

## Failed to check (20)

|package                              |version |error    |warning |note |
|:------------------------------------|:-------|:--------|:-------|:----|
|BgeeDB                               |2.10.0  |1        |1       |1    |
|circumplex                           |0.3.2   |1        |        |     |
|[CNPBayes](failures.md#cnpbayes)     |1.13.5  |1 __+1__ |4       |3    |
|colorednoise                         |1.0.4   |1        |        |     |
|dexter                               |1.0.0   |1        |        |     |
|dynfrail                             |0.5.2   |1        |        |     |
|ELMER                                |2.8.3   |2        |6       |4    |
|[gutenbergr](failures.md#gutenbergr) |0.1.4   |__+1__   |        |1    |
|maEndToEnd                           |?       |         |        |     |
|MSstats                              |3.16.2  |1        |1       |1    |
|nlmixr                               |1.1.1-2 |1        |        |     |
|phenofit                             |0.2.5-2 |1        |        |     |
|psycho                               |?       |         |        |     |
|sesame                               |?       |         |        |     |
|sf                                   |0.7-7   |1        |        |     |
|TCGAbiolinks                         |2.12.6  |1        |6       |5    |
|[TPP](failures.md#tpp)               |3.12.0  |__+1__   |        |3    |
|trialr                               |0.1.2   |1        |        |     |
|vlad                                 |0.2.0   |1        |        |     |
|[weathercan](failures.md#weathercan) |0.2.8   |__+1__   |        |2    |

## New problems (36)

|package                                                |version |error    |warning |note     |
|:------------------------------------------------------|:-------|:--------|:-------|:--------|
|[anomalize](problems.md#anomalize)                     |0.1.1   |__+2__   |        |1        |
|[basecallQC](problems.md#basecallqc)                   |1.8.0   |         |        |__+1__   |
|[cellbaseR](problems.md#cellbaser)                     |1.8.0   |__+1__   |        |         |
|[CellBench](problems.md#cellbench)                     |1.0.0   |__+1__   |1       |1        |
|[collector](problems.md#collector)                     |0.1.2   |__+2__   |        |         |
|[cutpointr](problems.md#cutpointr)                     |0.7.6   |__+2__   |        |         |
|[easyalluvial](problems.md#easyalluvial)               |0.2.0   |__+2__   |        |         |
|[eechidna](problems.md#eechidna)                       |1.3.0   |         |        |__+1__   |
|[egor](problems.md#egor)                               |0.19.1  |__+2__   |        |1        |
|[embed](problems.md#embed)                             |0.0.3   |__+1__   |        |         |
|[fedregs](problems.md#fedregs)                         |0.1.1   |__+1__   |        |1        |
|[genogeographer](problems.md#genogeographer)           |0.1.8   |__+1__   |        |         |
|[HTSSIP](problems.md#htssip)                           |1.4.0   |__+1__   |        |1        |
|[idmodelr](problems.md#idmodelr)                       |0.3.0   |__+2__   |        |         |
|[PHEindicatormethods](problems.md#pheindicatormethods) |1.1.3   |__+1__   |        |         |
|[plyranges](problems.md#plyranges)                     |1.4.3   |1 __+1__ |1       |1        |
|[PML](problems.md#pml)                                 |1.0     |__+1__   |        |         |
|[pointblank](problems.md#pointblank)                   |0.2.0   |__+2__   |        |         |
|[PrInCE](problems.md#prince)                           |1.0.0   |__+1__   |1       |         |
|[rclimateca](problems.md#rclimateca)                   |1.0.2   |__+1__   |        |1        |
|[recipes](problems.md#recipes)                         |0.1.6   |__+1__   |        |         |
|[sampler](problems.md#sampler)                         |0.2.3   |__+1__   |        |         |
|[simTool](problems.md#simtool)                         |1.1.3   |__+1__   |        |         |
|[sjstats](problems.md#sjstats)                         |0.17.5  |__+2__   |        |2        |
|[slinky](problems.md#slinky)                           |1.2.0   |__+2__   |        |         |
|[sociome](problems.md#sociome)                         |1.0.2   |__+1__   |        |         |
|[statsDK](problems.md#statsdk)                         |0.1.1   |__+2__   |        |1        |
|[strapgod](problems.md#strapgod)                       |0.0.3   |__+1__   |        |         |
|[suddengains](problems.md#suddengains)                 |0.3.0   |__+1__   |        |         |
|[SummarizedBenchmark](problems.md#summarizedbenchmark) |2.2.2   |__+2__   |1       |4        |
|[taxa](problems.md#taxa)                               |0.3.2   |         |        |1 __+1__ |
|[tibbletime](problems.md#tibbletime)                   |0.1.2   |__+2__   |        |         |
|[tidyquant](problems.md#tidyquant)                     |0.5.6   |__+1__   |        |1        |
|[tsibble](problems.md#tsibble)                         |0.8.3   |__+2__   |        |         |
|[widyr](problems.md#widyr)                             |0.1.1   |__+2__   |        |         |
|[xpose](problems.md#xpose)                             |0.4.4   |__+2__   |        |1        |

