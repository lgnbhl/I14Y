# I14Y 0.2.0

- BREAKING CHANGE: align package with the restructured I14Y API. The upstream `Nomenclatures`, `DataStructures` and `ContentConfigurations` endpoints have been removed; in the new data model multi-level "nomenclatures" are split into separate codelist concepts (e.g. NOGA is now `NOGA_SECTION`, `NOGA_DIVISION`, `NOGA_GROUP`, `NOGA_CLASS`) and structures are exposed by dataset UUID.
- BREAKING CHANGE: remove `i14y_get_nomenclature_level()` and `i14y_get_nomenclature_level_multiple()`. Use `i14y_search_concept()` to find the relevant per-level codelist concept, then `i14y_get_codelist()` to download its entries.
- BREAKING CHANGE: remove `i14y_search_nomenclature()`. Replaced by `i14y_search_codelist(id, query, language)` which calls `/concepts/{conceptId}/codelist-entries/search` on the public API. Takes a concept UUID instead of a string nomenclature identifier.
- BREAKING CHANGE: rename `i14y_get_data_structure()` to `i14y_get_dataset_structure()` to match the public API endpoint `/datasets/{datasetId}/structures/exports/{format}`. Argument `identifier` (string) is replaced by `id` (UUID), and `language` is replaced by `format` (one of "JsonLd", "Ttl", "Rdf"). The endpoint returns a SHACL/RDF graph rather than a tabular variables list.
- BREAKING CHANGE: rename `i14y_get_content_information()` to `i14y_get_dataset()` to match the public API endpoint `/datasets/{datasetId}`. Argument `identifier` (string) is replaced by `id` (UUID).
- BREAKING CHANGE: remove `i14y_get_dataset_metadata()`. It targeted the internal `input-backend` host and is superseded by `i14y_get_dataset()`, which calls the equivalent public API endpoint.
- BREAKING CHANGE: remove `i14y_get_concept_all_versions()`. It targeted the internal `input-backend` host and the public API exposes no equivalent. If/when `/concepts/{id}/versions` becomes available publicly, it may be reintroduced.
- BREAKING CHANGE: `i14y_get_concept()` now calls `/concepts/{conceptId}` on the public API. The `language` argument is removed (the public endpoint always returns all four languages, de/en/fr/it). The response is unwrapped from the `{data: ...}` envelope; a few internal-only fields (`responsiblePerson`, `validTo`, `codeListId`, ...) are no longer returned, and the casing of `codelistEntryValueMaxLength` becomes `codeListEntryValueMaxLength`.
- New generic search: `i14y_search()` exposes the faceted public-API search over all resource types (Dataset, DataService, PublicService, Concept, MappingTable). `i14y_search_catalog()` and `i14y_search_concept()` become thin wrappers around it and no longer call the undocumented `input-backend` host.
- New listing functions for every catalog resource: `i14y_list_catalogs()`, `i14y_list_datasets()`, `i14y_list_concepts()`, `i14y_list_dataservices()`, `i14y_list_publicservices()`, `i14y_list_mappingtables()`. All accept the standard `language`, `publishers`, `themes`, `registrationStatuses`, `page` and `pageSize` filters.
- New catalog endpoints: `i14y_get_catalog()`, `i14y_get_catalog_records()`, `i14y_get_catalog_record()` and `i14y_get_catalog_dcat()` (RDF/TTL export).
- New mapping table endpoints: `i14y_get_mappingtable()` and `i14y_get_mappingtable_relations()` (Json/Csv).
- New endpoints `i14y_get_dataservice()` and `i14y_get_publicservice()` for single-resource lookups.
- New `i14y_get_concept_export()` to fetch the full DCAT export of a concept.
- New `i14y_export_codelist_search()` to download codelist search results as CSV or JSON, with optional annotations.
- `i14y_search_codelist()` accepts a `NULL` query (list-all mode) and a `filters` argument, and supports the Rm (Romansh) language.
- `i14y_get_codelist()` gains `withAnnotations`; `i14y_get_concept()` gains `includeCodeListEntries`.
- Internal: all exported functions now share a single HTTP layer (`i14y_request()`) with retry on transient statuses, RFC 7807-aware error messages, and consistent `{data: ...}` envelope unwrapping.
- New vignettes: "Getting started", "Discovering the catalog" and "Codelists with BFS".
- Update `README.Rmd` to reflect the new model and use UUIDs in examples.

# I14Y 0.1.7
- BREAKING CHANGE: remove `i14y_get_data_service()` as it fails test and seems to always return error 404.

# I14Y 0.1.6
- Fail gracefully if no internet
- Use air code formatter

# I14Y 0.1.5
- new contributor
- added and fixed tests for pull request https://github.com/lgnbhl/I14Y/pull/1
- Modification by pull request https://github.com/lgnbhl/I14Y/pull/1 :
  - Updated all affected functions to use the new backend API base URL.
  - Refactored i14y_search_concept() to align with the new Catalog endpoint, and added support for filtering by conceptValueTypes and registrationStatuses.
  - Added a new function, `i14y_get_dataset_metadata()`, which now retrieves both dataset descriptions and distributions, since these are handled under a unified endpoint in the updated API.
  - BREAKING CHANGE: `i14y_get_data_element()` removed, as its endpoint seems to have been removed in the API.
  - Updated and re-rendered the `README.Rmd` to reflect the API changes and function modifications.

# I14Y 0.1.4

- BREAKING CHANGE: remove `i14y_get_data_service_registration()` as it fails test.

# I14Y 0.1.3

- add `Depends: R (>= 4.0)` in DESCRIPTION so older R version can use the package.

# I14Y 0.1.2

- fix validate message giving wrong information to user

# I14Y 0.1.0

- first version
