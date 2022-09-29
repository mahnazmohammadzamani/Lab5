#content("API")

url <- "http://api.kolada.se/v2/ou?title=skola"
output <- my_API(url)


test_that("Downloading a big query", {
  expect_error(file_size(url))
})
test_that("Testing the outputs of your functions", {
  expect_equal(names(output)[1],"municipality_name")
})


test_that("Testing the outputs of your functions", {
  expect_equal(names(output[1]),"municipality_name")
})
test_that("Testing the outputs of your functions", {
  expect_equal(names(output[2]),"number_schools")
})

test_that("Testing the outputs of your functions", {
  expect_equal(output[1,1],"0114")
})

test_that("Testing the outputs of your functions", {
  expect_equal(output[3,2],75)
})