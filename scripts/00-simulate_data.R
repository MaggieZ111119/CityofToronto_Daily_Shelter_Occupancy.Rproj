#### Preamble ####
# Purpose: Simulates Data
# Author: Maggie Zhang 
# Date: 19 September 2024
# Contact: maggiey.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: First sketch the idea of 
# Any other information needed? Not much

set.seed(1009633096)

#### Workspace setup ####
library(tidyverse)

start_data <- as.Date("2018-01-01")
end_date <- as.Date("2023-12-31")

#### Simulate data ####
number_of_date <- 100

data <-
  tibble(
    date = as.Date(runif(n = number_of_date, 
                         min = as.numeric(start_data), 
                         max = as.numeric(end_date))),
    number_of_marriage = rpois(n = num_of_date, lambda = 10)
  )


write_csv(data, file = "starter_folder-main/data/raw_data/simulated.csv")
