################################################################################
#                 LOAD ENVIRONMENTAL LAYERS FOR MODEL PROJECTION
################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)

################################################################################
#    Current Variables - Converted to 10x10 km square grids
################################################################################

#Create 10x10 km to calibrate models
utm10 <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/variedades_portugal_15_05_2024.shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "Picual", "Cordovil", "Madural", "Verdeal")]
#utm10_df <- data.frame(utm10)
#utm10_df[is.na(utm10_df)] <- 0
variables_10x10 <- terra::extract(env_vars_2, utm10, fun = 'mean')
#utm_bio1_10x10_df <- data.frame(variables_10x10)
#names(utm_bio1_10x10_df)

utm10_results <- utm10
utm10_results$results_galega <- NA
utm10_results$results_cobrancosa <- NA
utm10_results$results_arbequina <- NA
utm10_results$results_picual <- NA
utm10_results$results_cordovil <- NA
utm10_results$results_madural <- NA
utm10_results$results_verdeal <- NA

# To get CRS...
bio1 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_1.tif")
#Load Portugal shape
portugal <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/shape_portugal_continental.shp")

################################################################################
#                 RCP 4.5 - CCSM4 (CC)
################################################################################

bio2_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi502.tif")     
bio3_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi503.tif")       
bio13_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi513.tif")
bio15_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi515.tif")
#
nffd_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/NFFD.asc") 
eref_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/EREF.asc") 
#
nffd_res_cc_45 <- terra::resample(nffd_cc_45, bio1)
eref_res_cc_45 <- terra::resample(eref_cc_45, bio1)
#
nffd_res_crop_cc_45 <- crop(nffd_res_cc_45, portugal, mask = TRUE)
eref_res_crop_cc_45 <- crop(eref_res_cc_45, portugal, mask = TRUE)
#
eref_res_crop_cc_45_wgs84 <- terra::project(eref_res_crop_cc_45, bio1)
nffd_res_crop_cc_45_wgs84 <- terra::project(nffd_res_crop_cc_45, bio1)


#These will be the same, whichever the GCM...
ocd <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/OCD.tif") #OCD - Organic Carbon Density
ph <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/pH.tif") #pH
sand <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/Sand.tif") #Sand - Proportion of sand particles (> 0.05 mm) in the fine earth fraction
tri <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/TRI.tif") #TRI - Terrain Roughness Index (derivada da variável DEM)
twi <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/TWI.tif") #TWI - Topographic Wetness Index (derivada da variável DEM)
ocd_wgs84 <- terra::project(ocd, bio1)
ph_wgs84 <- terra::project(ph, bio1)
sand_wgs84 <- terra::project(sand, bio1)
tri_wgs84 <- terra::project(tri, bio1)
twi_wgs84 <- terra::project(twi, bio1)
slope_wgs84 <- terra::project(slope, bio1)


#Create a stack of rasters

#Create a data frame
variables_10x10_cc_rcp45 <- terra::extract(env_vars_2, utm10, fun = 'mean')

#Delete the files
rm(bio2_cc_45, bio3_cc_45, bio13_cc_45, bio15_cc_45, nffd_cc_45, eref_cc_45,
nffd_res_cc_45, eref_res_cc_45, nffd_res_crop_cc_45, eref_res_crop_cc_45,
eref_res_crop_cc_45_wgs84, nffd_res_crop_cc_45_wgs84)


################################################################################
#                 RCP 4.5 - CNRM-CM5
################################################################################


################################################################################
#                 RCP 4.5 - GFDL-CM3
################################################################################


################################################################################
#                 RCP 4.5 - HadGEM2-ES
################################################################################


################################################################################
#                 RCP 4.5 - INMCM4
################################################################################


################################################################################
#                 RCP 4.5 - IPSL-CM5A-LR
################################################################################


################################################################################
#                 RCP 4.5 - MPI-ESM-LR
################################################################################
