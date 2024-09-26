#### Preamble ####
# Purpose: Simulates Data
# Author: Maggie Zhang 
# Date: 19 September 2024
# Contact: maggiey.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: First sketch the idea of 
# Any other information needed? Not much


#### Workspace setup ####
library(tidyverse)

## Since the dataset contains information that is not in my intrest and will not effect my understanding of my intrest. I will later remove them in the data selection section, thus, I'm not going to be simulated information about these colum (eg. PROGRAM_NAME, FACILITY_NAME, etc.)


#### Simulate data ####

## Date of data collection
set.seed(1009633096)
start_data <- as.Date("2017-01-01")
end_date <- as.Date("2020-12-31")
Date_seq = seq(from = start_data, to = end_date, by = "day") |> as.character()


## The City of shelter
appeared_city <-  unique(c(unique(raw_2017_shelter$SHELTER_CITY), 
              unique(raw_2018_shelter$SHELTER_CITY),
              unique(raw_2019_shelter$SHELTER_CITY),
              unique(raw_2020_shelter$SHELTER_CITY)
              ))


# All involved sector categories:
sectors <- c("women", "men", "youth", "co-ed", "family")



## The amount of total Occupancy, 


# Create an empty data frame for the simulated data
simulated_dataset <- data.frame(
  DATE = as.Date(character()),
  SHELTER_CITY = character(),
  SECTOR = character(),
  TOTAL_OCCUPANCY = numeric(),
  TOTAL_CAPACITY = numeric(),
  stringsAsFactors = FALSE
)


# Simulate data for each day
set.seed(1009633096)

for (date in Date_seq) {
  for (city in appeared_city) {
    for (sector in sectors) {
      # Simulate total occupancy and total capacity
      total_occupancy <- rnorm(1, mean = 1600, sd = 500)  # Mean is approx. mid-range of 0 to 3279
      total_capacity <- rnorm(1, mean = 1800, sd = 500)  # Mean is approx. mid-range of 0 to 3619
      
      # Ensure non-negative values
      total_occupancy <- max(0, round(total_occupancy))
      total_capacity <- max(0, round(total_capacity))
      
      # Add a new row to the data frame
      simulated_dataset <- rbind(simulated_dataset, data.frame(
        DATE = date,
        SHELTER_CITY = city,
        SECTOR = sector,
        TOTAL_OCCUPANCY = total_occupancy,
        TOTAL_CAPACITY = total_capacity,
        stringsAsFactors = FALSE
      ))
    }
  }
}

# View the first few rows of the simulated dataset
# head(simulated_dataset)


# Write and store the simulated dataset
write_csv(simulated_dataset, file = "data/raw_data/simulated_dataset_shelter_data.csv")
