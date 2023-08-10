library(stringdist)
library(ape)

# West Nile Data 
# ------------------------

# Combine country and city for matching
west_nile_coords_combined <- paste(west_nile_coords$Country, west_nile_coords$City, sep = ": ")

# Match tip labels to combined locations
matching_indices <- stringdist::amatch(west_nile_coords_combined, west_nile_tree$tip.label, maxDist = )

# Subset matched coordinates and tree data
west_nile_coords_matched <- west_nile_coords[!is.na(matching_indices), ]
west_nile_coords_combined_matched <- west_nile_coords_combined[!is.na(matching_indices)]
west_nile_branch_lengths <- west_nile_tree$edge.length[matching_indices]
tip_labels <- west_nile_tree$tip.label[matching_indices]

# Subset data for matched locations
sum_extracted_values <- west_nile_coords$average_values[matching_indices]
extracted_temp <- west_nile_coords$extracted_temp[matching_indices]
extracted_precip <- west_nile_coords$extracted_precip[matching_indices]
lat <- west_nile_coords$lat[matching_indices]
lon <- west_nile_coords$lon[matching_indices]
sampling_intensity <- west_nile_coords$sampling_intensity[matching_indices]

# Create west_nile_data with matched terminal branches and data
west_nile_data <- data.frame(
  branch_length = west_nile_branch_lengths,
  location = tip_labels,
  sum_extracted_values = sum_extracted_values,
  extracted_temp = extracted_temp,
  extracted_precip = extracted_precip,
  X = lat,
  Y = lon
)
west_nile_data <- west_nile_data %>%
  group_by(location) %>%
  mutate(num_location_occurrences = n())

# Rabies Data 
# ----------------------

# Combine country and city for matching
rabies_coords_combined <- paste(rabies_coords$Country, rabies_coords$City, sep = ": ")

# Match tip labels to combined locations
matching_indices <- stringdist::amatch(rabies_coords_combined, rabies_tree$tip.label, maxDist = 2)

# Subset matched coordinates and tree data
rabies_coords_matched <- rabies_coords[!is.na(matching_indices), ]
rabies_coords_combined_matched <- rabies_coords_combined[!is.na(matching_indices)]
rabies_branch_lengths <- rabies_tree$edge.length[matching_indices]
tip_labels <- rabies_tree$tip.label[matching_indices]

# Subset data for matched locations
sum_extracted_values <- rabies_coords$average_values[matching_indices]
extracted_temp <- rabies_coords$extracted_temp[matching_indices]
extracted_precip <- rabies_coords$extracted_precip[matching_indices]
lat <- rabies_coords$lat[matching_indices]
lon <- rabies_coords$lon[matching_indices]
sampling_intensity <- west_nile_coords$sampling_intensity[matching_indices]

# Create rabies_data with matched terminal branches and data
rabies_data <- data.frame(
  branch_length = rabies_branch_lengths,
  location = tip_labels,
  sum_extracted_values = sum_extracted_values,
  extracted_temp = extracted_temp,
  extracted_precip = extracted_precip,
  X = lat,
  Y = lon
)

#yellow fever

yellow_fever_coords_combined <- paste(yellow_fever_coords$Country, yellow_fever_coords$City, sep = ": ")
matching_indices <- stringdist::amatch(yellow_fever_coords_combined, yellow_fever_tree$tip.label, maxDist = 4)

# Subset west_nile_coords to include only matching terminal branches
yellow_fever_coords_matched <- yellow_fever_coords[!is.na(matching_indices), ]
yellow_fever_coords_combined_matched <- yellow_fever_coords_combined[!is.na(matching_indices)]
yellow_fever_branch_lengths <- yellow_fever_tree$edge.length[matching_indices]
tip_labels <- yellow_fever_tree$tip.label[matching_indices]


# Match and subset sum_extracted_values based on matching_indices
sum_extracted_values <- yellow_fever_coords$average_values[matching_indices]
extracted_temp<- yellow_fever_coords$extracted_temp[matching_indices]
extracted_precip<- yellow_fever_coords$extracted_precip[matching_indices]
lat<- yellow_fever_coords$lat[matching_indices]
lon<- yellow_fever_coords$lon[matching_indices]
sampling_intensity<- yellow_fever_coords$sampling_intensity[matching_indices]

