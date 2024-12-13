################################################################################
#           MODELLING THE OCCURRENCE OF OLIVE VARIETIES IN PORTUGAL
################################################################################

#FMestre
#13-05-2024

#Load required packages
#detach(package:sdm, unload = TRUE)
#devtools::install_github("babaknaimi/sdm")

#sessionInfo()

library(sdm)
library(usdm)
#installAll()
library(terra)
library(exactextractr)

#Load Portugal shape
portugal <- terra::vect("C:/Users/mestr/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/shape_portugal_continental.shp")
#plot(portugal)
#crs(portugal)

################################################################################
#                       1. LOAD OLIVE TREES OCCURRENCES
################################################################################

#What is the minimum number of presences to conduct an SMD modelling?
#See: https://nsojournals.onlinelibrary.wiley.com/doi/full/10.1111/ecog.01509

olive_vars <- terra::vect("C:/Users/mestr/Documents/github/olive_variety_enm/NEW_DATASET/UTM_10x10_km (1).shp")
#crs(olive_vars)

#Derive variety prevalence in Portugal
olive_vars_df <- data.frame(olive_vars)
#View(olive_vars_df)
olive_vars_df[is.na(olive_vars_df)] <- 0 #Convert NA to 0.
#names(olive_vars_df)[2] # Delete this column
olive_vars_df <- olive_vars_df[,-2]
olive_vars_df <- data.frame(colSums(olive_vars_df[,-1]))
names(olive_vars_df) <- "number_presences"
olive_vars_df <- data.frame(olive_vars_df,round((olive_vars_df$number_presences)/nrow(olive_vars), 2))
names(olive_vars_df)[2] <- "prevalence"
olive_vars_df <- olive_vars_df[order(olive_vars_df$number_presences, decreasing = TRUE),]
#Use these varieties
vars_keep <- rownames(olive_vars_df[olive_vars_df$number_presences > 30,])

#[1] "Galega"     "Cobrancosa" "Arbequina"  "Picual"     "VerdealTM"  "Madural"   
#[7] "CordovilTM" "CordovilSe"

#Galega
galega <- olive_vars[,vars_keep[1]]
galega$Galega[is.na(galega$Galega)] <- 0
galega <- centroids(galega, inside=FALSE)
galega <- galega[galega$Galega ==1,]
#plot(galega)

#Cobrançosa
cobrancosa <- olive_vars[,vars_keep[2]]
cobrancosa$Cobrancosa[is.na(cobrancosa$Cobrancosa)] <- 0
cobrancosa <- centroids(cobrancosa, inside=FALSE)
cobrancosa <- cobrancosa[cobrancosa$Cobrancosa ==1,]
#plot(cobrancosa)

#Arbequina
arbequina <- olive_vars[,vars_keep[3]]
arbequina$Arbequina[is.na(arbequina$Arbequina)] <- 0
arbequina <- centroids(arbequina, inside=FALSE)
arbequina <- arbequina[arbequina$Arbequina ==1,]
#plot(arbequina)

#Picual
picual <- olive_vars[,vars_keep[4]]
picual$Picual[is.na(picual$Picual)] <- 0
picual <- centroids(picual, inside=FALSE)
picual <- picual[picual$Picual ==1,]
#plot(picual)

#CordovilTM
cordovilTM <- olive_vars[,vars_keep[7]]
cordovilTM$CordovilTM[is.na(cordovilTM$CordovilTM)] <- 0
cordovilTM <- centroids(cordovilTM, inside=FALSE)
cordovilTM <- cordovilTM[cordovilTM$CordovilTM ==1,]
#plot(cordovilTM)

#CordovilSe
cordovilSe <- olive_vars[,vars_keep[8]]
cordovilSe$CordovilSe[is.na(cordovilSe$CordovilSe)] <- 0
cordovilSe <- centroids(cordovilSe, inside=FALSE)
cordovilSe <- cordovilSe[cordovilSe$CordovilSe ==1,]
#plot(cordovilSe)

