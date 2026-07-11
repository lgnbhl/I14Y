# Get a mapping table by ID

Calls the I14Y public API endpoint `/mappingtables/{mappingTableId}`.

## Usage

``` r
i14y_get_mappingtable(id = NULL)
```

## Arguments

- id:

  string. The UUID of the mapping table.

## Value

A list with the mapping table metadata. \`NULL\` when offline.
