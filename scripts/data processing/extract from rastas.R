# Load Required Libraries
library(raster)
library(sf)
library(sp)

# land, temp, precip data
# ----------
land_data <- raster("/Users/nitarawijayatilake/Downloads/hildap_vGLOB-1.0_change-layers/HILDAplus_vGLOB-1.0_luc_change-freq_1960-2019_wgs84.tif")
temp_raster<-raster("/Users/nitarawijayatilake/Downloads/temperature_meanchange_baselinetopresent.tif")
precip_raster<- raster("/Users/nitarawijayatilake/Downloads/precip_meanchange_baselinetopresent.tif")
# West Nile Data Processing
# ------------------------
# Read West Nile coordinates
west_nile_coords <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/West Nile/Location data/westnile_coords.csv")
west_nile_coords <- west_nile_coords[,-1]
west_nile_coords$lon <- as.numeric(west_nile_coords$lon)
west_nile_coords$lat <- as.numeric(west_nile_coords$lat)
west_nile_sf <- st_as_sf(west_nile_coords, coords = c("lon", "lat"), crs = 4326)

# Calculate buffer sizes
west_nile_buffer_sizes <- ifelse(grepl(",", west_nile_coords$City), mean(city_areas), mean(states_area))
west_nile_buffered_sf <- st_buffer(west_nile_sf, dist = sqrt(west_nile_buffer_sizes/pi))

# Extract values from land_data within the buffered polygons
west_nile_extracted_values <- extract(land_data, west_nile_buffered_sf)

# Calculate sum of extracted values within each polygon
sum_extracted_values <- sapply(west_nile_extracted_values, sum)
west_nile_coords$sum_extracted_values <- sum_extracted_values

# Calculate number of locations and average values per grid cell
grid_cell_counts <- sapply(west_nile_extracted_values, length)
sum_extracted_values <- sapply(west_nile_extracted_values, sum)
average_values <- sum_extracted_values / grid_cell_counts
west_nile_coords$average_values <- average_values

# Rabies Data Processing
# ----------------------
# Read Rabies coordinates
rabies_coords <- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Rabies/Location data/rabies_coords.csv")
rabies_coords$lon <- as.numeric(rabies_coords$lon)
rabies_coords$lat <- as.numeric(rabies_coords$lat)
rabies_coords <- na.omit(rabies_coords)

# Calculate buffer sizes
rabies_sf <- st_as_sf(rabies_coords, coords = c("lon", "lat"), crs = 4326)
rabies_buffer_sizes <- ifelse(grepl(",", rabies_coords$City), mean(city_areas), mean(states_area))
rabies_buffered_sf <- st_buffer(rabies_sf, dist = sqrt(rabies_buffer_sizes/pi))

# Extract values from land_data within the buffered polygons
rabies_extracted_values <- extract(land_data, rabies_buffered_sf)
rabies_extracted_values <- lapply(rabies_extracted_values, function(x) as.numeric(trimws(x)))
rabies_sum_extracted_values <- sapply(rabies_extracted_values, sum)
rabies_coords$sum_extracted_values <- rabies_sum_extracted_values

# Calculate number of locations and average values per grid cell
grid_cell_counts <- sapply(rabies_extracted_values, length)
rabies_sum_extracted_values <- sapply(rabies_extracted_values, sum)
average_values <- rabies_sum_extracted_values / grid_cell_counts
rabies_coords$average_values <- average_values


#enterovirus
enterovirus_coords<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Enterovirus B/enterovirusb_coords.csv")
enterovirus_coords<- enterovirus_coords[,-1]
enterovirus_coords$lon <- as.numeric(enterovirus_coords$lon)
enterovirus_coords$lat <- as.numeric(enterovirus_coords$lat)
enterovirus_sf<- st_as_sf(enterovirus_coords, coords = c("lon", "lat"), crs = 4326) 
# Extract buffer sizes
enterovirus_buffer_sizes <- ifelse(grepl(",", enterovirus_coords$City), mean(city_areas), mean(state_areas))
enterovirus_buffered_sf <- st_buffer(enterovirus_sf, dist= sqrt(enterovirus_buffer_sizes/pi))
enterovirus_extracted_values <- extract(land_data, enterovirus_buffered_sf)
enterovirus_extracted_values <- lapply(enterovirus_extracted_values, function(x) as.numeric(trimws(x)))
sum_extracted_values <- sapply(enterovirus_extracted_values, sum)
enterovirus_coords$sum_extracted_values <- sum_extracted_values
#chikungunya
chik_coords<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Chikungunya/chikungunya_coords.csv")
chik_coords$lon <- as.numeric(chik_coords$lon)
chik_coords$lat <- as.numeric(chik_coords$lat)

# Extract buffer sizes
# Buffer sizes in square meters
chik_coords<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Chikungunya/chikungunya_coords.csv")
chik_coords$lon <- as.numeric(chik_coords$lon)
chik_coords$lat <- as.numeric(chik_coords$lat)

