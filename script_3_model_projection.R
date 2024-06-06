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
#cordovil_model <- read.sdm(filename = "cordovil_model.sdm")
#madural_model <- read.sdm(filename = "madural_model.sdm")
#verdeal_model <- read.sdm( filename = "verdeal_model.sdm")

#Ensemble Outputs
#load("galega_ensemble.RData")
#load("cobrancosa_ensemble.RData")
#load("arbequina_ensemble.RData")
#load("picual_ensemble.RData")
#load("cordovil_ensemble.RData")
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


##### CORDOVIL
ensemble_cordovil <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results$results_cordovil <- ensemble_cordovil
#plot(utm10_results, "results_cordovil")
save(ensemble_cordovil, file = "cordovil_ensemble.RData")


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

#cordovil_model
cordovil_observ <- as.vector(olive_vars$Cordovil)
cordovil_predict <- ensemble_cordovil$ensemble_weighted
cordovil_ev_df <- data.frame(cordovil_observ, cordovil_predict)
cordovil_ev_df[is.na(cordovil_ev_df)] <- 0
metrics_cordovil <- evaluates(cordovil_ev_df[,1],cordovil_ev_df[,2])
save(metrics_cordovil, file = "metrics_cordovil.RData")

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
metrics_cordovil@statistics$AUC,
metrics_madural@statistics$AUC,
metrics_verdeal@statistics$AUC
)

#TSS (using max(se+sp) as a criteria for predicting potential presence and absence)
tss_1 <- c(metrics_galega@threshold_based$TSS[2],
metrics_cobrancosa@threshold_based$TSS[2],
metrics_arbequina@threshold_based$TSS[2],
metrics_picual@threshold_based$TSS[2],
metrics_cordovil@threshold_based$TSS[2],
metrics_madural@threshold_based$TSS[2],
metrics_verdeal@threshold_based$TSS[2]
)

#Create data frame
metrics_1 <- data.frame(auc_1, tss_1)
colnames(metrics_1) <- c("AUC", "TSS")
rownames(metrics_1) <- c("Galega", "Cobrançosa", "Arbequina", "Picual", "Cordovil", "Madural", "Verdeal")
#write.csv(metrics_1, file = "metrics_1.csv")

################################################################################
#                              Write to shapefile
################################################################################

#terra::writeVector(utm10_results, "olive_variety_suitability_v4", filetype="ESRI Shapefile")
#utm10_results <- terra::vect("olive_variety_suitability_v2/olive_variety_suitability_v4.shp")

################################################################################
#                              Load ...
################################################################################

#Load...
#load("galega_ensemble.RData")
#load("cobrancosa_ensemble.RData")
#load("arbequina_ensemble.RData")
#load("picual_ensemble.RData")
#load("cordovil_ensemble.RData")
#load("madural_ensemble.RData")
#load("verdeal_ensemble.RData")

################################################################################
#                              Plotting
################################################################################


#tidyterra reference:
  
  #Hernangómez, D., (2023). Using the tidyverse with terra objects: 
  #the tidyterra package. Journal of Open Source Software, 8(91), 5751, 
  #https://doi.org/10.21105/joss.05751.
  
  
png(file="galega_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_galega), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Galega current suitability"
  )+ 
  geom_spatvector(data = portugal, fill = NA)
dev.off()


png(file="cobrancosa_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_cobrancosa), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cobrançosa current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="arbequina_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_arbequina), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Arbequina current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="picual_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_picual), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Picual current suitability"
  )+
  geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="cordovil_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_cordovil), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Cordovil current suitability"
  )+
geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="madural_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_madural), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Madural current suitability"
  )+
geom_spatvector(data = portugal, fill = NA)
dev.off()

png(file="verdeal_v4.png",width=2000, height=2500, res=300)
ggplot(utm10_results) +
  geom_spatvector(aes(fill = results_verdeal), color = NA) +
  scale_fill_whitebox_c(palette = "bl_yl_rd") +
  labs(
    fill = "Suitability",
    title = "Verdeal current suitability"
  )+
geom_spatvector(data = portugal, fill = NA)
dev.off()


################################################################################
#                 Creta vector for the 2050 projections
################################################################################

utm10_results_2050 <- utm10
utm10_results_2050$galCC <- NA
utm10_results_2050$cbrCC <- NA
utm10_results_2050$arbCC <- NA
utm10_results_2050$picCC <- NA
utm10_results_2050$corCC <- NA
utm10_results_2050$madCC <- NA
utm10_results_2050$verCC <- NA
#
utm10_results_2050$galCN <- NA
utm10_results_2050$cbrCN <- NA
utm10_results_2050$arbCN <- NA
utm10_results_2050$picCN <- NA
utm10_results_2050$corCN <- NA
utm10_results_2050$madCN <- NA
utm10_results_2050$verCN <- NA
#
utm10_results_2050$galGF <- NA
utm10_results_2050$cbrGF <- NA
utm10_results_2050$arbGF <- NA
utm10_results_2050$picGF <- NA
utm10_results_2050$corGF <- NA
utm10_results_2050$madGF <- NA
utm10_results_2050$verGF <- NA
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

#######################################################################################################################################
#                                                   MODEL PROJECTION - 2050
#######################################################################################################################################

################################################################################
#                 RCP 4.5 - CCSM4 (CC)
################################################################################

#Use thes vars
#variables_10x10_cc_rcp45

#Read
#galega_model <- read.sdm(filename = "galega_model.sdm")
#cobrancosa_model <- read.sdm(filename = "cobrancosa_model.sdm")
#arbequina_model <- read.sdm(filename = "arbequina_model.sdm")
#picual_model <- read.sdm(filename = "picual_model.sdm")
#cordovil_model <- read.sdm(filename = "cordovil_model.sdm")
#madural_model <- read.sdm(filename = "madural_model.sdm")
#verdeal_model <- read.sdm( filename = "verdeal_model.sdm")

##### GALEGA #####
ensemble_galega_2050_CC <- sdm::ensemble(
  x = galega_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

#utm10_results_2050$galCC <- ensemble_galega_2050_CC
#save(ensemble_galega_2050_CC, file = "ensemble_galega_2050_CC.RData")


##### COBRANÇOSA #####
ensemble_cobrancosa_2050_CC <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)
#AQUI - os valores são muito esquisitos, muitos NA e NaN
utm10_results_2050$cbrCC <- ensemble_cobrancosa_2050_CC
save(ensemble_cobrancosa_2050_CC, file = "ensemble_cobrancosa_2050_CC.RData")


##### ARBEQUINA
ensemble_arbequina_2050_CC <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$arbCC <- ensemble_arbequina_2050_CC
save(ensemble_arbequina_2050_CC, file = "ensemble_arbequina_2050_CC.RData")


##### PICUAL
ensemble_picual_2050_CC <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$picCC <- ensemble_picual_2050_CC
save(ensemble_picual_2050_CC, file = "ensemble_picual_2050_CC.RData")


##### CORDOVIL
ensemble_cordovil_2050_CC <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$corCC <- ensemble_cordovil_2050_CC
save(ensemble_cordovil_2050_CC, file = "ensemble_cordovil_2050_CC.RData")


##### MADURAL
ensemble_madural_2050_CC <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$madCC <- ensemble_madural_2050_CC
save(ensemble_madural_2050_CC, file = "ensemble_madural_2050_CC.RData")

##### VERDEAL
ensemble_verdeal_2050_CC <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10_cc_rcp45,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  )
)

utm10_results_2050$verCC <- ensemble_verdeal_2050_CC
save(ensemble_verdeal_2050_CC, file = "ensemble_verdeal_2050_CC.RData")

