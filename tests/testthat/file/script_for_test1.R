# This is a test script for the librely unit tests
# It is a basic script that uses functions from dplyr and base R.

library(dplyr) # Used for data frame manipulation
library(tibble)

df <- tibble(x = rnorm(1000),
             y = rnorm(1000))

df <- df %>%
  mutate(z = (x + y)/2) %>%
  summarize_all(c("mean", "sd"))
