# Getting started with I14Y

The **I14Y** R package wraps the public API of the [I14Y
interoperability platform](https://www.i14y.admin.ch) of Switzerland.
The platform publishes metadata about five kinds of resources:

| Resource type | Description | Functions |
|----|----|----|
| **Concept** | Definitions and codelists | [`i14y_search_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_concept.md), [`i14y_get_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept.md), [`i14y_get_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_codelist.md) |
| **Dataset** | Tabular or non-tabular datasets | [`i14y_list_datasets()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_datasets.md), [`i14y_get_dataset()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset.md), [`i14y_get_dataset_structure()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset_structure.md) |
| **DataService** | APIs and data services | [`i14y_list_dataservices()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_dataservices.md), [`i14y_get_dataservice()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataservice.md) |
| **PublicService** | Administrative services for citizens and business | [`i14y_list_publicservices()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_publicservices.md), [`i14y_get_publicservice()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_publicservice.md) |
| **MappingTable** | Mappings between codelists | [`i14y_list_mappingtables()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_mappingtables.md), [`i14y_get_mappingtable()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_mappingtable.md) |

A single
[`i14y_search()`](https://felixluginbuhl.com/I14Y/reference/i14y_search.md)
function searches across all five at once.

``` r

library(I14Y)
```

## A typical workflow

Most workflows follow the same three steps:

1.  **Search** for a resource, either with the faceted
    [`i14y_search()`](https://felixluginbuhl.com/I14Y/reference/i14y_search.md)
    or with one of the convenience wrappers
    ([`i14y_search_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_catalog.md),
    [`i14y_search_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_concept.md)).
2.  **Inspect** the metadata of a single item with `i14y_get_*()`.
3.  **Download** the actual payload (codelist entries, dataset
    structure, DCAT export, …) with the matching `i14y_get_*()` /
    `i14y_export_*()` function.

### 1. Search

Search the whole catalog in English for the keyword “noga”:

``` r

i14y_search(query = "noga", language = "en")
#> # A tibble: 15 × 69
#>    businessEvents formats      id         identifier lifeEvents publicationLevel
#>    <list>         <list>       <chr>      <chr>      <list>     <chr>           
#>  1 <list [0]>     <df [1 × 6]> 4f71b53b-… HCL_NOGA   <list [0]> Public          
#>  2 <list [0]>     <df [0 × 0]> 08dc481b-… nogaCode   <list [0]> Public          
#>  3 <list [0]>     <df [0 × 0]> 001bfaa8-… nogaCode   <list [0]> Public          
#>  4 <list [0]>     <df [0 × 0]> 08d94603-… NOGA_SECT… <list [0]> Public          
#>  5 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_CLASS <list [0]> Public          
#>  6 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_DIVI… <list [0]> Public          
#>  7 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_GROUP <list [0]> Public          
#>  8 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_TYPE  <list [0]> Public          
#>  9 <list [0]>     <df [0 × 0]> 08d9f1f9-… NOGA_SECT… <list [0]> Public          
#> 10 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_OFS50 <list [0]> Public          
#> 11 <list [0]>     <df [0 × 0]> 08dd28d2-… nogaCode   <list [0]> Public          
#> 12 <list [0]>     <df [0 × 0]> 08d9f6dd-… NOGA_ESTA… <list [0]> Public          
#> 13 <list [0]>     <df [0 × 0]> 019edf0a-… 36506617@… <list [0]> Public          
#> 14 <list [0]>     <df [0 × 0]> 019edf0a-… 36506623@… <list [0]> Public          
#> 15 <list [0]>     <df [0 × 0]> 019edf0a-… 36506622@… <list [0]> Public          
#> # ℹ 63 more variables: registrationStatus <chr>, structure <chr>,
#> #   themes <list>, type <chr>, conceptType <chr>, validFrom <chr>,
#> #   version <chr>, validTo <chr>, accessRights.code <chr>,
#> #   accessRights.uri <chr>, accessRights.name.de <chr>,
#> #   accessRights.name.en <chr>, accessRights.name.fr <chr>,
#> #   accessRights.name.it <chr>, description.de <chr>, description.en <chr>,
#> #   description.fr <chr>, description.it <chr>, publisher.homePage <chr>, …
```

The `types` column shows which resource type each row is. You can
restrict to one type:

``` r

i14y_search(
  query = "noga",
  language = "en",
  types = "Concept"
)
#> # A tibble: 11 × 61
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
#> 11 <list [0]>     CodeList    <list [0]> 08d9f6dd-f8a3-cb… NOGA_ESTA… <list [0]>
#> # ℹ 55 more variables: publicationLevel <chr>, registrationStatus <chr>,
#> #   themes <list>, type <chr>, validFrom <chr>, version <chr>, validTo <chr>,
#> #   description.de <chr>, description.en <chr>, description.fr <chr>,
#> #   description.it <chr>, publisher.homePage <chr>, publisher.id <chr>,
#> #   publisher.identifier <chr>, publisher.images <list>,
#> #   publisher.spatial <list>, publisher.spatialCH <list>,
#> #   publisher.subAgents <list>, publisher.uid <chr>, …
```

The faceted parameters mirror the OpenAPI spec — see
[`?i14y_search`](https://felixluginbuhl.com/I14Y/reference/i14y_search.md)
for the full list (publication levels, registration statuses, life
events, business events, themes, publishers, …).

### 2. Inspect

Pick an `id` from the search result and fetch the full metadata:

``` r

concept <- i14y_get_concept(id = "08d94604-e058-62a2-aa25-53f84b974201")
concept$name
#> $de
#> [1] "NOGA Abteilung"
#> 
#> $en
#> [1] "NOGA Division"
#> 
#> $fr
#> [1] "NOGA Division"
#> 
#> $it
#> [1] "NOGA Divisione"
concept$description$en
#> [1] "Second level of the General Classification of Economic Activities (NOGA) composed of headings identified by a two-digit numerical code. This second level is determined by the International Standard Industrial Classification of All Economic Activities (ISIC Rev.4)."
```

Multilingual fields always carry the four official Swiss languages plus
Romansh (`de`, `fr`, `it`, `en`, `rm` when available).

### 3. Download

For a code-list concept, download the entries as a tibble:

``` r

i14y_get_codelist(id = "08d94604-e058-62a2-aa25-53f84b974201")
#> # A tibble: 88 × 12
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
#> # ℹ 4 more variables: Description_fr <lgl>, Description_it <lgl>,
#> #   Description_rm <lgl>, Description_en <lgl>
```

For a dataset, the SHACL/RDF structure is available in three formats
(`JsonLd`, `Ttl`, `Rdf`):

``` r

str(
  i14y_get_dataset_structure(
    id = "b902add5-9538-47ed-b663-f9fbfac92381",
    format = "JsonLd"
  ),
  max.level = 1
)
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

## Going further

Two further vignettes drill down into common workflows:

- [`vignette("codelists-with-bfs")`](https://felixluginbuhl.com/I14Y/articles/codelists-with-bfs.md)
  — translate official BFS dataset codes to multilingual labels.
- [`vignette("discovering-the-catalog")`](https://felixluginbuhl.com/I14Y/articles/discovering-the-catalog.md)
  — list and filter resources by type, publisher, theme, …; export
  catalog metadata as DCAT.
