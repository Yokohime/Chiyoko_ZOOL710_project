###############################
# analysis script
#
#this script loads the cleaned data and utilizes coding to help analyze the data.
#the data to help anwser questions and saves it as Rds file in the Analysis_Code folder


## ---- packages --------
##Required packages...

require(dplyr)
require(qpcR)
require(tidyverse)

## ---- loaddata --------

#path to data
data_location <- "../../Cyano/Data/Processed Data/AllSpeciesAllGenes.csv"
data_path <- "../../Data/Processed Data/"

#load data

dat <- read.csv(data_location, check.names=FALSE)


###Finding similarities between two vectors of strings

##JS2 comparison: seeing if any of the genes in JS2 are also present in the other species
JS2vsFH<- dat$JS2gene[dat$JS2gene %in% dat$F.halapii_gene]  #compare the genes in JS2 vs the genes in F.halapii
JS2vsFH  #shared genes between these two speices

JS2vsFmajor<- dat$JS2gene[dat$JS2gene %in% dat$F.major_gene]  #compare the genes in JS2 vs the genes in F.major
JS2vsFmajor  #shared genes between these two speices

JS2vsFmus<- dat$JS2gene[dat$JS2gene %in% dat$F.muscicola_gene]  #compare the genes in JS2 vs the genes in F.muscicola
JS2vsFmus  #shared genes between these two speices

JS2vsFP<- dat$JS2gene[dat$JS2gene %in% dat$F.pepsitadii_gene]  #compare the genes in JS2 vs the genes in F.pepsitadii
JS2vsFP  #shared genes between these two speices

JS2vsFT<- dat$JS2gene[dat$JS2gene %in% dat$F.thermalis_gene]  #compare the genes in JS2 vs the genes in F.thermalis
JS2vsFT #shared genes between these two speices

JS2vsFW<- dat$JS2gene[dat$JS2gene %in% dat$F.welwii_gene]  #compare the genes in JS2 vs the genes in F.welwii
JS2vsFW  #shared genes between these two speices

##F.halapii:  seeing if any of the genes in F.halapii are also present in the other species

FHvsFmajor<- dat$F.halapii_gene[dat$F.halapii_gene %in% dat$F.major_gene]  #compare the genes in F.halapii vs F.major
FHvsFmajor  #shared genes between these two speices

FHvsFmus<- dat$F.halapii_gene[dat$F.halapii_gene %in% dat$F.muscicola_gene]  #compare the genes in F.halapii vs F.muscicola
FHvsFmus  #shared genes between these two speices

FHvsFP<- dat$F.halapii_gene[dat$F.halapii_gene %in% dat$F.pepsitadii_gene]  #compare the genes in F.halapii vs F.pepsitadii
FHvsFP  #shared genes between these two speices

FHvsFT<- dat$F.halapii_gene[dat$F.halapii_gene %in% dat$F.thermalis_gene]  #compare the genes in F.halapii vs F.thermalis
FHvsFT  #shared genes between these two speices

FHvsFW<- dat$F.halapii_gene[dat$F.halapii_gene %in% dat$F.welwii_gene]  #compare the genes in F.halapii vs F.welwii
FHvsFW  #shared genes between these two speices

##F.major:  seeing if any of the genes in F.major are also present in the other species

FmajorvsFmus<- dat$F.major_gene[dat$F.major_gene %in% dat$F.muscicola_gene]  #compare the genes in F.major vs F.muscicola
FmajorvsFmus  #shared genes between these two speices

FmajorvsFP<- dat$F.major_gene[dat$F.major_gene %in% dat$F.pepsitadii_gene]  #compare the genes in F.major vs F.pepsitadii
FmajorvsFP  #shared genes between these two speices

FmajorvsFT<- dat$F.major_gene[dat$F.major_gene %in% dat$F.thermalis_gene]  #compare the genes in F.major vs F.thermalis
FmajorvsFT  #shared genes between these two speices

