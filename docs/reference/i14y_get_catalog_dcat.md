# Export the DCAT representation of a catalog

Calls the I14Y public API endpoint
`/catalogs/{catalogId}/dcat/exports/{dataFormat}`.

## Usage

``` r
i14y_get_catalog_dcat(id = NULL, format = "RDF")
```

## Arguments

- id:

  string. The catalog identifier.

- format:

  string. One of "RDF" (default), "TTL".

## Value

A character string with the raw RDF/TTL document. \`NULL\` when offline.
