# List data services

Calls the I14Y public API endpoint `/dataservices`.

## Usage

``` r
i14y_list_dataservices(
  accessRights = NULL,
  dataServiceIdentifier = NULL,
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

- dataServiceIdentifier:

  string. Filter by data service identifier.

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

A tibble of data service summaries. \`NULL\` when offline.
