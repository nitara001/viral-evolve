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

# Cross-validation
# ----------------

# Create a training control object for cross-validation
ctrl <- trainControl(method = "cv", number = 5)

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
wn_train_indices <- createDataPartition(grouped_data$median_branch_length, p = 0.7, list = FALSE)
wn_train_data <- grouped_data[wn_train_indices, ]
wn_test_data <- grouped_data[-wn_train_indices, ]

# Fit a GAM model using the training data
wn_gam_model <- train(
  log(median_branch_length) ~ mean_sum_extracted_values +
    mean_extracted_temp + mean_extracted_precip,
  data = wn_train_data, method = "gam", trControl = ctrl
)

# Predict using the test data
wn_predictions <- predict(wn_gam_model, newdata = wn_test_data)
wn_predictions_original <- exp(wn_predictions)
wn_errors <- wn_predictions_original - wn_test_data$median_branch_length

# Calculate performance metrics
wn_MAE <- mean(abs(wn_errors), na.rm = TRUE)
wn_MSE <- mean(wn_errors^2, na.rm = TRUE)
wn_RMSE <- sqrt(wn_MSE)
wn_R_squared <- cor(wn_predictions_original, wn_test_data$median_branch_length)^2
wn_response_range <- range(wn_test_data$median_branch_length)

# Print the performance metrics for West Nile model
cat("West Nile Model Performance:\n")
cat("MAE:", wn_MAE, "\n")
cat("MSE:", wn_MSE, "\n")
cat("RMSE:", wn_RMSE, "\n")
cat("R-squared:", wn_R_squared, "\n")
cat("Response Variable Range:", wn_response_range, "\n\n")

# Split the Rabies data into training and testing sets
rabies_train_indices <- createDataPartition(grouped_rabies$median_branch_length, p = 0.7, list = FALSE)
rabies_train_data <- grouped_rabies[rabies_train_indices, ]
rabies_test_data <- grouped_rabies[-rabies_train_indices, ]

# Fit a GAM model using the training data for Rabies
rabies_gam_model <- train(
  log(median_branch_length) ~ mean_sum_extracted_values +
    mean_extracted_temp + mean_extracted_precip,
  data = rabies_train_data, method = "gam", trControl = ctrl
)

# Predict using the test data for Rabies
rabies_predictions <- predict(rabies_gam_model, newdata = rabies_test_data)
rabies_predictions_original <- exp(rabies_predictions)
rabies_errors <- rabies_predictions_original - rabies_test_data$median_branch_length

# Calculate performance metrics for Rabies
rabies_MAE <- mean(abs(rabies_errors), na.rm = TRUE)
rabies_MSE <- mean(rabies_errors^2, na.rm = TRUE)
rabies_RMSE <- sqrt(rabies_MSE)
rabies_R_squared <- cor(rabies_predictions_original, rabies_test_data$median_branch_length)^2
rabies_response_range <- range(rabies_test_data$median_branch_length)

# Print the performance metrics for Rabies model
cat("Rabies Model Performance:\n")
cat("MAE:", rabies_MAE, "\n")
cat("MSE:", rabies_MSE, "\n")
cat("RMSE:", rabies_RMSE, "\n")
cat("R-squared:", rabies_R_squared, "\n")
cat("Response Variable Range:", rabies_response_range, "\n")
