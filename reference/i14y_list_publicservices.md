# List public services

Calls the I14Y public API endpoint `/publicservices`.

## Usage

``` r
i14y_list_publicservices(
  publicServiceIdentifier = NULL,
  publisherIdentifier = NULL,
  publicationLevel = NULL,
  registrationStatus = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- publicServiceIdentifier:

  string. Filter by public service identifier.

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

A tibble of public service summaries. \`NULL\` when offline.
