
context("Test lib_search")

# input: a script
input1 <- "file/script_for_test1.R"
input3 <- "file/script_for_test3.R"

# expected output: a list of dependencies
exp_output1 <- c("dplyr","tibble")


test_that("In case the input is not a .R script", {

  expect_equal(lib_search("file/script_for_test1.txt"), "The input should be a .R script")
  expect_equal(lib_search("file/script_for_test1.pdf"), "The input should be a .R script")

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_search(input1, "script"))

})


test_that("test if the the ouput is correct", {

  expect_equal(lib_search(input1), exp_output1)
  expect_equal(lib_search(input3), character(0))
})
