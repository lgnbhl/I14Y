# Get a single record of a catalog

Calls the I14Y public API endpoint
`/catalogs/{catalogId}/records/{recordId}`.

## Usage

``` r
i14y_get_catalog_record(id = NULL, recordId = NULL)
```

## Arguments

- id:

  string. The catalog identifier.

- recordId:

  string. The record identifier.

## Value

A list with the record metadata. \`NULL\` when offline.
