#' Export the data structure of a dataset
#'
#' Calls the I14Y public API endpoint
#' \verb{/datasets/\{datasetId\}/structures/exports/\{dataFormat\}}. The endpoint returns
#' a SHACL/RDF graph in one of the supported linked-data formats. Note that many
#' datasets do not have a published structure and will return an empty result.
#'
#' @param id string. The UUID of the dataset.
#' @param format string. The export format. One of "JsonLd" (default), "Ttl" or
#'   "Rdf".
#'
#' @return For `format = "JsonLd"`, the parsed JSON-LD graph as a list. For
#'   other formats, the raw response body as a character string.
#' @export
#' @examples
#' i14y_get_dataset_structure(
#'   id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
#' )
i14y_get_dataset_structure <- function(
  id = NULL,
  format = "JsonLd"
) {
  check_not_null(id)
  check_not_null(format)
  check_string(id)
  check_string(format)
  format <- arg_match(format, c("JsonLd", "Ttl", "Rdf"))
  if (!curl::has_internet()) {
    message("No internet connection")
    return(NULL)
  }

  req <- httr2::request("https://api.i14y.admin.ch/api/public/v1")
  req <- httr2::req_user_agent(
    req,
    "I14Y R package (https://github.com/lgnbhl/I14Y)"
  )
  req <- httr2::req_url_path_append(
    req,
    paste0("/datasets/", id, "/structures/exports/", format)
  )
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  if (format == "JsonLd") {
    return(httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE))
  }
  return(httr2::resp_body_string(req))
}
