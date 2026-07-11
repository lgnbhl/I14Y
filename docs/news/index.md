# Changelog

## I14Y 0.2.0

- BREAKING CHANGE: align package with the restructured I14Y API. The
  upstream `Nomenclatures`, `DataStructures` and `ContentConfigurations`
  endpoints have been removed; in the new data model multi-level
  “nomenclatures” are split into separate codelist concepts (e.g. NOGA
  is now `NOGA_SECTION`, `NOGA_DIVISION`, `NOGA_GROUP`, `NOGA_CLASS`)
  and structures are exposed by dataset UUID.
- BREAKING CHANGE: remove `i14y_get_nomenclature_level()` and
  `i14y_get_nomenclature_level_multiple()`. Use
  [`i14y_search_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_concept.md)
  to find the relevant per-level codelist concept, then
  [`i14y_get_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_codelist.md)
  to download its entries.
- BREAKING CHANGE: remove `i14y_search_nomenclature()`. Replaced by
  `i14y_search_codelist(id, query, language)` which calls
  `/concepts/{conceptId}/codelist-entries/search` on the public API.
  Takes a concept UUID instead of a string nomenclature identifier.
- BREAKING CHANGE: rename `i14y_get_data_structure()` to
  [`i14y_get_dataset_structure()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset_structure.md)
  to match the public API endpoint
  `/datasets/{datasetId}/structures/exports/{format}`. Argument
  `identifier` (string) is replaced by `id` (UUID), and `language` is
  replaced by `format` (one of “JsonLd”, “Ttl”, “Rdf”). The endpoint
  returns a SHACL/RDF graph rather than a tabular variables list.
- BREAKING CHANGE: rename `i14y_get_content_information()` to
  [`i14y_get_dataset()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset.md)
  to match the public API endpoint `/datasets/{datasetId}`. Argument
  `identifier` (string) is replaced by `id` (UUID).
- BREAKING CHANGE: remove `i14y_get_dataset_metadata()`. It targeted the
  internal `input-backend` host and is superseded by
  [`i14y_get_dataset()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataset.md),
  which calls the equivalent public API endpoint.
- BREAKING CHANGE: remove `i14y_get_concept_all_versions()`. It targeted
  the internal `input-backend` host and the public API exposes no
  equivalent. If/when `/concepts/{id}/versions` becomes available
  publicly, it may be reintroduced.
- BREAKING CHANGE:
  [`i14y_get_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept.md)
  now calls `/concepts/{conceptId}` on the public API. The `language`
  argument is removed (the public endpoint always returns all four
  languages, de/en/fr/it). The response is unwrapped from the
  `{data: ...}` envelope; a few internal-only fields
  (`responsiblePerson`, `validTo`, `codeListId`, …) are no longer
  returned, and the casing of `codelistEntryValueMaxLength` becomes
  `codeListEntryValueMaxLength`.
- New generic search:
  [`i14y_search()`](https://felixluginbuhl.com/I14Y/reference/i14y_search.md)
  exposes the faceted public-API search over all resource types
  (Dataset, DataService, PublicService, Concept, MappingTable).
  [`i14y_search_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_catalog.md)
  and
  [`i14y_search_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_concept.md)
  become thin wrappers around it and no longer call the undocumented
  `input-backend` host.
- New listing functions for every catalog resource:
  [`i14y_list_catalogs()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_catalogs.md),
  [`i14y_list_datasets()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_datasets.md),
  [`i14y_list_concepts()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_concepts.md),
  [`i14y_list_dataservices()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_dataservices.md),
  [`i14y_list_publicservices()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_publicservices.md),
  [`i14y_list_mappingtables()`](https://felixluginbuhl.com/I14Y/reference/i14y_list_mappingtables.md).
  All accept the standard `language`, `publishers`, `themes`,
  `registrationStatuses`, `page` and `pageSize` filters.
- New catalog endpoints:
  [`i14y_get_catalog()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog.md),
  [`i14y_get_catalog_records()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog_records.md),
  [`i14y_get_catalog_record()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog_record.md)
  and
  [`i14y_get_catalog_dcat()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_catalog_dcat.md)
  (RDF/TTL export).
- New mapping table endpoints:
  [`i14y_get_mappingtable()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_mappingtable.md)
  and
  [`i14y_get_mappingtable_relations()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_mappingtable_relations.md)
  (Json/Csv).
- New endpoints
  [`i14y_get_dataservice()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_dataservice.md)
  and
  [`i14y_get_publicservice()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_publicservice.md)
  for single-resource lookups.
- New
  [`i14y_get_concept_export()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept_export.md)
  to fetch the full DCAT export of a concept.
- New
  [`i14y_export_codelist_search()`](https://felixluginbuhl.com/I14Y/reference/i14y_export_codelist_search.md)
  to download codelist search results as CSV or JSON, with optional
  annotations.
- [`i14y_search_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_search_codelist.md)
  accepts a `NULL` query (list-all mode) and a `filters` argument, and
  supports the Rm (Romansh) language.
- [`i14y_get_codelist()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_codelist.md)
  gains `withAnnotations`;
  [`i14y_get_concept()`](https://felixluginbuhl.com/I14Y/reference/i14y_get_concept.md)
  gains `includeCodeListEntries`.
- Internal: all exported functions now share a single HTTP layer
  (`i14y_request()`) with retry on transient statuses, RFC 7807-aware
  error messages, and consistent `{data: ...}` envelope unwrapping.
- New vignettes: “Getting started”, “Discovering the catalog” and
  “Codelists with BFS”.
- Update `README.Rmd` to reflect the new model and use UUIDs in
  examples.

## I14Y 0.1.7

CRAN release: 2025-10-28

- BREAKING CHANGE: remove `i14y_get_data_service()` as it fails test and
  seems to always return error 404.

## I14Y 0.1.6

CRAN release: 2025-09-24

- Fail gracefully if no internet
- Use air code formatter

## I14Y 0.1.5

CRAN release: 2025-07-14

- new contributor
- added and fixed tests for pull request
  <https://github.com/lgnbhl/I14Y/pull/1>
- Modification by pull request <https://github.com/lgnbhl/I14Y/pull/1> :
  - Updated all affected functions to use the new backend API base URL.
  - Refactored i14y_search_concept() to align with the new Catalog
    endpoint, and added support for filtering by conceptValueTypes and
    registrationStatuses.
  - Added a new function, `i14y_get_dataset_metadata()`, which now
    retrieves both dataset descriptions and distributions, since these
    are handled under a unified endpoint in the updated API.
  - BREAKING CHANGE: `i14y_get_data_element()` removed, as its endpoint
    seems to have been removed in the API.
  - Updated and re-rendered the `README.Rmd` to reflect the API changes
    and function modifications.

## I14Y 0.1.4

CRAN release: 2025-06-09

- BREAKING CHANGE: remove `i14y_get_data_service_registration()` as it
  fails test.

## I14Y 0.1.3

CRAN release: 2025-04-24

- add `Depends: R (>= 4.0)` in DESCRIPTION so older R version can use
  the package.

## I14Y 0.1.2

CRAN release: 2025-04-16

- fix validate message giving wrong information to user

## I14Y 0.1.0

CRAN release: 2025-03-05

- first version
