#### Preamble ####
# Purpose: Test and check of the simulated data
# Author: Maggie Zhang
# Date: 26 September 2024
# Contact: maggiey.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: have the data ready into R
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)


#### Test data ####
simulated_dataset <- read.csv("data/raw_data/simulated_dataset_shelter_data.csv")


## TEST1: Missing Value
num_missing_values <- sum(is.na(simulated_dataset))
cat("Total missing values: ", num_missing_values, "\n")


## TEST2: Negative value (Total_Occupancy and Total_Capacity)
negative_occupancy <- sum(simulated_dataset$Total_Occupancy < 0)
negative_capacity <- sum(simulated_dataset$Total_Capacity < 0)
cat("Total negative occupancy values: ", negative_occupancy, "\n")
cat("Total negative capacity values: ", negative_capacity, "\n")


## TEST3: Date Format is consistent
incorrect_dates <- sum(!grepl("^\\d{4}-\\d{2}-\\d{2}$", simulated_dataset$OCCUPANCY_DATE))

if (incorrect_dates > 0) {
  message("Warning: ", incorrect_dates, " dates are not in the correct format (YYYY-MM-DD).")
} else {
  message("All dates are in the correct format (YYYY-MM-DD).")
}

