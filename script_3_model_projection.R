#######################################################################################################################################
#                                                   MODEL PROJECTION - PRESENT
#######################################################################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)
#remotes::install_github("dieghernan/tidyterra")
library("tidyterra")

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

terra::writeVector(utm10_results, "olive_variety_suitability_v2", filetype="ESRI Shapefile")
names(utm10_results)


################################################################################
#                     Figure of current suitability
################################################################################

#Hernangómez, D., (2023). Using the tidyverse with terra objects: 
#the tidyterra package. Journal of Open Source Software, 8(91), 5751, 
#https://doi.org/10.21105/joss.05751.

#"atlas", "high_relief", "arid", "soft", "muted", "purple", "viridi", "gn_yl", "pi_y_g", "bl_yl_rd", "deep".

ggplot(utm10_results) +
  #autoplot(aes(fill = results_galega)) +
  geom_spatvector(data = utm10_results, fill = NA) +
  scale_fill_whitebox_d(palette = "viridi") + 
  theme_grey()
  
  scale_fill_whitebox_c(palette = "viridi") +
  labs(
    fill = "population per km2",
    title = "Population density of Luxembourg",
    subtitle = "By canton"
  )



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
#                              Combined plot
################################################################################

png(file="galega.png",width=800, height=500)
plot(utm10_results, "results_galega", main = "Galega")
dev.off()

png(file="cobrancosa.png",width=800, height=500)
plot(utm10_results, "results_cobrancosa", main = "Cobrançosa")
dev.off()

png(file="arbequina.png",width=800, height=500)
plot(utm10_results, "results_arbequina", main = "Arbequina")
dev.off()

png(file="picual.png",width=800, height=500)
plot(utm10_results, "results_picual", main = "Picual")
dev.off()

png(file="cordovil.png",width=800, height=500)
plot(utm10_results, "results_cordovil", main = "Cordovil")
dev.off()

png(file="madural.png",width=800, height=500)
plot(utm10_results, "results_madural", main = "Madural")
dev.off()

png(file="verdeal.png",width=800, height=500)
plot(utm10_results, "results_verdeal", main = "Verdeal")
dev.off()

#######################################################################################################################################
#                                                   MODEL PROJECTION - 2050
#######################################################################################################################################