FmajorvsFW<- dat$F.major_gene[dat$F.major_gene %in% dat$F.welwii_gene]  #compare the genes in F.major vs F.welwii
FmajorvsFW  #shared genes between these two speices

##F.muscicola: seeing if any of the genes in F.muscicola are also present in the other species

FmusvsFP<- dat$F.muscicola_gene[dat$F.muscicola_gene %in% dat$F.pepsitadii_gene]  #compare the genes in F.muscicola vs F.pepsitadii
FmusvsFP  #shared genes between these two speices

FmusvsFT<- dat$F.muscicola_gene[dat$F.muscicola_gene %in% dat$F.thermalis_gene]  #compare the genes in F.muscicola vs F.thermalis
FmusvsFT  #shared genes between these two speices

FmusvsFW<- dat$F.muscicola_gene[dat$F.muscicola_gene %in% dat$F.welwii_gene]  #compare the genes in F.muscicola vs F.welwii
FmusvsFW  #shared genes between these two speices

##F.pepsitadii: seeing if any of the genes in F.pepsitadii are also present in the other species

FPvsFT<- dat$F.pepsitadii_gene[dat$F.pepsitadii_gene %in% dat$F.thermalis_gene]  #compare the genes in F.pepsitadii vs F.thermalis
FPvsFT  #shared genes between these two speices

FPvsFW<- dat$F.pepsitadii_gene[dat$F.pepsitadii_gene %in% dat$F.welwii_gene]  #compare the genes in F.pepsitadii vs F.welwii
FPvsFW  #shared genes between these two speices

##F.thermalis: seeing if any of the genes in F.thermalis are also present in the other species

FTvsFW<- dat$F.thermalis_gene[dat$F.thermalis_gene %in% dat$F.welwii_gene]  #compare the genes in F.thermalis vs F.welwii
FTvsFW  #shared genes between these two speices


Genes <- as.data.frame(dat)
dim(Genes)
attributes(Genes)

C1 <- dat$JS2gene[dat$JS2gene %in% dat$F.halapii_gene]

C2 <- C1[C1 %in% dat$F.major_gene] #Shared genes between JS2, F.halapii, and F.major
C2

C3 <- C2[C2 %in% dat$F.muscicola_gene] #Shared genes between JS2, F.halapii, F.major, and F.muscicola
C3

C4 <- C3[C3 %in% dat$F.pepsitadii_gene] #Shared genes between JS2, F.halapii, F.major, F.muscicola, and F.pepsitadii
C4

C5 <- C4[C4 %in% dat$F.thermalis_gene] #Shared genes between JS2, F.halapii, F.major, F.muscicola, F.pepsitadii, and F.thermalis
C5

C6 <- C5[C5 %in% dat$F.welwii_gene] #Shared genes between JS2, F.halapii, F.major, F.muscicola, F.pepsitadii, F.thermalis, and F.welwii
C6 #92 shared genes between all 7 species

print(C6)
save_data_location <- "Analysis Code/AllSpeciesSharedGenes.rds"
saveRDS(C6, file = save_data_location)

save_data_location_csv <- "Analysis Code/AllSpeciesSharedGenes.csv"
write.csv(C6, file = save_data_location_csv, row.names=FALSE, quote=FALSE) #Save the table



G2 <- as_tibble(Genes)  #Make the dataframe as a tibble
G2 %>% duplicated
unique(Genes) #All the unique genes found between all Species of Fischerella
anyDuplicated(Genes) #Trying to identify if there is any shared genes between all species


##Investigating inhibitory and toxin production genes

JS2P <- dat$product  #We want the products from JS2
JS2_Products <- JS2P[JS2P != "hypothetical protein"]

save_data_location <- "Analysis Code/JS2_Products.rds"
saveRDS(JS2_Products, file = save_data_location)

save_data_location_csv <- "Analysis Code/JS2_Products.csv"
write.csv(JS2_Products, file = save_data_location_csv, row.names=FALSE, quote=FALSE) #Save the table


