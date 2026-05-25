# I14Y 0.2.0

- BREAKING CHANGE: align package with the restructured I14Y API. The upstream `Nomenclatures`, `DataStructures` and `ContentConfigurations` endpoints have been removed; in the new data model multi-level "nomenclatures" are split into separate codelist concepts (e.g. NOGA is now `NOGA_SECTION`, `NOGA_DIVISION`, `NOGA_GROUP`, `NOGA_CLASS`) and structures are exposed by dataset UUID.
- BREAKING CHANGE: remove `i14y_get_nomenclature_level()` and `i14y_get_nomenclature_level_multiple()`. Use `i14y_search_concept()` to find the relevant per-level codelist concept, then `i14y_get_codelist()` to download its entries.
- BREAKING CHANGE: remove `i14y_search_nomenclature()`. Replaced by `i14y_search_codelist(id, query, language)` which calls `/concepts/{conceptId}/codelist-entries/search` on the public API. Takes a concept UUID instead of a string nomenclature identifier.
- BREAKING CHANGE: `i14y_get_data_structure()` now calls `/datasets/{datasetId}/structures/exports/{format}` on the public API. Argument `identifier` (string) is replaced by `id` (UUID), and `language` is replaced by `format` (one of "JsonLd", "Ttl", "Rdf"). The endpoint returns a SHACL/RDF graph rather than a tabular variables list.
- BREAKING CHANGE: `i14y_get_content_information()` now calls `/datasets/{datasetId}` on the public API. Argument `identifier` (string) is replaced by `id` (UUID). Also fixes a bug introduced in 0.1.7 where the function referenced an undefined `identifier` variable and errored on every call.
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
