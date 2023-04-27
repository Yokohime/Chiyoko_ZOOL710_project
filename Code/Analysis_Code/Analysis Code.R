###############################
# analysis script
#
#this script loads the cleaned data and utilizes coding to help analyze the data.
#the data to help anwser questions and saves it as Rds file in the Analysis_Code folder


## ---- packages --------
##Required packages...
update.packages(ask=FALSE)
require(dplyr)
require(qpcR)
require(tidyverse)

## ---- loaddata --------

#path to data
data_location <- "../../Data/Processed_Data/AllSpeciesAllGenes.csv"
data_path <- "../../Data/Processed_Data"

#load data

dat <- read.csv(data_location, check.names=FALSE)


Genes <- as.data.frame(dat)
dim(Genes)
attributes(Genes



G2 <- as_tibble(Genes)  #Make the dataframe as a tibble
G2 %>% duplicated
unique(Genes) #All the unique genes found between all Species of Fischerella
anyDuplicated(Genes) #Trying to identify if there is any shared genes between all species




