#######################################################################################################################################
#                                                   MODEL PROJECTION - PRESENT
#######################################################################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)
#remotes::install_github("dieghernan/tidyterra")
library(tidyterra)

#A model performs accurately at a certain detection threshold if it scores a 
#TSS higher than 0.5 (Allouche et al. 2006; Liu et al. 2011).

#?ensemble

#Read
#galega_model <- read.sdm(filename = "galega_model.sdm")
#cobrancosa_model <- read.sdm(filename = "cobrancosa_model.sdm")
#arbequina_model <- read.sdm(filename = "arbequina_model.sdm")
#picual_model <- read.sdm(filename = "picual_model.sdm")
#cordovilTM_model <- read.sdm(filename = "cordovilTM_model.sdm")
#cordovilSE_model <- read.sdm(filename = "cordovilSE_model.sdm")
#madural_model <- read.sdm(filename = "madural_model.sdm")
#verdeal_model <- read.sdm( filename = "verdeal_model.sdm")

#Ensemble Outputs
#load("galega_ensemble.RData")
#load("cobrancosa_ensemble.RData")
#load("arbequina_ensemble.RData")
#load("picual_ensemble.RData")
#load("cordovilTM_ensemble.RData")
#load("cordovilSE_ensemble.RData")
#load("madural_ensemble.RData")
#load("verdeal_ensemble.RData")


##### GALEGA #####
ensemble_galega <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10,
  setting=list(
  method = 'weighted',
  stat = 'TSS',
  power = 2,
  expr = 'tss > 0.5'
   )
  )

utm10_results$results_galega <- ensemble_galega
#plot(utm10_results, "results_galega")
save(ensemble_galega, file = "galega_ensemble.RData")
#load( "galega_ensemble.RData")

##### COBRANÇOSA #####
ensemble_cobrancosa <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_cobrancosa <- ensemble_cobrancosa
#plot(utm10_results, "results_cobrancosa")
save(ensemble_cobrancosa, file = "cobrancosa_ensemble.RData")
#load("cobrancosa_ensemble.RData")

##### ARBEQUINA
ensemble_arbequina <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_arbequina <- ensemble_arbequina
#plot(utm10_results, "results_arbequina")
save(ensemble_arbequina, file = "arbequina_ensemble.RData")


##### PICUAL
ensemble_picual <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_picual <- ensemble_picual
#plot(utm10_results, "results_picual")
save(ensemble_picual, file = "picual_ensemble.RData")


