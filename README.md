
<!-- README.md is generated from README.Rmd. Please edit that file -->

# I14Y <img src="man/figures/logo.png" align="right" width="138" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/lgnbhl/I14Y/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lgnbhl/I14Y/actions/workflows/R-CMD-check.yaml)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Follow-E4405F?style=social&logo=linkedin)](https://www.linkedin.com/in/FelixLuginbuhl)
[![Codecov test
coverage](https://codecov.io/gh/lgnbhl/I14Y/branch/main/graph/badge.svg)](https://app.codecov.io/gh/lgnbhl/I14Y?branch=main)
<!-- badges: end -->

Search and download official Swiss metadata from the [I14Y
interoperability plateform](https://www.i14y.admin.ch) of Switzerland
using its public [IOP API](https://www.i14y.admin.ch/api/index.html) and
[Console API](https://apiconsole.i14y.admin.ch/public/v1/index.html) in
any language (“en”, “de”, “fr” or “it”).

## Install

``` r
remotes::install_github("lgnbhl/I14Y")
```

## Usage

``` r
library(I14Y)
```

### Get concepts and codelists

You can get the full concept public catalog with
`i14y_search_concept()`:

``` r
i14y_search_concept()
#> # A tibble: 604 × 32
#>    accessRights businessEvents conceptValueType id        identifiers lifeEvents
#>    <lgl>        <list>         <chr>            <chr>     <list>      <list>    
#>  1 NA           <list [0]>     CodeList         08db7950… <chr [1]>   <list [0]>
#>  2 NA           <list [0]>     CodeList         08db7950… <chr [1]>   <list [0]>
#>  3 NA           <list [0]>     CodeList         08db7950… <chr [1]>   <list [0]>
#>  4 NA           <list [0]>     CodeList         08db7950… <chr [1]>   <list [0]>
#>  5 NA           <list [0]>     CodeList         08db7951… <chr [1]>   <list [0]>
#>  6 NA           <list [0]>     CodeList         08db7951… <chr [1]>   <list [0]>
#>  7 NA           <list [0]>     CodeList         08db7951… <chr [1]>   <list [0]>
#>  8 NA           <list [0]>     CodeList         08db7951… <chr [1]>   <list [0]>
#>  9 NA           <list [0]>     CodeList         08db7951… <chr [1]>   <list [0]>
#> 10 NA           <list [0]>     CodeList         08db7951… <chr [1]>   <list [0]>
#> # ℹ 594 more rows
#> # ℹ 26 more variables: publicationLevel <chr>, publicationLevelProposal <lgl>,
#> #   registrationStatus <chr>, registrationStatusProposal <chr>, status <chr>,
#> #   structure <lgl>, themes <list>, type <chr>, validFrom <chr>, validTo <chr>,
#> #   version <chr>, description.de <chr>, description.en <chr>,
#> #   description.fr <chr>, description.it <chr>, description.rm <chr>,
#> #   publisherName.de <chr>, publisherName.en <chr>, publisherName.fr <chr>, …
```

Search for a specific concept in a given language (“en”, “de”, “fr” or
“it”) with `i14y_search_concept()`:

``` r
i14y_search_concept(query = "noga", language = "en")
#> # A tibble: 11 × 32
#>    accessRights businessEvents conceptValueType id        identifiers lifeEvents
#>    <lgl>        <list>         <chr>            <chr>     <list>      <list>    
#>  1 NA           <list [0]>     CodeList         08d94604… <chr [1]>   <list [0]>
#>  2 NA           <list [0]>     CodeList         08d94604… <chr [1]>   <list [0]>
#>  3 NA           <list [0]>     CodeList         08d94604… <chr [1]>   <list [0]>
#>  4 NA           <list [0]>     CodeList         08dc481b… <chr [1]>   <list [0]>
#>  5 NA           <list [0]>     CodeList         001bfaa8… <chr [1]>   <list [0]>
#>  6 NA           <list [0]>     CodeList         08d94603… <chr [1]>   <list [0]>
#>  7 NA           <list [0]>     CodeList         08d94604… <chr [1]>   <list [0]>
#>  8 NA           <list [0]>     CodeList         08d9f1f9… <chr [1]>   <list [0]>
#>  9 NA           <list [0]>     CodeList         08d94604… <chr [1]>   <list [0]>
#> 10 NA           <list [0]>     CodeList         08dd28d2… <chr [1]>   <list [0]>
#> 11 NA           <list [0]>     CodeList         08d9f6dd… <chr [1]>   <list [0]>
#> # ℹ 26 more variables: publicationLevel <chr>, publicationLevelProposal <lgl>,
#> #   registrationStatus <chr>, registrationStatusProposal <lgl>, status <chr>,
#> #   structure <lgl>, themes <list>, type <chr>, validFrom <chr>, validTo <chr>,
#> #   version <chr>, description.de <chr>, description.en <chr>,
#> #   description.fr <chr>, description.it <chr>, description.rm <lgl>,
#> #   publisherName.de <chr>, publisherName.en <chr>, publisherName.fr <chr>,
#> #   publisherName.it <chr>, publisherName.rm <lgl>, title.de <chr>, …
```

As showed in the `conceptType` column, some concepts have the type
“CodeList”. You can get the codelist (i.e. the “content”) of a concept
using `i14y_get_codelist()`, with the value from the `id` column.

``` r
i14y_get_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201" # for DV_NOGA_DIVISION
)
#> # A tibble: 88 × 48
#>    Code  ParentCode Name_de       Name_fr Name_it Name_rm Name_en Description_de
#>    <chr> <lgl>      <chr>         <chr>   <chr>   <lgl>   <chr>   <lgl>         
#>  1 01    NA         Landwirtscha… Cultur… Produz… NA      Crop a… NA            
#>  2 02    NA         Forstwirtsch… Sylvic… Silvic… NA      Forest… NA            
#>  3 03    NA         Fischerei un… Pêche … Pesca … NA      Fishin… NA            
#>  4 05    NA         Kohlenbergbau Extrac… Estraz… NA      Mining… NA            
#>  5 06    NA         Gewinnung vo… Extrac… Estraz… NA      Extrac… NA            
#>  6 07    NA         Erzbergbau    Extrac… Estraz… NA      Mining… NA            
#>  7 08    NA         Gewinnung vo… Autres… Altre … NA      Other … NA            
#>  8 09    NA         Erbringung v… Servic… Attivi… NA      Mining… NA            
#>  9 10    NA         Herstellung … Indust… Indust… NA      Manufa… NA            
#> 10 11    NA         Getränkehers… Fabric… Produz… NA      Manufa… NA            
#> # ℹ 78 more rows
#> # ℹ 40 more variables: Description_fr <lgl>, Description_it <lgl>,
#> #   Description_rm <lgl>, Description_en <lgl>, Annotation_ABBREV_Type <chr>,
#> #   Annotation_ABBREV_Title <lgl>, Annotation_ABBREV_URI <lgl>,
#> #   Annotation_ABBREV_Identifier <lgl>, Annotation_ABBREV_Text_de <chr>,
#> #   Annotation_ABBREV_Text_fr <chr>, Annotation_ABBREV_Text_it <chr>,
#> #   Annotation_ABBREV_Text_rm <lgl>, Annotation_ABBREV_Text_en <chr>, …
```

You can also get all concept metadata using `i14_get_concept()`. Note
that the object returned is a list (not a data.frame).

``` r
concept_list <- i14y_get_concept(
  id = "08d94604-e058-62a2-aa25-53f84b974201"
)

concept_list$description
#> $de
#> [1] "Zweite Ebene der Allgemeinen Systematik der Wirtschaftszweige (NOGA), bestehend aus Rubriken, die durch einen zweistelligen numerischen Code gekennzeichnet sind. Diese zweite Ebene wird durch die International Standard Industrial Classification of All Economic Activities (ISIC Rev.4) bestimmt."
#> 
#> $en
#> [1] "Second level of the General Classification of Economic Activities (NOGA) composed of headings identified by a two-digit numerical code. This second level is determined by the International Standard Industrial Classification of All Economic Activities (ISIC Rev.4)."
#> 
#> $fr
#> [1] "Deuxième niveau de la Nomenclature générale des activités économiques (NOGA) composé de rubriques identifiées par un code numérique à deux chiffres. Ce deuxième niveau est déterminé par la Classification internationale type, par industrie, de toutes les branches d’activité économique (CITI Rev.4)."
#> 
#> $it
#> [1] "Secondo livello della Nomenclatura generale delle attività economiche (NOGA) composto da rubriche identificate da un codice numerico a due cifre. Questo secondo livello è determinato dalla Classificazione Internazionale Standard Industriale di tutte le attività economiche (ISIC Rev.4)."
#> 
#> $rm
#> NULL
```

### A concrete example

When using an official Swiss dataset, you can use I14Y to get
translations or additional information for a given category. For
example, let’s get the monthly income by gender and profession in 2022
using the BFS R package.

``` r
library(BFS)

income_by_job_and_gender_meta <- BFS::bfs_get_metadata(
  number_bfs = "px-x-0304010000_201"
)

income_by_job_and_gender <- BFS::bfs_get_data(
  number_bfs = "px-x-0304010000_201", 
  language = "de",
  query = list(
    Jahr = "2022", 
    Geschlecht = c("1", "2"),
    Wirtschaftsabteilung = income_by_job_and_gender_meta$values[[3]],
    'Zentralwert und andere Perzentile' = "1"
  )
)

income_by_job_and_gender
#> # A tibble: 6,560 × 7
#>    Jahr  Grossregion Wirtschaftsabteilung       `Berufliche Stellung` Geschlecht
#>    <chr> <chr>       <chr>                      <chr>                 <chr>     
#>  1 2022  Schweiz     Wirtschaftsabteilung - To… Berufliche Stellung … Frauen    
#>  2 2022  Schweiz     Wirtschaftsabteilung - To… Berufliche Stellung … Männer    
#>  3 2022  Schweiz     Wirtschaftsabteilung - To… Oberes und mittleres… Frauen    
#>  4 2022  Schweiz     Wirtschaftsabteilung - To… Oberes und mittleres… Männer    
#>  5 2022  Schweiz     Wirtschaftsabteilung - To… Unteres Kader         Frauen    
#>  6 2022  Schweiz     Wirtschaftsabteilung - To… Unteres Kader         Männer    
#>  7 2022  Schweiz     Wirtschaftsabteilung - To… Verantwortlich für d… Frauen    
#>  8 2022  Schweiz     Wirtschaftsabteilung - To… Verantwortlich für d… Männer    
#>  9 2022  Schweiz     Wirtschaftsabteilung - To… Ohne Kaderfunktion    Frauen    
#> 10 2022  Schweiz     Wirtschaftsabteilung - To… Ohne Kaderfunktion    Männer    
#> # ℹ 6,550 more rows
#> # ℹ 2 more variables: `Zentralwert und andere Perzentile` <chr>,
#> #   `Monatlicher Bruttolohn` <dbl>
```

Using I14Y, you can get the English, French or Italian translation of
the German NOGA division categories (with a bit of extra data
transformations):

``` r
library(dplyr)
library(stringr)
library(readr)

noga_division <- i14y_get_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201" # for DV_NOGA_DIVISION
) |>
  mutate(Code = as.numeric(Code))

income_by_job_and_gender |>
  filter(!str_detect(Wirtschaftsabteilung, "Sektor")) |> # remove sectors
  mutate(Code = readr::parse_number(Wirtschaftsabteilung)) |> # extract code
  left_join(noga_division, by = "Code") |>
  select(Wirtschaftsabteilung, Name_en, Name_fr, Name_it)
#> # A tibble: 6,400 × 4
#>    Wirtschaftsabteilung         Name_en Name_fr Name_it
#>    <chr>                        <chr>   <chr>   <chr>  
#>  1 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  2 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  3 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  4 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  5 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  6 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  7 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  8 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#>  9 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#> 10 Wirtschaftsabteilung - Total <NA>    <NA>    <NA>   
#> # ℹ 6,390 more rows
```

### Search and get datasets

You can search in the public catalog for datasets, data services or
public services with `i14y_search_catalog()`:

``` r
i14y_search_catalog()
#> # A tibble: 2,806 × 38
#>    businessEvents conceptValueType id    identifiers lifeEvents publicationLevel
#>    <list>         <chr>            <chr> <list>      <list>     <chr>           
#>  1 <df [0 × 0]>   <NA>             0091… <chr [1]>   <df>       Public          
#>  2 <df [0 × 0]>   <NA>             00b3… <chr [1]>   <df>       Public          
#>  3 <df [0 × 0]>   <NA>             02b4… <chr [1]>   <df>       Public          
#>  4 <df [0 × 0]>   <NA>             02e3… <chr [1]>   <df>       Public          
#>  5 <df [0 × 0]>   <NA>             0466… <chr [1]>   <df>       Public          
#>  6 <df [0 × 0]>   <NA>             0490… <chr [1]>   <df>       Public          
#>  7 <df [0 × 0]>   <NA>             04f0… <chr [1]>   <df>       Public          
#>  8 <df [0 × 0]>   <NA>             05c7… <chr [1]>   <df>       Public          
#>  9 <df [0 × 0]>   <NA>             0623… <chr [1]>   <df>       Public          
#> 10 <df [0 × 0]>   <NA>             0699… <chr [1]>   <df>       Public          
#> # ℹ 2,796 more rows
#> # ℹ 32 more variables: publicationLevelProposal <lgl>,
#> #   registrationStatus <chr>, registrationStatusProposal <chr>, status <chr>,
#> #   structure <chr>, themes <list>, type <chr>, validFrom <chr>, validTo <chr>,
#> #   version <chr>, accessRights.code <chr>, accessRights.uri <chr>,
#> #   accessRights.name.de <chr>, accessRights.name.en <chr>,
#> #   accessRights.name.fr <chr>, accessRights.name.it <chr>, …
```

Note that the “type” column returned by `i14y_search_catalog()` shows if
the content is a “Dataset”, a “DataService” or a “PublicService”.

You can get the description from the metadata of a given “Dataset” with
`i14y_get_dataset_metadata()`.

``` r
dataset_metadata <- i14y_get_dataset_metadata(
  id = "02e34f85-14df-45b5-a38b-2f063c999481"
)

# Add the language
dataset_metadata$description$en
#> [1] "The Swiss prosecution authorities and the Federal intelligence service (FIS) may order post and telecommunications surveillance measures for the purpose of investigating serious criminal offences based on the Swiss Criminal Procedure Code and the Federal Intelligence Service Act. The PTSS is obliged to produce statistics on surveillance measures based on  Art. 16 para. 1 let. k of the Federal Act on Post and Telecommunications Surveillance (SPTA).\r\n\r\nAlthough the number of monitoring measures has fallen this year, it is still slightly above the average of the last five years. While real-time monitoring is within this average, retrospective monitoring is slightly higher. However, emergency searches and tracing of persons show a strong increase compared to the above-mentioned average, while antenna searches are slightly lower.\r\n\r\nThe Articles 269bis and 269ter of the Swiss Criminal Procedure Code allow the use of special technical devices (IMSI catchers) and computer software (govware) for telecommunications surveillance. \r\n\r\nIn 2023, 9 operations used this special computer software (7 in the previous year). The number of operations using special technical devices (IMSI-Catcher) amounts to 160 compared to 120 in the previous year. \r\n\r\nNote: The numbers presented by FIS and those by the PTSS are not comparable due to a different counting method.\r\n"
```

Some datasets can be access directly using the I14Y API. But other
datasets are hosted only on partner websites. You can get the URL
downloads and formats of the dataset using in the distributions part:

``` r
# see "downloadUrl" and "format" columns
str(dataset_metadata$distributions, max.level = 1)
#> 'data.frame':    18 obs. of  46 variables:
#>  $ accessServices    :List of 18
#>  $ availability      : logi  NA NA NA NA NA NA ...
#>  $ byteSize          : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ checksum          : logi  NA NA NA NA NA NA ...
#>  $ conformsTo        :List of 18
#>  $ coverage          :List of 18
#>  $ documentation     :List of 18
#>  $ id                : chr  "051ce80d-5cc5-4bf4-874b-9626d55ae5a4" "123e09a1-2198-44af-aa2a-c4bf1cc1fd94" "16bc7686-a1c6-4cd9-8583-704f7922e647" "2ca8412c-3627-449f-b7fb-239889ade1a0" ...
#>  $ identifier        : chr  "Detaillierte_Statistik_UEPF_detaillierte_statistik_2023_-_auskünfte" "Detaillierte_Statistik_UEPF_detaillierte_statistik_2011" "Detaillierte_Statistik_UEPF_detaillierte_statistik_2015" "Detaillierte_Statistik_UEPF_detaillierte_statistik_2020_-_auskünfte" ...
#>  $ images            :List of 18
#>  $ issued            : chr  "2024-04-25T02:00:00+02:00" "2012-03-06T01:00:00+01:00" "2016-02-25T01:00:00+01:00" "2021-03-23T01:00:00+01:00" ...
#>  $ languages         :List of 18
#>  $ mediaType         : logi  NA NA NA NA NA NA ...
#>  $ modified          : chr  "2024-05-08T10:40:25.929+02:00" "2020-05-07T13:49:33.014+02:00" "2020-05-07T13:49:33.014+02:00" "2021-04-07T15:56:03.405+02:00" ...
#>  $ packagingFormat   : logi  NA NA NA NA NA NA ...
#>  $ rights            : logi  NA NA NA NA NA NA ...
#>  $ spatialResolution : logi  NA NA NA NA NA NA ...
#>  $ temporalResolution: chr  "" "" "" NA ...
#>  $ accessUrl.label   : logi  NA NA NA NA NA NA ...
#>  $ accessUrl.uri     : chr  "https://www.li.admin.ch/sites/default/files/2024-04/auskunfte-2023.xlsx" "https://www.li.admin.ch/sites/default/files/2019-05/Detaillierte_Statistik_des_Dienstes_2011.xlsx" "https://www.li.admin.ch/sites/default/files/2019-05/Detaillierte_Statistik_des_Dienstes_2015.xlsx" "https://www.li.admin.ch/sites/default/files/2021-03/auskuenfte_2020.xlsx" ...
#>  $ description.de    : chr  "Die Schweizer Strafverfolgungsbehörden und der Nachrichtendienst des Bundes (NDB) können zur Aufklärung von sch"| __truncated__ "Eine Echtzeitüberwachung ist die simultane, leicht verzögerte oder periodische Übertragung der Post- oder Fernm"| __truncated__ "Eine Echtzeitüberwachung ist die simultane, leicht verzögerte oder periodische Übertragung der Post- oder Fernm"| __truncated__ "Echtzeitüberwachung \r\nEine Echtzeitüberwachung ist die simultane, leicht verzögerte oder periodische Übertrag"| __truncated__ ...
#>  $ description.en    : chr  "The Swiss prosecution authorities and the Federal intelligence service (FIS) may order post and telecommunicati"| __truncated__ NA NA NA ...
#>  $ description.fr    : chr  "Les autorités suisses de poursuite pénale et le Service de renseignement de la Confédération (SRC) peuvent, en "| __truncated__ "Une surveillance en temps réel est l’interception en temps réel et la transmission simultanée, légèrement diffé"| __truncated__ "Une surveillance en temps réel est l’interception en temps réel et la transmission simultanée, légèrement diffé"| __truncated__ "Surveillance en temps réel \r\nUne surveillance en temps réel est l’interception en temps réel et la transmissi"| __truncated__ ...
#>  $ description.it    : chr  "Per indagare su reati gravi, le autorità di perseguimento penale svizzere e il Servizio delle attività informat"| __truncated__ "Una sorveglianza in tempo reale consiste nella trasmissione simultanea, leggermente ritardata o periodica di da"| __truncated__ "Una sorveglianza in tempo reale consiste nella trasmissione simultanea, leggermente ritardata o periodica di da"| __truncated__ "Sorveglianza in tempo reale \r\nUna sorveglianza in tempo reale consiste nella trasmissione simultanea, leggerm"| __truncated__ ...
#>  $ description.rm    : logi  NA NA NA NA NA NA ...
#>  $ downloadUrl.label : logi  NA NA NA NA NA NA ...
#>  $ downloadUrl.uri   : chr  "https://www.li.admin.ch/sites/default/files/2024-04/auskunfte-2023.xlsx" "https://www.li.admin.ch/sites/default/files/2019-05/Detaillierte_Statistik_des_Dienstes_2011.xlsx" "https://www.li.admin.ch/sites/default/files/2019-05/Detaillierte_Statistik_des_Dienstes_2015.xlsx" "https://www.li.admin.ch/sites/default/files/2021-03/auskuenfte_2020.xlsx" ...
#>  $ format.code       : chr  "XLS" "XLS" "XLS" "XLS" ...
#>  $ format.uri        : logi  NA NA NA NA NA NA ...
#>  $ format.name.de    : chr  "Excel XLS" "Excel XLS" "Excel XLS" "Excel XLS" ...
#>  $ format.name.en    : chr  "Excel XLS" "Excel XLS" "Excel XLS" "Excel XLS" ...
#>  $ format.name.fr    : chr  "Excel XLS" "Excel XLS" "Excel XLS" "Excel XLS" ...
#>  $ format.name.it    : chr  "Excel XLS" "Excel XLS" "Excel XLS" "Excel XLS" ...
#>  $ format.name.rm    : logi  NA NA NA NA NA NA ...
#>  $ license.code      : chr  "terms_open" "terms_open" "terms_open" "terms_open" ...
#>  $ license.uri       : chr  "http://dcat-ap.ch/vocabulary/licenses/terms_open" "http://dcat-ap.ch/vocabulary/licenses/terms_open" "http://dcat-ap.ch/vocabulary/licenses/terms_open" "http://dcat-ap.ch/vocabulary/licenses/terms_open" ...
#>  $ license.name.de   : chr  "Opendata OPEN: Freie Nutzung." "Opendata OPEN: Freie Nutzung." "Opendata OPEN: Freie Nutzung." "Opendata OPEN: Freie Nutzung." ...
#>  $ license.name.en   : chr  "Opendata OPEN: Open use." "Opendata OPEN: Open use." "Opendata OPEN: Open use." "Opendata OPEN: Open use." ...
#>  $ license.name.fr   : chr  "Opendata OPEN: Utilisation libre." "Opendata OPEN: Utilisation libre." "Opendata OPEN: Utilisation libre." "Opendata OPEN: Utilisation libre." ...
#>  $ license.name.it   : chr  "Opendata OPEN: Libero utilizzo." "Opendata OPEN: Libero utilizzo." "Opendata OPEN: Libero utilizzo." "Opendata OPEN: Libero utilizzo." ...
#>  $ license.name.rm   : logi  NA NA NA NA NA NA ...
#>  $ title.de          : chr  "Detaillierte Statistik 2023 - Auskünfte" "Detaillierte Statistik 2011" "Detaillierte Statistik 2015" "Detaillierte Statistik 2020 - Auskünfte" ...
#>  $ title.en          : chr  NA NA NA NA ...
#>  $ title.fr          : chr  "Statistique détaillée 2023 - Renseignements" "Statistique détaillée 2011" "Statistique détaillée 2015" NA ...
#>  $ title.it          : chr  "Statistica dettagliata 2023 - Informazioni" "Statistica dettagliata 2011" "Statistica dettagliata 2015" NA ...
#>  $ title.rm          : logi  NA NA NA NA NA NA ...
```

Note: the previous I14Y API exposed multi-level “Nomenclature” endpoints
(`i14y_get_nomenclature_level()`,
`i14y_get_nomenclature_level_multiple()`, `i14y_search_nomenclature()`).
These have been removed upstream. In the new I14Y data model, each level
of a former nomenclature is published as a separate codelist concept
(for example NOGA is split into `NOGA_SECTION`, `NOGA_DIVISION`,
`NOGA_GROUP`, `NOGA_CLASS`). Use `i14y_search_concept()` to find the
relevant concept and then `i14y_get_codelist()` to download the codes
for that level.

``` r
i14y_search_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
  query = "agriculture",
  language = "fr"
)
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           annotations
#> 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      0a212c98-9ed0-4357-a506-106cf447debe, 6a9889c9-c662-4b21-adff-5c7eb4dbae90, 411ed36c-8e3f-4231-8fb5-55d70e225359, 411ed36c-8e3f-4231-8fb5-55d70e225359, , , ABBREV, INCLUDES, Forstw. u. Holzeinschlag, Diese Abteilung umfasst die Erzeugung von Rundholz sowie die Gewinnung und Sammlung von wachsenden Erzeugnissen des Waldes. Hinzu kommen geringfügig bearbeitete Erzeugnisse wie Brennholz, Holzkohle oder Industrieholz (z. B. Grubenholz, Papierholz usw.). Diese Tätigkeiten können sowohl in natürlichen als auch in angepflanzten Wäldern ausgeführt werden., Forestry and logging, This division includes the production of roundwood as well as the extraction and gathering of wild growing non-wood forest products. Besides the production of timber, forestry activities result in products that undergo little processing, such as firewood, charcoal and roundwood used in an unprocessed form (e.g. pit-props, pulpwood, etc.). These activities can be carried out in natural or planted forests., Sylviculture et exploitation forestière, Cette division comprend la production de bois rond, ainsi que l'extraction et la cueillette de produits forestiers autres que du bois et poussant à l'état sauvage. À côté de la production de grumes, l'exploitation forestière conduit à des produits peu transformés comme le bois de chauffage, le charbon de bois ou le bois rond utilisé sous une forme brute (bois de mine, bois de trituration, etc.). Ces activités peuvent être effectuées dans des forêts naturelles ou dans des plantations., Silvicolt. e utilizzo di aree forestali, Questa divisione include la produzione di tronchi (tondame) per le industrie del settore così come l'estrazione e la raccolta di altri materiali dalle foreste e dai boschi incolti. Oltre alla produzione di tronchi (tondame) le attività forestali danno prodotti che vengono sottoposti ad un minimo di lavorazione, quali la legna da ardere, il carbone e il legname da industria (per esempio, puntelli per miniere, pasta di cellulosa, ecc.). Queste attività possono essere effettuate in foreste naturali o create dall'uomo.\nDalla divisione è escluso ogni ulteriore trattamento del legno a cominciare dal taglio e dalla piallatura (cfr. Divisione 16).
#> 2 d16474e6-3bcf-447a-9464-dd10530b40e1, da8d225a-153d-4bbd-89c3-8b3b0d0a94b8, 056ec921-6947-447b-b836-6f5509f27be2, 056ec921-6947-447b-b836-6f5509f27be2, , , ABBREV, INCLUDES, Landw. u. Jagd, Diese Abteilung umfasst die beiden Tätigkeitsbereiche Gewinnung pflanzlicher Erzeugnisse und Gewinnung tierischer Erzeugnisse. Sie umfasst ferner die ökologische Landwirtschaft sowie den Anbau gentechnisch veränderter Nutzpflanzen und die Haltung gentechnisch veränderter Nutztiere. Diese Abteilung umfasst Freiland- wie auch Gewächshauskulturen.\n\nFerner in dieser Abteilung eingeschlossen sind die Erbringung von mit der Landwirtschaft und der gewerblichen Jagd verbundenen Dienstleistungen sowie die Fallenstellerei und damit verbundene Tätigkeiten.\n\nGruppe 015 (Gemischte Landwirtschaft) bildet eine Ausnahme von den Grundregeln zur Bestimmung der Haupttätigkeit. Man geht hier davon aus, dass in zahlreichen landwirtschaftlichen Betrieben ein Gleichgewicht zwischen pflanzlicher und tierischer Erzeugung besteht und es willkürlich wäre, sie in die eine oder die andere Kategorie einzuordnen., Crop and animal produc., hunting, This division includes two basic activities, namely the production of crop products and production of animal products, covering also the forms of organic agriculture, the growing of genetically modified crops and the raising of genetically modified animals. This division includes growing of crops in open fields as well in greenhouses.\nThis division also includes service activities incidental to agriculture, as well as hunting, trapping and related activities.\nGroup 015 (Mixed farming) breaks with the usual principles for identifying main activity. It accepts that many agricultural holdings have reasonably balanced crop and animal production, and that it would be arbitrary to classify them in one category or the other., Cult. et p. anim., chasse, Cette division comprend deux activités de base, à savoir la production de produits végétaux et la production de produits animaux, ainsi que l'agriculture biologique, la culture de plantes génétiquement modifiées et l'élevage d'animaux génétiquement modifiés. Cette division comprend la culture de plein champ et la culture sous abris.\n\nCette division comprend également les services annexes à l'agriculture, à la chasse, au piégeage et aux activités connexes.\n\nLe groupe 015 (Culture et élevage associés) rompt avec les principes usuels pour identifier l'activité principale. Il tient compte du fait que de nombreuses exploitations agricoles ont une production végétale et animale assez équilibrée et qu'il serait arbitraire de les classer dans l'une ou l'autre catégorie., Prod. vegetali  e animali, caccia, Questa divisione include due attività di base, la produzione di prodotti derivanti da coltivazioni agricole e la produzione di prodotti animali; includendo anche le forme di agricoltura biologica, coltivazione di prodotti geneticamente modificati e l'allevamento di animali geneticamente modificati. Questa divisione include la coltivazione di colture in piena aria ed in serre.\n\nInoltre, sono incluse le attività di servizio accessorie all'agricoltura, alla caccia e alle attività a queste relative.\n\nIl gruppo 015 (Coltivazioni agricole associate all'allevamento di animali: attività mista) costituisce una eccezione ai principi generali adottati per l'identificazione dell'attività principale. Si ammette che un'azienda agricola possa avere una ben bilanciata produzione sia agricola che animale. In questo caso sarebbe arbitrario classificare l'azienda in una categoria o nell'altra.
#>   code                            conceptId
#> 1   02 08d94604-e058-62a2-aa25-53f84b974201
#> 2   01 08d94604-e058-62a2-aa25-53f84b974201
#>                                     id
#> 1 411ed36c-8e3f-4231-8fb5-55d70e225359
#> 2 056ec921-6947-447b-b836-6f5509f27be2
#>                                                 name.de
#> 1                     Forstwirtschaft und Holzeinschlag
#> 2 Landwirtschaft, Jagd und damit verbundene Tätigkeiten
#>                                                              name.en
#> 1                                               Forestry and logging
#> 2 Crop and animal production, hunting and related service activities
#>                                                     name.fr
#> 1                   Sylviculture et exploitation forestière
#> 2 Culture et production animale, chasse et services annexes
#>                                                    name.it
#> 1                Silvicoltura e utilizzo di aree forestali
#> 2 Produzioni vegetali e animali, caccia e servizi connessi
```

Note that other official Swiss datasets from the Swiss Federal
Statistical Office (BFS) can be accessed using the
[BFS](https://felixluginbuhl.com/BFS/) R package.

### Data structure

You can search for data structure of a dataset. Let’s search for example
for the SpiGes project:

``` r
i14y_search_catalog(query = "SpiGes_Administratives")
#> # A tibble: 1 × 38
#>   businessEvents conceptValueType id     identifiers lifeEvents publicationLevel
#>   <list>         <lgl>            <chr>  <list>      <list>     <chr>           
#> 1 <list [0]>     NA               b902a… <chr [1]>   <list [0]> Public          
#> # ℹ 32 more variables: publicationLevelProposal <lgl>,
#> #   registrationStatus <chr>, registrationStatusProposal <lgl>, status <chr>,
#> #   structure <chr>, themes <list>, type <chr>, validFrom <lgl>, validTo <lgl>,
#> #   version <chr>, accessRights.code <chr>, accessRights.uri <chr>,
#> #   accessRights.name.de <chr>, accessRights.name.en <chr>,
#> #   accessRights.name.fr <chr>, accessRights.name.it <chr>,
#> #   accessRights.name.rm <lgl>, description.de <chr>, description.en <chr>, …
```

You can check first the dataset metadata (note that the API now uses
dataset UUIDs rather than string identifiers):

``` r
content_info <- i14y_get_content_information(
  id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
)

names(content_info)
#>  [1] "accessRights"          "confidentialityPerson" "conformsTo"           
#>  [4] "contactPoints"         "description"           "distributions"        
#>  [7] "documentation"         "frequency"             "geoIvIds"             
#> [10] "id"                    "identifiers"           "images"               
#> [13] "isReferencedBy"        "issued"                "keywords"             
#> [16] "landingPages"          "languages"             "modified"             
#> [19] "publicationLevel"      "publisher"             "qualifiedAttributions"
#> [22] "qualifiedRelations"    "registrationStatus"    "relations"            
#> [25] "system"                "spatial"               "temporalCoverage"     
#> [28] "themes"                "title"                 "version"
```

You can get its data structure with `i14y_get_data_structure()`. The new
public API returns the structure as a SHACL/RDF graph in JSON-LD, Turtle
or RDF/XML — pick a format with the `format` argument:

``` r
data_structure <- i14y_get_data_structure(
  id = "b902add5-9538-47ed-b663-f9fbfac92381", # SpiGes_Administratives
  format = "JsonLd"
)

str(data_structure, max.level = 1)
#> 'data.frame':    252 obs. of  22 variables:
#>  $ @id                                      : chr  "https://register.ld.admin.ch/i14y/dataset/SpiGes_Administratives/structure/UnternehmenType/version" "https://register.ld.admin.ch/i14y/dataset/SpiGes_Administratives/structure/UnternehmenType/ent_id" "https://register.ld.admin.ch/i14y/dataset/SpiGes_Administratives/structure/UnternehmenType/Standort" "https://register.ld.admin.ch/i14y/dataset/SpiGes_Administratives/structure/StandortType" ...
#>  $ @type                                    :List of 252
#>  $ http://www.w3.org/ns/shacl#datatype      :List of 252
#>  $ http://www.w3.org/ns/shacl#in            :List of 252
#>  $ http://www.w3.org/ns/shacl#minCount      :List of 252
#>  $ http://www.w3.org/ns/shacl#name          :List of 252
#>  $ http://www.w3.org/ns/shacl#path          :List of 252
#>  $ http://purl.org/dc/terms/conformsTo      :List of 252
#>  $ http://purl.org/dc/terms/description     :List of 252
#>  $ http://www.w3.org/ns/shacl#description   :List of 252
#>  $ http://www.w3.org/ns/shacl#maxInclusive  :List of 252
#>  $ http://www.w3.org/ns/shacl#maxCount      :List of 252
#>  $ http://www.w3.org/ns/shacl#node          :List of 252
#>  $ http://www.w3.org/ns/shacl#order         :List of 252
#>  $ http://www.w3.org/ns/shacl#property      :List of 252
#>  $ http://www.w3.org/ns/shacl#targetClass   :List of 252
#>  $ http://www.w3.org/ns/shacl#maxLength     :List of 252
#>  $ http://www.w3.org/ns/shacl#minLength     :List of 252
#>  $ http://www.w3.org/ns/shacl#minInclusive  :List of 252
#>  $ http://www.w3.org/ns/shacl#fractionDigits:List of 252
#>  $ http://www.w3.org/ns/shacl#totalDigits   :List of 252
#>  $ http://www.w3.org/ns/shacl#pattern       :List of 252
```

Note that if you have a SpiGes XML file, you can extract the data using
the **[SpiGesXML](https://github.com/SwissStatsR/SpiGesXML)** R package.

## Acknowledgements

This R package is inspired by
[fso-metadata](https://gitlab.renkulab.io/dscc/metadata-auto-r-library)
and some [I14Y Python
tutorials](https://github.com/I14Y-ch/tutorials/blob/main/content/Public%20API's%20documentation.ipynb).

## Other information

This package is in no way officially related to or endorsed by the Swiss
Federal Statistical Office (Bundesamt für Statistik).
