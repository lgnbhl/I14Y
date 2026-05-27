# List mapping tables

Calls the I14Y public API endpoint `/mappingtables`.

## Usage

``` r
i14y_list_mappingtables(
  mappingTableIdentifier = NULL,
  publisherIdentifier = NULL,
  version = NULL,
  codeSystemUri = NULL,
  publicationLevel = NULL,
  registrationStatus = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- mappingTableIdentifier:

  string. Filter by mapping table identifier.

- publisherIdentifier:

  string. Filter by publisher identifier.

- version:

  string. Filter by version.

- codeSystemUri:

  string. Filter by code system URI.

- publicationLevel:

  string. One of "Internal", "Public".

- registrationStatus:

  string. A registration status value.

- page:

  integer. The result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of mapping table summaries. \`NULL\` when offline.
