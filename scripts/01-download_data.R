#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Maggie Zhang
# Date: 19 September 2024
# Contact: maggie.zhang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: the data planned in simulation
# Any other information needed? NO 


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dprly)

#### Download data ####

### Shelter occupancy 2020 ###
#Downloaded data for Shelter occupancy in the year 2020 from OpenDataToronto as csv. file

raw_2020_shelter <- read_csv(file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/8a6eceb2-821b-4961-a29d-758f3087732d/resource/9e076fe4-2f86-48d7-a6e4-93710ca715ae/download/Daily%20shelter%20occupancy%202020.csv",
                             show_col_types = FALSE)
#Save Data
write_csv(raw_2020_shelter, 
          "data/raw_data/raw_2020_shelter_data.csv") 


### Shelter occupancy 2019 ###
#Downloaded data for Shelter occupancy in the year 2019 from OpenDataToronto as csv. file

raw_2019_shelter <- read_csv(file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/8a6eceb2-821b-4961-a29d-758f3087732d/resource/3ea9d9ba-f05f-4055-bcc3-333f699c5e77/download/Daily%20shelter%20occupancy%202019.csv",
                             show_col_types = FALSE)
#Save Data
write_csv(raw_2019_shelter, 
          "data/raw_data/raw_2019_shelter_data.csv") 


### Shelter occupancy 2018 ###
#Downloaded data for Shelter occupancy in the year 2018 from OpenDataToronto as csv. file

raw_2018_shelter <- read_csv(file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/8a6eceb2-821b-4961-a29d-758f3087732d/resource/af47a4d4-4339-446d-bf53-7983f78a80bc/download/Daily%20shelter%20occupancy%202018.csv",
                             show_col_types = FALSE)
#Save Data
write_csv(raw_2018_shelter, 
          "data/raw_data/raw_2018_shelter_data.csv") 


### Shelter occupancy 2017 ###
#Downloaded data for Shelter occupancy in the year 2017 from OpenDataToronto as csv. file

raw_2017_shelter <- read_csv(file = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/8a6eceb2-821b-4961-a29d-758f3087732d/resource/c07041d2-633f-43cf-8372-8133474bf4f4/download/Daily%20shelter%20occupancy%202017.csv",
                             show_col_types = FALSE)
#Save Data
write_csv(raw_2017_shelter, 
          "data/raw_data/raw_2017_shelter_data.csv") 
