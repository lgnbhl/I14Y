test_that("i14y_get_concept() returns unwrapped, multilingual concept metadata", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_concept(
    id = "08d94604-e058-62a2-aa25-53f84b974201" # DV_NOGA_DIVISION
  )
  expect_type(res, "list")
  # response should be unwrapped from the {data: ...} envelope
  expect_false("data" %in% names(res))
  expect_true(all(c("id", "identifiers", "name", "description") %in% names(res)))
  expect_equal(res$id, "08d94604-e058-62a2-aa25-53f84b974201")
  # public API always returns all four languages on multilingual fields
  expect_true(all(c("de", "en", "fr", "it") %in% names(res$name)))
  expect_equal(res$name$en, "NOGA Division")
})

test_that("i14y_get_concept() validates its arguments", {
  expect_error(i14y_get_concept(id = NULL))
  expect_error(i14y_get_concept(id = 123))
})
