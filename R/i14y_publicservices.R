#' List public services
#'
#' Calls the I14Y public API endpoint \verb{/publicservices}.
#'
#' @param publicServiceIdentifier string. Filter by public service identifier.
#' @param publisherIdentifier string. Filter by publisher identifier.
#' @param publicationLevel string. One of "Internal", "Public".
#' @param registrationStatus string. A registration status value.
#' @param page integer. The result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of public service summaries. `NULL` when offline.
#' @export
i14y_list_publicservices <- function(
  publicServiceIdentifier = NULL,
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
    "/publicservices",
    query = list(
      publicServiceIdentifier = publicServiceIdentifier,
      publisherIdentifier = publisherIdentifier,
      publicationLevel = publicationLevel,
      registrationStatus = registrationStatus,
      page = page,
      pageSize = pageSize
    )
  )
  as_tibble_safe(i14y_perform_json(req))
}

#' Get a public service by ID
#'
#' Calls the I14Y public API endpoint
#' \verb{/publicservices/\{publicServiceId\}}.
#'
#' @param id string. The UUID of the public service.
#'
#' @return A list with the public service metadata. `NULL` when offline.
#' @export
i14y_get_publicservice <- function(id = NULL) {
  check_string(id)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/publicservices/", id))
  i14y_perform_json(req)
}
