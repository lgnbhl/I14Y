# Export multiple levels of a nomenclature

Export multiple levels of a nomenclature

## Usage

``` r
i14y_get_nomenclature_level_multiple(
  identifier = NULL,
  language = "de",
  levelFrom = NULL,
  levelTo = NULL,
  format = "csv",
  annotations = NULL,
  filters = NULL
)
```

## Arguments

- identifier:

  string. The identifier of dcat dataset.

- language:

  string. The language of the response data. Default "de".

- levelFrom:

  integer. The first level to include.

- levelTo:

  integer. The last level to include.

- format:

  string. The format of the export ("csv" or "xlsx"). Default "csv".

- annotations:

  boolean. Include annotations

- filters:

  object. The filters

## Value

a tibble

## Examples

``` r
i14y_get_nomenclature_level_multiple(
  identifier = "HCL_CH_ISCO_19_PROF",
  format = "csv", # read internally
  levelFrom = 1,
  levelTo = 2,
  language = "fr"
 )
#> Error in httr2::req_perform(req): HTTP 404 Not Found.
```
