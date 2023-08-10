library(raster)

map_palette <- colorRampPalette(c("lightblue", "#b4d3b2", "orange" ,"red"))
# Plot using the custom temperature color palette
plot(temp_raster, col = map_palette(300), bg = "white")

points(west_nile_data$Y, west_nile_data$X, col = "blue", pch = 16, cex = 0.5)
points(rabies_data$Y, rabies_data$X, col = "#097969", pch = 16, cex = 0.5)
# Add a legend to the plot
legend("topleft", legend = c("West Nile data", "Rabies data"), col = c("blue", "#097969"), pch = 16, cex = 0.8)
mtext("Temperature Change (°C)", side = 4.5, line = 4., cex = 0.9, font=2)
title(xlab = "Longitude")
title(ylab = "Latitude")
