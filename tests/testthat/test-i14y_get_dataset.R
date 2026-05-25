test_that("i14y_get_dataset() returns unwrapped dataset metadata", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_dataset(
    id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
  )
  expect_type(res, "list")
  # response should be unwrapped from the {data: ...} envelope
  expect_false("data" %in% names(res))
  # expected DCAT-AP fields from the public API
  expect_true(all(c("id", "description", "distributions") %in% names(res)))
  expect_equal(res$id, "b902add5-9538-47ed-b663-f9fbfac92381")
  # description is multilingual
  expect_true(any(c("de", "en", "fr", "it") %in% names(res$description)))
})

test_that("i14y_get_dataset() validates its arguments", {
  expect_error(i14y_get_dataset(id = NULL))
  expect_error(i14y_get_dataset(id = 123))
})
