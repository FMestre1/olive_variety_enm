################################################################################
#                       VARIETIES TO SELECT IN THE FUTURE
################################################################################

#FMestre
#12-02-2025

rm(list = ls())

#Load packages
library(terra)

#current_suitability <- terra::vect("")
#future_suitability <- terra::vect("")

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

# 10. Which is the selected var per square grid- RESTRICTING TO CELLS WHERE THE SPECIES IS ABOVE ITS SUITABILITY THRESHOLD TODAY

percent_increase_verdeal_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
percent_increase_verdeal_2 <- percent_increase_verdeal_2[,1:8]
#
percent_increase_verdeal_2$percent_increase_verdeal_2_CC <- ifelse((ensemble_verdeal_2050_CC$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_CC$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_CN <- ifelse((ensemble_verdeal_2050_CN$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_CN$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_GF <- ifelse((ensemble_verdeal_2050_GF$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_GF$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_HAD <- ifelse((ensemble_verdeal_2050_HAD$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_HAD$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_IN <- ifelse((ensemble_verdeal_2050_IN$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_IN$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_IP <- ifelse((ensemble_verdeal_2050_IP$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_IP$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
percent_increase_verdeal_2$percent_increase_verdeal_2_MPI <- ifelse((ensemble_verdeal_2050_MPI$ensemble_weighted - present$results_verdeal)>0, ensemble_verdeal_2050_MPI$ensemble_weighted - present$results_verdeal, 0)*100/present$results_verdeal
#
percent_increase_verdeal_2$percent_increase_verdeal_2_MEAN <- rowMeans(data.frame(percent_increase_verdeal_2[,9:15]))

# 11. Which is the selected var per square grid

selected_var_2 <- terra::vect("olive_variety_suitability_version_09Jan25/olive_variety_suitability_version_09Jan25.shp")
selected_var_2 <- selected_var_2[,1:8]
#
selected_var_2$galega_increase <- percent_increase_galega_2$percent_increase_galega_2_MEAN
selected_var_2$cobrancosa_increase <- percent_increase_cobrancosa_2$percent_increase_cobrancosa_2_MEAN
selected_var_2$cordovilSE_increase <- percent_increase_cordovilSE_2$percent_increase_cordovilSE_2_MEAN
selected_var_2$cordovilTM_increase <- percent_increase_cordovilTM_2$percent_increase_cordovilTM_2_MEAN
selected_var_2$arbequina_increase <- percent_increase_arbequina_2$percent_increase_arbequina_2_MEAN
selected_var_2$madural_increase <- percent_increase_madural_2$percent_increase_madural_2_MEAN
selected_var_2$picual_increase <- percent_increase_picual_2$percent_increase_picual_2_MEAN
selected_var_2$verdeal_increase <- percent_increase_verdeal_2$percent_increase_verdeal_2_MEAN
#View(data.frame(selected_var_2))

selected_var_22 <- c()

for(i in 1:nrow(selected_var_2)){
  
  max_suit <- max(data.frame(selected_var_2[i,9:16]))
  
  if(max_suit!=0){
    
    selected_var_22[i] <- names(selected_var_2[i,9:16])[which(max_suit == data.frame(selected_var_2[i,9:16]))]
    
  }else selected_var_22[i] <- NA
  
}

selected_var_22 <- gsub("_increase", "", selected_var_22)

selected_var_2$selected_var_2 <- selected_var_22

#Plot
plot(selected_var_2, "selected_var_2")


################################################################################
#                     VARIETY RICHNNESS CURRENT AND FUTURE
################################################################################



################################################################################
#         FIGURE RELATING VAR PRESENT AND % SUITABLE GRIDS IN FUTURE 
################################################################################



################################################################################
#                       WON AND LOST AREA PER VARIETY
################################################################################

