test_that("i14y_list_mappingtables() returns a list/data.frame", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_list_mappingtables(pageSize = 3)
  expect_true(is.list(res) || is.data.frame(res))
})

test_that("i14y_list_mappingtables() validates enum arguments", {
  expect_error(i14y_list_mappingtables(publicationLevel = "Secret"))
  expect_error(i14y_list_mappingtables(registrationStatus = "Bogus"))
})

test_that("i14y_get_mappingtable() validates its arguments", {
  expect_error(i14y_get_mappingtable(id = NULL))
  expect_error(i14y_get_mappingtable(id = 123))
})

test_that("i14y_get_mappingtable_relations() validates the format argument", {
  expect_error(i14y_get_mappingtable_relations(id = NULL))
  expect_error(i14y_get_mappingtable_relations(id = "x", format = "json"))
})
