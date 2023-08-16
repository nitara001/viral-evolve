library(mgcv)
library(caret)

# West Nile Model
# ----------------

# Fit GAM model for West Nile data
west_nile_model <- mgcv::gam(
  log(median_branch_length) ~ mean_sum_extracted_values +
    mean_extracted_temp + mean_extracted_precip +
    s(num_occurrences, bs = "re"),
  data = grouped_data
)

# Print summary of West Nile model
summary(west_nile_model)

# Rabies Model
# -------------

# Fit GAM model for Rabies data
rabies_model <- mgcv::gam(
  log(median_branch_length) ~ mean_sum_extracted_values +
    mean_extracted_temp + mean_extracted_precip +
    s(num_occurrences, bs = "re"),
  family = gaussian(),
  data = grouped_rabies
)

# Print summary of Rabies model
summary(rabies_model)

