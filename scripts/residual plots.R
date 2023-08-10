library(ggplot2)
library(gridExtra)  # For grid.arrange

# Residual Plots for West Nile Model
# ----------------------------------

# Histogram Plot
hist_plot <- ggplot(data = data.frame(residuals = wn_residuals), aes(x = residuals)) +
  geom_histogram(bins = 6, fill = "#6495ED", color = "black") +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# Density Plot
density_plot <- ggplot(data = data.frame(residuals = wn_residuals), aes(x = residuals)) +
  geom_density(fill = "#6495ED", color = "black") +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# Scale-Location Plot
scale_location_plot <- ggplot(data = data.frame(residuals = wn_residuals, fitted = fitted(west_nile_model)),
                              aes(x = fitted, y = sd(residuals))) +
  geom_point(alpha = 0.7, color = "#6495ED") +
  geom_smooth(method = "lm", se = FALSE, color = "#6495ED") +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# QQ Plot
qq_plot <- ggplot(data = data.frame(residuals = wn_residuals), aes(sample = residuals)) +
  stat_qq(geom = "point", shape = 1, color = "#6495ED") +
  stat_qq_line() +  # Add the straight line
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        panel.grid.major = element_blank())

# Combine plots using grid.arrange
grid_arrange_wn <- grid.arrange(hist_plot, density_plot, scale_location_plot, qq_plot, ncol = 2)


# Residual Plots for Rabies Model
# -------------------------------

# Histogram Plot
hist_plot_rabies <- ggplot(data = data.frame(residuals = rabies_residuals), aes(x = residuals)) +
  geom_histogram(bins = 4, fill = "#5F8575", color = "black") +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# Density Plot
density_plot_rabies <- ggplot(data = data.frame(residuals = filtered_residuals), aes(x = residuals)) +
  geom_density(fill = "#5F8575", color = "black") +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# Scale-Location Plot
scale_location_plot_rabies <- ggplot(data = data.frame(residuals = rabies_residuals, fitted = fitted(rabies_model)),
                                     aes(x = fitted, y = sd(residuals))) +
  geom_point(alpha = 0.7, color = "#5F8575") +
  geom_smooth(method = "lm", se = FALSE, color = "#5F8575") +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# QQ Plot
qq_plot_rabies <- ggplot(data = data.frame(residuals = filtered_residuals), aes(sample = residuals)) +
  stat_qq(geom = "point", shape = 1, color = "#5F8575") +
  stat_qq_line() +  # Add the straight line
  theme_minimal() +
  theme(panel.background = element_rect(fill = "white"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        panel.grid.major = element_blank())

# Combine plots using grid.arrange
grid_arrange_rabies <- grid.arrange(hist_plot_rabies, density_plot_rabies, scale_location_plot_rabies, qq_plot_rabies, ncol = 2)


# Combine both sets of plots vertically
grid_arrange_both <- grid.arrange(grid_arrange_wn, grid_arrange_rabies, ncol = 1)

# Display the combined plots
grid_arrange_both




