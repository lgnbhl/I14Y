# Export a codelist

Calls the I14Y public API endpoint
`/concepts/{conceptId}/codelist-entries/exports/{dataFormat}`.

## Usage

``` r
i14y_get_codelist(id = NULL, format = "csv", withAnnotations = FALSE)
```

## Arguments

- id:

  string. The Id of the response data.

- format:

  string. The format of the export ("csv" or "json").

- withAnnotations:

  logical. If \`TRUE\`, annotations are included in the export. Default
  \`FALSE\`.

## Value

A tibble for \`format = "csv"\`. For \`format = "json"\`, a list when
\`withAnnotations = TRUE\` (preserves the nested structure) or a tibble
otherwise. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_get_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201" # for DV_NOGA_DIVISION
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
# }
```
