% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/i14y_search_concept.R
\name{i14y_search_concept}
\alias{i14y_search_concept}
\title{Search for a Concept Summary}
\usage{
i14y_search_concept(
  search = NULL,
  language = "de",
  page = 1,
  pageSize = 1000,
  publishers = NULL,
  themeCodes = NULL
)
}
\arguments{
\item{search}{string. Search query.}

\item{language}{string. The language of the response data.}

\item{page}{integer. The number of the result page to return.}

\item{pageSize}{integer. The size of each result page.}

\item{publishers}{vector of strings. Filter with Publishers identifiers.}

\item{themeCodes}{vector of strings. Filter with theme codes.}
}
\value{
a tibble
}
\description{
Search for a Concept Summary
}
\examples{
i14y_search_concept(search = "noga", language = "en")
}
