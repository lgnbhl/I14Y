#' List concepts
#'
#' Calls the I14Y public API endpoint \verb{/concepts}.
#'
#' @param conceptIdentifier string. Filter by concept identifier.
#' @param publisherIdentifier string. Filter by publisher identifier.
#' @param version string. Filter by version.
#' @param publicationLevel string. One of "Internal", "Public".
#' @param registrationStatus string. A registration status value.
#' @param page integer. The result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of concept summaries. `NULL` when offline.
#' @export
i14y_list_concepts <- function(
  conceptIdentifier = NULL,
  publisherIdentifier = NULL,
  version = NULL,
  publicationLevel = NULL,
  registrationStatus = NULL,
  page = NULL,
  pageSize = NULL
) {
  if (!is.null(publicationLevel)) {
    publicationLevel <- arg_match(publicationLevel, i14y_publication_levels())
  }
  if (!is.null(registrationStatus)) {
    registrationStatus <- arg_match(
      registrationStatus,
      i14y_registration_statuses()
    )
  }
  if (!check_internet()) return(NULL)
  req <- i14y_request(
    "/concepts",
    query = list(
      conceptIdentifier = conceptIdentifier,
      publisherIdentifier = publisherIdentifier,
      version = version,
      publicationLevel = publicationLevel,
      registrationStatus = registrationStatus,
      page = page,
      pageSize = pageSize
    )
  )
  as_tibble_safe(i14y_perform_json(req))
}

#' Get the JSON export of a concept
#'
#' Calls the I14Y public API endpoint
#' \verb{/concepts/\{conceptId\}/exports/json}.
#'
#' @param id string. The UUID of the concept.
#'
#' @return A list with the JSON export of the concept. `NULL` when offline.
#' @export
i14y_get_concept_export <- function(id = NULL) {
  check_string(id)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/concepts/", id, "/exports/json"))
  i14y_perform_json(req, unwrap_data = FALSE)
}

#' List datasets
#'
#' Calls the I14Y public API endpoint \verb{/datasets}.
#'
#' @param accessRights string. Filter by access rights.
#' @param datasetIdentifier string. Filter by dataset identifier.
#' @param publisherIdentifier string. Filter by publisher identifier.
#' @param publicationLevel string. One of "Internal", "Public".
#' @param registrationStatus string. A registration status value.
#' @param page integer. The result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of dataset summaries. `NULL` when offline.
#' @export
i14y_list_datasets <- function(
  accessRights = NULL,
  datasetIdentifier = NULL,
  publisherIdentifier = NULL,
  publicationLevel = NULL,
  registrationStatus = NULL,
  page = NULL,
  pageSize = NULL
) {
  if (!is.null(publicationLevel)) {
    publicationLevel <- arg_match(publicationLevel, i14y_publication_levels())
  }
  if (!is.null(registrationStatus)) {
    registrationStatus <- arg_match(
      registrationStatus,
      i14y_registration_statuses()
    )
  }
  if (!check_internet()) return(NULL)
  req <- i14y_request(
    "/datasets",
    query = list(
      accessRights = accessRights,
      datasetIdentifier = datasetIdentifier,
      publisherIdentifier = publisherIdentifier,
      publicationLevel = publicationLevel,
      registrationStatus = registrationStatus,
      page = page,
      pageSize = pageSize
    )
  )
  as_tibble_safe(i14y_perform_json(req))
}
