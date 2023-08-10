library("ape")

#west nile
#west nile
west_nile_tree<- read.tree("/Users/nitarawijayatilake/Downloads/output.boottrees")
west_nile_metadata <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/West Nile/west_nile_metadata.csv")
west_nile_tree<- west_nile_tree[[1]]
west_nile_tree$metadata <- west_nile_metadata[match(west_nile_tree[["tip.label"]], west_nile_metadata[["AccessionNumber"]]), ]
west_nile_geo_location <- west_nile_tree$metadata$Geo_location
names(west_nile_geo_location) <- west_nile_tree$metadata$AccessionNumber
west_nile_tree$tip.label <- west_nile_geo_location[west_nile_tree$tip.label]
plot(west_nile_tree, show.tip.label = TRUE, label.offset = 0.5)

#rabies
rabies_tree<- read.tree("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Rabies/RAxML_bootstrap.testR.PID.8")
rabies_metadata <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Rabies/rabies_metadata.csv")
rabies_tree<- rabies_tree[[1]]
rabies_tree$metadata <- rabies_metadata[match(rabies_tree[["tip.label"]], rabies_metadata[["Geo_location"]]), ]
rabies_geo_location <- rabies_metadata$Geo_location
names(rabies_geo_location) <- rabies_tree$metadata$AccessionNumber
rabies_tree$tip.label <-rabies_metadata$Geo_location
#chik

#rabies
chik_tree<- read.tree("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Chikungunya/RAxML_bipartitionsBranchLabels.MLTB_output")
chik_metadata <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Chikungunya/chikungunya_metadata.csv")
chik_tree$metadata <- chik_metadata[match(chik_tree[["tip.label"]], chik_metadata[["AccessionNumber"]]), ]
chik_geo_location <- chik_metadata$Geo_location
names(chik_geo_location) <- chik_tree$metadata$AccessionNumber
chik_tree$tip.label <- chik_tree$metadata$Geo_location
plot(chik_tree, show.tip.label = TRUE, label.offset = 0.5)


#yello fever
yellow_fever_tree<- read.tree("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Yellow Fever/RAxML_bootstrap.testR.PID.9")
yellow_fever_metadata <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Yellow Fever/yellow_fever_metadata.csv")
yellow_fever_tree$metadata <- yellow_fever_metadata[match(yellow_fever_tree$tip.label, yellow_fever_metadata$AccessionNumber), ]
yellow_fever_geo_location <- yellow_fever_metadata$Geo_location
names(yellow_fever_geo_location) <- yellow_fever_tree$metadata$AccessionNumber
yellow_fever_tree$tip.label <- yellow_fever_tree$metadata$Geo_Location

# Plot the tree with the updated tip labels
plot(yellow_fever_tree, show.tip.label = TRUE, label.offset = 0.5)

l#dengue
dengue_tree<- read.tree("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Dengue/RAxML_bootstrap.testR.PID.9")
dengue_metadata <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Dengue/dengue_metadata.csv")
dengue_tree$metadata <- dengue_metadata[match(dengue_tree$tip.label, dengue_metadata$AccessionNumber), ]
dengue_geo_location <- dengue_metadata$Geo_location
names(dengue_geo_location) <- dengue_tree$metadata$AccessionNumber
dengue_tree$tip.label <- dengue_geo_location

#bat
bat_tree<- read.tree("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Bat coronavirus/RAxML_bootstrap (2).testR")
bat_metadata<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Bat coronavirus/ bat_corona_metadata.csv")
bat_tree$metadata <- bat_metadata[match(bat_tree$tip.label, bat_metadata$AccessionNumber), ]
bat_geo_location <- bat_metadata$Geo_location
names(bat_geo_location) <- bat_tree$metadata$AccessionNumber
bat_tree$tip.label <-bat_tree$metadata$Geo_location
x