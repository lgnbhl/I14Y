# I14Y

Search and download official Swiss metadata from the [I14Y
interoperability platform](https://www.i14y.admin.ch) of Switzerland
using its public [IOP API](https://www.i14y.admin.ch/api/index.html) and
[Console API](https://apiconsole.i14y.admin.ch/public/v1/index.html) in
any of the four official languages plus English (“de”, “fr”, “it”, “en”,
“rm”).

The platform publishes metadata about five kinds of resources —
**Concepts** (definitions and codelists), **Datasets**,
**DataServices**, **PublicServices** and **MappingTables** — all
organised in **Catalogs**. The package mirrors that structure with one
family of functions per resource type.

## Install

``` r

remotes::install_github("lgnbhl/I14Y")
```

## Quick start

``` r

library(I14Y)
```

Search the whole catalog in English:

``` r

i14y_search(query = "noga", language = "en")
#> # A tibble: 15 × 1
#>    data$businessEvents $formats $id    $identifier $lifeEvents $publicationLevel
#>    <list>              <list>   <chr>  <chr>       <list>      <chr>            
#>  1 <list [0]>          <df>     4f71b… HCL_NOGA    <list [0]>  Public           
#>  2 <list [0]>          <df>     08dc4… nogaCode    <list [0]>  Public           
#>  3 <list [0]>          <df>     001bf… nogaCode    <list [0]>  Public           
#>  4 <list [0]>          <df>     08d94… NOGA_SECTI… <list [0]>  Public           
#>  5 <list [0]>          <df>     08d94… NOGA_CLASS  <list [0]>  Public           
#>  6 <list [0]>          <df>     08d94… NOGA_DIVIS… <list [0]>  Public           
#>  7 <list [0]>          <df>     08d94… NOGA_GROUP  <list [0]>  Public           
#>  8 <list [0]>          <df>     08d94… NOGA_TYPE   <list [0]>  Public           
#>  9 <list [0]>          <df>     08d9f… NOGA_SECTOR <list [0]>  Public           
#> 10 <list [0]>          <df>     08d94… NOGA_OFS50  <list [0]>  Public           
#> 11 <list [0]>          <df>     08dd2… nogaCode    <list [0]>  Public           
#> 12 <list [0]>          <df>     08d9f… NOGA_ESTAT… <list [0]>  Public           
#> 13 <list [0]>          <df>     17d00… 36506623@b… <list [0]>  Public           
#> 14 <list [0]>          <df>     a145d… 36506617@b… <list [0]>  Public           
#> 15 <list [0]>          <df>     e12c3… 36506622@b… <list [0]>  Public           
#> # ℹ 59 more variables: data$registrationStatus <chr>, $structure <chr>,
#> #   $themes <list>, $type <chr>, $conceptType <chr>, $validFrom <chr>,
#> #   $version <chr>, $structureReferencesCount <int>, $validTo <chr>,
#> #   $accessRights.code <chr>, $accessRights.uri <chr>,
#> #   $accessRights.name.de <chr>, $accessRights.name.en <chr>,
#> #   $accessRights.name.fr <chr>, $accessRights.name.it <chr>,
#> #   $description.de <chr>, $description.en <chr>, $description.fr <chr>, …
```

Download a codelist as a tidy multilingual tibble:

``` r

i14y_get_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201" # DV_NOGA_DIVISION
)
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

Fetch a dataset’s metadata and its SHACL/RDF structure:

``` r

dataset <- i14y_get_dataset(id = "b902add5-9538-47ed-b663-f9fbfac92381")
dataset$title$en
#> NULL

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

## Vignettes

Three vignettes give an end-to-end view of what the package can do:

- **[Getting started with
  I14Y](https://lgnbhl.github.io/I14Y/articles/getting-started.html)** —
  the three-step *search → inspect → download* workflow, with one
  example per resource type.
- **[Discovering the I14Y
  catalog](https://lgnbhl.github.io/I14Y/articles/discovering-the-catalog.html)**
  — faceted search vs. list endpoints, getting dataservices /
  publicservices / mapping tables, browsing catalogs and exporting them
  in DCAT.
- **[Enrich BFS data with I14Y
  codelists](https://lgnbhl.github.io/I14Y/articles/codelists-with-bfs.html)**
  — the canonical use case: find a codelist, download it, and join it
  onto a [BFS](https://felixluginbuhl.com/BFS/) dataset to get
  multilingual labels.

## Function reference

| Resource | Search / list | Get one | Export |
|----|----|----|----|
| *Cross-resource* | [`i14y_search()`](https://felixluginbuhl.com/I14Y/reference/i14y_search.md) | — | — |
| Concept | [`i14y_search_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_concept.md), [`i14y_list_concepts()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_concepts.md) | [`i14y_get_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept.md), [`i14y_get_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_codelist.md) | [`i14y_get_concept_export()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept_export.md), [`i14y_export_codelist_search()`](https://felixluginbuhl.com/I14Y/reference/i14y_export_codelist_search.md), [`i14y_search_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_codelist.md) |
| Dataset | [`i14y_search_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_catalog.md), [`i14y_list_datasets()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_datasets.md) | [`i14y_get_dataset()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset.md) | [`i14y_get_dataset_structure()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset_structure.md) |
| DataService | [`i14y_search_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_catalog.md), [`i14y_list_dataservices()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_dataservices.md) | [`i14y_get_dataservice()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataservice.md) | — |
| PublicService | [`i14y_search_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_catalog.md), [`i14y_list_publicservices()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_publicservices.md) | [`i14y_get_publicservice()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_publicservice.md) | — |
| MappingTable | [`i14y_list_mappingtables()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_mappingtables.md) | [`i14y_get_mappingtable()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_mappingtable.md) | [`i14y_get_mappingtable_relations()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_mappingtable_relations.md) |
| Catalog | [`i14y_list_catalogs()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_catalogs.md) | [`i14y_get_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog.md), [`i14y_get_catalog_records()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog_records.md), [`i14y_get_catalog_record()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog_record.md) | [`i14y_get_catalog_dcat()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog_dcat.md) |

## A note on argument names

Function arguments use **camelCase** (`pageSize`, `publicationLevel`,
`registrationStatuses`, `withAnnotations`, …) rather than the more
idiomatic R **snake_case**. This is deliberate: argument names match the
underlying OpenAPI parameters one-for-one, so anything you read in the
[I14Y API documentation](https://www.i14y.admin.ch/api/index.html) can
be passed straight through to the corresponding R function.

## Configuring the base URL

By default the package targets
<https://api.i14y.admin.ch/api/public/v1>. Override this with the
`I14Y_BASE_URL` environment variable to point at a different deployment
(test environment, local mock):

``` r

Sys.setenv(I14Y_BASE_URL = "https://api-test.i14y.admin.ch/api/public/v1")
```

## Acknowledgements

This R package is inspired by
[fso-metadata](https://gitlab.renkulab.io/dscc/metadata-auto-r-library)
and some [I14Y Python
tutorials](https://github.com/I14Y-ch/tutorials/blob/main/content/Public%20API's%20documentation.ipynb).

## Other information

This package is in no way officially related to or endorsed by the Swiss
Federal Statistical Office (Bundesamt für Statistik).
