#' Get a concept by ID
#'
#' Calls the I14Y public API endpoint \verb{/concepts/\{conceptId\}} and returns
#' the concept metadata. Multilingual fields (`name`, `description`, ...) are
#' returned with one entry per language (de, en, fr, it, rm).
#'
#' @param id string. The UUID of the concept.
#' @param includeCodeListEntries logical. If `TRUE`, the response includes the
#'   codelist entries for code-list concepts. Default `FALSE`.
#'
#' @return A list with the concept metadata. `NULL` when offline.
#' @export
#'
#' @examples
#' \donttest{
#' i14y_get_concept(
#'   id = "08d94604-e058-62a2-aa25-53f84b974201" # DV_NOGA_DIVISION
#' )
#' }
i14y_get_concept <- function(
  id = NULL,
  includeCodeListEntries = FALSE
) {
  check_string(id)
  check_logical(includeCodeListEntries)
  if (!check_internet()) return(NULL)

  req <- i14y_request(
    paste0("/concepts/", id),
    query = list(includeCodeListEntries = includeCodeListEntries)
  )
  i14y_perform_json(req)
}
