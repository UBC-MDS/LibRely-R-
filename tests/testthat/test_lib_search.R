
# input: a script
input1 <- "tests/scripts/summarized_data.R"
input2 <- "tests/scripts/empty_script.R"


# expected output: a list of dependencies
exp_output1 <- c(tidyverse, ggplot2)
exp_output2 <- c()


test_that("In case the input is not a .R script", {

  expect_error(lib_search("tests/scripts/summarized_data.pdf"))
  expect_error(lib_search("tests/scripts/summarized_data.txt"))

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_search(input, "script"))

})

test_that("In case the input is not a string", {

  expect_error(lib_search(123))
  expect_error(lib_search(c(1,2,3)))
})


test_that("In case the input path does not exist", {

  expect_error(lib_search("123/input.R"))
  expect_error(lib_search("test_file/input.R"))
})

test_that("In case the output vector is empty", {

  expect_equal(lib_search(input2), exp_output2)
})





