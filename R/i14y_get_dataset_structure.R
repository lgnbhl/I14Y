#' Export the data structure of a dataset
#'
#' Calls the I14Y public API endpoint
#' \verb{/datasets/\{datasetId\}/structures/exports/\{dataFormat\}}. The endpoint
#' returns a SHACL/RDF graph in one of the supported linked-data formats. Note
#' that many datasets do not have a published structure and will return an
#' empty result.
#'
#' @param id string. The UUID of the dataset.
#' @param format string. The export format. One of "JsonLd" (default), "Ttl" or
#'   "Rdf".
#'
#' @return For `format = "JsonLd"`, the parsed JSON-LD graph as a list. For
#'   other formats, the raw response body as a character string. `NULL` when
#'   offline.
#' @export
#' @examples
#' \donttest{
#' i14y_get_dataset_structure(
#'   id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
#' )
#' }
i14y_get_dataset_structure <- function(
  id = NULL,
  format = "JsonLd"
) {
  check_string(id)
  check_string(format)
  format <- arg_match(format, i14y_linked_data_formats())
  if (!check_internet()) return(NULL)

  req <- i14y_request(paste0("/datasets/", id, "/structures/exports/", format))
  if (format == "JsonLd") {
    return(i14y_perform_json(req, unwrap_data = FALSE))
  }
  i14y_perform_raw(req)
}
