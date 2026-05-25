# Export a level of a nomenclature

Export a level of a nomenclature

## Usage

``` r
i14y_get_nomenclature_level(
  identifier = NULL,
  language = "de",
  level = 1,
  format = "csv",
  annotations = FALSE,
  filters = NULL
)
```

## Arguments

- identifier:

  string. The identifier of dcat dataset.

- language:

  string. The language of the response data.

- level:

  integer. The level to export. Default 1.

- format:

  string. The format of the export (CSV or XLSX).

- annotations:

  boolean. Include annotations. Default FALSE.

- filters:

  object. The filters

## Value

a tibble
