################################################################################
#                       VARIETIES TO SELECT IN THE FUTURE
################################################################################

#FMestre
#12-02-2025

rm(list = ls())

#Load packages
library(terra)

# 1. Metrics
metrics_arbequina <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_arbequina.csv", sep = ";")
metrics_cobrancosa <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_cobrancosa.csv", sep = ";")
metrics_cordovilSE <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_cordovilSE.csv", sep = ";")
metrics_cordovilTM <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_cordovilTM.csv", sep = ";")
metrics_galega <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_galega.csv", sep = ";")
metrics_madural <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_madural.csv", sep = ";")
metrics_picual <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_picual.csv", sep = ";")
metrics_verdeal <- read.csv("last_results_fev_2025\\tabelas_metrics\\metrics_verdeal.csv", sep = ";")

# 2. Threshold
t_arbequina <- metrics_arbequina[metrics_arbequina$criteria=="threshold",]$threshold
t_cobrancosa <- metrics_cobrancosa[metrics_cobrancosa$criteria=="threshold",]$threshold  
t_cordovilSE <- metrics_cordovilSE[metrics_cordovilSE$criteria=="threshold",]$threshold  
t_cordovilTM <- metrics_cordovilTM[metrics_cordovilTM$criteria=="threshold",]$threshold  
t_galega <- metrics_galega[metrics_galega$criteria=="threshold",]$threshold  
t_madural <- metrics_madural[metrics_madural$criteria=="threshold",]$threshold  
t_picual <- metrics_picual[metrics_picual$criteria=="threshold",]$threshold  
t_verdeal <- metrics_verdeal[metrics_verdeal$criteria=="threshold",]$threshold  

# 3. Load present projections
load("last_results_fev_2025/present/arbequina_ensemble.RData")
load("last_results_fev_2025/present/cobrancosa_ensemble.RData")
load("last_results_fev_2025/present/cordovilSE_ensemble.RData")
load("last_results_fev_2025/present/cordovilTM_ensemble.RData")
load("last_results_fev_2025/present/galega_ensemble.RData")
load("last_results_fev_2025/present/madural_ensemble.RData")
load("last_results_fev_2025/present/picual_ensemble.RData")
load("last_results_fev_2025/present/verdeal_ensemble.RData")

# 4. Create current projections shapefile
present <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
present <- present[,1:8]
#
present$results_galega <- ensemble_galega
present$results_cobrancosa <- ensemble_cobrancosa
present$results_arbequina <- ensemble_arbequina
present$results_picual <- ensemble_picual
present$results_cordovilTM <- ensemble_cordovilTM
present$results_cordovilSE <- ensemble_cordovilSE
present$results_madural <- ensemble_madural
present$results_verdeal <- ensemble_verdeal

# 5. Which varieties are present?
present$results_galega_01 <- ifelse(present$results_galega >= t_galega, 1, 0)
present$results_cobrancosa_01 <- ifelse(present$results_cobrancosa >= t_cobrancosa, 1, 0)
present$results_arbequina_01 <- ifelse(present$results_arbequina >= t_arbequina, 1, 0)
present$results_picual_01 <- ifelse(present$results_picual >= t_picual, 1, 0)
present$results_cordovilTM_01 <- ifelse(present$results_cordovilTM >= t_cordovilTM, 1, 0)
present$results_cordovilSE_01 <- ifelse(present$results_cordovilSE >= t_cordovilSE, 1, 0)
present$results_madural_01 <- ifelse(present$results_madural >= t_madural, 1, 0)
present$results_verdeal_01 <- ifelse(present$results_verdeal >= t_verdeal, 1, 0)

# 6. Load future projections for all varieties and GCM

# 6.1. Galega
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_galega_2050_MPI.RData")

# 6.2. Cobrancosa
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cobrancosa_2050_MPI.RData")

# 6.3. Arbequina
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_arbequina_2050_MPI.RData")

# 6.4. Picual
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_picual_2050_MPI.RData")

# 6.5. Cordovil TM
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilTM_2050_MPI.RData")

# 6.6. Cordovil SE
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_cordovilSE_2050_MPI.RData")

# 6.7. Madural
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_madural_2050_MPI.RData")

# 6.8. Verdeal
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_CC.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_CN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_GF.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_HAD.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_IN.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_IP.RData")
load("~/github/olive_variety_enm/last_results_fev_2025/future_projections/ensemble_verdeal_2050_MPI.RData")

# 7. Create current projections shapefile
future <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
future <- future[,1:8]

