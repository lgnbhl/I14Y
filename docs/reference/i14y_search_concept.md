# Search for a Concept Summary

Search for a Concept Summary

## Usage

``` r
i14y_search_concept(
  query = NULL,
  language = "de",
  page = 1,
  pageSize = 1000,
  publishers = NULL,
  themes = NULL,
  conceptValueTypes = NULL,
  registrationStatuses = NULL
)
```

## Arguments

- query:

  string. Search query.

- language:

  string. The language of the response data.

- page:

  integer. The number of the result page to return.

- pageSize:

  integer. The size of each result page.

- publishers:

  vector of strings. Filter with Publishers identifiers.

- themes:

  vector of strings. Filter with theme codes.

- conceptValueTypes:

  character vector. One or more concept value types to filter by.

- registrationStatuses:

  character vector. One or more registration statuses to filter by.

## Value

a tibble

## Note

This function calls the internal I14Y `input-backend` host
(`input-backend.i14y.c.bfs.admin.ch/api/Catalog/search`) because the
public API at `api.i14y.admin.ch` does not yet expose an equivalent
faceted concept search endpoint. That host is undocumented and may
change without notice, so this function may break between releases. It
will be migrated once a public equivalent is available.

## Examples

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
