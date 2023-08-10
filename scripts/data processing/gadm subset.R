library(sf)
library(rgdal)
library(raster)
#average size of each administrative level
gadm <- st_read("/Users/nitarawijayatilake/Downloads/gadm_410.gpkg")
cities <- gadm[gadm$ENGTYPE_1 == "City", ]
city_areas <- st_area(cities)
avg_city_area <- mean(city_areas)

states<- gadm[gadm$ENGTYPE_1 == "State", ]
states_area<- st_area(states)
avg_state_area<- mean(states_area)



city_areas<- 231857800
states_area<- 1.08e+11
