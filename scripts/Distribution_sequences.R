library(dplyr)
library(ggplot2)
library(Biostrings)
#------------------------------------------------------------------------------------------------
#investigate data availability

viruses <- read.csv("/Users/nitarawijayatilake/Downloads/sequences.csv")
str(viruses)

#filter for more specific locations past country level 
viruses_filtered <- viruses[grep(":", viruses$Geo_Location), ]
# Convert the 'release date' column to Date type
viruses_filtered$release_date <- as.Date(viruses_filtered$release_date)
# Filter sequences released after January 2005 
viruses_filtered <- viruses_filtered %>%
  filter(ReleaseDate > as.Date("2005-01-01"))

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#filter out domestic animals 
domestic_animals <- c("Homo sapiens", "Gallus gallus", "Bos taurus", "Equus caballus", "Sus scrofa domesticus", "Ovis aries", "Capra aegagrus hircus", "Oryctolagus cuniculus", "Anser anser domesticus", "Cygnus olor", "Meleagris gallopavo", "Aves domesticus", "Lepus europaeus", "Equus asinus", "Camelus dromedarius", "Sus scrofa", "Bubalus bubalis")

#rabies
rabies<-readDNAStringSet("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Rabies/rabies.fasta", format = "fasta")
rabies_filtered<- rabies[!grepl(paste(domestic_animals, collapse = "|"), names(rabies))]
#west nile
west_nile<-readDNAStringSet("", format = "fasta")
west_nile_filtered<- west_nile[!grepl(paste(domestic_animals, collapse = "|"), names(west_nile))]


#investigate abundance of sequences on the species level after filtering
species_count<- viruses %>%
  group_by(Species) %>%
  summarize(Total_Sequences = n())
