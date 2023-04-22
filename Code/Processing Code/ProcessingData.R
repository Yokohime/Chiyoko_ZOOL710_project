###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the Processed_data folder

## ---- packages --------
##Required packages...

require(dplyr)
require(qpcR)
require(tidyverse)

## ---- loaddata --------

#load data

dat <- read.delim2("Data/Raw Data/JS2/JS2 Annotations/prokka_out/new_JS2_hybrid_assembly_contigs.tsv")
dat2 <- read.delim2("Data/Raw Data/F.musicola/F. musicola annotation/F_musicola.tsv")
dat3 <- read.delim2("Data/Raw Data/F.major/F.major annotations/F_major.tsv")
dat4 <- read.delim2("Data/Raw Data/F.halapii/F.halapii annotations/F_halapii.tsv")
dat5 <- read.delim2("Data/Raw Data/F.thermalis/F.thermalis annotation/F_thermalis.tsv")
dat6 <- read.delim2("Data/Raw Data/F.peptidasii/F.peptidasii annotation/F_pepsitadii.tsv")
dat7 <- read.delim2("Data/Raw Data/F.welwii/F.welwii annotations/F_welwii.tsv")

##Looking into the data
#JS2
names(dat)  #Identify what variables are present
dat$gene  #We want the genes from JS2, so looking at what genes were found
JS2gene <- dat$gene[dat$gene != ""]  #We are only interested in the genes that were identifiable, so we leave out any hypothetical genes returned
JS2gene 

#we do this for all 7 Species, grab the `Gene` column from each dataset, identify how many total genes are present and remove all hypothetical genes.


##F.muscicola
dat2$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.muscicola_gene <- dat2$gene[dat2$gene != ""]  
F.muscicola_gene


##F.major
dat3$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.major_gene <- dat3$gene[dat3$gene != ""]  
F.major_gene


##F.halapii
dat4$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.halapii_gene <- dat4$gene[dat4$gene != ""]  
F.halapii_gene

##F.thermalis
dat5$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.thermalis_gene <- dat5$gene[dat5$gene != ""]  
F.thermalis_gene


##F.pepsitadii
dat6$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.pepsitadii_gene <- dat6$gene[dat6$gene != ""]  
F.pepsitadii_gene


##F.welwii
dat7$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.welwii_gene <- dat7$gene[dat7$gene != ""]  
F.welwii_gene

##Combine all genes into one dataframe so we can compare all genes within this Genus
F2 <- qpcR:::cbind.na(JS2gene,F.halapii_gene) #Create a dataframe with JS2 & F.halapii genes
F3 <- qpcR:::cbind.na(F2,F.major_gene) #Add F.major to the dataframe
F4 <- qpcR:::cbind.na(F3,F.muscicola_gene) #Add F.muscicola to the dataframe
F5 <- qpcR:::cbind.na(F4 ,F.pepsitadii_gene) #Add F.pepsitadii to the dataframe
F6 <- qpcR:::cbind.na(F5 ,F.thermalis_gene) #Add F.thermalis to the dataframe
F7 <- qpcR:::cbind.na(F6 ,F.welwii_gene) #Add F.welwii to the dataframe
F7 #Final dataframe with all 7 Species and their genes


print(F7)
save_data_location <- "Data/Processed Data/AllSpeciesAllGenes.rds"
saveRDS(F7, file = save_data_location)
save_data_location_csv <- "Data/Processed Data/AllSpeciesAllGenes.csv"
write.csv(F7, file = save_data_location_csv, row.names=FALSE, quote=FALSE) 


