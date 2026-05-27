test_that("i14y_search() returns a tibble for the public /search endpoint", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  df <- i14y_search(query = "noga", language = "en", pageSize = 5)
  expect_s3_class(df, "tbl_df")
  expect_true(nrow(df) >= 1)
  expect_true("id" %in% names(df))
})

test_that("i14y_search() restricts to a single resource type", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  df <- i14y_search(
    query = "noga",
    language = "en",
    types = "Concept",
    pageSize = 5
  )
  expect_s3_class(df, "tbl_df")
})

test_that("i14y_search() validates enum arguments", {
  expect_error(i14y_search(language = "xx"))
  expect_error(i14y_search(types = "NotAType"))
  expect_error(i14y_search(conceptValueTypes = "Bogus"))
  expect_error(i14y_search(publicationLevels = "Secret"))
  expect_error(i14y_search(structure = "Maybe"))
})

test_that("i14y_search() accepts Romansh as a language", {
  # The new Language enum includes "rm" — validation must not reject it
  expect_true("rm" %in% i14y_languages())
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  expect_no_error(i14y_search(query = "noga", language = "rm", pageSize = 1))
})
