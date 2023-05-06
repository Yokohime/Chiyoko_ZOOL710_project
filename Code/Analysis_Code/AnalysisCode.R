###############################
# analysis script
#
#this script loads the cleaned data and utilizes coding to help analyze the data.
#the data to help anwser questions and saves it as Rds file in the Analysis_Code folder


## ---- packages --------
##Required packages...

require(dplyr)
require(tidyverse)

## ---- loaddata --------

#path to data
data_location <- "../../Data/Processed_Data/JS2_Products.csv"
data_path <- "../../Data/Processed_Data"

#load data

dat <- read.csv(data_location, check.names=FALSE)

attributes(dat)
Unique <- unique(dat) #All the unique genes found between all Species of Fischerella
Duplicate <- anyDuplicated(dat) #Trying to identify if there is any shared genes between all species

options(knitr.kable.NA = "")
knitr::kable(Unique, digits=1)
save_data_location <- "../../Data/Processed_Data/JS2Products.rds"
saveRDS(Unique, file = save_data_location)


