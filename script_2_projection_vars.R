################################################################################
#                 LOAD ENVIRONMENTAL LAYERS FOR MODEL PROJECTION
################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)
library(exactextractr)

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

#Load sample raster for resample operations
bio1 <- terra::rast("data2/wc2.1_30s_bio/wc2.1_30s_bio_1.tif")

#Load Portugal shape
portugal <- terra::vect("data2/shapes/shape_portugal_continental.shp")

#Create 10x10 km to calibrate models
utm10 <- terra::vect("data2/olive_presence/UTM_10x10_km (1).shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "CordovilTM", "VerdealTM", "Madural",   
                  "Picual", "CordovilSe")]

################################################################################
#         Variables that remain the same (no projections for 2050)
################################################################################

#These will be the same, whichever the GCM...
ocd <- terra::rast("data2/soil/OCD.tif") #OCD - Organic Carbon Density
ph <- terra::rast("data2/soil/pH.tif") #pH
sand <- terra::rast("data2/soil/Sand.tif") #Sand - Proportion of sand particles (> 0.05 mm) in the fine earth fraction
tri <- terra::rast("data2/soil/TRI.tif") #TRI - Terrain Roughness Index (derivada da variável DEM)
twi <- terra::rast("data2/soil/TWI.tif") #TWI - Topographic Wetness Index (derivada da variável DEM)
#slope <- terra::rast("data2/soil/slope.tif") #TWI - Topographic Wetness Index (derivada da variável DEM)
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
  twi_wgs84
  )

soil_vars_crop <- terra::crop(soil_vars, portugal, mask = TRUE)

#Plot
#plot(soil_vars_crop)

################################################################################
#    Current Variables - Converted to 10x10 km square grids
################################################################################

#variables_10x10 <- terra::extract(env_vars_2, utm10, fun = 'mean', touches = TRUE)
variables_10x10 <- exactextractr::exact_extract(env_vars_2, sf::st_as_sf(utm10), 'mean')

################################################################################
#                     Create table to save the results to:
################################################################################

utm10_results <- utm10
utm10_results$results_galega <- NA
utm10_results$results_cobrancosa <- NA
utm10_results$results_arbequina <- NA
utm10_results$results_picual <- NA
utm10_results$results_cordovilTM <- NA
utm10_results$results_cordovilSE <- NA
utm10_results$results_madural <- NA
utm10_results$results_verdeal <- NA


variables_10x10 <- terra::cbind2(as.data.frame(utm10), variables_10x10)
names(variables_10x10)[9:19] <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", 
                                  "eref_wgs84", "OCD", "pH", "Sand",
                                  "TRI", "TWI")

################################################################################
#                 RCP 4.5 - CCSM4 (CC)
################################################################################

bio2_cc_45 <- terra::rast("data2/2050/CC/rcp45/cc45bi502.tif")    
bio3_cc_45 <- terra::rast("data2/2050/CC/rcp45/cc45bi503.tif")       
bio13_cc_45 <- terra::rast("data2/2050/CC/rcp45/cc45bi5013.tif")
bio15_cc_45 <- terra::rast("data2/2050/CC/rcp45/cc45bi5015.tif")
#
bioclimatic_cc_45 <- c(bio2_cc_45, bio3_cc_45, bio13_cc_45, bio15_cc_45)
bioclimatic_cc_45 <- terra::project(bioclimatic_cc_45, bio1)
bioclimatic_cc_45 <- terra::crop(bioclimatic_cc_45, portugal, mask = TRUE)
#
nffd_cc_45 <- terra::rast("data2\\2050\\CC\\rcp45\\CCSM4_rcp45_2050s_Bioclimatic\\NFFD.asc") 
eref_cc_45 <- terra::rast("data2\\2050\\CC\\rcp45\\CCSM4_rcp45_2050s_Bioclimatic\\Eref.asc") 

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

#Create a raster::stack of rasters
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

#plot(env_vars_cc)

#Create a data frame
variables_10x10_cc_rcp45 <- exactextractr::exact_extract(raster::raster::stack(env_vars_cc), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_cc_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                      "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_cc_rcp45, "variables_10x10_cc_rcp45.csv")
#variables_10x10_cc_rcp45 <- read.csv("variables_10x10_cc_rcp45.csv")
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
   soil_vars#, soil_vars_crop
   )

################################################################################
#                 RCP 4.5 - CNRM-CM5 (CN)
################################################################################

