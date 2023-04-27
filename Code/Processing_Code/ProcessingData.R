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
dat <- read.delim2("../../Data/Raw_Data/JS2/JS2_Annotations/prokka_out/new_JS2_hybrid_assembly_contigs.tsv")
dat2 <- read.delim2("../../Data/Raw_Data/F.musicola/F. musicola_annotation/F_musicola.tsv")
dat3 <- read.delim2("../../Data/Raw_Data/F.major/F.major_annotations/F_major.tsv")
dat4 <- read.delim2("../../Data/Raw_Data/F.halapii/F.halapii_annotations/F_halapii.tsv")
dat5 <- read.delim2("../../Data/Raw_Data/F.thermalis/F.thermalis_annotation/F.thermalis.tsv")
dat6 <- read.delim2("../../Data/Raw_Data/F.peptidasii/F.peptidasii_annotation/F_pepsitadii.tsv")
dat7 <- read.delim2("../../Data/Raw_Data/F.welwii/F.welwii_annotations/F_welwii.tsv")
dat8 <- read.delim2("../../Data/Raw_Data/Gleobacter_violaceus/G.violaceus_annotations/G_violaceus.tsv")

##Looking into the data
#JS2
names(dat)  #Identify what variables are present
dat$gene  #We want the genes from JS2, so looking at what genes were found
JS2 <- data.frame("gene"=dat[dat$gene != "", "gene"])  #We are only interested in the genes that were identifiable, so we leave out any hypothetical genes returned
JS2

#we do this for all 7 Species, grab the `Gene` column from each dataset, identify how many total genes are present and remove all hypothetical genes.


##F.muscicola
dat2$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.muscicola <- data.frame( "gene"=dat2[dat2$gene != "", "gene"])  
F.muscicola

mdat <- merge(JS2, F.muscicola) #1910 shared genes between JS2 & F.muscicola

##F.major
dat3$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.major <-  data.frame( "gene"=dat3[dat3$gene != "", "gene"])  
F.major


mdat <- merge(mdat, F.major) #1587 shared genes between JS2, F.muscicola, & F.major

##F.halapii
dat4$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.halapii<- data.frame( "gene"=dat4[dat4$gene != "", "gene"] )
F.halapii

mdat <- merge(mdat, F.halapii) #1408 shared genes between JS2, F.muscicola, F.major, & F.halapii

##F.thermalis
dat5$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.thermalis <-  data.frame( "gene"=dat5[dat5$gene != "", "gene"] ) 
F.thermalis

mdat <- merge(mdat, F.thermalis) #1349 shared genes between JS2, F.muscicola, F.major, F.halapii & F.thermalis


##F.pepsitadii
dat6$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.pepsitadii <- data.frame( "gene"=dat6[dat6$gene != "", "gene"] ) 
F.pepsitadii

mdat <- merge(mdat, F.pepsitadii)  #1253 shared genes between JS2, F.muscicola, F.major, F.halapii, F.thermalis, & F.pepsitadii


##F.welwii
dat7$gene  #We want the genes from F.muscicola, so looking at what genes were found
F.welwii <- data.frame( "gene"=dat7[dat7$gene != "", "gene"] ) 
F.welwii

mdat <- merge(mdat, F.welwii) #1213 shared genes between JS2, F.muscicola, F.major, F.halapii, F.thermalis, F.pepsitadii, & F.welwii


##G.violaceus
dat8$gene  #We want the genes from G.violaceus, so looking at what genes were found
G.violaceus <- data.frame( "gene"=dat8[dat8$gene != "", "gene"] )   
G.violaceus

mdat <- merge(mdat, G.violaceus) #694 genes shared between all Fischerella species and the outgroup , Gleobacter violaceus
print(mdat)

save_data_location <- "../../Data/Processed_Data/AllSpecieSharedGenes.rds"
saveRDS(mdat, file = save_data_location)
save_data_location_csv <- "../../Data/Processed_Data/AllSpeciesSharedGenes.csv"
write.csv(mdat, file = save_data_location_csv, row.names=FALSE, quote=FALSE)



##Combine all genes into one dataframe so we can compare all genes within this Genus
F2 <- qpcR:::cbind.na(JS2gene,F.halapii) #Create a dataframe with JS2 & F.halapii genes, has 2386 entries
F3 <- qpcR:::cbind.na(F2,F.major) #Add F.major to the dataframe
F4 <- qpcR:::cbind.na(F3,F.muscicola) #Add F.muscicola to the dataframe
F5 <- qpcR:::cbind.na(F4 ,F.pepsitadii) #Add F.pepsitadii to the dataframe
F6 <- qpcR:::cbind.na(F5 ,F.thermalis) #Add F.thermalis to the dataframe
F7 <- qpcR:::cbind.na(F6 ,F.welwii) #Add F.welwii to the dataframe
F8 <- qpcR:::cbind.na(F7 ,G.violaceus) #Add G.violaceus to the dataframe

F8 #Final dataframe with all 8 Species and their genes


print(F8)

save_data_location <- "../../Data/Processed_Data/AllSpeciesAllGenes.rds"
saveRDS(F8, file = save_data_location)
save_data_location_csv <- "../../Data/Processed_Data/AllSpeciesAllGenes.csv"
write.csv(F8, file = save_data_location_csv, row.names=FALSE, quote=FALSE) 


AllUnique <- F8[!F8 %in% mdat] #Trying to find the unique genes in each species by removing all the shared ones


save_data_location <- "../../Data/Processed_Data/AllSpeciesUniqueGenes.rds"
saveRDS(AllUnique, file = save_data_location)
save_data_location_csv <- "../../Data/Processed_Data/AllSpeciesUniqueGenes.csv"
write.csv(AllUnique, file = save_data_location_csv, row.names=FALSE, quote=FALSE) 


##Investigating inhibitory and toxin production genes

JS2P <- dat$product  #We want the products from JS2
JS2_Products <- JS2P[JS2P != "hypothetical protein"]

save_data_location <- "../../Data/Processed_Data/JS2_Products.rds"
saveRDS(JS2_Products, file = save_data_location)

save_data_location_csv <- "../../Data/Processed_Data/JS2_Products.csv"
write.csv(JS2_Products, file = save_data_location_csv, row.names=FALSE, quote=FALSE) #Save the table

