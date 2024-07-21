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
portugal <- terra::vect("C:/Users/asus/Documents/0. Artigos/oleadapt_modelacao_variedades/shapes/shape_portugal_continental.shp")
#Create 10x10 km to calibrate models
utm10 <- terra::vect("C:/Users/asus/Documents/github/olive_variety_enm/olive_variety_10x10_30Maio24.shp")
utm10 <- utm10[,c("Galega", "Cobrancosa", "Arbequina", "Picual", "Cordovil", "Madural", "Verdeal")]

# Plot projections using
#utm10_results_2050

################################################################################
#                    AVERAGE ALL MODELS ACROSS ALL GCM
################################################################################

utm10_results_2050_averages <- utm10

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
#terra::plot(utm10_results_2050_averages, "GAL_m")

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

cordovil_mean_2050 <- rowMeans(cbind(
  ensemble_cordovil_2050_CC,
  ensemble_cordovil_2050_CN,
  ensemble_cordovil_2050_GF,
  ensemble_cordovil_2050_HAD,
  ensemble_cordovil_2050_IN,
  ensemble_cordovil_2050_IP,
  ensemble_cordovil_2050_MPI
))

utm10_results_2050_averages$COR_m <- cordovil_mean_2050

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

terra::writeVector(utm10_results_2050_averages, "utm10_results_2050_averages_v1", filetype="ESRI Shapefile")

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

png(file="cordovil_mean_2050.png",width=2000, height=2500, res=300)
ggplot(utm10_results_2050_averages) +
  geom_spatvector(aes(fill = COR_m), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cordovil future suitability"
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


