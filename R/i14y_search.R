#' Search the I14Y catalog
#'
#' Calls the I14Y public API endpoint \verb{/search}. This is the faceted search
#' over all resource types (datasets, data services, public services, concepts,
#' mapping tables) and replaces the previous private `input-backend` host that
#' powered `i14y_search_catalog()` and `i14y_search_concept()` in earlier
#' releases.
#'
#' @param query string. The search query.
#' @param language string. The language to use for the search ("de", "en",
#'   "fr", "it", "rm"). Default "de".
#' @param types character vector. Filter by resource types. One or more of
#'   "Dataset", "DataService", "PublicService", "Concept", "MappingTable".
#' @param accessRights character vector. Filter by access rights.
#' @param businessEvents character vector. Filter by business events.
#' @param conceptValueTypes character vector. Filter by concept value type. One
#'   or more of "CodeList", "Date", "Numeric", "String".
#' @param formats character vector. Filter by distribution formats.
#' @param publicationLevels character vector. Filter by publication level
#'   ("Internal", "Public").
#' @param publicationLevelProposals character vector. Filter by proposed
#'   publication level ("Internal", "Public").
#' @param lifeEvents character vector. Filter by life events.
#' @param publishers character vector. Filter by publisher identifiers.
#' @param registrationStatuses character vector. Filter by registration status.
#' @param registrationStatusProposals character vector. Filter by proposed
#'   registration status.
#' @param structure string. One of "WithStructure", "WithoutStructure".
#' @param themes character vector. Filter by theme codes.
#' @param page integer. The number of the result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of search results. `NULL` when offline.
#' @export
#'
#' @examples
#' \donttest{
#' i14y_search(query = "noga", language = "en")
#' }
i14y_search <- function(
  query = NULL,
  language = "de",
  types = NULL,
  accessRights = NULL,
  businessEvents = NULL,
  conceptValueTypes = NULL,
  formats = NULL,
  publicationLevels = NULL,
  publicationLevelProposals = NULL,
  lifeEvents = NULL,
  publishers = NULL,
  registrationStatuses = NULL,
  registrationStatusProposals = NULL,
  structure = NULL,
  themes = NULL,
  page = NULL,
  pageSize = NULL
) {
  language <- arg_match(language, i14y_languages())
  check_enum(types, i14y_search_resource_types())
  check_enum(conceptValueTypes, i14y_concept_value_types())
  check_enum(publicationLevels, i14y_publication_levels())
  check_enum(publicationLevelProposals, i14y_publication_levels())
  check_enum(registrationStatuses, i14y_registration_statuses())
  check_enum(registrationStatusProposals, i14y_registration_statuses())
  if (!is.null(structure)) {
    structure <- arg_match(structure, i14y_search_structure_options())
  }
  if (!check_internet()) return(NULL)

  req <- i14y_request(
    "/search",
    query = list(
      language = language,
      query = query,
      accessRights = accessRights,
      businessEvents = businessEvents,
      conceptValueTypes = conceptValueTypes,
      formats = formats,
      publicationLevels = publicationLevels,
      publicationLevelProposals = publicationLevelProposals,
      lifeEvents = lifeEvents,
      publishers = publishers,
      registrationStatuses = registrationStatuses,
      registrationStatusProposals = registrationStatusProposals,
      structure = structure,
      themes = themes,
      types = types,
      page = page,
      pageSize = pageSize
    )
  )
  body <- i14y_perform_json(req, unwrap_data = FALSE)
  data <- if (is_envelope(body)) body$data else body
  as_tibble_safe(data)
}
