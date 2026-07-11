# Export the relations of a mapping table

Calls the I14Y public API endpoint
`/mappingtables/{mappingTableId}/relations/exports/{dataFormat}`.

## Usage

``` r
i14y_get_mappingtable_relations(id = NULL, format = "Json")
```

## Arguments

- id:

  string. The UUID of the mapping table.

- format:

  string. One of "Json" (default), "Csv".

## Value

For \`format = "Json"\`, a tibble of relations (one row per
source/target/relationType triple). For \`format = "Csv"\`, the raw CSV
response body as a character string. \`NULL\` when offline.
