# West Nile 
# -----------------------

# Histograms to visualize the distribution of variables within West Nile data
hist(log(west_nile_data$median_branch_length))
hist(west_nile_data$sum_extracted_values)
hist(west_nile_data$mean_extracted_temp)
hist(west_nile_data$mean_extracted_precip)

# Aggregate data by location due to spatial correlation and oversampling
grouped_data <- west_nile_data %>% 
  group_by(location) %>%
  summarise(
    median_branch_length = median(branch_length),
    mean_sum_extracted_values = mean(sum_extracted_values),
    mean_extracted_temp = median(extracted_temp),
    mean_extracted_precip = mean(extracted_precip),
    num_occurrences = n(),
    X = mean(X),
    Y = mean(Y)
  )

# Filter and plot histogram for West Nile data
grouped_data <- grouped_data %>%
  filter(log(median_branch_length) > -10, log(median_branch_length) < -4)
hist(log(grouped_data$median_branch_length))

# Rabies
# ---------------------

# Histograms to visualize the distribution of variables within Rabies data
hist(log(rabies_data$median_branch_length))
hist(rabies_data$sum_extracted_values)
hist(rabies_data$mean_extracted_temp)
hist(rabies_data$mean_extracted_precip)

# Aggregate data by location due to spatial correlation and oversampling
grouped_rabies <- rabies_data %>% 
  group_by(location) %>%
  summarise(
    median_branch_length = median(branch_length),
    mean_sum_extracted_values = median(sum_extracted_values),
    mean_extracted_temp = median(extracted_temp),
    mean_extracted_precip = mean(extracted_precip),
    num_occurrences = n(),
    X = mean(X),
    Y = mean(Y)
  )

# Filter and plot histogram for Rabies data
grouped_rabies <- grouped_rabies %>%
  filter(log(median_branch_length) > -12, log(median_branch_length) < -2)
hist(log(grouped_rabies$median_branch_length), breaks = 20)
