# input: a script
input1 <- "file/script_for_test1.R"
input3 <- "file/script_for_test3.R"

# expected output: a list that has the information of number of lines and characters
exp_output1 <- list(num_line = 7, num_char = 193)
exp_output3 <- list(num_line = 0, num_char = 0)

test_that("In case the input is not a .R script", {

  expect_equal(lib_lines("file/script_for_test1.txt"), "The input should be a .R script")
  expect_equal(lib_lines("file/script_for_test1.pdf"), "The input should be a .R script")

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_lines(input1, "script"))

})

test_that("In case the input is not a string", {

  expect_error(lib_lines(123))
  expect_error(lib_lines(c(1,2,3)))
})


test_that("test if the the ouput is correct", {
  expect_equal(lib_lines(input1), exp_output1)
  expect_equal(lib_lines(input3), exp_output3)
})







