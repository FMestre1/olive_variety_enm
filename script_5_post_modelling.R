################################################################################
#                               POST MODELLING
################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)
library(ggplot2)
library(tidyterra)

#Load Portugal shape
portugal <- terra::vect("D:/000Frederico/data2/shapes/shape_portugal_continental.shp")
#Create 10x10 km to calibrate models
utm10 <- terra::vect("D:/000Frederico/data2/olive_presence/UTM_10x10_km (1).shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "CordovilTM", "VerdealTM", "Madural",   
                  "Picual", "CordovilSe")]

#Create table to output
utm10_results_2050_averages <- utm10
utm10_results_2050_averages <- terra::crop(utm10_results_2050_averages, portugal)
#plot(utm10_results_2050_averages)

################################################################################
#                    AVERAGE ALL MODELS ACROSS ALL GCM
################################################################################

galega_mean_2050 <- rowMeans(cbind(
  ensemble_galega_2050_CC,
  ensemble_galega_2050_CN,
  ensemble_galega_2050_GF,
  ensemble_galega_2050_HAD,
  ensemble_galega_2050_IN,
  ensemble_galega_2050_IP,
  ensemble_galega_2050_MPI
))

utm10_results_2050_averages$GAL_m <- galega_mean_2050

cobrancosa_mean_2050 <- rowMeans(cbind(
  ensemble_cobrancosa_2050_CC,
  ensemble_cobrancosa_2050_CN,
  ensemble_cobrancosa_2050_GF,
  ensemble_cobrancosa_2050_HAD,
  ensemble_cobrancosa_2050_IN,
  ensemble_cobrancosa_2050_IP,
  ensemble_cobrancosa_2050_MPI
))

utm10_results_2050_averages$COB_m <- cobrancosa_mean_2050

arbequina_mean_2050 <- rowMeans(cbind(
  ensemble_arbequina_2050_CC,
  ensemble_arbequina_2050_CN,
  ensemble_arbequina_2050_GF,
  ensemble_arbequina_2050_HAD,
  ensemble_arbequina_2050_IN,
  ensemble_arbequina_2050_IP,
  ensemble_arbequina_2050_MPI
))

utm10_results_2050_averages$ARB_m <- arbequina_mean_2050

picual_mean_2050 <- rowMeans(cbind(
  ensemble_picual_2050_CC,
  ensemble_picual_2050_CN,
  ensemble_picual_2050_GF,
  ensemble_picual_2050_HAD,
  ensemble_picual_2050_IN,
  ensemble_picual_2050_IP,
  ensemble_picual_2050_MPI
))

utm10_results_2050_averages$PIC_m <- picual_mean_2050

cordovilTM_mean_2050 <- rowMeans(cbind(
  ensemble_cordovilTM_2050_CC,
  ensemble_cordovilTM_2050_CN,
  ensemble_cordovilTM_2050_GF,
  ensemble_cordovilTM_2050_HAD,
  ensemble_cordovilTM_2050_IN,
  ensemble_cordovilTM_2050_IP,
  ensemble_cordovilTM_2050_MPI
))

utm10_results_2050_averages$COR_TM_m <- cordovilTM_mean_2050

cordovilSE_mean_2050 <- rowMeans(cbind(
  ensemble_cordovilSE_2050_CC,
  ensemble_cordovilSE_2050_CN,
  ensemble_cordovilSE_2050_GF,
  ensemble_cordovilSE_2050_HAD,
  ensemble_cordovilSE_2050_IN,
  ensemble_cordovilSE_2050_IP,
  ensemble_cordovilSE_2050_MPI
))

utm10_results_2050_averages$COR_SE_m <- cordovilSE_mean_2050

madural_mean_2050 <- rowMeans(cbind(
  ensemble_madural_2050_CC,
  ensemble_madural_2050_CN,
  ensemble_madural_2050_GF,
  ensemble_madural_2050_HAD,
  ensemble_madural_2050_IN,
  ensemble_madural_2050_IP,
  ensemble_madural_2050_MPI
))

utm10_results_2050_averages$MAD_m <- madural_mean_2050

verdeal_mean_2050 <- rowMeans(cbind(
  ensemble_verdeal_2050_CC,
  ensemble_verdeal_2050_CN,
  ensemble_verdeal_2050_GF,
  ensemble_verdeal_2050_HAD,
  ensemble_verdeal_2050_IN,
  ensemble_verdeal_2050_IP,
  ensemble_verdeal_2050_MPI
))

utm10_results_2050_averages$VER_m <- verdeal_mean_2050


################################################################################
#                              Write to shapefile
################################################################################

terra::writeVector(utm10_results_2050_averages, "utm10_results_2050_averages_version_january25_v4", filetype="ESRI Shapefile")

################################################################################
#                              Plotting
################################################################################

png(file="galega_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = GAL_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Galega future suitability"
  )+ 
  geom_spatvector(data = portugal, fill = NA)
dev.off()


png(file="cobrancosa_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = COB_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cobrançosa future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="arbequina_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = ARB_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Arbequina future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="picual_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = PIC_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Picual future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="cordovilTM_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = COR_TM_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cordovil TM future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="cordovilSE_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = COR_SE_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cordovil SE future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="madural_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = MAD_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Madural future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="verdeal_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = VER_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Verdeal future suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()