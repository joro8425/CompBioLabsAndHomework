#Final Project
#setting proper working directory
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Project")

#setting all data sets to variables
projectsummarydata <- read.csv(file.choose("Adamczyk_PLOSdata.csv"))
projectlakedata <- read.csv(file.choose("Adamczyk_YSI_PLOSdata.csv"))
projectabundancedata <- read.csv(file.choose("Adamczyk_zooplankton_abundance_PLOSdata.csv"))
projectlengthdata <- read.csv(file.choose("Adamczyk_zooplankton_lengths_PLOSdata.csv"))


