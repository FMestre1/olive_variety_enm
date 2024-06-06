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

#Load sample raster for resample operations
bio1 <- terra::rast("D:/Dados climáticos/WorldClim 2.0/30 seconds/wc2.1_30s_bio/wc2.1_30s_bio_1.tif")

#Load Portugal shape
portugal <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/shape_portugal_continental.shp")

#Create 10x10 km to calibrate models
utm10 <- terra::vect("C:/Users/asus/Documents/github/olive_variety_enm/olive_variety_10x10_30Maio24.shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "Picual", "Cordovil", "Madural", "Verdeal")]
#utm10_df <- data.frame(utm10)
#utm10_df[is.na(utm10_df)] <- 0
#variables_10x10 <- terra::extract(env_vars_2, utm10, fun = 'mean', touches = TRUE)
variables_10x10 <- exactextractr::exact_extract(stack(env_vars_2), sf::st_as_sf(utm10), 'mean')

#utm_bio1_10x10_df <- data.frame(variables_10x10)
#names(utm_bio1_10x10_df)

################################################################################
#                         Table to save the results to
################################################################################

utm10_results <- utm10
utm10_results$results_galega <- NA
utm10_results$results_cobrancosa <- NA
utm10_results$results_arbequina <- NA
utm10_results$results_picual <- NA
utm10_results$results_cordovil <- NA
utm10_results$results_madural <- NA
utm10_results$results_verdeal <- NA

#plot(portugal)
#plot(twi_wgs84, add=TRUE)

variables_10x10 <- terra::cbind2(utm10, variables_10x10)
names(variables_10x10)[8:18] <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", 
                                  "eref_wgs84", "OCD", "pH", "Sand",
                                  "TRI", "TWI")

variables_10x10 <- data.frame(variables_10x10)

#plot(variables_10x10, "TWI")
#plot(portugal, add=TRUE)

#names(variables_10x10)

################################################################################
#                 RCP 4.5 - CCSM4 (CC)
################################################################################

bio2_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi502.tif")    
bio3_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi503.tif")       
bio13_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi5013.tif")
bio15_cc_45 <- terra::rast("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi5015.tif")
#
bioclimatic_cc_45 <- c(bio2_cc_45, bio3_cc_45, bio13_cc_45, bio15_cc_45)
bioclimatic_cc_45 <- terra::project(bioclimatic_cc_45, bio1)
bioclimatic_cc_45 <- terra::crop(bioclimatic_cc_45, portugal, mask = TRUE)
#
nffd_cc_45 <- terra::rast("D:\\SDM_OLIVES\\2050\\CC\\rcp45\\CCSM4_rcp45_2050s_Bioclimatic\\NFFD.asc") 
eref_cc_45 <- terra::rast("D:\\SDM_OLIVES\\2050\\CC\\rcp45\\CCSM4_rcp45_2050s_Bioclimatic\\Eref.asc") 

#From: https://epsg.io/102013
crs_climateEU <- 'PROJCS["Europe_Albers_Equal_Area_Conic",
    GEOGCS["GCS_European_1950",
        DATUM["D_European_1950",
            SPHEROID["International_1924",6378388.0,297.0]],
        PRIMEM["Greenwich",0.0],
        UNIT["Degree",0.0174532925199433]],
    PROJECTION["Albers"],
    PARAMETER["False_Easting",0.0],
    PARAMETER["False_Northing",0.0],
    PARAMETER["Central_Meridian",10.0],
    PARAMETER["Standard_Parallel_1",43.0],
    PARAMETER["Standard_Parallel_2",62.0],
    PARAMETER["Latitude_Of_Origin",30.0],
    UNIT["Meter",1.0]]'

terra::crs(nffd_cc_45)  <- crs_climateEU
terra::crs(eref_cc_45)  <- crs_climateEU
#
nffd_cc_45_wgs84 <- terra::project(nffd_cc_45, bio1)
eref_cc_45_wgs84 <- terra::project(eref_cc_45, bio1)
#
nffd_cc_45_wgs84_res <- terra::resample(nffd_cc_45_wgs84, bio1)
eref_cc_45_wgs84_res <- terra::resample(eref_cc_45_wgs84, bio1)
#
nffd_cc_45_wgs84_res_crop <- crop(nffd_cc_45_wgs84_res, portugal, mask = TRUE)
eref_cc_45_wgs84_res_crop <- crop(eref_cc_45_wgs84_res, portugal, mask = TRUE)

#These will be the same, whichever the GCM...
ocd <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/OCD.tif") #OCD - Organic Carbon Density
ph <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/pH.tif") #pH
sand <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/Sand.tif") #Sand - Proportion of sand particles (> 0.05 mm) in the fine earth fraction
tri <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/TRI.tif") #TRI - Terrain Roughness Index (derivada da variável DEM)
twi <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/TWI.tif") #TWI - Topographic Wetness Index (derivada da variável DEM)
#slope <- terra::rast("~/0. Artigos/oleadapt_modelacao_variedades/Variaveis/slope.tif") #TWI - Topographic Wetness Index (derivada da variável DEM)
ocd_wgs84 <- terra::project(ocd, bio1)
ph_wgs84 <- terra::project(ph, bio1)
sand_wgs84 <- terra::project(sand, bio1)
tri_wgs84 <- terra::project(tri, bio1)
twi_wgs84 <- terra::project(twi, bio1)
#slope_wgs84 <- terra::project(slope, bio1)
#
#Gather these vars
soil_vars <- c(
  ocd_wgs84,
  ph_wgs84,
  sand_wgs84,
  tri_wgs84,
  twi_wgs84#,
#  slope_wgs84
  )

soil_vars_crop <- terra::crop(soil_vars, portugal, mask = TRUE)

#Create a stack of rasters
env_vars_cc <- c(
  bioclimatic_cc_45,
  nffd_cc_45_wgs84_res_crop,
  eref_cc_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_cc)
names(env_vars_cc)

names(env_vars_cc) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

plot(env_vars_cc)

#Create a data frame
variables_10x10_cc_rcp45 <- terra::extract(env_vars_cc, utm10, fun = 'mean')
#View(variables_10x10_cc_rcp45)

#Delete the files
rm(bio2_cc_45, bio3_cc_45, bio13_cc_45, bio15_cc_45,
   bioclimatic_cc_45,
   nffd_cc_45, eref_cc_45,
   nffd_cc_45_wgs84, eref_cc_45_wgs84, 
   nffd_cc_45_wgs84_res, eref_cc_45_wgs84_res,
   nffd_cc_45_wgs84_res_crop, eref_cc_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars, soil_vars_crop
   )

################################################################################
#                 RCP 4.5 - CNRM-CM5 (CN)
################################################################################


################################################################################
#                 RCP 4.5 - GFDL-CM3 (GF)
################################################################################


################################################################################
#                 RCP 4.5 - HadGEM2-ES (Had)
################################################################################


################################################################################
#                 RCP 4.5 - INMCM4 (IN)
################################################################################


################################################################################
#                 RCP 4.5 - IPSL-CM5A-LR (IP)
################################################################################


################################################################################
#                 RCP 4.5 - MPI-ESM-LR (MPI)
################################################################################