bio2_cn_45 <- terra::rast("data2/2050/CN/rcp45/cn45bi502.tif")    
bio3_cn_45 <- terra::rast("data2/2050/CN/rcp45/cn45bi503.tif")       
bio13_cn_45 <- terra::rast("data2/2050/CN/rcp45/cn45bi5013.tif")
bio15_cn_45 <- terra::rast("data2/2050/CN/rcp45/cn45bi5015.tif")
#
bioclimatic_cn_45 <- c(bio2_cn_45, bio3_cn_45, bio13_cn_45, bio15_cn_45)
bioclimatic_cn_45 <- terra::project(bioclimatic_cn_45, bio1)
bioclimatic_cn_45 <- terra::crop(bioclimatic_cn_45, portugal, mask = TRUE)
#
nffd_cn_45 <- terra::rast("data2\\2050\\CN\\rcp45\\NFFD.asc") 
eref_cn_45 <- terra::rast("data2\\2050\\CN\\rcp45\\Eref.asc") 

terra::crs(nffd_cn_45)  <- crs_climateEU
terra::crs(eref_cn_45)  <- crs_climateEU
#
nffd_cn_45_wgs84 <- terra::project(nffd_cn_45, bio1)
eref_cn_45_wgs84 <- terra::project(eref_cn_45, bio1)
#
nffd_cn_45_wgs84_res <- terra::resample(nffd_cn_45_wgs84, bio1)
eref_cn_45_wgs84_res <- terra::resample(eref_cn_45_wgs84, bio1)
#
nffd_cn_45_wgs84_res_crop <- crop(nffd_cn_45_wgs84_res, portugal, mask = TRUE)
eref_cn_45_wgs84_res_crop <- crop(eref_cn_45_wgs84_res, portugal, mask = TRUE)

#Create a raster::stack of rasters
env_vars_cn <- c(
  bioclimatic_cn_45,
  nffd_cn_45_wgs84_res_crop,
  eref_cn_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_cn)
names(env_vars_cn)

names(env_vars_cn) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

#plot(env_vars_cn)