#Madural
madural <- olive_vars[,vars_keep[6]]
madural$Madural[is.na(madural$Madural)] <- 0
madural <- centroids(madural, inside=FALSE)
madural <- madural[madural$Madural ==1,]
#plot(madural)

#VerdealTM (41 presences, prevalence of 0.04)
verdealTM <- olive_vars[,vars_keep[5]]
verdealTM$VerdealTM[is.na(verdealTM$VerdealTM)] <- 0
verdealTM <- centroids(verdealTM, inside=FALSE)
verdealTM <- verdealTM[verdealTM$VerdealTM ==1,]
#plot(verdealTM)

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
#crs(bio1)
#terra::res(bio1)

bioclimatic <- c(bio1, bio2, bio3, bio4, bio5, bio6, bio7, bio8, bio9, bio10, bio11, bio12, bio13, bio14, 
                 bio15, bio16, bio17, bio18, bio19)

bioclimatic_crop <- crop(bioclimatic, portugal, mask = TRUE)
names(bioclimatic_crop) <- c("bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", 
                             "bio10", "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", 
                             "bio19")

#plot(bioclimatic_crop)

#ClimateEU variables
#Other climatic variables - ClimateEU
#https://sites.ualberta.ca/~ahamann/data/climateeu.html

#Marchi, M., Castellanos-Acuna, D., Hamann, A., Wang, T., Ray, D. Menzel, A. 2020. 
#ClimateEU, scale-free climate normals, historical time series, and future 
#projections for Europe. Scientific Data 7: 428. doi: 10.1038/s41597-020-00763-0
#https://www.nature.com/articles/s41597-020-00763-0

ahm <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/ahm_wgs84.tif")#Annual heat:moisture index (MAT+10)/(MAP/1000))
shm <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/shm_wgs84.tif")#Summer heat:moisture index ((MWMT)/(MSP/1000))
nffd <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/nffd_wgs84.tif")#Number of frost-free days
eref <- terra::rast("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/eref_wgs84.tif")#Hargreaves reference evaporation
#
climate_eu <- c(ahm, shm, nffd, eref)
climate_eu_res <- terra::resample(climate_eu, bio1)
climate_eu_res_crop <- crop(climate_eu_res, portugal, mask = TRUE)

#plot(climate_eu_res_crop)

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
slope_wgs84 <- terra::project(slope, bio1)#

soil <- c(bdod_wgs84, ocd_wgs84, ph_wgs84, sand_wgs84, soil_class_wgs84, tri_wgs84, twi_wgs84, slope_wgs84)
soil_crop <- crop(soil, portugal, mask = TRUE)
#plot(soil_crop)

################################################################################
#                        All variables together
################################################################################

env_vars <- c(bioclimatic_crop, climate_eu_res_crop, soil_crop)
#names(env_vars)

################################################################################
#                       Variance Inflation Factor (VIF)
################################################################################

#Names of all variables in the initial dataset
#names(env_vars)

#vif1 <- usdm::vifstep(env_vars)#stepwise elimination of highly inflating variables
#usdm::vifcor(env_vars)
#vif1@results

#Using VIF to select the variables to consider in the model
#env_vars_2 <- usdm::exclude(env_vars, vif1)
#names(env_vars_2)
#

#Keep the one from the first time I ran the VIF function
#keep_these <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", 
#  "eref_wgs84", "OCD", "pH", "Sand", "Soil_Class", "TRI", "TWI")
keep_these <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", 
                "eref_wgs84", "OCD", "pH", "Sand", "TRI", "TWI")


env_vars_2 <- env_vars[[keep_these]]

#Saving it...
#save(env_vars_2, file = "env_vars_2.RData")

#Load it...
#load("env_vars_2.RData")


################################################################################
#                    Average to every 10x10 km square grid
################################################################################

#Create 10x10 km to calibrate models
utm10 <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/variedades_portugal_15_05_2024.shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "Picual", "Cordovil", "Madural", "Verdeal")]
#utm10_df <- data.frame(utm10)
#utm10_df[is.na(utm10_df)] <- 0

#variables_10x10 <- terra::extract(env_vars_2, utm10, fun = 'mean')
variables_10x10 <- exactextractr::exact_extract(env_vars_2, sf::st_as_sf(utm10), 'mean')

