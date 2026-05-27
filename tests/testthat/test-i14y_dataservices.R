test_that("i14y_list_dataservices() returns a list/data.frame", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_list_dataservices(pageSize = 3)
  expect_true(is.list(res) || is.data.frame(res))
})

test_that("i14y_list_dataservices() validates enum arguments", {
  expect_error(i14y_list_dataservices(publicationLevel = "Secret"))
  expect_error(i14y_list_dataservices(registrationStatus = "Bogus"))
})

test_that("i14y_get_dataservice() validates its arguments", {
  expect_error(i14y_get_dataservice(id = NULL))
  expect_error(i14y_get_dataservice(id = 123))
})
