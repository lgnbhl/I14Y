test_that("i14y_list_publicservices() returns a list/data.frame", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_list_publicservices(pageSize = 3)
  expect_true(is.list(res) || is.data.frame(res))
})

test_that("i14y_list_publicservices() validates enum arguments", {
  expect_error(i14y_list_publicservices(publicationLevel = "Secret"))
  expect_error(i14y_list_publicservices(registrationStatus = "Bogus"))
})

test_that("i14y_get_publicservice() validates its arguments", {
  expect_error(i14y_get_publicservice(id = NULL))
  expect_error(i14y_get_publicservice(id = 123))
})
