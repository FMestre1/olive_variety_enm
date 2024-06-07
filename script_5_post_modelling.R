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

utm10_results_2050$galCC
utm10_results_2050$galCN
utm10_results_2050$galGF

utm10_results_2050$cbrCC
utm10_results_2050$cbrCN
utm10_results_2050$cbrGF

utm10_results_2050$arbCC
utm10_results_2050$arbCN
utm10_results_2050$arbGF

utm10_results_2050$picCC
utm10_results_2050$picCN
utm10_results_2050$picGF

utm10_results_2050$corCC
utm10_results_2050$corCN
utm10_results_2050$corGF

utm10_results_2050$madCC
utm10_results_2050$madCN
utm10_results_2050$madGF

utm10_results_2050$verCC
utm10_results_2050$verCN
utm10_results_2050$verGF

#AQUI
#
utm10_results_2050$galHad <- NA
utm10_results_2050$cbrHad <- NA
utm10_results_2050$arbHad <- NA
utm10_results_2050$picHad <- NA
utm10_results_2050$corHad <- NA
utm10_results_2050$madHad <- NA
utm10_results_2050$verHad <- NA
#
utm10_results_2050$galIN <- NA
utm10_results_2050$cbrIN <- NA
utm10_results_2050$arbIN <- NA
utm10_results_2050$picIN <- NA
utm10_results_2050$corIN <- NA
utm10_results_2050$madIN <- NA
utm10_results_2050$verIN <- NA
#
utm10_results_2050$galIP <- NA
utm10_results_2050$cbrIP <- NA
utm10_results_2050$arbIP <- NA
utm10_results_2050$picIP <- NA
utm10_results_2050$corIP <- NA
utm10_results_2050$madIP <- NA
utm10_results_2050$verIP <- NA
#
utm10_results_2050$galMPI <- NA
utm10_results_2050$cbrMPI <- NA
utm10_results_2050$arbMPI <- NA
utm10_results_2050$picMPI <- NA
utm10_results_2050$corMPI <- NA
utm10_results_2050$madMPI <- NA
utm10_results_2050$verMPI <- NA

################################################################################
#                    AVERAGE ALL MODELS ACROSS ALL GCM
################################################################################

# Galega - 205
ggplot(utm10_results_2050) +
  geom_spatvector(aes(fill = xxx), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Galega 2050 suitability"
  )+ 
  geom_spatvector(data = portugal, fill = NA)




