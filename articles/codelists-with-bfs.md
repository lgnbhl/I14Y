# Enrich BFS data with I14Y codelists

Official Swiss datasets distributed by the [Bundesamt für Statistik
(BFS)](https://www.bfs.admin.ch) often label rows in German only, using
codes from a published nomenclature (NOGA, NOMEM, NUTS, …). The
companion [BFS R package](https://felixluginbuhl.com/BFS/) gives you the
data; **I14Y** gives you the official multilingual labels for those
codes.

This vignette shows the typical pattern: **find the right codelist,
download it, join it onto a BFS dataset**.

``` r

library(I14Y)
library(BFS)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(stringr)
library(readr)
```

## 1. Find the right codelist

In the new I14Y data model, each level of a former multi-level
nomenclature is published as a **separate codelist concept**. For NOGA,
that means four concepts: `NOGA_SECTION`, `NOGA_DIVISION`, `NOGA_GROUP`,
`NOGA_CLASS`.

Search for them:

``` r

i14y_search_concept(query = "NOGA", language = "en", pageSize = 10)
#> # A tibble: 10 × 61
#>    businessEvents conceptType formats    id                identifier lifeEvents
#>    <list>         <chr>       <list>     <chr>             <chr>      <list>    
#>  1 <list [0]>     CodeList    <list [0]> 08dc481b-2add-12… nogaCode   <list [0]>
#>  2 <list [0]>     CodeList    <list [0]> 001bfaa8-fa57-4d… nogaCode   <list [0]>
#>  3 <list [0]>     CodeList    <list [0]> 08d94603-f490-f0… NOGA_SECT… <list [0]>
#>  4 <list [0]>     CodeList    <list [0]> 08d94604-db03-19… NOGA_CLASS <list [0]>
#>  5 <list [0]>     CodeList    <list [0]> 08d94604-e058-62… NOGA_DIVI… <list [0]>
#>  6 <list [0]>     CodeList    <list [0]> 08d94604-e5ac-f8… NOGA_GROUP <list [0]>
#>  7 <list [0]>     CodeList    <list [0]> 08d94604-f12a-5d… NOGA_TYPE  <list [0]>
#>  8 <list [0]>     CodeList    <list [0]> 08d9f1f9-3f89-00… NOGA_SECT… <list [0]>
#>  9 <list [0]>     CodeList    <list [0]> 08d94604-ecc0-66… NOGA_OFS50 <list [0]>
#> 10 <list [0]>     CodeList    <list [0]> 08dd28d2-a693-50… nogaCode   <list [0]>
#> # ℹ 55 more variables: publicationLevel <chr>, registrationStatus <chr>,
#> #   themes <list>, type <chr>, validFrom <chr>, version <chr>, validTo <chr>,
#> #   description.de <chr>, description.en <chr>, description.fr <chr>,
#> #   description.it <chr>, publisher.homePage <chr>, publisher.id <chr>,
#> #   publisher.identifier <chr>, publisher.images <list>,
#> #   publisher.spatial <list>, publisher.spatialCH <list>,
#> #   publisher.subAgents <list>, publisher.uid <chr>, …
```

Pick the one matching the granularity of your data. For
“Wirtschaftsabteilung” (economic division) we want `DV_NOGA_DIVISION`.

## 2. Download the codelist

``` r

noga_division <- i14y_get_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201" # DV_NOGA_DIVISION
) |>
  mutate(Code = as.numeric(Code))

noga_division
#> # A tibble: 88 × 12
#>     Code ParentCode Name_de       Name_fr Name_it Name_rm Name_en Description_de
#>    <dbl> <lgl>      <chr>         <chr>   <chr>   <lgl>   <chr>   <lgl>         
#>  1     1 NA         Landwirtscha… Cultur… Produz… NA      Crop a… NA            
#>  2     2 NA         Forstwirtsch… Sylvic… Silvic… NA      Forest… NA            
#>  3     3 NA         Fischerei un… Pêche … Pesca … NA      Fishin… NA            
#>  4     5 NA         Kohlenbergbau Extrac… Estraz… NA      Mining… NA            
#>  5     6 NA         Gewinnung vo… Extrac… Estraz… NA      Extrac… NA            
#>  6     7 NA         Erzbergbau    Extrac… Estraz… NA      Mining… NA            
#>  7     8 NA         Gewinnung vo… Autres… Altre … NA      Other … NA            
#>  8     9 NA         Erbringung v… Servic… Attivi… NA      Mining… NA            
#>  9    10 NA         Herstellung … Indust… Indust… NA      Manufa… NA            
#> 10    11 NA         Getränkehers… Fabric… Produz… NA      Manufa… NA            
#> # ℹ 78 more rows
#> # ℹ 4 more variables: Description_fr <lgl>, Description_it <lgl>,
#> #   Description_rm <lgl>, Description_en <lgl>
```

The tibble carries one column per official language (`Name_de`,
`Name_fr`, `Name_it`, `Name_en`) ready for joining.

## 3. Join to a BFS dataset

Get the monthly income by gender and economic division for 2022:

``` r

income_meta <- BFS::bfs_get_metadata(number_bfs = "px-x-0304010000_201")

income <- BFS::bfs_get_data(
  number_bfs = "px-x-0304010000_201",
  language = "de",
  query = list(
    Jahr = "2022",
    Geschlecht = c("1", "2"),
    Wirtschaftsabteilung = income_meta$values[[3]],
    "Zentralwert und andere Perzentile" = "1"
  )
)
```

Extract the NOGA code from the German label and left-join the
multilingual codelist:

``` r

income |>
  filter(!str_detect(Wirtschaftsabteilung, "Sektor")) |>
  mutate(Code = readr::parse_number(Wirtschaftsabteilung)) |>
  left_join(noga_division, by = "Code") |>
  select(Wirtschaftsabteilung, Name_en, Name_fr, Name_it) |>
  arrange(Name_en) |>
  head(10)
#> Warning: There was 1 warning in `mutate()`.
#> ℹ In argument: `Code = readr::parse_number(Wirtschaftsabteilung)`.
#> Caused by warning:
#> ! 80 parsing failures.
#> row col expected                       actual
#>   1  -- a number Wirtschaftsabteilung - Total
#>   2  -- a number Wirtschaftsabteilung - Total
#>   3  -- a number Wirtschaftsabteilung - Total
#>   4  -- a number Wirtschaftsabteilung - Total
#>   5  -- a number Wirtschaftsabteilung - Total
#> ... ... ........ ............................
#> See problems(...) for more details.
#> # A tibble: 10 × 4
#>    Wirtschaftsabteilung Name_en       Name_fr     Name_it            
#>    <chr>                <chr>         <chr>       <chr>              
#>  1 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  2 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  3 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  4 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  5 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  6 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  7 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  8 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#>  9 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
#> 10 > 55 Beherbergung    Accommodation Hébergement Servizi di alloggio
```

## 4. Narrow-search inside a codelist

If you only need a few entries, search **within** a codelist concept
instead of downloading it whole. The faceted endpoint accepts a
free-text query in any of the five languages:

``` r

i14y_search_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
  query = "agriculture",
  language = "fr"
)
#> # A tibble: 2 × 8
#>   annotations  code  conceptId             id    name.de name.en name.fr name.it
#>   <list>       <chr> <chr>                 <chr> <chr>   <chr>   <chr>   <chr>  
#> 1 <df [2 × 8]> 02    08d94604-e058-62a2-a… 411e… Forstw… Forest… Sylvic… Silvic…
#> 2 <df [2 × 8]> 01    08d94604-e058-62a2-a… 056e… Landwi… Crop a… Cultur… Produz…
```

And if you’d rather get the search result as a downloadable CSV:

``` r

i14y_export_codelist_search(
  id = "08d94604-e058-62a2-aa25-53f84b974201",
  query = "agriculture",
  language = "fr",
  format = "csv"
)
#> # A tibble: 2 × 30
#>   Code  ParentCode Name_de        Name_fr Name_it Name_rm Name_en Description_de
#>   <chr> <lgl>      <chr>          <chr>   <chr>   <lgl>   <chr>   <lgl>         
#> 1 02    NA         Forstwirtscha… Sylvic… Silvic… NA      Forest… NA            
#> 2 01    NA         Landwirtschaf… Cultur… Produz… NA      Crop a… NA            
#> # ℹ 22 more variables: Description_fr <lgl>, Description_it <lgl>,
#> #   Description_rm <lgl>, Description_en <lgl>, Annotation_ABBREV_Type <chr>,
#> #   Annotation_ABBREV_Title <lgl>, Annotation_ABBREV_URI <lgl>,
#> #   Annotation_ABBREV_Identifier <lgl>, Annotation_ABBREV_Text_de <chr>,
#> #   Annotation_ABBREV_Text_fr <chr>, Annotation_ABBREV_Text_it <chr>,
#> #   Annotation_ABBREV_Text_rm <lgl>, Annotation_ABBREV_Text_en <chr>,
#> #   Annotation_INCLUDES_Type <chr>, Annotation_INCLUDES_Title <lgl>, …
```

## Concept metadata

The full concept descriptor — including version, publisher, registration
status, value type, and conformance statements — is available via
[`i14y_get_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept.md):

``` r

concept <- i14y_get_concept(
  id = "08d94604-e058-62a2-aa25-53f84b974201",
  includeCodeListEntries = FALSE
)

concept$publisher
#> $classification
#> $classification$code
#> [1] "0220"
#> 
#> $classification$name
#> $classification$name$de
#> [1] "Verwaltungseinheit des Bundes"
#> 
#> $classification$name$en
#> [1] "Administrative unit of the Confederation"
#> 
#> $classification$name$fr
#> [1] "Unité de l’administration fédérale"
#> 
#> $classification$name$it
#> [1] "Unità amministrativa della Confederazione"
#> 
#> 
#> 
#> $description
#> $description$de
#> [1] "Das BFS ist das nationale Kompetenzzentrum der öffentlichen Statistik der Schweiz. Es produziert und publiziert statistische Informationen über den Stand und die Entwicklung von Bevölkerung, Wirtschaft, Gesellschaft, Bildung, Forschung, Raum und Umwelt. Diese Informationen dienen der Meinungsbildung in der Bevölkerung sowie der Planung und Steuerung von zentralen Politikbereichen. Sie leisten einen wichtigen Beitrag für einen modernen, demokratischen Staat."
#> 
#> $description$en
#> [1] "The FSO is Switzerland's national competence centre for official statistics. It produces and publishes statistical information on the status and development of the population, economy, society, education, research, territory and the environment. This information is used for opinion building among the population and for the planning and management of key policy areas. They make an important contribution to a modern, democratic state."
#> 
#> $description$fr
#> [1] "L'OFS est le centre de compétence de la statistique publique suisse. Il produit des informations statistiques sur la population, l'économie, la société, la formation et la recherche, le territoire et l'environnement. Ces informations servent à la formation de l’opinion publique. Elles sont un outil de planification et de gouvernance dans tous les domaines de l’action politique et contribuent au bon fonctionnement de notre État moderne et démocratique."
#> 
#> $description$it
#> [1] "L’UST è il centro di competenza nazionale per la statistica pubblica della Svizzera. Produce e pubblica informazioni statistiche sullo stato e sull'evoluzione della popolazione, dell'economia, della società, della formazione, della ricerca, del territorio e dell'ambiente. Queste informazioni servono alla formazione dell'opinione pubblica nonché alla pianificazione e alla gestione in ambiti politici di centrale importanza. Forniscono un importante contributo per uno Stato moderno e democratico."
#> 
#> $description$rm
#> [1] ""
#> 
#> 
#> $homePage
#> [1] "https://bfs.admin.ch"
#> 
#> $id
#> [1] "a88d610b-62f9-4e45-b288-3b23ff4f1758"
#> 
#> $identifier
#> [1] "CH1"
#> 
#> $images
#> list()
#> 
#> $name
#> $name$de
#> [1] "Bundesamt für Statistik (BFS)"
#> 
#> $name$en
#> [1] "Federal Statistical Office (FSO)"
#> 
#> $name$fr
#> [1] "Office Fédéral de la Statistique (OFS)"
#> 
#> $name$it
#> [1] "Ufficio federale di statistica (UFS)"
#> 
#> $name$rm
#> [1] ""
#> 
#> 
#> $prefLabel
#> $prefLabel$de
#> [1] "BFS"
#> 
#> $prefLabel$en
#> [1] "FSO"
#> 
#> $prefLabel$fr
#> [1] "OFS"
#> 
#> $prefLabel$it
#> [1] "UFS"
#> 
#> $prefLabel$rm
#> [1] ""
#> 
#> 
#> $system
#> $system$createdAt
#> [1] "0001-01-01T00:00:00+00:00"
#> 
#> $system$modifiedAt
#> [1] "2026-07-10T07:18:44.32979+00:00"
#> 
#> 
#> $spatial
#> [1] "CH"
#> 
#> $spatialCH
#>   code name.de     name.en name.fr  name.it name.rm
#> 1 8100 Schweiz Switzerland  Suisse Svizzera  Svizra
#> 
#> $subAgents
#> list()
#> 
#> $uid
#> [1] "CHE131608474"
concept$registrationStatus
#> [1] "PreferredStandard"
concept$description$en
#> [1] "Second level of the General Classification of Economic Activities (NOGA) composed of headings identified by a two-digit numerical code. This second level is determined by the International Standard Industrial Classification of All Economic Activities (ISIC Rev.4)."
```

Pass `includeCodeListEntries = TRUE` if you want the entries embedded in
the same response (rarely needed when you already have
[`i14y_get_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_codelist.md)).

If you need the full canonical JSON export of a concept (useful when
archiving or feeding the concept into another system), use
[`i14y_get_concept_export()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept_export.md):

``` r

concept_export <- i14y_get_concept_export(
  id = "08d94604-e058-62a2-aa25-53f84b974201"
)
str(concept_export, max.level = 1)
#> List of 1
#>  $ data:List of 20
```
