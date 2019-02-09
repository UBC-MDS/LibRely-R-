# input: a script
input <- "tests/scripts/summarized_data.R"

# expected output: a text file documenting the dependancies
exp_output <- read_file("tests/sample.txt")


test_that("The Text file generated is as expected with simple case", {

  expect_equal(read_file(lib_writeme("tests/scripts/summarized_data.R")), exp_output)

})

