#' List catalogs
#'
#' Calls the I14Y public API endpoint \verb{/catalogs}.
#'
#' @param page integer. The result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of catalog summaries. `NULL` when offline.
#' @export
i14y_list_catalogs <- function(page = NULL, pageSize = NULL) {
  if (!check_internet()) return(NULL)
  req <- i14y_request(
    "/catalogs",
    query = list(page = page, pageSize = pageSize)
  )
  as_tibble_safe(i14y_perform_json(req))
}

#' Get a catalog by ID
#'
#' Calls the I14Y public API endpoint \verb{/catalogs/\{catalogId\}}.
#'
#' @param id string. The catalog identifier.
#'
#' @return A list of catalog metadata. `NULL` when offline.
#' @export
i14y_get_catalog <- function(id = NULL) {
  check_string(id)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/catalogs/", id))
  i14y_perform_json(req)
}

#' List records of a catalog
#'
#' Calls the I14Y public API endpoint \verb{/catalogs/\{catalogId\}/records}.
#'
#' @param id string. The catalog identifier.
#'
#' @return A tibble of catalog records. `NULL` when offline.
#' @export
i14y_get_catalog_records <- function(id = NULL) {
  check_string(id)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/catalogs/", id, "/records"))
  as_tibble_safe(i14y_perform_json(req))
}

#' Get a single record of a catalog
#'
#' Calls the I14Y public API endpoint
#' \verb{/catalogs/\{catalogId\}/records/\{recordId\}}.
#'
#' @param id string. The catalog identifier.
#' @param recordId string. The record identifier.
#'
#' @return A list with the record metadata. `NULL` when offline.
#' @export
i14y_get_catalog_record <- function(id = NULL, recordId = NULL) {
  check_string(id)
  check_string(recordId)
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/catalogs/", id, "/records/", recordId))
  i14y_perform_json(req)
}

#' Export the DCAT representation of a catalog
#'
#' Calls the I14Y public API endpoint
#' \verb{/catalogs/\{catalogId\}/dcat/exports/\{dataFormat\}}.
#'
#' @param id string. The catalog identifier.
#' @param format string. One of "RDF" (default), "TTL".
#'
#' @return A character string with the raw RDF/TTL document. `NULL` when offline.
#' @export
i14y_get_catalog_dcat <- function(id = NULL, format = "RDF") {
  check_string(id)
  check_string(format)
  format <- arg_match(format, i14y_catalog_export_formats())
  if (!check_internet()) return(NULL)
  req <- i14y_request(paste0("/catalogs/", id, "/dcat/exports/", format))
  i14y_perform_raw(req)
}