##### CORDOVIL_TM
ensemble_cordovilTM <- sdm::ensemble(
  x = cordovilTM_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_cordovilTM <- ensemble_cordovilTM
#plot(utm10_results, "results_cordovilTM")
save(ensemble_cordovilTM, file = "cordovilTM_ensemble.RData")

##### CORDOVIL_SE
ensemble_cordovilSE <- sdm::ensemble(
  x = cordovilSE_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_cordovilSE <- ensemble_cordovilSE
#plot(utm10_results, "results_cordovilSE")
save(ensemble_cordovilSE, file = "cordovilSE_ensemble.RData")


##### MADURAL
ensemble_madural <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_madural <- ensemble_madural
#plot(utm10_results, "results_madural")
save(ensemble_madural, file = "madural_ensemble.RData")

##### VERDEAL
ensemble_verdeal <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_verdeal <- ensemble_verdeal
#plot(utm10_results, "results_verdeal")
save(ensemble_verdeal, file = "verdeal_ensemble.RData")

################################################################################
#                           Evaluation metrics
################################################################################

#galega_model
galega_observ <- as.vector(olive_vars$Galega)
galega_predict <- ensemble_galega$ensemble_weighted
galega_ev_df <- data.frame(galega_observ, galega_predict)
galega_ev_df[is.na(galega_ev_df)] <- 0
metrics_galega <- evaluates(galega_ev_df[,1],galega_ev_df[,2])
save(metrics_galega, file = "metrics_galega.RData")

#cobrancosa_model
cobrancosa_observ <- as.vector(olive_vars$Cobrancosa)
cobrancosa_predict <- ensemble_cobrancosa$ensemble_weighted
cobrancosa_ev_df <- data.frame(cobrancosa_observ, cobrancosa_predict)
cobrancosa_ev_df[is.na(cobrancosa_ev_df)] <- 0
metrics_cobrancosa <- evaluates(cobrancosa_ev_df[,1],cobrancosa_ev_df[,2])
save(metrics_cobrancosa, file = "metrics_cobrancosa.RData")

#arbequina_model
arbequina_observ <- as.vector(olive_vars$Arbequina)
arbequina_predict <- ensemble_arbequina$ensemble_weighted
arbequina_ev_df <- data.frame(arbequina_observ, arbequina_predict)
arbequina_ev_df[is.na(arbequina_ev_df)] <- 0
metrics_arbequina <- evaluates(arbequina_ev_df[,1],arbequina_ev_df[,2])
save(metrics_arbequina, file = "metrics_arbequina.RData")

#picual_model
picual_observ <- as.vector(olive_vars$Picual)
picual_predict <- ensemble_picual$ensemble_weighted
picual_ev_df <- data.frame(picual_observ, picual_predict)
picual_ev_df[is.na(picual_ev_df)] <- 0
metrics_picual <- evaluates(picual_ev_df[,1],picual_ev_df[,2])
save(metrics_picual, file = "metrics_picual.RData")

#cordovilTM_model
cordovilTM_observ <- as.vector(olive_vars$CordovilTM)
cordovilTM_predict <- ensemble_cordovilTM$ensemble_weighted
cordovilTM_ev_df <- data.frame(cordovilTM_observ, cordovilTM_predict)
cordovilTM_ev_df[is.na(cordovilTM_ev_df)] <- 0
metrics_cordovilTM <- evaluates(cordovilTM_ev_df[,1],cordovilTM_ev_df[,2])
save(metrics_cordovilTM, file = "metrics_cordovilTM.RData")

#cordovil_model
cordovilSE_observ <- as.vector(olive_vars$CordovilSE)
cordovilSE_predict <- ensemble_cordovilSE$ensemble_weighted
cordovilSE_ev_df <- data.frame(cordovilSE_observ, cordovilSE_predict)
cordovilSE_ev_df[is.na(cordovilSE_ev_df)] <- 0
metrics_cordovilSE <- evaluates(cordovilSE_ev_df[,1],cordovilSE_ev_df[,2])
save(metrics_cordovilSE, file = "metrics_cordovilSE.RData")

#madural_model
madural_observ <- as.vector(olive_vars$Madural)
madural_predict <- ensemble_madural$ensemble_weighted
madural_ev_df <- data.frame(madural_observ, madural_predict)
madural_ev_df[is.na(madural_ev_df)] <- 0
metrics_madural <- evaluates(madural_ev_df[,1],madural_ev_df[,2])
save(metrics_madural, file = "metrics_madural.RData")

#verdeal_model
verdeal_observ <- as.vector(olive_vars$Verdeal)
verdeal_predict <- ensemble_verdeal$ensemble_weighted
verdeal_ev_df <- data.frame(verdeal_observ, verdeal_predict)
verdeal_ev_df[is.na(verdeal_ev_df)] <- 0
metrics_verdeal <- evaluates(verdeal_ev_df[,1],verdeal_ev_df[,2])
save(metrics_verdeal, file = "metrics_verdeal.RData")

###### Overall table ###### 

#AUC
auc_1 <- c(metrics_galega@statistics$AUC,
metrics_cobrancosa@statistics$AUC,
metrics_arbequina@statistics$AUC,
metrics_picual@statistics$AUC,
metrics_cordovilTM@statistics$AUC,
metrics_cordovilSE@statistics$AUC,
metrics_madural@statistics$AUC,
metrics_verdeal@statistics$AUC
)

#TSS (using max(se+sp) as a criteria for predicting potential presence and absence)
tss_1 <- c(metrics_galega@threshold_based$TSS[2],
metrics_cobrancosa@threshold_based$TSS[2],
metrics_arbequina@threshold_based$TSS[2],
metrics_picual@threshold_based$TSS[2],
metrics_cordovilTM@threshold_based$TSS[2],
metrics_cordovilSE@threshold_based$TSS[2],
metrics_madural@threshold_based$TSS[2],
metrics_verdeal@threshold_based$TSS[2]
)

#Create data frame
metrics_1 <- data.frame(auc_1, tss_1)
colnames(metrics_1) <- c("AUC", "TSS")
rownames(metrics_1) <- c("Galega", "Cobrançosa", "Arbequina", "Picual", "CordovilTM", "CordovilSE", "Madural", "VerdealTM")
#write.csv(metrics_1, file = "metrics_1.csv")

################################################################################
#                              Write to shapefile
################################################################################

terra::writeVector(utm10_results, "olive_variety_suitability_version_december24", filetype="ESRI Shapefile")
#utm10_results <- terra::vect("olive_variety_suitability_version_december24/olive_variety_suitability_version_december24.shp")

################################################################################
#                              Load ...
################################################################################

#Load...
#load("galega_ensemble.RData")
#load("cobrancosa_ensemble.RData")
#load("arbequina_ensemble.RData")
#load("picual_ensemble.RData")
#load("cordovilTM_ensemble.RData")
#load("cordovilSE_ensemble.RData")
#load("madural_ensemble.RData")
#load("verdeal_ensemble.RData")

################################################################################
#                              Plotting
################################################################################


#tidyterra reference:
  
  #Hernangómez, D., (2023). Using the tidyverse with terra objects: 
  #the tidyterra package. Journal of Open Source Software, 8(91), 5751, 
  #https://doi.org/10.21105/joss.05751.
  
  
png(file="galega_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_galega), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Galega current suitability"
  )+ 
  geom_spatvector(data = portugal, fill = NA)
dev.off()


png(file="cobrancosa_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_cobrancosa), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cobrançosa current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="arbequina_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_arbequina), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Arbequina current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="picual_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_picual), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Picual current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="cordovilTM_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_cordovilTM), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cordovil (Trás-os-Montes) current suitability"
  )+
geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="cordovilSE_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_cordovilSE), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cordovil (Serpa) current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="madural_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_madural), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Madural current suitability"
  )+
geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="verdeal_V5.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_verdeal), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "VerdealTM current suitability"
  )+
geom_spatvector(data = portugal, fill = NA)
dev.off()

