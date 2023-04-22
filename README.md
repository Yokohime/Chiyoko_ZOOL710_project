# Chiyoko_ZOOL710_project
Author: Chiyoko Onouye
Date: 04-05-2023


# Overview
This repository contains genomic data for the Genus Fischerella and aims to do comparative analysis between species within this Genus using their Whole Genome Sequence--found in the `Raw Data` folder > `Species name` folder > `Species name Genome`. 


![JS2-Fischerella sp.](https://github.com/Yokohime/Chiyoko_ZOOL710_project3/blob/main/Products/Manuscript/Images/JS2_7.jpg)


# History

2023-02-16 First release with Data and Code folders with materials for data cleaning and initial exploration.

2023-04-21 Added all of the genomes and annotations.

2023-04-22 Added picture of Cyanobacteria.

# Acknowledgments

The genomes were sequences using a GitHub by Ethan Hill that can be cloned and modified from https://github.com/ehill-iolani/ulana.git
The Docker Desktop script by Ethan Hill can also be found at https://hub.docker.com/r/ethill/ulana
Whole genome sequence was done thanks to Dr.Stuart Donachie and his going out to the volcano and collecting samples, Iolani High School and Dr.Rebecca Prescott for help with sequencing, and Ethan Hill for help with the genome annotations.
A huge mahalo to these authors for their generosity in sharing their knowledge.



# Software requirements
This template lays out a data analysis project and report writing using R, Quarto, Github, Docker Desktop, Notepad ++, and Ulana.

For more R packages supporting reproducible research check out the taskview https://cran.r-project.org/web/views/ReproducibleResearch.html



# Workflow

This template also uses the convention that Folder names begin with a capital letter.

All data goes into the Data folder and any subfolders.
All code goes into the Code folder or subfolders.
All results (figures, tables, computed values) go into Results folder or subfolders.
All products (manuscripts, supplement, presentation slides, web apps, etc.) go into Products subfolders.
See the various README.md files in those folders for some more information.


Please see the README.md files in each folder for more details.

This template has been populated with genomic data for the species in the Genus Fischerella in the `Raw Data` folder.
The `Processing Code` folder contains several files that load the raw data, perform a bit of cleaning, and save the result in the `Processed Data` folder.
The `Analysis Code` folder contains several files that load the processed data,and do an exploratory analysis. These files produce figures and some numeric output (tables), which are saved to the results folder.
The `Products` folder contains an example bibtex and CSL style files for references. Those files are used by the example manuscript and slides.
The `Manuscript` folder contains a template for a report written as Quarto file. There is also a sub-folder containing an example template for a supplementary material file as is common in scientific articles these days.


# Getting started
This is a Github template repository. The best way to get it and start using it is by following these steps.

Once you got the repository, you can check out the examples by executing them in order.

First run the processing code, which will produce the processed data.
Then run the analysis scripts, which will take the processed data and produce some results.
Then you can run the manuscript, poster and slides example files in any order. Those files pull in the generated results and display them. These files also pull in references from the bibtex file and format them according to the CSL style.
