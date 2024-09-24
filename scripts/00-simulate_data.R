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

## Since the dataset contains information that is not in my intrest and will not effect my understanding of my intrest. I will later remove them in the data selection section, thus, I'm not going to be simulated information about these colum (eg. PROGRAM_NAME, FACILITY_NAME, etc.)


#### Simulate data ####

## Date of data collection
#Since the date in the data are collected each day at 4:00 am.
start_data <- as.Date("2017-01-01")
end_date <- as.Date("2020-12-31")
Date_seq = seq(from = start_data, to = end_date, by = "day")
Date <- rep(Date_seq, each = 4)


## The City of shelter
# Randomly pick a city to locate the shelter from all cities that has shelters suggested by the dataset from 2017 to 2020.
appeared_city = unique(c(unique(raw_2017_shelter$SHELTER_CITY), 
              unique(raw_2018_shelter$SHELTER_CITY),
              unique(raw_2019_shelter$SHELTER_CITY),
              unique(raw_2020_shelter$SHELTER_CITY)
              ))
City = sample(appeared_city, size = length(Date), replace = TRUE)

## The Province of shelter
# Randomly pick a city to locate the shelter from all provinces that has shelters suggested by the dataset from 2017 to 2020.
appeared_province = unique(c(unique(raw_2017_shelter$SHELTER_PROVINCE), 
                         unique(raw_2018_shelter$SHELTER_PROVINCE),
                         unique(raw_2019_shelter$SHELTER_PROVINCE),
                         unique(raw_2020_shelter$SHELTER_PROVINCE)
                         ))
Province = sample(appeared_province, size = length(Date), replace = TRUE)



## The amount each sector occupying the shelter, group by Cities
# Randomly pick a type of Sector who is using the shelter from all Sectors exist within our focus suggested by the dataset from 2017 to 2020.
appeared_sectors = unique(c(unique(raw_2017_shelter$SECTOR), 
                             unique(raw_2018_shelter$SECTOR),
                             unique(raw_2019_shelter$SECTOR),
                             unique(raw_2020_shelter$SECTOR)
))
Sectors = sample(appeared_sectors, size = length(Date), replace = TRUE)






write_csv(data, file = "starter_folder-main/data/raw_data/simulated.csv")
