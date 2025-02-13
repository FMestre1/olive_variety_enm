################################################################################
#                       VARIETIES TO SELECT IN THE FUTURE
################################################################################

#FMestre
#12-02-2025

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
#View(data.frame(present))

# 6. What is the % of suitability increase relative to the threshold
present$results_galega_percent_increase <- ifelse(present$results_galega_01 == 1, (((present$results_galega - t_galega) * 100) / t_galega), 0)
present$results_cobrancosa_percent_increase <- ifelse(present$results_cobrancosa_01 == 1, (((present$results_cobrancosa - t_cobrancosa) * 100) / t_cobrancosa), 0)
present$results_arbequina_percent_increase <- ifelse(present$results_arbequina_01 == 1, (((present$results_arbequina - t_arbequina) * 100) / t_arbequina), 0)
present$results_picual_percent_increase <- ifelse(present$results_picual_01 == 1, (((present$results_picual - t_picual) * 100) / t_picual), 0)
present$results_cordovilTM_percent_increase <- ifelse(present$results_cordovilTM_01 == 1, (((present$results_cordovilTM - t_cordovilTM) * 100) / t_cordovilTM), 0)
present$results_cordovilSE_percent_increase <- ifelse(present$results_cordovilSE_01 == 1, (((present$results_cordovilSE - t_cordovilSE) * 100) / t_cordovilSE), 0)
present$results_madural_percent_increase <- ifelse(present$results_madural_01 == 1, (((present$results_madural - t_madural) * 100) / t_madural), 0)
present$results_verdeal_percent_increase <- ifelse(present$results_verdeal_01 == 1, (((present$results_verdeal - t_verdeal) * 100) / t_verdeal), 0)


#5. Which variety has the greater % increase relative to the treshold
names(present[,25:32])

## ??? PROBLEM!!! - Isto tem que ser com a suitability do futuro!!!!
#Mas deve ser relativo ao treshold, ou relativo ao passado?

# 7. Save the updated shapefile (Optional but recommended)
#terra::writeVector(present, "present_with_percent_increase.shp", overwrite=TRUE)