# Create west_nile_data with matching terminal branches and sum_extracted_values
yellow_fever_data <- data.frame(
  branch_length = yellow_fever_branch_lengths,
  location = tip_labels,
  sum_extracted_values = sum_extracted_values,
  extracted_temp = extracted_temp,
  extracted_precip= extracted_precip,
  X= lat,
  Y=lon)

#chikungunya

chik_coords_combined <- paste(chik_coords$Country, chik_coords$City, sep = ": ")
matching_indices <- stringdist::amatch(chik_coords_combined, chik_tree$tip.label, maxDist = 4)

# Subset west_nile_coords to include only matching terminal branches
chik_coords_matched <- chik_coords[!is.na(matching_indices), ]
chik_coords_combined_matched <- chik_coords_combined[!is.na(matching_indices)]
chik_branch_lengths <- chik_tree$edge.length[matching_indices]
tip_labels <- chik_tree$tip.label[matching_indices]


# Match and subset sum_extracted_values based on matching_indices
sum_extracted_values <- chik_coords$average_values[matching_indices]
extracted_temp<- chik_coords$extracted_temp[matching_indices]
chik_precip<- chik_coords$extracted_precip[matching_indices]
lat<- chik_coords$lat[matching_indices]
lon<- chik_coords$lon[matching_indices]

# Create west_nile_data with matching terminal branches and sum_extracted_values
chik_data <- data.frame(
  branch_length = chik_branch_lengths,
  location = tip_labels,
  sum_extracted_values = sum_extracted_values,
  extracted_temp = extracted_temp,
  extracted_precip= chik_precip,
  X= lat,
  Y=lon)

#dengue


dengue_coords_combined <- paste(dengue_coords$Country, dengue_coords$City, sep = ": ")
matching_indices <- stringdist::amatch(dengue_coords_combined, dengue_tree$tip.label, maxDist = 4)


dengue_coords_matched <- dengue_coords[!is.na(matching_indices), ]
dengue_coords_combined_matched <- dengue_coords_combined[!is.na(matching_indices)]
dengue_branch_lengths <- dengue_tree$edge.length[matching_indices]
tip_labels <- dengue_tree$tip.label[matching_indices]

sum_extracted_values <- dengue_coords$average_values[matching_indices]
extracted_temp<- dengue_coords$extracted_temp[matching_indices]
dengue_precip<- dengue_coords$extracted_precip[matching_indices]
lat<- dengue_coords$lat[matching_indices]
lon<- dengue_coords$lon[matching_indices]

# Create west_nile_data with matching terminal branches and sum_extracted_values
dengue_data <- data.frame(
  branch_length = dengue_branch_lengths,
  location = tip_labels,
  sum_extracted_values = sum_extracted_values,
  extracted_temp = extracted_temp,
  extracted_precip= dengue_precip,
  X= lat,
  Y=lon)

#bat coronavirus
bat_coords_combined <- paste(bat_coords$Country, bat_coords$City, sep = ": ")
matching_indices <- stringdist::amatch(bat_coords_combined, bat_tree$tip.label, maxDist = 4)


bat_coords_matched <- bat_coords[!is.na(matching_indices), ]
bat_coords_combined_matched <- bat_coords_combined[!is.na(matching_indices)]
bat_branch_lengths <- bat_tree$edge.length[matching_indices]
tip_labels <- bat_tree$tip.label[matching_indices]

sum_extracted_values <- bat_coords$average_values[matching_indices]
extracted_temp<- bat_coords$extracted_temp[matching_indices]
bat_precip<- bat_coords$extracted_precip[matching_indices]
lat<- bat_coords$lat[matching_indices]
lon<- bat_coords$lon[matching_indices]

bat_data <- data.frame(
  branch_length = bat_branch_lengths,
  location = tip_labels,
  sum_extracted_values = sum_extracted_values,
  extracted_temp = extracted_temp,
  extracted_precip= bat_precip,
  X= lat,
  Y=lon)

