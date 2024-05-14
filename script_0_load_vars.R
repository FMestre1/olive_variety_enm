################################################################################
#           MODELLING THE OCCURRENCE OF OLIVE VARIETIES IN PORTUGAL
################################################################################

#FMestre
#13-05-2024

#Load required packages
library(sdm)
library(usdm)
#installAll()
library(terra)

#Load Portugal shape
portugal <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/shape_portugal_continental.shp")
#plot(portugal)
#crs(portugal)

################################################################################
#                       1. LOAD OLIVE TREES OCCURRENCES
################################################################################

#What is the minimum number of presences to conduct an SMD modelling?
#See: https://nsojournals.onlinelibrary.wiley.com/doi/full/10.1111/ecog.01509

olive_vars <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/variedades_portugal_15_05_2024.shp")
crs(olive_vars)

#Derive variety prevalence in Portugal
olive_vars_df <- data.frame(olive_vars)
olive_vars_df[is.na(olive_vars_df)] <- 0
names(olive_vars_df)[2] # Delete this column
olive_vars_df <- olive_vars_df[,-2]
olive_vars_df <- data.frame(colSums(olive_vars_df[,-1]))
names(olive_vars_df) <- "number_presences"
olive_vars_df <- data.frame(olive_vars_df,round((olive_vars_df$number_presences*100)/nrow(olive_vars), 2))
names(olive_vars_df)[2] <- "prevalence"
View(olive_vars_df)


#olive <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/UTM_10x10_km.shp") 
#plot(olive)
#olive_df <- as.data.frame(olive)
#View(olive_df)

#olive_df[is.na(olive_df)] <- 0
#nr_presences_var <- as.data.frame(colSums(olive_df[,-c(1,2)]))
#nr_presences_var <- data.frame(rownames(nr_presences_var), nr_presences_var[,1])
#names(nr_presences_var) <- c("var_name", "number_presences")
#nr_presences_var[order(nr_presences_var$number_presences, decreasing=TRUE), ]

################################################################################
#                         2. LOAD ENVIRONMENTAL LAYERS
################################################################################

#Worldclim v2
bio1 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_1.tif")
bio2 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_2.tif")
bio3 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_3.tif")
bio4 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_4.tif")
bio5 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_5.tif")
bio6 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_6.tif")
bio7 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_7.tif")
bio8 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_8.tif")
bio9 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_9.tif")
bio10 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_10.tif")
bio11 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_11.tif")
bio12 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_12.tif")
bio13 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_13.tif")
bio14 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_14.tif")
bio15 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_15.tif")
bio16 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_16.tif")
bio17 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_17.tif")
bio18 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_18.tif")
bio19 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_19.tif")
#
crs(bio1)
terra::res(bio1)

bioclimatic <- c(bio1, bio2, bio3, bio4, bio5, bio6, bio7, bio8, bio9, bio10, bio11, bio12, bio13, bio14, 
                 bio15, bio16, bio17, bio18, bio19)

bioclimatic_crop <- crop(bioclimatic, portugal, mask = TRUE)
names(bioclimatic_crop) <- c("bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", 
                             "bio10", "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", 
                             "bio19")
#plot(bioclimatic_crop)

#Other variables
#Other climatic variables - ClimateEU
#https://sites.ualberta.ca/~ahamann/data/climateeu.html

ahm <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/ahm_wgs84.tif")#Annual heat:moisture index (MAT+10)/(MAP/1000))
shm <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/shm_wgs84.tif")#Summer heat:moisture index ((MWMT)/(MSP/1000))
nffd <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/nffd_wgs84.tif")#Number of frost-free days
eref <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/eref_wgs84.tif")#Hargreaves reference evaporation
#
crs(ahm_res)

climate_eu <- c(ahm_res, shm_res, nffd_res, eref_res)
climate_eu_res <- terra::resample(climate_eu, bio1)
climate_eu_res_crop <- crop(climate_eu_res, portugal, mask = TRUE)

#plot(climate_eu_crop)

#Soil-related variables
bdod <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/BDOD.tif") #BDOD - Bulk density of the fine earth fraction
ocd <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/OCD.tif") #OCD - Organic Carbon Density
ph <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/pH.tif") #pH
sand <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/Sand.tif") #Sand - Proportion of sand particles (> 0.05 mm) in the fine earth fraction
soil_class <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/Soil_Class.tif") #Soil_Class - World Reference Base Soil Groups
tri <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/TRI.tif") #TRI - Terrain Roughness Index (derivada da variável DEM)
twi <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/TWI.tif") #TWI - Topographic Wetness Index (derivada da variável DEM)
slope <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/Slope.tif") #Slope
#
bdod_wgs84 <- terra::project(bdod, bio1)
ocd_wgs84 <- terra::project(ocd, bio1)
ph_wgs84 <- terra::project(ph, bio1)
sand_wgs84 <- terra::project(sand, bio1)
soil_class_wgs84 <- terra::project(soil_class, bio1)
tri_wgs84 <- terra::project(tri, bio1)
twi_wgs84 <- terra::project(twi, bio1)
slope_wgs84 <- terra::project(slope, bio1)
#
crs(ocd_wgs84)
terra::res(ocd_wgs84)

soil <- c(bdod_wgs84, ocd_wgs84, ph_wgs84, sand_wgs84, soil_class_wgs84, tri_wgs84, twi_wgs84, slope_wgs84)
soil_crop <- crop(soil, portugal, mask = TRUE)
#plot(soil_crop)

################################################################################
#                        All variables together...
################################################################################

env_vars <- c(bioclimatic_crop, climate_eu_res_crop, soil_crop)
names(env_vars)
#
#save(env_vars, file = "environmental_variables.RData")
