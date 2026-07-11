test_that("i14y_search_codelist() returns results for NOGA_DIVISION", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_search_codelist(
    id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
    query = "agriculture",
    language = "fr"
  )
  expect_true(is.data.frame(res) || is.list(res))
  expect_true(length(res) >= 1)
})
