# https://rlang.r-lib.org/reference/topic-error-call.html#input-checkers-and-caller-arg-
check_string <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (!is_string(x)) {
    cli::cli_abort("{.arg {arg}} must be a string.", call = call)
  }
}
check_integer <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (!is_integerish(x)) {
    cli::cli_abort("{.arg {arg}} must be an integer.", call = call)
  }
}
check_logical <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (!is_logical(x)) {
    cli::cli_abort("{.arg {arg}} must be logical.", call = call)
  }
}
# Validate that all values of a character vector belong to a fixed enum.
# `rlang::arg_match()` only accepts a single value, which makes it unsuitable
# for query parameters that are repeated arrays in the I14Y API.
check_enum <- function(
  x,
  values,
  arg = caller_arg(x),
  call = caller_env()
) {
  if (is.null(x)) return(invisible(NULL))
  bad <- setdiff(x, values)
  if (length(bad) > 0) {
    cli::cli_abort(
      c(
        "{.arg {arg}} contains invalid value{?s}: {.val {bad}}.",
        i = "Allowed value{?s}: {.val {values}}."
      ),
      call = call
    )
  }
  invisible(x)
}

i14y_languages <- function() c("de", "en", "fr", "it", "rm")

i14y_registration_statuses <- function() {
  c(
    "Incomplete",
    "Candidate",
    "Recorded",
    "Qualified",
    "Standard",
    "PreferredStandard",
    "Superseded",
    "Retired"
  )
}

i14y_publication_levels <- function() c("Internal", "Public")

i14y_concept_value_types <- function() {
  c("CodeList", "Date", "Numeric", "String")
}

i14y_search_resource_types <- function() {
  c("Dataset", "DataService", "PublicService", "Concept", "MappingTable")
}

i14y_search_structure_options <- function() {
  c("WithStructure", "WithoutStructure")
}

i14y_linked_data_formats <- function() c("JsonLd", "Ttl", "Rdf")

i14y_catalog_export_formats <- function() c("RDF", "TTL")

i14y_codelist_entries_formats <- function() c("Json", "Csv")

i14y_mappingtable_relations_formats <- function() c("Json", "Csv")