# 8. Add future suitabilities to table
#
future$results_galega_2050_CC <- ensemble_galega_2050_CC$ensemble_weighted
future$results_galega_2050_CN <- ensemble_galega_2050_CN$ensemble_weighted
future$results_galega_2050_GF <- ensemble_galega_2050_GF$ensemble_weighted
future$results_galega_2050_HAD <- ensemble_galega_2050_HAD$ensemble_weighted
future$results_galega_2050_IN <- ensemble_galega_2050_IN$ensemble_weighted
future$results_galega_2050_IP <- ensemble_galega_2050_IP$ensemble_weighted
future$results_galega_2050_MPI <- ensemble_galega_2050_MPI$ensemble_weighted
#
future$results_cobrancosa_2050_CC <- ensemble_cobrancosa_2050_CC$ensemble_weighted
future$results_cobrancosa_2050_CN <- ensemble_cobrancosa_2050_CN$ensemble_weighted
future$results_cobrancosa_2050_GF <- ensemble_cobrancosa_2050_GF$ensemble_weighted
future$results_cobrancosa_2050_HAD <- ensemble_cobrancosa_2050_HAD$ensemble_weighted
future$results_cobrancosa_2050_IN <- ensemble_cobrancosa_2050_IN$ensemble_weighted
future$results_cobrancosa_2050_IP <- ensemble_cobrancosa_2050_IP$ensemble_weighted
future$results_cobrancosa_2050_MPI <- ensemble_cobrancosa_2050_MPI$ensemble_weighted
#
future$results_cordovilSE_2050_CC <- ensemble_cordovilSE_2050_CC$ensemble_weighted
future$results_cordovilSE_2050_CN <- ensemble_cordovilSE_2050_CN$ensemble_weighted
future$results_cordovilSE_2050_GF <- ensemble_cordovilSE_2050_GF$ensemble_weighted
future$results_cordovilSE_2050_HAD <- ensemble_cordovilSE_2050_HAD$ensemble_weighted
future$results_cordovilSE_2050_IN <- ensemble_cordovilSE_2050_IN$ensemble_weighted
future$results_cordovilSE_2050_IP <- ensemble_cordovilSE_2050_IP$ensemble_weighted
future$results_cordovilSE_2050_MPI <- ensemble_cordovilSE_2050_MPI$ensemble_weighted
#
future$results_cordovilTM_2050_CC <- ensemble_cordovilTM_2050_CC$ensemble_weighted
future$results_cordovilTM_2050_CN <- ensemble_cordovilTM_2050_CN$ensemble_weighted
future$results_cordovilTM_2050_GF <- ensemble_cordovilTM_2050_GF$ensemble_weighted
future$results_cordovilTM_2050_HAD <- ensemble_cordovilTM_2050_HAD$ensemble_weighted
future$results_cordovilTM_2050_IN <- ensemble_cordovilTM_2050_IN$ensemble_weighted
future$results_cordovilTM_2050_IP <- ensemble_cordovilTM_2050_IP$ensemble_weighted
future$results_cordovilTM_2050_MPI <- ensemble_cordovilTM_2050_MPI$ensemble_weighted
#
future$results_arbequina_2050_CC <- ensemble_arbequina_2050_CC$ensemble_weighted
future$results_arbequina_2050_CN <- ensemble_arbequina_2050_CN$ensemble_weighted
future$results_arbequina_2050_GF <- ensemble_arbequina_2050_GF$ensemble_weighted
future$results_arbequina_2050_HAD <- ensemble_arbequina_2050_HAD$ensemble_weighted
future$results_arbequina_2050_IN <- ensemble_arbequina_2050_IN$ensemble_weighted
future$results_arbequina_2050_IP <- ensemble_arbequina_2050_IP$ensemble_weighted
future$results_arbequina_2050_MPI <- ensemble_arbequina_2050_MPI$ensemble_weighted
#
future$results_madural_2050_CC <- ensemble_madural_2050_CC$ensemble_weighted
future$results_madural_2050_CN <- ensemble_madural_2050_CN$ensemble_weighted
future$results_madural_2050_GF <- ensemble_madural_2050_GF$ensemble_weighted
future$results_madural_2050_HAD <- ensemble_madural_2050_HAD$ensemble_weighted
future$results_madural_2050_IN <- ensemble_madural_2050_IN$ensemble_weighted
future$results_madural_2050_IP <- ensemble_madural_2050_IP$ensemble_weighted
future$results_madural_2050_MPI <- ensemble_madural_2050_MPI$ensemble_weighted
#
future$results_picual_2050_CC <- ensemble_picual_2050_CC$ensemble_weighted
future$results_picual_2050_CN <- ensemble_picual_2050_CN$ensemble_weighted
future$results_picual_2050_GF <- ensemble_picual_2050_GF$ensemble_weighted
future$results_picual_2050_HAD <- ensemble_picual_2050_HAD$ensemble_weighted
future$results_picual_2050_IN <- ensemble_picual_2050_IN$ensemble_weighted
future$results_picual_2050_IP <- ensemble_picual_2050_IP$ensemble_weighted
future$results_picual_2050_MPI <- ensemble_picual_2050_MPI$ensemble_weighted
#
future$results_verdeal_2050_CC <- ensemble_verdeal_2050_CC$ensemble_weighted
future$results_verdeal_2050_CN <- ensemble_verdeal_2050_CN$ensemble_weighted
future$results_verdeal_2050_GF <- ensemble_verdeal_2050_GF$ensemble_weighted
future$results_verdeal_2050_HAD <- ensemble_verdeal_2050_HAD$ensemble_weighted
future$results_verdeal_2050_IN <- ensemble_verdeal_2050_IN$ensemble_weighted
future$results_verdeal_2050_IP <- ensemble_verdeal_2050_IP$ensemble_weighted
future$results_verdeal_2050_MPI <- ensemble_verdeal_2050_MPI$ensemble_weighted