#Create a data frame
variables_10x10_cn_rcp45 <- exactextractr::exact_extract(raster::stack(env_vars_cn), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_cn_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                        "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_cn_rcp45, "variables_10x10_cn_rcp45.csv")
#variables_10x10_cn_rcp45 <- read.csv("variables_10x10_cn_rcp45.csv")
#View(variables_10x10_cn_rcp45)

#Delete the files
rm(bio2_cn_45, bio3_cn_45, bio13_cn_45, bio15_cn_45,
   bioclimatic_cn_45,
   nffd_cn_45, eref_cn_45,
   nffd_cn_45_wgs84, eref_cn_45_wgs84, 
   nffd_cn_45_wgs84_res, eref_cn_45_wgs84_res,
   nffd_cn_45_wgs84_res_crop, eref_cn_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars#, soil_vars_crop
   )

################################################################################
#                 RCP 4.5 - GFDL-CM3 (GF)
################################################################################

bio2_gf_45 <- terra::rast("data2/2050/GF/rcp45/gf45bi502.tif")    
bio3_gf_45 <- terra::rast("data2/2050/GF/rcp45/gf45bi503.tif")       
bio13_gf_45 <- terra::rast("data2/2050/GF/rcp45/gf45bi5013.tif")
bio15_gf_45 <- terra::rast("data2/2050/GF/rcp45/gf45bi5015.tif")
#
bioclimatic_gf_45 <- c(bio2_gf_45, bio3_gf_45, bio13_gf_45, bio15_gf_45)
bioclimatic_gf_45 <- terra::project(bioclimatic_gf_45, bio1)
bioclimatic_gf_45 <- terra::crop(bioclimatic_gf_45, portugal, mask = TRUE)
#
nffd_gf_45 <- terra::rast("data2\\2050\\GF\\rcp45\\NFFD.asc") 
eref_gf_45 <- terra::rast("data2\\2050\\GF\\rcp45\\Eref.asc") 

terra::crs(nffd_gf_45)  <- crs_climateEU
terra::crs(eref_gf_45)  <- crs_climateEU
#
nffd_gf_45_wgs84 <- terra::project(nffd_gf_45, bio1)
eref_gf_45_wgs84 <- terra::project(eref_gf_45, bio1)
#
nffd_gf_45_wgs84_res <- terra::resample(nffd_gf_45_wgs84, bio1)
eref_gf_45_wgs84_res <- terra::resample(eref_gf_45_wgs84, bio1)
#
nffd_gf_45_wgs84_res_crop <- crop(nffd_gf_45_wgs84_res, portugal, mask = TRUE)
eref_gf_45_wgs84_res_crop <- crop(eref_gf_45_wgs84_res, portugal, mask = TRUE)

#Create a raster::stack of rasters
env_vars_gf <- c(
  bioclimatic_gf_45,
  nffd_gf_45_wgs84_res_crop,
  eref_gf_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_gf)
names(env_vars_gf)

names(env_vars_gf) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

#plot(env_vars_gf)

#Create a data frame
variables_10x10_gf_rcp45 <- exactextractr::exact_extract(raster::stack(env_vars_gf), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_gf_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                        "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_gf_rcp45, "variables_10x10_gf_rcp45.csv")
#variables_10x10_gf_rcp45 <- read.csv("variables_10x10_gf_rcp45.csv")

#Delete the files
rm(bio2_gf_45, bio3_gf_45, bio13_gf_45, bio15_gf_45,
   bioclimatic_gf_45,
   nffd_gf_45, eref_gf_45,
   nffd_gf_45_wgs84, eref_gf_45_wgs84, 
   nffd_gf_45_wgs84_res, eref_gf_45_wgs84_res,
   nffd_gf_45_wgs84_res_crop, eref_gf_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars#, soil_vars_crop
   )
   
################################################################################
#                 RCP 4.5 - HadGEM2-ES (HE)
################################################################################

bio2_had_45 <- terra::rast("data2/2050/HE/rcp45/he45bi502.tif")    
bio3_had_45 <- terra::rast("data2/2050/HE/rcp45/he45bi503.tif")       
bio13_had_45 <- terra::rast("data2/2050/HE/rcp45/he45bi5013.tif")
bio15_had_45 <- terra::rast("data2/2050/HE/rcp45/he45bi5015.tif")
#
bioclimatic_had_45 <- c(bio2_had_45, bio3_had_45, bio13_had_45, bio15_had_45)
bioclimatic_had_45 <- terra::project(bioclimatic_had_45, bio1)
bioclimatic_had_45 <- terra::crop(bioclimatic_had_45, portugal, mask = TRUE)
#
nffd_had_45 <- terra::rast("data2\\2050\\HE\\rcp45\\NFFD.asc") 
eref_had_45 <- terra::rast("data2\\2050\\HE\\rcp45\\Eref.asc") 

terra::crs(nffd_had_45)  <- crs_climateEU
terra::crs(eref_had_45)  <- crs_climateEU
#
nffd_had_45_wgs84 <- terra::project(nffd_had_45, bio1)
eref_had_45_wgs84 <- terra::project(eref_had_45, bio1)
#
nffd_had_45_wgs84_res <- terra::resample(nffd_had_45_wgs84, bio1)
eref_had_45_wgs84_res <- terra::resample(eref_had_45_wgs84, bio1)
#
nffd_had_45_wgs84_res_crop <- crop(nffd_had_45_wgs84_res, portugal, mask = TRUE)
eref_had_45_wgs84_res_crop <- crop(eref_had_45_wgs84_res, portugal, mask = TRUE)

#Create a raster::stack of rasters
env_vars_had <- c(
  bioclimatic_had_45,
  nffd_had_45_wgs84_res_crop,
  eref_had_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_had)
names(env_vars_had)

names(env_vars_had) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

#plot(env_vars_had)

#Create a data frame
variables_10x10_had_rcp45 <- exactextractr::exact_extract(raster::stack(env_vars_had), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_had_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                        "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_had_rcp45, "variables_10x10_had_rcp45.csv")
#variables_10x10_had_rcp45 <- read.csv("variables_10x10_had_rcp45.csv")

#Delete the files
rm(bio2_had_45, bio3_had_45, bio13_had_45, bio15_had_45,
   bioclimatic_had_45,
   nffd_had_45, eref_had_45,
   nffd_had_45_wgs84, eref_had_45_wgs84, 
   nffd_had_45_wgs84_res, eref_had_45_wgs84_res,
   nffd_had_45_wgs84_res_crop, eref_had_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars#, soil_vars_crop
   )

################################################################################
#                 RCP 4.5 - INMCM4 (IN)
################################################################################

bio2_in_45 <- terra::rast("data2/2050/IN/rcp45/in45bi502.tif")    
bio3_in_45 <- terra::rast("data2/2050/IN/rcp45/in45bi503.tif")       
bio13_in_45 <- terra::rast("data2/2050/IN/rcp45/in45bi5013.tif")
bio15_in_45 <- terra::rast("data2/2050/IN/rcp45/in45bi5015.tif")
#
bioclimatic_in_45 <- c(bio2_in_45, bio3_in_45, bio13_in_45, bio15_in_45)
bioclimatic_in_45 <- terra::project(bioclimatic_in_45, bio1)
bioclimatic_in_45 <- terra::crop(bioclimatic_in_45, portugal, mask = TRUE)
#
nffd_in_45 <- terra::rast("data2\\2050\\IN\\rcp45\\NFFD.asc") 
eref_in_45 <- terra::rast("data2\\2050\\IN\\rcp45\\Eref.asc") 

terra::crs(nffd_in_45)  <- crs_climateEU
terra::crs(eref_in_45)  <- crs_climateEU
#
nffd_in_45_wgs84 <- terra::project(nffd_in_45, bio1)
eref_in_45_wgs84 <- terra::project(eref_in_45, bio1)
#
nffd_in_45_wgs84_res <- terra::resample(nffd_in_45_wgs84, bio1)
eref_in_45_wgs84_res <- terra::resample(eref_in_45_wgs84, bio1)
#
nffd_in_45_wgs84_res_crop <- crop(nffd_in_45_wgs84_res, portugal, mask = TRUE)
eref_in_45_wgs84_res_crop <- crop(eref_in_45_wgs84_res, portugal, mask = TRUE)

#Create a raster::stack of rasters
env_vars_in <- c(
  bioclimatic_in_45,
  nffd_in_45_wgs84_res_crop,
  eref_in_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_in)
names(env_vars_in)

names(env_vars_in) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

plot(env_vars_in)

#Create a data frame
variables_10x10_in_rcp45 <- exactextractr::exact_extract(raster::stack(env_vars_in), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_in_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                         "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_in_rcp45, "variables_10x10_in_rcp45.csv")
#variables_10x10_in_rcp45 <- read.csv("variables_10x10_in_rcp45.csv")

#Delete the files
rm(bio2_in_45, bio3_in_45, bio13_in_45, bio15_in_45,
   bioclimatic_in_45,
   nffd_in_45, eref_in_45,
   nffd_in_45_wgs84, eref_in_45_wgs84, 
   nffd_in_45_wgs84_res, eref_in_45_wgs84_res,
   nffd_in_45_wgs84_res_crop, eref_in_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars#, soil_vars_crop
   )

################################################################################
#                 RCP 4.5 - IPSL-CM5A-LR (IP)
################################################################################

bio2_ip_45 <- terra::rast("data2/2050/IP/rcp45/ip45bi502.tif")    
bio3_ip_45 <- terra::rast("data2/2050/IP/rcp45/ip45bi503.tif")       
bio13_ip_45 <- terra::rast("data2/2050/IP/rcp45/ip45bi5013.tif")
bio15_ip_45 <- terra::rast("data2/2050/IP/rcp45/ip45bi5015.tif")
#
bioclimatic_ip_45 <- c(bio2_ip_45, bio3_ip_45, bio13_ip_45, bio15_ip_45)
bioclimatic_ip_45 <- terra::project(bioclimatic_ip_45, bio1)
bioclimatic_ip_45 <- terra::crop(bioclimatic_ip_45, portugal, mask = TRUE)
#
nffd_ip_45 <- terra::rast("data2\\2050\\IP\\rcp45\\NFFD.asc") 
eref_ip_45 <- terra::rast("data2\\2050\\IP\\rcp45\\Eref.asc") 

terra::crs(nffd_ip_45)  <- crs_climateEU
terra::crs(eref_ip_45)  <- crs_climateEU
#
nffd_ip_45_wgs84 <- terra::project(nffd_ip_45, bio1)
eref_ip_45_wgs84 <- terra::project(eref_ip_45, bio1)
#
nffd_ip_45_wgs84_res <- terra::resample(nffd_ip_45_wgs84, bio1)
eref_ip_45_wgs84_res <- terra::resample(eref_ip_45_wgs84, bio1)
#
nffd_ip_45_wgs84_res_crop <- crop(nffd_ip_45_wgs84_res, portugal, mask = TRUE)
eref_ip_45_wgs84_res_crop <- crop(eref_ip_45_wgs84_res, portugal, mask = TRUE)

#Create a raster::stack of rasters
env_vars_ip <- c(
  bioclimatic_ip_45,
  nffd_ip_45_wgs84_res_crop,
  eref_ip_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_ip)
names(env_vars_ip)

names(env_vars_ip) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

plot(env_vars_ip)

#Create a data frame
variables_10x10_ip_rcp45 <- exactextractr::exact_extract(raster::stack(env_vars_ip), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_ip_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                        "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_ip_rcp45, "variables_10x10_ip_rcp45.csv")
#variables_10x10_ip_rcp45 <- read.csv("variables_10x10_ip_rcp45.csv")

#Delete the files
rm(bio2_ip_45, bio3_ip_45, bio13_ip_45, bio15_ip_45,
   bioclimatic_ip_45,
   nffd_ip_45, eref_ip_45,
   nffd_ip_45_wgs84, eref_ip_45_wgs84, 
   nffd_ip_45_wgs84_res, eref_ip_45_wgs84_res,
   nffd_ip_45_wgs84_res_crop, eref_ip_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars#, soil_vars_crop
   )


################################################################################
#                 RCP 4.5 - MPI-ESM-LR (MPI)
################################################################################

bio2_mpi_45 <- terra::rast("data2/2050/MP/rcp45/mp45bi502.tif")    
bio3_mpi_45 <- terra::rast("data2/2050/MP/rcp45/mp45bi503.tif")       
bio13_mpi_45 <- terra::rast("data2/2050/MP/rcp45/mp45bi5013.tif")
bio15_mpi_45 <- terra::rast("data2/2050/MP/rcp45/mp45bi5015.tif")
#
bioclimatic_mpi_45 <- c(bio2_mpi_45, bio3_mpi_45, bio13_mpi_45, bio15_mpi_45)
bioclimatic_mpi_45 <- terra::project(bioclimatic_mpi_45, bio1)
bioclimatic_mpi_45 <- terra::crop(bioclimatic_mpi_45, portugal, mask = TRUE)
#
nffd_mpi_45 <- terra::rast("data2\\2050\\MP\\rcp45\\NFFD.asc") 
eref_mpi_45 <- terra::rast("data2\\2050\\MP\\rcp45\\Eref.asc") 

terra::crs(nffd_mpi_45)  <- crs_climateEU
terra::crs(eref_mpi_45)  <- crs_climateEU
#
nffd_mpi_45_wgs84 <- terra::project(nffd_mpi_45, bio1)
eref_mpi_45_wgs84 <- terra::project(eref_mpi_45, bio1)
#
nffd_mpi_45_wgs84_res <- terra::resample(nffd_mpi_45_wgs84, bio1)
eref_mpi_45_wgs84_res <- terra::resample(eref_mpi_45_wgs84, bio1)
#
nffd_mpi_45_wgs84_res_crop <- crop(nffd_mpi_45_wgs84_res, portugal, mask = TRUE)
eref_mpi_45_wgs84_res_crop <- crop(eref_mpi_45_wgs84_res, portugal, mask = TRUE)

#Create a raster::stack of rasters
env_vars_mpi <- c(
  bioclimatic_mpi_45,
  nffd_mpi_45_wgs84_res_crop,
  eref_mpi_45_wgs84_res_crop,
  soil_vars_crop
  )

#plot(env_vars_mpi)
names(env_vars_mpi)

names(env_vars_mpi) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                        "OCD", "pH", "Sand", "TRI", "TWI")

plot(env_vars_mpi)

#Create a data frame
variables_10x10_mpi_rcp45 <- exactextractr::exact_extract(raster::stack(env_vars_mpi), sf::st_as_sf(utm10), 'mean')
colnames(variables_10x10_mpi_rcp45) <- c("bio2", "bio3", "bio13", "bio15", "nffd_wgs84", "eref_wgs84", 
                                        "OCD", "pH", "Sand", "TRI", "TWI")

#write.csv(variables_10x10_mpi_rcp45, "variables_10x10_mpi_rcp45.csv")
#variables_10x10_mpi_rcp45 <- read.csv("variables_10x10_mpi_rcp45.csv")

#Delete the files
rm(bio2_mpi_45, bio3_mpi_45, bio13_mpi_45, bio15_mpi_45,
   bioclimatic_mpi_45,
   nffd_mpi_45, eref_mpi_45,
   nffd_mpi_45_wgs84, eref_mpi_45_wgs84, 
   nffd_mpi_45_wgs84_res, eref_mpi_45_wgs84_res,
   nffd_mpi_45_wgs84_res_crop, eref_mpi_45_wgs84_res_crop,
   ocd, ph, sand, tri, twi,
   ocd_wgs84, ph_wgs84, sand_wgs84, tri_wgs84, twi_wgs84,
   soil_vars#, soil_vars_crop
   )

