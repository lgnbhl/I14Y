#' List data services
#'
#' Calls the I14Y public API endpoint \verb{/dataservices}.
#'
#' @param accessRights string. Filter by access rights.
#' @param dataServiceIdentifier string. Filter by data service identifier.
#' @param publisherIdentifier string. Filter by publisher identifier.
#' @param publicationLevel string. One of "Internal", "Public".
#' @param registrationStatus string. A registration status value.
#' @param page integer. The result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of data service summaries. `NULL` when offline.
#' @export
i14y_list_dataservices <- function(
  accessRights = NULL,
  dataServiceIdentifier = NULL,
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
    "/dataservices",
    query = list(
      accessRights = accessRights,
      dataServiceIdentifier = dataServiceIdentifier,
      publisherIdentifier = publisherIdentifier,
      publicationLevel = publicationLevel,
      registrationStatus = registrationStatus,
      page = page,
      pageSize = pageSize
    )
  )
  as_tibble_safe(i14y_perform_json(req))
}

#' Get a data service by ID
#'
#' Calls the I14Y public API endpoint \verb{/dataservices/\{dataServiceId\}}.
#'
#' @param id string. The UUID of the data service.
#'
#' @return A list with the data service metadata. `NULL` when offline.
#' @export
i14y_get_dataservice <- function(id = NULL) {
  check_string(id)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/dataservices/", id))
  i14y_perform_json(req)
}
