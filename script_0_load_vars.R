################################################################################
#           MODELLING THE OCCURRENCE OF OLIVE VARIETIES IN PORTUGAL
################################################################################

#FMestre
#28-04-2024

#Load required packages
library(sdm)
library(usdm)
#installAll()
library(terra)


################################################################################
#                       1. LOAD OLIVE TREES OCCURRENCES
################################################################################

olive <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/UTM_10x10_km.shp") 
#plot(olive)
olive_df <- as.data.frame(olive)
View(olive_df)

olive_df[is.na(olive_df)] <- 0
nr_presences_var <- as.data.frame(colSums(olive_df[,-c(1,2)]))
nr_presences_var <- data.frame(rownames(nr_presences_var), nr_presences_var[,1])
names(nr_presences_var) <- c("var_name", "number_presences")
nr_presences_var[order(nr_presences_var$number_presences, decreasing=TRUE), ]

################################################################################
#                         2. LOAD ENVIRONMENTAL LAYERS
################################################################################

#From
#

#Worldclim v2
bio1 <- terra::rast("")
bio2 <- terra::rast("")
bio3 <- terra::rast("")
bio4 <- terra::rast("")
bio5 <- terra::rast("")
bio6 <- terra::rast("")
bio7 <- terra::rast("")
bio8 <- terra::rast("")
bio9 <- terra::rast("")
bio10 <- terra::rast("")
bio11 <- terra::rast("")
bio12 <- terra::rast("")
bio13 <- terra::rast("")
bio14 <- terra::rast("")
bio15 <- terra::rast("")
bio16 <- terra::rast("")
bio17 <- terra::rast("")
bio18 <- terra::rast("")
bio19 <- terra::rast("")


#Soil-related variables

#BDOD - Bulk density of the fine earth fraction
bdod <- terra::rast("")

#OCD - Organic Carbon Density
ocd <- terra::rast("")

#pH - pH
ph <- terra::rast("")

#Sand - Proportion of sand particles (> 0.05 mm) in the fine earth fraction
sand <- terra::rast("")

#Soil_Class - World Reference Base Soil Groups
soil_class <- terra::rast("")

#TRI - Terrain Roughness Index (derivada da variável DEM)
tri <- terra::rast("")

#TWI - Topographic Wetness Index (derivada da variável DEM)
twi <- terra::rast("")
