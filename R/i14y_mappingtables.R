#' List mapping tables
#'
#' Calls the I14Y public API endpoint \verb{/mappingtables}.
#'
#' @param mappingTableIdentifier string. Filter by mapping table identifier.
#' @param publisherIdentifier string. Filter by publisher identifier.
#' @param version string. Filter by version.
#' @param codeSystemUri string. Filter by code system URI.
#' @param publicationLevel string. One of "Internal", "Public".
#' @param registrationStatus string. A registration status value.
#' @param page integer. The result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of mapping table summaries. `NULL` when offline.
#' @export
i14y_list_mappingtables <- function(
  mappingTableIdentifier = NULL,
  publisherIdentifier = NULL,
  version = NULL,
  codeSystemUri = NULL,
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
    "/mappingtables",
    query = list(
      mappingTableIdentifier = mappingTableIdentifier,
      publisherIdentifier = publisherIdentifier,
      version = version,
      codeSystemUri = codeSystemUri,
      publicationLevel = publicationLevel,
      registrationStatus = registrationStatus,
      page = page,
      pageSize = pageSize
    )
  )
  as_tibble_safe(i14y_perform_json(req))
}

#' Get a mapping table by ID
#'
#' Calls the I14Y public API endpoint \verb{/mappingtables/\{mappingTableId\}}.
#'
#' @param id string. The UUID of the mapping table.
#'
#' @return A list with the mapping table metadata. `NULL` when offline.
#' @export
i14y_get_mappingtable <- function(id = NULL) {
  check_string(id)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/mappingtables/", id))
  i14y_perform_json(req)
}

#' Export the relations of a mapping table
#'
#' Calls the I14Y public API endpoint
#' \verb{/mappingtables/\{mappingTableId\}/relations/exports/\{dataFormat\}}.
#'
#' @param id string. The UUID of the mapping table.
#' @param format string. One of "Json" (default), "Csv".
#'
#' @return For `format = "Json"`, a tibble of relations (one row per
#'   source/target/relationType triple). For `format = "Csv"`, the raw
#'   CSV response body as a character string. `NULL` when offline.
#' @export
i14y_get_mappingtable_relations <- function(id = NULL, format = "Json") {
  check_string(id)
  check_string(format)
  format <- arg_match(format, i14y_mappingtable_relations_formats())
  if (!check_internet()) return(NULL)
  req <- i14y_request(
    paste0("/mappingtables/", id, "/relations/exports/", format)
  )
  if (format == "Json") {
    return(as_tibble_safe(i14y_perform_json(req)))
  }
  i14y_perform_raw(req)
}
