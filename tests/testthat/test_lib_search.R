
context("Test lib_search")

# input: a script
input1 <- "file/script_for_test1.R"

# expected output: a list of dependencies
exp_output1 <- c("dplyr","tibble")


test_that("In case the input is not a .R script", {

  expect_error(lib_search("tests/test.txt"))
  expect_error(lib_search("tests/test.pdf"))

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_search(input1, "script"))

})

test_that("In case the input is not a string", {

  expect_error(lib_search(123))
  expect_error(lib_search(c(1,2,3)))
})

test_that("In case the input path does not exist", {

  expect_error(lib_search("123/input.R"))
  expect_error(lib_search("test_file/input.R"))
})

test_that("test if the the ouput is correct", {

  expect_equal(lib_search(input1), exp_output1)
  expect_equal(class(lib_search(input1)), "character")
})
