test_that("i14y_get_dataset_structure() returns a JSON-LD graph by default", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_dataset_structure(
    id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
  )
  expect_type(res, "list")
  expect_true(length(res) >= 1)
  # JSON-LD graphs use @context / @graph / @id at the top level
  expect_true(any(grepl("^@", names(res))) || "@graph" %in% names(res))
})

test_that("i14y_get_dataset_structure() returns a character string for Ttl", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_dataset_structure(
    id = "b902add5-9538-47ed-b663-f9fbfac92381",
    format = "Ttl"
  )
  expect_type(res, "character")
  expect_true(nchar(res) > 0)
})

test_that("i14y_get_dataset_structure() validates its arguments", {
  expect_error(i14y_get_dataset_structure(id = NULL))
  expect_error(i14y_get_dataset_structure(id = 123))
  expect_error(i14y_get_dataset_structure(
    id = "b902add5-9538-47ed-b663-f9fbfac92381",
    format = "xml"
  ))
})