# Extract buffer sizes
chik_sf <- st_as_sf(chik_coords, coords = c("lon", "lat"), crs = 4326)
# Extract buffer sizes
chik_buffer_sizes <- ifelse(grepl(",", chik_coords$City),mean(city_areas), mean(states_area)) # Apply buffer sizes to west_nile_sf
chik_buffered_sf <- st_buffer(chik_sf, dist= sqrt(chik_buffer_sizes/pi))
chik_extracted_values <- extract(land_data, chik_buffered_sf)
chik_extracted_values <- lapply(chik_extracted_values, function(x) as.numeric(trimws(x)))
chik_sum_extracted_values <- sapply(chik_extracted_values, sum)
chik_coords$sum_extracted_values <- chik_sum_extracted_values

##per grid cell
# Calculate the number of locations for each grid cell
grid_cell_counts <- sapply(chik_extracted_values, length)
chik_sum_extracted_values <- sapply(chik_extracted_values, sum)
average_values <- chik_sum_extracted_values / grid_cell_counts
chik_coords$average_values <- average_values

#yellow fever
yellow_fever_coords<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Yellow Fever/yellow_fever_coords.csv")
yellow_fever_coords$lon <- as.numeric(yellow_fever_coords$lon)
yellow_fever_coords$lat <- as.numeric(yellow_fever_coords$lat)
yellow_fever_coords<- yellow_fever_coords[,-1]

yellow_fever_sf <- st_as_sf(yellow_fever_coords, coords = c("lon", "lat"), crs = 4326)
# Extract buffer sizes
yellow_fever_buffer_sizes <- ifelse(grepl(",", yellow_fever_coords$City),mean(city_areas), mean(states_area)) # Apply buffer sizes to west_nile_sf
yellow_fever_buffered_sf <- st_buffer(yellow_fever_sf, dist= sqrt(yellow_fever_buffer_sizes/pi))
yellow_fever_extracted_values <- extract(land_data, yellow_fever_buffered_sf)
yellow_fever_extracted_values <- lapply(yellow_fever_extracted_values, function(x) as.numeric(trimws(x)))
yellow_fever_sum_extracted_values <- sapply(yellow_fever_extracted_values, sum)
yellow_fever_coords$sum_extracted_values <- yellow_fever_sum_extracted_values

##per grid cell
# Calculate the number of locations for each grid cell
grid_cell_counts <- sapply(yellow_fever_extracted_values, length)
yellow_fever_sum_extracted_values <- sapply(yellow_fever_extracted_values, sum)
average_values <- yellow_fever_sum_extracted_values / grid_cell_counts
yellow_fever_coords$average_values <- average_values

#dengue 
dengue_coords<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Dengue/dengue_coords.csv")
dengue_coords$lon <- as.numeric(dengue_coords$lon)
dengue_coords$lat <- as.numeric(dengue_coords$lat)

dengue_sf <- st_as_sf(dengue_coords, coords = c("lon", "lat"), crs = 4326)
# Extract buffer sizes
dengue_buffer_sizes <- ifelse(grepl(",", dengue_coords$City),mean(city_areas), mean(states_area)) # Apply buffer sizes to west_nile_sf
dengue_buffered_sf <- st_buffer(dengue_sf, dist= sqrt(dengue_buffer_sizes/pi))
dengue_extracted_values <- extract(land_data, dengue_buffered_sf)
dengue_extracted_values <- lapply(dengue_extracted_values, function(x) as.numeric(trimws(x)))
dengue_sum_extracted_values <- sapply(dengue_extracted_values, sum)
denguedengue_coords$sum_extracted_values <- dengue_sum_extracted_values

grid_cell_counts <- sapply(dengue_extracted_values, length)
dengue_sum_extracted_values <- sapply(dengue_extracted_values, sum)
average_values <- dengue_sum_extracted_values / grid_cell_counts
dengue_coords$average_values <- average_values

#bat corona
bat_coords<- read.csv("/Users/nitarawijayatilake/Documents/UCL /Masters Project/Files/Bat coronavirus/bat_coronavirus_coords.csv")
bat_coords$lon <- as.numeric(bat_coords$lon)
bat_coords$lat <- as.numeric(bat_coords$lat)

bat_sf <- st_as_sf(bat_coords, coords = c("lon", "lat"), crs = 4326)
# Extract buffer sizes
bat_buffer_sizes <- ifelse(grepl(",", bat_coords$City),mean(city_areas), mean(states_area)) # Apply buffer sizes to west_nile_sf
bat_buffered_sf <- st_buffer(bat_sf, dist= sqrt(bat_buffer_sizes/pi))
bat_extracted_values <- extract(land_data, bat_buffered_sf)
bat_extracted_values <- lapply(bat_extracted_values, function(x) as.numeric(trimws(x)))
bat_sum_extracted_values <- sapply(bat_extracted_values, sum)
bat_coords$sum_extracted_values <- bat_sum_extracted_values

grid_cell_counts <- sapply(bat_extracted_values, length)
bat_sum_extracted_values <- sapply(bat_extracted_values, sum)
average_values <- bat_sum_extracted_values / grid_cell_counts
bat_coords$average_values <- average_values
