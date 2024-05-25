################################################################################
#                         MODEL PROJECTION - PRESENT
################################################################################

#FMestre
#28-04-2024

#Load packages
library(sdm)
library(terra)

#A model performs accurately at a certain detection threshold if it scores a 
#TSS higher than 0.5 (Allouche et al. 2006; Liu et al. 2011).

#env_vars_3 <- raster::stack(env_vars_2)

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
  ),
  overwrites = FALSE
  )

utm10_results$results_galega <- ensemble_galega
plot(utm10_results, "results_galega")

#Metrics
#metrics_galega <- evaluates(galega_sdm_data, ensemble_galega)
#metrics_galega@statistics$AUC


##### COBRANÇOSA #####
ensemble_cobrancosa <- sdm::ensemble(
  x = cobrancosa_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)


utm10_results$results_cobrancosa <- ensemble_cobrancosa
plot(utm10_results, "results_cobrancosa")

#Metrics
#metrics_cobrancosa <- evaluates(cobrancosa_model, ensemble_cobrancosa)
#metrics_cobrancosa@statistics$AUC


##### ARBEQUINA
ensemble_arbequina <- sdm::ensemble(
  x = arbequina_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

utm10_results$results_arbequina <- ensemble_arbequina
plot(utm10_results, "results_arbequina")

#Metrics
#metrics_arbequina <- evaluates(arbequina_model, ensemble_arbequina)
#metrics_arbequina@statistics$AUC

##### PICUAL
ensemble_picual <- sdm::ensemble(
  x = picual_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

utm10_results$results_picual <- ensemble_picual
plot(utm10_results, "results_picual")

#Metrics
#metrics_picual <- evaluates(picual_model, ensemble_picual)
#metrics_picual@statistics$AUC

##### CORDOVIL
ensemble_cordovil <- sdm::ensemble(
  x = cordovil_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

utm10_results$results_cordovil <- ensemble_cordovil
plot(utm10_results, "results_cordovil")

#Metrics
#metrics_cordovil <- evaluates(cordovil_model, ensemble_cordovil)
#metrics_cordovil@statistics$AUC


##### MADURAL
ensemble_madural <- sdm::ensemble(
  x = madural_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

utm10_results$results_madural <- ensemble_madural
plot(utm10_results, "results_madural")

#Metrics
#metrics_madural <- evaluates(madural_model, ensemble_madural)
#metrics_madural@statistics$AUC

##### VERDEAL
ensemble_verdeal <- sdm::ensemble(
  x = verdeal_model,
  newdata = variables_10x10,
  setting=list(
    method = 'weighted',
    stat = 'TSS',
    power = 2,
    expr = 'tss > 0.5'
  ),
  overwrites = FALSE
)

utm10_results$results_verdeal <- ensemble_verdeal
plot(utm10_results, "results_verdeal")

#Metrics
#metrics_madural <- evaluates(madural_model, ensemble_madural)
#metrics_madural@statistics$AUC


################################################################################
#                              Write to disk
################################################################################

#Save...
#save(ensemble_galega, file = "galega_ensemble.RData")
#save(ensemble_cobrancosa, file = "cobrancosa_ensemble.RData")
#save(ensemble_arbequina, file = "arbequina_ensemble.RData")
#save(ensemble_picual, file = "picual_ensemble.RData")
#save(ensemble_cordovil, file = "cordovil_ensemble.RData")
#save(ensemble_madural, file = "madural_ensemble.RData")
#save(ensemble_verdeal, file = "verdeal_ensemble.RData")

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

################################################################################
#                              Write to shapefile
################################################################################

terra::writeVector(utm10_results, "olive_variety_suitability", filetype="ESRI Shapefile")