#utm_bio1_10x10_df <- data.frame(variables_10x10)
#names(utm_bio1_10x10_df)

#variables_10x10_2 <- terra::cbind2(utm10, variables_10x10)
#plot(variables_10x10_2, "bio2")
#names(variables_10x10_2)

################################################################################
#                              Create SDM data
################################################################################

galega_sdm_data <- sdmData(train=galega, predictors=env_vars_2, bg=list(n=nrow(galega),method='gRandom',remove=TRUE))
cobrancosa_sdm_data <- sdmData(train=cobrancosa, predictors=env_vars_2, bg=list(n=nrow(cobrancosa),method='gRandom',remove=TRUE))
arbequina_sdm_data <- sdmData(train=arbequina, predictors=env_vars_2, bg=list(n=nrow(arbequina),method='gRandom',remove=TRUE))
picual_sdm_data <- sdmData(train=picual, predictors=env_vars_2, bg=list(n=nrow(picual),method='gRandom',remove=TRUE))
cordovilTM_sdm_data <- sdmData(train=cordovilTM, predictors=env_vars_2, bg=list(n=nrow(cordovil),method='gRandom',remove=TRUE))
cordovilSE_sdm_data <- sdmData(train=cordovilSe, predictors=env_vars_2, bg=list(n=nrow(cordovil),method='gRandom',remove=TRUE))
madural_sdm_data <- sdmData(train=madural, predictors=env_vars_2, bg=list(n=nrow(madural),method='gRandom',remove=TRUE))
verdeal_sdm_data <- sdmData(train=verdeal, predictors=env_vars_2, bg=list(n=nrow(verdeal),method='gRandom',remove=TRUE))

#Save...
#write.sdm(galega_sdm_data, filename = "galega_sdm_data", overwrite = TRUE)
#write.sdm(cobrancosa_sdm_data, filename = "cobrancosa_sdm_data", overwrite = TRUE)
#write.sdm(arbequina_sdm_data, filename = "arbequina_sdm_data", overwrite = TRUE)
#write.sdm(picual_sdm_data, filename = "picual_sdm_data", overwrite = TRUE)
#write.sdm(cordovilTM_sdm_data, filename = "cordovilTM_sdm_data", overwrite = TRUE)
#write.sdm(cordovilSE_sdm_data, filename = "cordovilSE_sdm_data", overwrite = TRUE)
#write.sdm(madural_sdm_data, filename = "madural_sdm_data", overwrite = TRUE)
#write.sdm(verdeal_sdm_data, filename = "verdeal_sdm_data", overwrite = TRUE)

#remove individual rasters...
rm(bio1, bio2, bio3, bio4, bio5, bio6, bio7, bio8, bio9, 
   bio10, bio11, bio12, bio13, bio14, bio15, bio16, bio17, 
   bio18, bio19, bdod_wgs84, ocd_wgs84, ph_wgs84, sand_wgs84, 
   soil_class_wgs84, tri_wgs84, twi_wgs84, slope_wgs84, 
   bdod, ocd, ph, sand, soil_class, tri, twi, slope, bioclimatic_crop, 
   climate_eu_res_crop, soil_crop, climate_eu, climate_eu_res, soil, 
   keep_these, ahm, shm, nffd, eref)

#Read...
#galega_sdm_data <- read.sdm(filename = "galega_sdm_data.sdd")
#cobrancosa_sdm_data <- read.sdm(filename = "cobrancosa_sdm_data.sdd")
#arbequina_sdm_data <- read.sdm(filename = "arbequina_sdm_data.sdd")
#picual_sdm_data <- read.sdm(filename = "picual_sdm_data.sdd")
#cordovilTM_sdm_data <- read.sdm(filename = "cordovilTM_sdm_data.sdd")
#cordovilSE_sdm_data <- read.sdm(filename = "cordovilSE_sdm_data.sdd")
#madural_sdm_data <- read.sdm(filename = "madural_sdm_data.sdd")
#verdeal_sdm_data <- read.sdm( filename = "verdeal_sdm_data.sdd")
