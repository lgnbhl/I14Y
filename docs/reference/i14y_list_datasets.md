# List datasets

Calls the I14Y public API endpoint `/datasets`.

## Usage

``` r
i14y_list_datasets(
  accessRights = NULL,
  datasetIdentifier = NULL,
  publisherIdentifier = NULL,
  publicationLevel = NULL,
  registrationStatus = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- accessRights:

  string. Filter by access rights.

- datasetIdentifier:

  string. Filter by dataset identifier.

- publisherIdentifier:

  string. Filter by publisher identifier.

- publicationLevel:

  string. One of "Internal", "Public".

- registrationStatus:

  string. A registration status value.

- page:

  integer. The result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of dataset summaries. \`NULL\` when offline.
