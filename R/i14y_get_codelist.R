#' Export a codelist
#'
#' Calls the I14Y public API endpoint
#' \verb{/concepts/\{conceptId\}/codelist-entries/exports/\{dataFormat\}}.
#'
#' @param id string. The Id of the response data.
#' @param format string. The format of the export ("csv" or "json").
#' @param withAnnotations logical. If `TRUE`, annotations are included in the
#'   export. Default `FALSE`.
#'
#' @return A tibble for `format = "csv"`. For `format = "json"`, a list when
#'   `withAnnotations = TRUE` (preserves the nested structure) or a tibble
#'   otherwise. `NULL` when offline.
#' @export
#'
#' @examples
#' \donttest{
#' i14y_get_codelist(
#'   id = "08d94604-e058-62a2-aa25-53f84b974201" # for DV_NOGA_DIVISION
#' )
#' }
i14y_get_codelist <- function(
  id = NULL,
  format = "csv",
  withAnnotations = FALSE
) {
  check_string(id)
  check_string(format)
  check_logical(withAnnotations)
  format <- arg_match(format, c("csv", "json"))
  # Swagger enum is PascalCase: Json | Csv
  api_format <- c(csv = "Csv", json = "Json")[[format]]
  if (!check_internet()) return(NULL)

  req <- i14y_request(
    paste0("/concepts/", id, "/codelist-entries/exports/", api_format),
    query = list(withAnnotations = withAnnotations)
  )

  if (format == "csv") {
    resp <- i14y_perform_raw(req)
    return(readr::read_csv(resp, show_col_types = FALSE))
  }
  body <- i14y_perform_json(req, unwrap_data = FALSE)
  if (withAnnotations) {
    return(body)
  }
  as_tibble_safe(body)
}