# 8. Percent increase from current suitability for all GCM

percent_increase_galega <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_galega <- percent_increase_galega[,1:8]
#
percent_increase_galega$percent_increase_galega_CC <- ifelse((ensemble_galega_2050_CC$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_CC$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
percent_increase_galega$percent_increase_galega_CN <- ifelse((ensemble_galega_2050_CN$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_CN$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
percent_increase_galega$percent_increase_galega_GF <- ifelse((ensemble_galega_2050_GF$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_GF$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
percent_increase_galega$percent_increase_galega_HAD <- ifelse((ensemble_galega_2050_HAD$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_HAD$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
percent_increase_galega$percent_increase_galega_IN <- ifelse((ensemble_galega_2050_IN$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_IN$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
percent_increase_galega$percent_increase_galega_IP <- ifelse((ensemble_galega_2050_IP$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_IP$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
percent_increase_galega$percent_increase_galega_MPI <- ifelse((ensemble_galega_2050_MPI$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_MPI$ensemble_weighted - present$results_galega, 0)*100/present$results_galega*present$results_galega_01
#
percent_increase_galega$percent_increase_galega_MEAN <- rowMeans(data.frame(percent_increase_galega[,9:15]))

######

percent_increase_cobrancosa <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_cobrancosa <- percent_increase_cobrancosa[,1:8]
#
percent_increase_cobrancosa$percent_increase_cobrancosa_CC <- ifelse((ensemble_cobrancosa_2050_CC$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_CC$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
percent_increase_cobrancosa$percent_increase_cobrancosa_CN <- ifelse((ensemble_cobrancosa_2050_CN$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_CN$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
percent_increase_cobrancosa$percent_increase_cobrancosa_GF <- ifelse((ensemble_cobrancosa_2050_GF$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_GF$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
percent_increase_cobrancosa$percent_increase_cobrancosa_HAD <- ifelse((ensemble_cobrancosa_2050_HAD$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_HAD$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
percent_increase_cobrancosa$percent_increase_cobrancosa_IN <- ifelse((ensemble_cobrancosa_2050_IN$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_IN$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
percent_increase_cobrancosa$percent_increase_cobrancosa_IP <- ifelse((ensemble_cobrancosa_2050_IP$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_IP$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
percent_increase_cobrancosa$percent_increase_cobrancosa_MPI <- ifelse((ensemble_cobrancosa_2050_MPI$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_MPI$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa*present$results_cobrancosa_01
#
percent_increase_cobrancosa$percent_increase_cobrancosa_MEAN <- rowMeans(data.frame(percent_increase_cobrancosa[,9:15]))

######

percent_increase_cordovilSE <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_cordovilSE <- percent_increase_cordovilSE[,1:8]
#
percent_increase_cordovilSE$percent_increase_cordovilSE_CC <- ifelse((ensemble_cordovilSE_2050_CC$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_CC$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
percent_increase_cordovilSE$percent_increase_cordovilSE_CN <- ifelse((ensemble_cordovilSE_2050_CN$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_CN$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
percent_increase_cordovilSE$percent_increase_cordovilSE_GF <- ifelse((ensemble_cordovilSE_2050_GF$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_GF$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
percent_increase_cordovilSE$percent_increase_cordovilSE_HAD <- ifelse((ensemble_cordovilSE_2050_HAD$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_HAD$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
percent_increase_cordovilSE$percent_increase_cordovilSE_IN <- ifelse((ensemble_cordovilSE_2050_IN$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_IN$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
percent_increase_cordovilSE$percent_increase_cordovilSE_IP <- ifelse((ensemble_cordovilSE_2050_IP$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_IP$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
percent_increase_cordovilSE$percent_increase_cordovilSE_MPI <- ifelse((ensemble_cordovilSE_2050_MPI$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_MPI$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE*present$results_cordovilSE_01
#
percent_increase_cordovilSE$percent_increase_cordovilSE_MEAN <- rowMeans(data.frame(percent_increase_cordovilSE[,9:15]))

######

percent_increase_cordovilTM <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_cordovilTM <- percent_increase_cordovilTM[,1:8]
#
percent_increase_cordovilTM$percent_increase_cordovilTM_CC <- ifelse((ensemble_cordovilTM_2050_CC$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_CC$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
percent_increase_cordovilTM$percent_increase_cordovilTM_CN <- ifelse((ensemble_cordovilTM_2050_CN$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_CN$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
percent_increase_cordovilTM$percent_increase_cordovilTM_GF <- ifelse((ensemble_cordovilTM_2050_GF$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_GF$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
percent_increase_cordovilTM$percent_increase_cordovilTM_HAD <- ifelse((ensemble_cordovilTM_2050_HAD$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_HAD$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
percent_increase_cordovilTM$percent_increase_cordovilTM_IN <- ifelse((ensemble_cordovilTM_2050_IN$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_IN$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
percent_increase_cordovilTM$percent_increase_cordovilTM_IP <- ifelse((ensemble_cordovilTM_2050_IP$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_IP$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
percent_increase_cordovilTM$percent_increase_cordovilTM_MPI <- ifelse((ensemble_cordovilTM_2050_MPI$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_MPI$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM*present$results_cordovilTM_01
#
percent_increase_cordovilTM$percent_increase_cordovilTM_MEAN <- rowMeans(data.frame(percent_increase_cordovilTM[,9:15]))

######

percent_increase_arbequina <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_arbequina <- percent_increase_arbequina[,1:8]
#
percent_increase_arbequina$percent_increase_arbequina_CC <- ifelse((ensemble_arbequina_2050_CC$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_CC$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
percent_increase_arbequina$percent_increase_arbequina_CN <- ifelse((ensemble_arbequina_2050_CN$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_CN$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
percent_increase_arbequina$percent_increase_arbequina_GF <- ifelse((ensemble_arbequina_2050_GF$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_GF$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
percent_increase_arbequina$percent_increase_arbequina_HAD <- ifelse((ensemble_arbequina_2050_HAD$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_HAD$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
percent_increase_arbequina$percent_increase_arbequina_IN <- ifelse((ensemble_arbequina_2050_IN$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_IN$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
percent_increase_arbequina$percent_increase_arbequina_IP <- ifelse((ensemble_arbequina_2050_IP$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_IP$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
percent_increase_arbequina$percent_increase_arbequina_MPI <- ifelse((ensemble_arbequina_2050_MPI$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_MPI$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina*present$results_arbequina_01
#
percent_increase_arbequina$percent_increase_arbequina_MEAN <- rowMeans(data.frame(percent_increase_arbequina[,9:15]))

######

percent_increase_madural <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_madural <- percent_increase_madural[,1:8]
#
percent_increase_madural$percent_increase_madural_CC <- ifelse((ensemble_madural_2050_CC$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_CC$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
percent_increase_madural$percent_increase_madural_CN <- ifelse((ensemble_madural_2050_CN$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_CN$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
percent_increase_madural$percent_increase_madural_GF <- ifelse((ensemble_madural_2050_GF$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_GF$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
percent_increase_madural$percent_increase_madural_HAD <- ifelse((ensemble_madural_2050_HAD$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_HAD$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
percent_increase_madural$percent_increase_madural_IN <- ifelse((ensemble_madural_2050_IN$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_IN$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
percent_increase_madural$percent_increase_madural_IP <- ifelse((ensemble_madural_2050_IP$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_IP$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
percent_increase_madural$percent_increase_madural_MPI <- ifelse((ensemble_madural_2050_MPI$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_MPI$ensemble_weighted - present$results_madural, 0)*100/present$results_madural*present$results_madural_01
#
percent_increase_madural$percent_increase_madural_MEAN <- rowMeans(data.frame(percent_increase_madural[,9:15]))

######

percent_increase_picual <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_picual <- percent_increase_picual[,1:8]
#
percent_increase_picual$percent_increase_picual_CC <- ifelse((ensemble_picual_2050_CC$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_CC$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
percent_increase_picual$percent_increase_picual_CN <- ifelse((ensemble_picual_2050_CN$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_CN$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
percent_increase_picual$percent_increase_picual_GF <- ifelse((ensemble_picual_2050_GF$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_GF$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
percent_increase_picual$percent_increase_picual_HAD <- ifelse((ensemble_picual_2050_HAD$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_HAD$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
percent_increase_picual$percent_increase_picual_IN <- ifelse((ensemble_picual_2050_IN$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_IN$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
percent_increase_picual$percent_increase_picual_IP <- ifelse((ensemble_picual_2050_IP$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_IP$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
percent_increase_picual$percent_increase_picual_MPI <- ifelse((ensemble_picual_2050_MPI$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_MPI$ensemble_weighted - present$results_picual, 0)*100/present$results_picual*present$results_picual_01
#
percent_increase_picual$percent_increase_picual_MEAN <- rowMeans(data.frame(percent_increase_picual[,9:15]))

# 9. Which is the selected var per square grid- RESTRICTING TO CELLS WHERE THE SPECIES IS ABOVE ITS SUITABILITY THRESHOLD TODAY

percent_increase_verdeal <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_verdeal <- percent_increase_verdeal[,1:8]
#
percent_increase_verdeal$percent_increase_verdeal_CC <- ifelse((ensemble_verdeal_2050_CC$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_CC$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
percent_increase_verdeal$percent_increase_verdeal_CN <- ifelse((ensemble_verdeal_2050_CN$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_CN$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
percent_increase_verdeal$percent_increase_verdeal_GF <- ifelse((ensemble_verdeal_2050_GF$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_GF$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
percent_increase_verdeal$percent_increase_verdeal_HAD <- ifelse((ensemble_verdeal_2050_HAD$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_HAD$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
percent_increase_verdeal$percent_increase_verdeal_IN <- ifelse((ensemble_verdeal_2050_IN$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_IN$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
percent_increase_verdeal$percent_increase_verdeal_IP <- ifelse((ensemble_verdeal_2050_IP$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_IP$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
percent_increase_verdeal$percent_increase_verdeal_MPI <- ifelse((ensemble_verdeal_2050_MPI$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_MPI$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal*present$results_verdeal_01
#
percent_increase_verdeal$percent_increase_verdeal_MEAN <- rowMeans(data.frame(percent_increase_verdeal[,9:15]))

# 10. Which is the selected var per square grid

selected_var <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
selected_var <- selected_var[,1:8]
#
selected_var$galega_increase <- percent_increase_galega$percent_increase_galega_MEAN
selected_var$cobrancosa_increase <- percent_increase_cobrancosa$percent_increase_cobrancosa_MEAN
selected_var$cordovilSE_increase <- percent_increase_cordovilSE$percent_increase_cordovilSE_MEAN
selected_var$cordovilTM_increase <- percent_increase_cordovilTM$percent_increase_cordovilTM_MEAN
selected_var$arbequina_increase <- percent_increase_arbequina$percent_increase_arbequina_MEAN
selected_var$madural_increase <- percent_increase_madural$percent_increase_madural_MEAN
selected_var$picual_increase <- percent_increase_picual$percent_increase_picual_MEAN
selected_var$verdeal_increase <- percent_increase_verdeal$percent_increase_verdeal_MEAN
#View(data.frame(selected_var))

selected_var2 <- c()

for(i in 1:nrow(selected_var)){
  
max_suit <- max(data.frame(selected_var[i,9:16]))

if(max_suit!=0){

selected_var2[i] <- names(selected_var[i,9:16])[which(max_suit == data.frame(selected_var[i,9:16]))]

}else selected_var2[i] <- NA

}

selected_var2 <- gsub("_increase", "", selected_var2)

selected_var$selected_var <- selected_var2

#Plot
plot(selected_var, "selected_var")


# 11. Percent increase from current suitability for all GCM

percent_increase_galega_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_galega_2 <- percent_increase_galega_2[,1:8]
#
percent_increase_galega_2$percent_increase_galega_2_CC <- ifelse((ensemble_galega_2050_CC$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_CC$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
percent_increase_galega_2$percent_increase_galega_2_CN <- ifelse((ensemble_galega_2050_CN$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_CN$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
percent_increase_galega_2$percent_increase_galega_2_GF <- ifelse((ensemble_galega_2050_GF$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_GF$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
percent_increase_galega_2$percent_increase_galega_2_HAD <- ifelse((ensemble_galega_2050_HAD$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_HAD$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
percent_increase_galega_2$percent_increase_galega_2_IN <- ifelse((ensemble_galega_2050_IN$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_IN$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
percent_increase_galega_2$percent_increase_galega_2_IP <- ifelse((ensemble_galega_2050_IP$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_IP$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
percent_increase_galega_2$percent_increase_galega_2_MPI <- ifelse((ensemble_galega_2050_MPI$ensemble_weighted - present$results_galega)>0, ensemble_galega_2050_MPI$ensemble_weighted - present$results_galega, 0)*100/present$results_galega
#
percent_increase_galega_2$percent_increase_galega_2_MEAN <- rowMeans(data.frame(percent_increase_galega_2[,9:15]))

######

percent_increase_cobrancosa_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_cobrancosa_2 <- percent_increase_cobrancosa_2[,1:8]
#
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_CC <- ifelse((ensemble_cobrancosa_2050_CC$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_CC$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_CN <- ifelse((ensemble_cobrancosa_2050_CN$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_CN$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_GF <- ifelse((ensemble_cobrancosa_2050_GF$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_GF$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_HAD <- ifelse((ensemble_cobrancosa_2050_HAD$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_HAD$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_IN <- ifelse((ensemble_cobrancosa_2050_IN$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_IN$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_IP <- ifelse((ensemble_cobrancosa_2050_IP$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_IP$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_MPI <- ifelse((ensemble_cobrancosa_2050_MPI$ensemble_weighted - present$results_cobrancosa)>0, ensemble_cobrancosa_2050_MPI$ensemble_weighted - present$results_cobrancosa, 0)*100/present$results_cobrancosa
#
percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_MEAN <- rowMeans(data.frame(percent_increase_cobrancosa_2[,9:15]))

######

percent_increase_cordovilSE_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_cordovilSE_2 <- percent_increase_cordovilSE_2[,1:8]
#
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_CC <- ifelse((ensemble_cordovilSE_2050_CC$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_CC$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_CN <- ifelse((ensemble_cordovilSE_2050_CN$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_CN$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_GF <- ifelse((ensemble_cordovilSE_2050_GF$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_GF$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_HAD <- ifelse((ensemble_cordovilSE_2050_HAD$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_HAD$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_IN <- ifelse((ensemble_cordovilSE_2050_IN$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_IN$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_IP <- ifelse((ensemble_cordovilSE_2050_IP$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_IP$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_MPI <- ifelse((ensemble_cordovilSE_2050_MPI$ensemble_weighted - present$results_cordovilSE)>0, ensemble_cordovilSE_2050_MPI$ensemble_weighted - present$results_cordovilSE, 0)*100/present$results_cordovilSE
#
percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_MEAN <- rowMeans(data.frame(percent_increase_cordovilSE_2[,9:15]))

######

percent_increase_cordovilTM_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_cordovilTM_2 <- percent_increase_cordovilTM_2[,1:8]
#
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_CC <- ifelse((ensemble_cordovilTM_2050_CC$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_CC$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_CN <- ifelse((ensemble_cordovilTM_2050_CN$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_CN$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_GF <- ifelse((ensemble_cordovilTM_2050_GF$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_GF$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_HAD <- ifelse((ensemble_cordovilTM_2050_HAD$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_HAD$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_IN <- ifelse((ensemble_cordovilTM_2050_IN$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_IN$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_IP <- ifelse((ensemble_cordovilTM_2050_IP$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_IP$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_MPI <- ifelse((ensemble_cordovilTM_2050_MPI$ensemble_weighted - present$results_cordovilTM)>0, ensemble_cordovilTM_2050_MPI$ensemble_weighted - present$results_cordovilTM, 0)*100/present$results_cordovilTM
#
percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_MEAN <- rowMeans(data.frame(percent_increase_cordovilTM_2[,9:15]))

######

percent_increase_arbequina_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_arbequina_2 <- percent_increase_arbequina_2[,1:8]
#
percent_increase_arbequina_2$percent_increase_arbequina_2_CC <- ifelse((ensemble_arbequina_2050_CC$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_CC$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
percent_increase_arbequina_2$percent_increase_arbequina_2_CN <- ifelse((ensemble_arbequina_2050_CN$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_CN$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
percent_increase_arbequina_2$percent_increase_arbequina_2_GF <- ifelse((ensemble_arbequina_2050_GF$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_GF$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
percent_increase_arbequina_2$percent_increase_arbequina_2_HAD <- ifelse((ensemble_arbequina_2050_HAD$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_HAD$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
percent_increase_arbequina_2$percent_increase_arbequina_2_IN <- ifelse((ensemble_arbequina_2050_IN$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_IN$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
percent_increase_arbequina_2$percent_increase_arbequina_2_IP <- ifelse((ensemble_arbequina_2050_IP$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_IP$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
percent_increase_arbequina_2$percent_increase_arbequina_2_MPI <- ifelse((ensemble_arbequina_2050_MPI$ensemble_weighted - present$results_arbequina)>0, ensemble_arbequina_2050_MPI$ensemble_weighted - present$results_arbequina, 0)*100/present$results_arbequina
#
percent_increase_arbequina_2$percent_increase_arbequina_2_MEAN <- rowMeans(data.frame(percent_increase_arbequina_2[,9:15]))

######

percent_increase_madural_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_madural_2 <- percent_increase_madural_2[,1:8]
#
percent_increase_madural_2$percent_increase_madural_2_CC <- ifelse((ensemble_madural_2050_CC$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_CC$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
percent_increase_madural_2$percent_increase_madural_2_CN <- ifelse((ensemble_madural_2050_CN$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_CN$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
percent_increase_madural_2$percent_increase_madural_2_GF <- ifelse((ensemble_madural_2050_GF$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_GF$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
percent_increase_madural_2$percent_increase_madural_2_HAD <- ifelse((ensemble_madural_2050_HAD$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_HAD$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
percent_increase_madural_2$percent_increase_madural_2_IN <- ifelse((ensemble_madural_2050_IN$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_IN$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
percent_increase_madural_2$percent_increase_madural_2_IP <- ifelse((ensemble_madural_2050_IP$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_IP$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
percent_increase_madural_2$percent_increase_madural_2_MPI <- ifelse((ensemble_madural_2050_MPI$ensemble_weighted - present$results_madural)>0, ensemble_madural_2050_MPI$ensemble_weighted - present$results_madural, 0)*100/present$results_madural
#
percent_increase_madural_2$percent_increase_madural_2_MEAN <- rowMeans(data.frame(percent_increase_madural_2[,9:15]))

######

percent_increase_picual_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_picual_2 <- percent_increase_picual_2[,1:8]
#
percent_increase_picual_2$percent_increase_picual_2_CC <- ifelse((ensemble_picual_2050_CC$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_CC$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
percent_increase_picual_2$percent_increase_picual_2_CN <- ifelse((ensemble_picual_2050_CN$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_CN$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
percent_increase_picual_2$percent_increase_picual_2_GF <- ifelse((ensemble_picual_2050_GF$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_GF$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
percent_increase_picual_2$percent_increase_picual_2_HAD <- ifelse((ensemble_picual_2050_HAD$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_HAD$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
percent_increase_picual_2$percent_increase_picual_2_IN <- ifelse((ensemble_picual_2050_IN$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_IN$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
percent_increase_picual_2$percent_increase_picual_2_IP <- ifelse((ensemble_picual_2050_IP$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_IP$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
percent_increase_picual_2$percent_increase_picual_2_MPI <- ifelse((ensemble_picual_2050_MPI$ensemble_weighted - present$results_picual)>0, ensemble_picual_2050_MPI$ensemble_weighted - present$results_picual, 0)*100/present$results_picual
#
percent_increase_picual_2$percent_increase_picual_2_MEAN <- rowMeans(data.frame(percent_increase_picual_2[,9:15]))

################################################################################
#                     VARIETY RICHNNESS CURRENT AND FUTURE
################################################################################

##### CURRENT #####

present$current_predicted_species <- present$results_galega_01 +
                                     present$results_cobrancosa_01 +
                                     present$results_arbequina_01 +
                                     present$results_picual_01 +
                                     present$results_cordovilTM_01 +
                                     present$results_cordovilSE_01 +
                                     present$results_madural_01 +
                                     present$results_verdeal_01

#Plot using gradual colour for current_predicted_species
plot(present, "current_predicted_species")

#Keep only current_predicted_species
present_richness <- present[,"current_predicted_species"]

#Save shapefile
terra::writeVector(present_richness, "olive_potential_richness_05Mar25.shp", overwrite=TRUE)

##### FUTURE #####

#mean of the following vectors
galega_2050 <- rowMeans(data.frame(future$results_galega_2050_CC,
                                   future$results_galega_2050_CN,
                                   future$results_galega_2050_GF,
                                   future$results_galega_2050_HAD,
                                   future$results_galega_2050_IN,
                                   future$results_galega_2050_IP,
                                   future$results_galega_2050_MPI)
                                   )

cobrancosa_2050 <- rowMeans(data.frame(future$results_cobrancosa_2050_CC,
                                      future$results_cobrancosa_2050_CN,
                                      future$results_cobrancosa_2050_GF,
                                      future$results_cobrancosa_2050_HAD,
                                      future$results_cobrancosa_2050_IN,
                                      future$results_cobrancosa_2050_IP,
                                      future$results_cobrancosa_2050_MPI)
                                      )

cordovilTM_2050 <- rowMeans(data.frame(future$results_cordovilTM_2050_CC,
                                      future$results_cordovilTM_2050_CN,
                                      future$results_cordovilTM_2050_GF,
                                      future$results_cordovilTM_2050_HAD,
                                      future$results_cordovilTM_2050_IN,
                                      future$results_cordovilTM_2050_IP,
                                      future$results_cordovilTM_2050_MPI)
                                      )

cordovilSE_2050 <- rowMeans(data.frame(future$results_cordovilSE_2050_CC,
                                      future$results_cordovilSE_2050_CN,
                                      future$results_cordovilSE_2050_GF,
                                      future$results_cordovilSE_2050_HAD,
                                      future$results_cordovilSE_2050_IN,
                                      future$results_cordovilSE_2050_IP,
                                      future$results_cordovilSE_2050_MPI)
                                      )  

arbequina_2050 <- rowMeans(data.frame(future$results_arbequina_2050_CC,
                                     future$results_arbequina_2050_CN,
                                     future$results_arbequina_2050_GF,
                                     future$results_arbequina_2050_HAD,
                                     future$results_arbequina_2050_IN,
                                     future$results_arbequina_2050_IP,
                                     future$results_arbequina_2050_MPI)
                                     )

verdeal_2050 <- rowMeans(data.frame(future$results_verdeal_2050_CC,
                                   future$results_verdeal_2050_CN,
                                   future$results_verdeal_2050_GF,
                                   future$results_verdeal_2050_HAD,
                                   future$results_verdeal_2050_IN,
                                   future$results_verdeal_2050_IP,
                                   future$results_verdeal_2050_MPI)
                                   )

madural_2050 <- rowMeans(data.frame(future$results_madural_2050_CC,
                                   future$results_madural_2050_CN,
                                   future$results_madural_2050_GF,
                                   future$results_madural_2050_HAD,
                                   future$results_madural_2050_IN,
                                   future$results_madural_2050_IP,
                                   future$results_madural_2050_MPI)
                                   )

picual_2050 <- rowMeans(data.frame(future$results_picual_2050_CC,
                                  future$results_picual_2050_CN,
                                  future$results_picual_2050_GF,
                                  future$results_picual_2050_HAD,
                                  future$results_picual_2050_IN,
                                  future$results_picual_2050_IP,
                                  future$results_picual_2050_MPI)
                                  )


galega_2050_01 <- ifelse(galega_2050 >= t_galega, 1, 0)
cobrancosa_2050_01 <- ifelse(cobrancosa_2050 >= t_cobrancosa, 1, 0)
cordovilTM_2050_01 <- ifelse(cordovilTM_2050 >= t_cordovilTM, 1, 0)
cordovilSE_2050_01 <- ifelse(cordovilSE_2050 >= t_cordovilSE, 1, 0)
arbequina_2050_01 <- ifelse(arbequina_2050 >= t_arbequina, 1, 0)
verdeal_2050_01 <- ifelse(verdeal_2050 >= t_verdeal, 1, 0)
madural_2050_01 <- ifelse(madural_2050 >= t_madural, 1, 0)
picual_2050_01 <- ifelse(picual_2050 >= t_picual, 1, 0)

#Sum all
future$future_predicted_species <- galega_2050_01 +
                                   cobrancosa_2050_01 +
                                   cordovilTM_2050_01 +
                                   cordovilSE_2050_01 +
                                   arbequina_2050_01 +
                                   verdeal_2050_01 +
                                   madural_2050_01 +
                                   picual_2050_01

#plot using gradual colour for future_predicted_species
plot(future, "future_predicted_species")

#Keep only future_predicted_species
future_richness <- future[,"future_predicted_species"]

#Save shapefile
terra::writeVector(future_richness, "olive_future_potential_richness_2050_05Mar25.shp", overwrite=TRUE)

#Gain, loss and stable areas - difference between present_richness and future_richness
# Access attribute tables
present_values <- values(present_richness)
future_values <- values(future_richness)

# Perform column subtraction
difference_01 <- future_values$future_predicted_species - present_values$current_predicted_species

# Add the result to the present_richness SpatVector
difference_present_future <- present_richness
difference_present_future$difference <- difference_01
difference_present_future <- difference_present_future[,2]

#Plot
plot(difference_present_future, "difference")

#Save
terra::writeVector(difference_present_future, "olive_gain_loss_stable_richness_05Mar25.shp", overwrite=TRUE)

################################################################################
#         FIGURE RELATING VAR PRESENT AND % SUITABLE GRIDS IN FUTURE 
################################################################################

library(ggplot2)
library(dplyr)

df_galega <- data.frame(rep("galega", length(ensemble_galega$ensemble_weighted)),
                        rownames(ensemble_galega),
                        ensemble_galega$ensemble_weighted,
                        galega_2050)

names(df_galega) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_cobrancosa <- data.frame(rep("cobrancosa", length(ensemble_cobrancosa$ensemble_weighted)),
                            rownames(ensemble_cobrancosa),
                            ensemble_cobrancosa$ensemble_weighted,
                            cobrancosa_2050)

names(df_cobrancosa) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_cordovilTM <- data.frame(rep("cordovilTM", length(ensemble_cordovilTM$ensemble_weighted)),
                            rownames(ensemble_cordovilTM),
                            ensemble_cordovilTM$ensemble_weighted,
                            cordovilTM_2050)

names(df_cordovilTM) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_cordovilSE <- data.frame(rep("cordovilSE", length(ensemble_cordovilSE$ensemble_weighted)),
                            rownames(ensemble_cordovilSE),
                            ensemble_cordovilSE$ensemble_weighted,
                            cordovilSE_2050)

names(df_cordovilSE) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_arbequina <- data.frame(rep("arbequina", length(ensemble_arbequina$ensemble_weighted)),
                            rownames(ensemble_arbequina),
                            ensemble_arbequina$ensemble_weighted,
                            arbequina_2050)

names(df_arbequina) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_verdeal <- data.frame(rep("verdeal", length(ensemble_verdeal$ensemble_weighted)),
                            rownames(ensemble_verdeal),
                            ensemble_verdeal$ensemble_weighted,
                            verdeal_2050)

names(df_verdeal) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_madural <- data.frame(rep("madural", length(ensemble_madural$ensemble_weighted)),
                            rownames(ensemble_madural),
                            ensemble_madural$ensemble_weighted,
                            madural_2050)

names(df_madural) <- c("variety", "grid_id", "present_suitability", "future_suitability")

df_picual <- data.frame(rep("picual", length(ensemble_picual$ensemble_weighted)),
                            rownames(ensemble_picual),
                            ensemble_picual$ensemble_weighted,
                            picual_2050)

names(df_picual) <- c("variety", "grid_id", "present_suitability", "future_suitability")

# Combine all in a data frame
data1 <- rbind(df_galega, df_cobrancosa, df_cordovilTM, df_cordovilSE, df_arbequina, df_verdeal, df_madural, df_picual)


variety <- c("galega", "cobrancosa", "cordovilTM", "cordovilSE", "arbequina", "verdeal", "madural", "picual")

#all combinations of 1, 2, 3, 4, 5, 6, 7, 8 varieties
combinations_1 <- combn(variety, 1)
combinations_2 <- combn(variety, 2)
combinations_3 <- combn(variety, 3)
combinations_4 <- combn(variety, 4)
combinations_5 <- combn(variety, 5)
combinations_6 <- combn(variety, 6)
combinations_7 <- combn(variety, 7)
combinations_8 <- combn(variety, 8)


