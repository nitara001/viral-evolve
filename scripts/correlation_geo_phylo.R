library(ape)
# Compute cophenetic matrix of West Nile tree
wn_cophenetic_matrix <- cophenetic.phylo(west_nile_tree)
# Extract geographical coordinates matrix
wn_geo_coords_matrix <- cbind(west_nile_coords$lon, west_nile_coords$lat)
# Compute Euclidean matrix from geographical coordinates
wn_euclidean_matrix <- as.matrix(dist(wn_geo_coords_matrix))
# Perform correlation test between cophenetic and Euclidean matrices
wn_correlation_result <- cor.test(as.vector(wn_cophenetic_matrix), as.vector(wn_euclidean_matrix))

# Correlation test of phylo and geo similarity for Rabies

# Compute cophenetic matrix of Rabies tree
rabies_cophenetic_matrix <- cophenetic.phylo(rabies_tree)
rabies_geo_coords_matrix <- cbind(rabies_coords$lon, rabies_coords$lat)
rabies_euclidean_matrix <- as.matrix(dist(rabies_geo_coords_matrix))
rabies_correlation_result <- cor.test(as.vector(rabies_cophenetic_matrix), as.vector(rabies_euclidean_matrix))
