test_that("i14y_list_concepts() returns a list", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_list_concepts(pageSize = 3)
  expect_true(is.list(res) || is.data.frame(res))
})

test_that("i14y_list_concepts() validates enum arguments", {
  expect_error(i14y_list_concepts(publicationLevel = "Secret"))
  expect_error(i14y_list_concepts(registrationStatus = "Bogus"))
})

test_that("i14y_list_datasets() returns a list", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_list_datasets(pageSize = 3)
  expect_true(is.list(res) || is.data.frame(res))
})

test_that("i14y_list_datasets() validates enum arguments", {
  expect_error(i14y_list_datasets(publicationLevel = "Secret"))
  expect_error(i14y_list_datasets(registrationStatus = "Bogus"))
})

test_that("i14y_get_concept_export() returns the JSON export of a concept", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_concept_export(
    id = "08d94604-e058-62a2-aa25-53f84b974201"
  )
  expect_type(res, "list")
})

test_that("i14y_get_concept_export() validates its arguments", {
  expect_error(i14y_get_concept_export(id = NULL))
  expect_error(i14y_get_concept_export(id = 123))
})
