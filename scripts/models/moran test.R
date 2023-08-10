library(spdep)

# West Nile 
# ------------------

# Convert grouped data to spatial features
wn_sf <- st_as_sf(grouped_data, coords = c("X", "Y"), crs = 4326)
wn_sf <- st_buffer(wn_sf, mean(states_area))
# Create a neighbors object using queen contiguity
wn_nb_object <- poly2nb(wn_sf, queen = TRUE)
wn_listw <- nb2listw(wn_nb_object, zero.policy = TRUE)
# Calculate residuals of the West Nile model
wn_residuals <- residuals(west_nile_model)
# Perform Moran's I test on the residuals
wn_moran <- moran.test(wn_residuals, wn_listw, zero.policy = TRUE)
wn_moran


# Rabies
# ----------------

# Convert grouped rabies data to spatial features
rabies_sf <- st_as_sf(grouped_rabies, coords = c("X", "Y"), crs = 4326)
rabies_sf <- st_buffer(rabies_sf, mean(states_area))
# Create a neighbors object using queen contiguity
rabies_nb_object <- poly2nb(rabies_sf, queen = TRUE)
rabies_listw <- nb2listw(rabies_nb_object, zero.policy = TRUE)
# Calculate residuals of the Rabies model
rabies_residuals <- residuals(rabies_model)
# Perform Moran's I test on the residuals
rabies_moran <- moran.test(rabies_residuals, rabies_listw, zero.policy = TRUE)
rabies_moran

